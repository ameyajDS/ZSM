using DCC.UMB.CDF.UIControls.TextControls;
using DCC.ZOS.ZSM.Controls.Utils;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DCC.ZOS.ZSM.RPT
{
    public partial class GenerateDailyAttendanceReports : ZSMAbstractScreen
    {
        IDictionary<string, string> sewaTeamFilenameMapping = new Dictionary<string, string>();

        public GenerateDailyAttendanceReports()
        {
            InitializeComponent();
            sewaTeamFilenameMapping.Add("Langar", "Langar-G");
            sewaTeamFilenameMapping.Add("Canteen", "Canteen-G");
            sewaTeamFilenameMapping.Add("Sanitation", "Sanitation-G");
            sewaTeamFilenameMapping.Add("Shamiana", "Shamiana-G");
            sewaTeamFilenameMapping.Add("Traffic", "Traffic-G");
            sewaTeamFilenameMapping.Add("Watch And Ward", "Watch And Ward-G");
        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.RPT_GENERATE_DAILY_ATTENDANCE;
            }
        }

        private void btnGenerate_Click(object sender, EventArgs e)
        {
            DataSet dataSet = dbFacade.SelectDailyAttendanceList(ZSMUtility.GetSatsangCentreId(), lkpSewa.IdTextAsInteger,
                dtStartEndDate.FromDate.Value, dtStartEndDate.ToDate.Value, departmentListBox1.GetItemsAsXML(false),
                subDepartmentListBox1.GetItemsAsXML(false), chkAttendanceType.Checked ? "A" : "%");
            if (dataSet.Tables.Count > 0)
            {
                DataTable dt = dataSet.Tables[0];
                var sewaTeamList = GetSewaTeamList(dt);
                foreach (string sewaTeamNm in sewaTeamList)
                {
                    var filteredDataTable = dt.Select(String.Format("sewa_team_nm = '{0}'", sewaTeamNm)).CopyToDataTable();
                    filteredDataTable.Columns.RemoveAt(2);
                    foreach (DataColumn column in filteredDataTable.Columns)
                    {
                        if (column.ColumnName == "sewadar_grno")
                            column.ColumnName = "Sewadar GRNo";
                        else if (column.ColumnName == "name")
                            column.ColumnName = "Sewadar Name";
                        else if (column.ColumnName == "sewadar_status_nm")
                            column.ColumnName = "Sewadar Status";
                    }
                    string filename = txtPath.DisplayText + "\\" + sewaTeamNm + ".xlsx";
                    bool replaceFile = true;
                    if (chkCombined.Checked)
                    {                        
                        foreach (string sewaTeam in sewaTeamFilenameMapping.Keys)
                        {
                            if (sewaTeamNm.StartsWith(sewaTeam) && sewaTeamNm.Contains("-G"))
                            {
                                filename = txtPath.DisplayText + "\\" + sewaTeam + "-G.xlsx";
                                replaceFile = false;
                                break;
                            }
                            if (sewaTeamNm.StartsWith(sewaTeam) && sewaTeamNm.Contains("-L"))
                            {
                                filename = txtPath.DisplayText + "\\" + sewaTeam + "-L.xlsx";
                                replaceFile = false;
                                break;
                            }
                        }
                    }
                    CreateOrReplaceXSLX(filename, replaceFile);
                    WriteExcelFile(filename, filteredDataTable, sewaTeamNm);
                }
                MessageBox.Show("Export Completed Successfully");
            }
        }

        private void sewaLookup1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("2=2", "s.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId() + "AND s.is_satsang_programme = 'Yes'");
        }

        private void departmentListBox1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("(1=1)", "dsc.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId());
        }

        private void subDepartmentListBox1_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            e.LookupSqlString = e.LookupSqlString.Replace("1=2", " dsc.satsang_centre_id = " + ZSMUtility.GetSatsangCentreId() +
                " And sd.department_id " + ZSMUtility.GetInStatementUsingItems(this.departmentListBox1, false));
        }

        private IList<String> GetSewaTeamList(DataTable dt)
        {
            IList<String> sewaTeams = new List<String>();
            DataView view = new DataView(dt);
            DataTable distinctValues = view.ToTable(true, "sewa_team_nm");
            foreach (DataRow dr in distinctValues.Rows)
            {
                sewaTeams.Add(dr["sewa_team_nm"].ToString());
            }
            return sewaTeams;
        }

        private static void CreateOrReplaceXSLX(string filePath, Boolean replaceIfFileExists)
        {
            if (!Directory.Exists(filePath))
            {
                Directory.CreateDirectory(Path.GetDirectoryName(filePath));
            }

            if (!File.Exists(filePath) || replaceIfFileExists)
            {
                try
                {
                    using (SpreadsheetDocument document = SpreadsheetDocument.Create(filePath, SpreadsheetDocumentType.Workbook))
                    {
                        document.AddWorkbookPart();
                        document.Close();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }


        private static void WriteExcelFile(string outputPath, DataTable table, string title)
        {
            try
            {
                using (SpreadsheetDocument document = SpreadsheetDocument.Open(outputPath, true))
                {
                    string sheetName = "Sheet1";
                    Worksheet worksheet = GetWorksheetBySheetName(document, sheetName);
                    WorkbookPart workbookPart = null;
                    SheetData sheetData = null;
                    if (worksheet == null)
                    {
                        workbookPart = document.WorkbookPart;
						workbookPart.Workbook = new Workbook();
                        WorksheetPart worksheetPart = workbookPart.AddNewPart<WorksheetPart>();
                        sheetData = new SheetData();
                        worksheetPart.Worksheet = new Worksheet(sheetData);

                        WorkbookStylesPart stylesPart = workbookPart.AddNewPart<WorkbookStylesPart>();
                        stylesPart.Stylesheet = GenerateStyleSheet();
                        stylesPart.Stylesheet.Save();

                        Sheets sheets = workbookPart.Workbook.AppendChild(new Sheets());
                        Sheet sheet = new Sheet() { Id = workbookPart.GetIdOfPart(worksheetPart), SheetId = 1, Name = sheetName };
                        sheets.Append(sheet);
                    }
                    else
                    {
                        workbookPart = document.WorkbookPart;
                        sheetData = worksheet.GetFirstChild<SheetData>();
                        Row blankRow = new Row();
                        Cell cell2 = new Cell();
                        cell2.DataType = CellValues.String;
                        cell2.CellValue = new CellValue("");
                        blankRow.AppendChild(cell2);
                        sheetData.AppendChild(blankRow);
                    }
                    
                    Row titleRow = new Row();
                    Cell cell1 = new Cell();
                    cell1.DataType = CellValues.String;
                    cell1.CellValue = new CellValue(title);
                    titleRow.AppendChild(cell1);
                    sheetData.AppendChild(titleRow);

                    Row headerRow = new Row();

                    List<String> columns = new List<string>();
                    foreach (System.Data.DataColumn column in table.Columns)
                    {
                        columns.Add(column.ColumnName);
                        Cell cell = new Cell();
                        cell.DataType = CellValues.String;
                        cell.StyleIndex = 6;
                        cell.CellValue = new CellValue(column.ColumnName);
                        headerRow.AppendChild(cell);
                    }

                    sheetData.AppendChild(headerRow);

                    foreach (DataRow dsrow in table.Rows)
                    {
                        Row newRow = new Row();
                        foreach (String col in columns)
                        {
                            Cell cell = new Cell();
                            cell.DataType = CellValues.String;
                            cell.StyleIndex = 6;
                            cell.CellValue = new CellValue(dsrow[col].ToString());
                            newRow.AppendChild(cell);
                        }

                        sheetData.AppendChild(newRow);
                    }

                    workbookPart.Workbook.Save();
                    document.Close();
                    document.Dispose();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        public static Worksheet GetWorksheetBySheetName(SpreadsheetDocument document, string sheetName)
        {

            var workbookPart = document.WorkbookPart;
            if (workbookPart.Workbook != null)
            {
                var sheet = workbookPart.Workbook.Descendants<Sheet>().FirstOrDefault();
                if (sheet != null)
                {
                    string relationshipId = sheet.Id;
                    if (!string.IsNullOrEmpty(relationshipId))
                    {
                        var worksheet = ((WorksheetPart)workbookPart.GetPartById(relationshipId)).Worksheet;
                        return worksheet;
                    }
                }
            }
            return null;

        }

        private static Stylesheet GenerateStyleSheet()
        {
            return new Stylesheet(
                new Fonts(
                    new DocumentFormat.OpenXml.Spreadsheet.Font(                                                               // Index 0 - The default font.
                        new FontSize() { Val = 11 },
                        new DocumentFormat.OpenXml.Spreadsheet.Color() { Rgb = new HexBinaryValue() { Value = "000000" } },
                        new FontName() { Val = "Calibri" }),
                    new DocumentFormat.OpenXml.Spreadsheet.Font(                                                               // Index 1 - The bold font.
                        new Bold(),
                        new FontSize() { Val = 11 },
                        new DocumentFormat.OpenXml.Spreadsheet.Color() { Rgb = new HexBinaryValue() { Value = "000000" } },
                        new FontName() { Val = "Calibri" }),
                    new DocumentFormat.OpenXml.Spreadsheet.Font(                                                               // Index 2 - The Italic font.
                        new Italic(),
                        new FontSize() { Val = 11 },
                        new DocumentFormat.OpenXml.Spreadsheet.Color() { Rgb = new HexBinaryValue() { Value = "000000" } },
                        new FontName() { Val = "Calibri" }),
                    new DocumentFormat.OpenXml.Spreadsheet.Font(                                                               // Index 2 - The Times Roman font. with 16 size
                        new FontSize() { Val = 16 },
                        new DocumentFormat.OpenXml.Spreadsheet.Color() { Rgb = new HexBinaryValue() { Value = "000000" } },
                        new FontName() { Val = "Times New Roman" })
                ),
                new Fills(
                    new Fill(                                                           // Index 0 - The default fill.
                        new PatternFill() { PatternType = PatternValues.None }),
                    new Fill(                                                           // Index 1 - The default fill of gray 125 (required)
                        new PatternFill() { PatternType = PatternValues.Gray125 }),
                    new Fill(                                                           // Index 2 - The yellow fill.
                        new PatternFill(
                            new ForegroundColor() { Rgb = new HexBinaryValue() { Value = "FFFFFF00" } }
                        ) { PatternType = PatternValues.Solid })
                ),
                new Borders(
                    new Border(                                                         // Index 0 - The default border.
                        new LeftBorder(),
                        new RightBorder(),
                        new TopBorder(),
                        new BottomBorder(),
                        new DiagonalBorder()),
                    new Border(                                                         // Index 1 - Applies a Left, Right, Top, Bottom border to a cell
                        new LeftBorder(
                            new DocumentFormat.OpenXml.Spreadsheet.Color() { Auto = true }
                        ) { Style = BorderStyleValues.Thin },
                        new RightBorder(
                            new DocumentFormat.OpenXml.Spreadsheet.Color() { Auto = true }
                        ) { Style = BorderStyleValues.Thin },
                        new TopBorder(
                            new DocumentFormat.OpenXml.Spreadsheet.Color() { Auto = true }
                        ) { Style = BorderStyleValues.Thin },
                        new BottomBorder(
                            new DocumentFormat.OpenXml.Spreadsheet.Color() { Auto = true }
                        ) { Style = BorderStyleValues.Thin },
                        new DiagonalBorder())
                ),
                new CellFormats(
                    new CellFormat() { FontId = 0, FillId = 0, BorderId = 0 },                          // Index 0 - The default cell style.  If a cell does not have a style index applied it will use this style combination instead
                    new CellFormat() { FontId = 1, FillId = 0, BorderId = 0, ApplyFont = true },       // Index 1 - Bold 
                    new CellFormat() { FontId = 2, FillId = 0, BorderId = 0, ApplyFont = true },       // Index 2 - Italic
                    new CellFormat() { FontId = 3, FillId = 0, BorderId = 0, ApplyFont = true },       // Index 3 - Times Roman
                    new CellFormat() { FontId = 0, FillId = 2, BorderId = 0, ApplyFill = true },       // Index 4 - Yellow Fill
                    new CellFormat(                                                                   // Index 5 - Alignment
                        new Alignment() { Horizontal = HorizontalAlignmentValues.Center, Vertical = VerticalAlignmentValues.Center }
                    ) { FontId = 0, FillId = 0, BorderId = 0, ApplyAlignment = true },
                    new CellFormat() { FontId = 0, FillId = 0, BorderId = 1, ApplyBorder = true }      // Index 6 - Border
                )
            ); // return
        }

        private void lkpSewa_LookupResultSet(object sender, LookupResultEventArgs e)
        {
            dtStartEndDate.FromDate = DateTime.Parse(e.LookupResult.SelectedRecords[0]["start_dt"].ToString());
            dtStartEndDate.ToDate = DateTime.Parse(e.LookupResult.SelectedRecords[0]["finish_dt"].ToString());
        }

        private void btnPath_Click(object sender, EventArgs e)
        {
            using (var fbd = new FolderBrowserDialog())
            {
                DialogResult result = fbd.ShowDialog();

                if (result == DialogResult.OK && !string.IsNullOrWhiteSpace(fbd.SelectedPath))
                {
                    txtPath.DisplayText = fbd.SelectedPath;
                    this.btnGenerate.Enabled = true;
                }
            }
        }
    }
}
