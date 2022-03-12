using System;
using System.Collections.Generic;
using System.Data;
using DCC.DBFacade;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.ZOS.ZSM;
using DCC.UMB.CDF.MGMT.Global;
using DCC.ZOS.ZSM.Controls.Utils;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.Utils;
using System.Collections;
using System.Windows.Forms;

namespace DCC.ZOS.ZSM.ENT
{
    partial class BadgeTemplates : ZSMAbstractScreen
    {
        public BadgeTemplates()
        {
            InitializeComponent();            
        }

        public override string ScreenId
        {
            get
            {
                return Screens.ENT_BADGE_TEMPLATES;
            }
        }
         #region Nested type: grdListColNames

        private enum grdListColNames
        {
            badge_template_id,
            badge_template_nm,
            badge_shape,
            information_type,
            foreground_colour_control,
            foreground_colour_id,
            background_colour_control,
            background_colour_id,
            top_line_font_size,
            top_line_part_1_type,
            top_line_part_1_text,
            top_line_parts_separator,
            top_line_part_2_type,
            top_line_part_2_text,
            middle_line_font_size,
            middle_line_part_1_type,
            middle_line_part_1_text,
            middle_line_parts_separator,
            middle_line_part_2_type,
            middle_line_part_2_text,
            bottom_line_font_size,
            bottom_line_part_1_type,
            bottom_line_part_1_text,
            bottom_line_parts_separator,
            bottom_line_part_2_type,
            bottom_line_part_2_text,
            expiry_year,
            report_file_nm_front,
            report_file_nm_back,
            procedure_nm_front,
            procedure_nm_back,
            txn_ts,
        }
#endregion

        public override DCCGrid ListViewGrid
        {
            get { return grdList; }
        }

        public override void ClearControls()
        {
            base.ClearControls();
           
        }
        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
            this.ShowListView(this.scListOrBrowse, false);

            if (uiMode == UIModes.Insert)
            {
                ClearControls();
            }
            else if (uiMode == UIModes.Query)
            {
                ClearControls();
            }
            else if (uiMode == UIModes.Retrieve)
            {
                ClearControls();
            }
            else if (uiMode == UIModes.List)
            {
                this.ShowListView(this.scListOrBrowse, true);
            }
            else if (uiMode == UIModes.Browse)
            {
                this.ShowListView(this.scListOrBrowse, false);
            }
        }

        public override void LoadBrowseView(int rowIndex)
        {
            this.LoadDataFromGridToContainer(this.grdList, rowIndex, this.scListOrBrowse.Panel1);
            this.ObjectIdForLogOperation = this.txtBadgeTemplateId.DisplayText ; 
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            ViewBadgeTemplatesSQLSelectQuery query = new ViewBadgeTemplatesSQLSelectQuery();

            query.badge_template_id.Equal(txtBadgeTemplateId.DisplayText);
           

            return this.dbFacade.ExecuteSelectQuery(query);   
        }

       
        public override void CreateData()
        {
            this.dbFacade.InsertBadgeTemplate(this.txtBadgeTemplateId.DisplayText,
                                              this.txtBadgeTemplateNm.DisplayText,
                                              cmbBadgeShape.SelectedValueAsStr,
                                              cmbInformationType.SelectedValueAsStr,
                                              cmbForegroundColourControl.SelectedValueAsStr,
                                              lkpForegroundColourId.IdTextAsShort,
                                              cmbBackgroundColourControl.SelectedValueAsStr,
                                              lkpBackgroundColourId.IdTextAsShort,
                                              intTopLineFontSize.DisplayTextAsByte,
                                              cmbTopLinePart1Type.SelectedValueAsStr,
                                              txtTopLinePart1Text.DisplayText,
                                              cmbTopLinePartsSeparator.SelectedValueAsStr,
                                              cmbTopLinePart2Type.SelectedValueAsStr,
                                              txtTopLinePart2Text.DisplayText,

                                              intMiddleLineFontSize.DisplayTextAsByte,
                                              cmbMiddleLinePart1Type.SelectedValueAsStr,
                                              txtMiddleLinePart1Text.DisplayText,
                                              cmbMiddleLinePartsSeparator.SelectedValueAsStr,
                                              cmbMiddleLinePart2Type.SelectedValueAsStr,
                                              txtMiddleLinePart2Text.DisplayText,

                                              intBottomLineFontSize.DisplayTextAsByte,
                                              cmbBottomLinePart1Type.SelectedValueAsStr,
                                              txtBottomLinePart1Text.DisplayText,
                                              cmbBottomLinePartsSeparator.SelectedValueAsStr,
                                              cmbBottomLinePart2Type.SelectedValueAsStr,
                                              txtBottomLinePart2Text.DisplayText,
                                              txtExpiryYear.DisplayText,
                                              txtReportFileNmFront.DisplayText,
                                              txtReportFileNmBack.DisplayText,
                                              txtProcedureNmFront.DisplayText,
                                              txtProcedureNmBack.DisplayText,
                                              this.chkAreOutstaionAllowed.BlnString);
            this.ObjectIdForLogOperation = this.txtBadgeTemplateId.DisplayText; 
        }

        public override void UpdateData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs(grdListColNames.txn_ts.ToString());
            this.dbFacade.UpdateBadgeTemplate(this.txtBadgeTemplateId.DisplayText,
                                              this.txtBadgeTemplateNm.DisplayText,
                                              cmbBadgeShape.SelectedValueAsStr,
                                              cmbInformationType.SelectedValueAsStr,
                                              cmbForegroundColourControl.SelectedValueAsStr,
                                              lkpForegroundColourId.IdTextAsShort,
                                              cmbBackgroundColourControl.SelectedValueAsStr,
                                              lkpBackgroundColourId.IdTextAsShort,
                                              intTopLineFontSize.DisplayTextAsByte,
                                              cmbTopLinePart1Type.SelectedValueAsStr,
                                              txtTopLinePart1Text.DisplayText,
                                              cmbTopLinePartsSeparator.SelectedValueAsStr,
                                              cmbTopLinePart2Type.SelectedValueAsStr,
                                              txtTopLinePart2Text.DisplayText,

                                              intMiddleLineFontSize.DisplayTextAsByte,
                                              cmbMiddleLinePart1Type.SelectedValueAsStr,
                                              txtMiddleLinePart1Text.DisplayText,
                                              cmbMiddleLinePartsSeparator.SelectedValueAsStr,
                                              cmbMiddleLinePart2Type.SelectedValueAsStr,
                                              txtMiddleLinePart2Text.DisplayText,

                                              intBottomLineFontSize.DisplayTextAsByte,
                                              cmbBottomLinePart1Type.SelectedValueAsStr,
                                              txtBottomLinePart1Text.DisplayText,
                                              cmbBottomLinePartsSeparator.SelectedValueAsStr,
                                              cmbBottomLinePart2Type.SelectedValueAsStr,
                                              txtBottomLinePart2Text.DisplayText,
                                              txtExpiryYear.DisplayText,
                                              txtReportFileNmFront.DisplayText,
                                              txtReportFileNmBack.DisplayText,
                                              txtProcedureNmFront.DisplayText,
                                              txtProcedureNmBack.DisplayText,
                                              chkAreOutstaionAllowed.BlnString,
                                              txn_ts
                                              );                                
        }

        public override bool DeleteData()
        {
            byte[] txn_ts = this.grdList.AsTxnTs("txn_ts");
            this.dbFacade.DeleteBadgeTemplate(this.txtBadgeTemplateId.DisplayText, txn_ts);
            return true;
        }

        private void FontSize_Validating(object sender, System.ComponentModel.CancelEventArgs e)
        {
            try
            {
                if (!((sender as DCCLongIntegerField).DisplayTextAsInteger >= 8 && (sender as DCCLongIntegerField).DisplayTextAsInteger <= 72))
                {
                    UIManager.ShowMessage(MsgCodes.OutOfRange,
                        string.Format("{0}|{1}|{2}",
                        "Font Size", "8",
                        "72"),
                        MessageTypes.Error);
                    (sender as DCCLongIntegerField).ClearControlValues();
                }
            }
            catch { }
        }
    }
}