using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Forms;
using System.Xml;

namespace DCC.UMB.CDF.UIControls.TextControls.Lookup
{
    internal enum BooleanEnum
    {
        False = 1,
        True
    }
    
    public partial class LookupColumnsPropertyEditor : Form
    {
        List<LookupPropertyColumn> gridModel = new List<LookupPropertyColumn>();
        LookupPropertyColumn loadedColumn = null;
        private const string DEFAULT_SQL_STRING = "Type the Sql String here...";
        private bool isLoadedColumnValidated = false;
        string returnValue = null;
        //string existingColumns = null;
        public string ReturnValue
        {
            get { return returnValue; }
            internal set { returnValue = value; }
        }

        public LookupColumnsPropertyEditor(string existingColumns)
        {
            InitializeComponent();
            //this.existingColumns = existingColumns;
            this.txtSqlText.Text = DEFAULT_SQL_STRING;
            this.cmbIsCodeMember.DataSource = Enum.GetValues(typeof(BooleanEnum));
            this.cmbIsDisplayMember.DataSource = Enum.GetValues(typeof(BooleanEnum));
            this.cmbIsValueMember.DataSource = Enum.GetValues(typeof(BooleanEnum));
            this.grdLookupColumns.VirtualMode = true;
            this.grdLookupColumns.AllowUserToAddRows = false;
            this.grdLookupColumns.AllowUserToDeleteRows = false;
            this.grdLookupColumns.AllowUserToOrderColumns = false;
            this.grdLookupColumns.CellValueNeeded += new DataGridViewCellValueEventHandler(dgvAddedColumns_CellValueNeeded);
            this.grdLookupColumns.RowValidating += new DataGridViewCellCancelEventHandler(dgvAddedColumns_RowValidating);
            this.grdLookupColumns.RowEnter += new DataGridViewCellEventHandler(dgvAddedColumns_RowEnter);
            string lookupSqlString = string.Empty;
            this.returnValue = existingColumns;
            List<LookupPropertyColumn> previousColumns = GetPreviousExistingColumns(existingColumns, ref lookupSqlString);
            this.txtSqlText.Text = lookupSqlString;
            this.grdLookupColumns.SizeChanged += new EventHandler(grdLookupColumns_SizeChanged);

            foreach (LookupPropertyColumn col in previousColumns)
            {
                this.gridModel.Add(col);
            }
            this.grdLookupColumns.RowCount = this.gridModel.Count;
            this.tlpPropertyPairsContainerPanel.Enabled = false;
            AdjustColumnWidthsInGrid();
        }

        void grdLookupColumns_SizeChanged(object sender, EventArgs e)
        {
            AdjustColumnWidthsInGrid();
        }

        private void AdjustColumnWidthsInGrid()
        {
            this.grdLookupColumns.Columns[0].Width = this.grdLookupColumns.Width;
        }

        public static List<LookupPropertyColumn> GetPreviousExistingColumns(string existingColumns, ref string lookupSqlString)
        {
            List<LookupPropertyColumn> lookupPropertyColumns = new List<LookupPropertyColumn>();
            if (string.IsNullOrEmpty(existingColumns)) return new List<LookupPropertyColumn>();
           
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(existingColumns);
            lookupSqlString = doc.DocumentElement.Attributes["LookupSqlQuery"].Value;
            
            XmlNodeList list = doc.DocumentElement.SelectNodes("/Root/LookupColumn");
            foreach (XmlNode node in list)
            {
                lookupPropertyColumns.Add(LookupPropertyColumn.CreateColumnFromXmlString(node));
            }
            return lookupPropertyColumns;
        }



        void dgvAddedColumns_RowEnter(object sender, DataGridViewCellEventArgs e)
        {
            //if (loadedColumn == gridModel[e.RowIndex]) return;
            LoadColumnForEditing(gridModel[e.RowIndex]);
        }

        


        void dgvAddedColumns_RowValidating(object sender, DataGridViewCellCancelEventArgs e)
        {
            if (!this.grdLookupColumns.ContainsFocus) return;
            if (!SaveLoadedColumn()) { e.Cancel = true; return; }
            e.Cancel = false;
        }



        public string ShowLookupPropertyDialog(string previousPropertyValue)
        {

            //return null;
            //this.dataGridView1.DataSource = this.gridModel;
            //this.dataGridView1.AllowUserToAddRows = true;
            this.ShowDialog(null);
            return returnValue;
        }

        private void btnAddColumn_Click(object sender, EventArgs e)
        {
            if (!SaveLoadedColumn()) return;
            LookupPropertyColumn newColumn = new LookupPropertyColumn();
            this.gridModel.Add(newColumn);
            this.grdLookupColumns.RowCount = this.gridModel.Count;
            this.grdLookupColumns.CurrentCell = this.grdLookupColumns[0, this.grdLookupColumns.RowCount - 1];
            this.txtCaption.SelectAll();
            this.txtCaption.Focus();
        }

        private bool SaveLoadedColumn()
        {
            if (loadedColumn == null) return true;
            if (this.txtCaption.Text.Trim().Length == 0)
            {
                MessageBox.Show(this, "Invalid Caption", "Lookup Column Setup Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            if (this.txtSqlName.Text.Trim().Length == 0)
            {
                MessageBox.Show(this, "Invalid SQL Name", "Lookup Column Setup Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            if (this.txtAliasName.Text.Trim().Length == 0)
            {
                MessageBox.Show(this, "Invalid Alias Name", "Lookup Column Setup Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            if (this.txtPercentageWidth.Text.Trim().Length == 0)
            {
                MessageBox.Show(this, "Invalid %age width", "Lookup Column Setup Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            ///[[check for the existance of the column
            LookupPropertyColumnPredicate predicate = new LookupPropertyColumnPredicate();
            predicate.AliasName = txtAliasName.Text.Trim();
            if (this.gridModel.Find(predicate.Compare) != null && this.gridModel.Find(predicate.Compare)!=this.loadedColumn)
            {
                MessageBox.Show(this,"Repeated Alias Name","Lookup Column Setup Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
                return false;
            }
            predicate = new LookupPropertyColumnPredicate();
            predicate.Caption = txtCaption.Text.Trim();
            if (this.gridModel.Find(predicate.Compare) != null && this.gridModel.Find(predicate.Compare)!=this.loadedColumn)
            {
                MessageBox.Show(this, "Repeated Caption", "Lookup Column Setup Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            
            predicate = new LookupPropertyColumnPredicate();            
            predicate.SqlName = txtSqlName.Text.Trim();
            if (this.gridModel.Find(predicate.Compare) != null && this.gridModel.Find(predicate.Compare) != this.loadedColumn)
            {
                MessageBox.Show(this, "Repeated SQL Name", "Lookup Column Setup Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            //]]
            loadedColumn.Caption = this.txtCaption.Text.Trim();
            loadedColumn.SqlName = txtSqlName.Text.Trim();
            loadedColumn.AliasName = txtAliasName.Text.Trim();
            loadedColumn.PercentageWidth = int.Parse(txtPercentageWidth.Text.Trim());
            loadedColumn.ToolTipText = txtToolTipText.Text.Trim();
            loadedColumn.IsDisplayMemberColumn = bool.Parse(cmbIsDisplayMember.SelectedItem.ToString());
            loadedColumn.IsValueMemberColumn = bool.Parse(cmbIsValueMember.SelectedItem.ToString());
            loadedColumn.IsCodeMemberColumn = bool.Parse(cmbIsCodeMember.SelectedItem.ToString());
            loadedColumn.TablePrefix = this.txtTablePrefix.Text.Trim();
            return true;
        }



        private void LoadColumnForEditing(LookupPropertyColumn columnToLaod)
        {
            if (loadedColumn == columnToLaod) return;
            this.tlpPropertyPairsContainerPanel.Enabled = true;
            this.loadedColumn = columnToLaod;
            this.txtCaption.Text = columnToLaod.Caption;
            this.txtSqlName.Text = columnToLaod.SqlName;
            this.txtAliasName.Text = columnToLaod.AliasName;
            txtPercentageWidth.Text = columnToLaod.PercentageWidth.ToString();
            this.txtToolTipText.Text = columnToLaod.ToolTipText;
            cmbIsDisplayMember.SelectedItem = (BooleanEnum)Enum.Parse(typeof(BooleanEnum), columnToLaod.IsDisplayMemberColumn.ToString(), true);
            cmbIsValueMember.SelectedItem = (BooleanEnum)Enum.Parse(typeof(BooleanEnum), columnToLaod.IsValueMemberColumn.ToString(), true);
            cmbIsCodeMember.SelectedItem = (BooleanEnum)Enum.Parse(typeof(BooleanEnum), columnToLaod.IsCodeMemberColumn.ToString(), true);
            this.txtTablePrefix.Text = loadedColumn.TablePrefix;
            this.loadedColumn = columnToLaod;
            AdjustColumnWidthsInGrid();
        }
        void dgvAddedColumns_CellValueNeeded(object sender, DataGridViewCellValueEventArgs e)
        {
            if (this.gridModel.Count == 0) return;
            LookupPropertyColumn col = this.gridModel[e.RowIndex];
            switch (e.ColumnIndex)
            {
                case 0:
                    e.Value = col.Caption;
                    break;
                case 1:
                    e.Value = col.Guid;
                    break;
                default:
                    throw new Exception("Invalid Column Index");
            }
        }

        

        private void UnloadAllColumnsForEditing()
        {
            this.loadedColumn = null;
            this.txtCaption.Text = "";
            this.txtSqlName.Text = "";
            this.txtAliasName.Text = "";
            this.txtPercentageWidth.Text = "";
            this.tlpPropertyPairsContainerPanel.Enabled = false;
            this.Refresh();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            //check if the sql string is correct for the lookup
            if (!SaveLoadedColumn()) return;
            //if (this.txtSqlText.Text.Trim().Length == 0)
            //{
            //    MessageBox.Show("Sql Query for the lookup is not Valid!");
            //    return;
            //}
            //if (this.txtSqlText.Text.Trim() == DEFAULT_SQL_STRING)
            //{
            //    MessageBox.Show("Sql Query for the lookup is not Valid!");
            //    return;
            //}
            ///[[Check there MUST be one ID Text Column and one Display Text column.
            //if these are not defined, then throw an error and return
            LookupPropertyColumnPredicate predicate = new LookupPropertyColumnPredicate();
            predicate.IsDisplayMember = true;
            LookupPropertyColumn displayMbrColumn = this.gridModel.Find(predicate.Compare);
            if (displayMbrColumn == null)
            {
                DialogResult result = MessageBox.Show(this,"Display-Member column is not defined, do you want to proceed?","Lookup Columns Setup Warning",MessageBoxButtons.YesNo,MessageBoxIcon.Warning,MessageBoxDefaultButton.Button2);
                if (result == DialogResult.No) return;
            }
            predicate = new LookupPropertyColumnPredicate();
            predicate.IsValueMember = true;
            LookupPropertyColumn valueMbrColumn = this.gridModel.Find(predicate.Compare);
            if (valueMbrColumn == null)
            {
                DialogResult result = MessageBox.Show(this, "Value-Member column is not defined, do you want to proceed?", "Lookup Columns Setup Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2);
                if (result == DialogResult.No) return;
            }
            //]]
            returnValue = CreateReturnValue();
            this.Dispose();
        }

        private string CreateReturnValue()
        {
            StringBuilder sb = new StringBuilder();

            XmlWriterSettings settings = new XmlWriterSettings();
            settings.Indent = true;
            XmlWriter writer = XmlWriter.Create(sb, settings);
            if (DEFAULT_SQL_STRING != this.txtSqlText.Text)
            {
                writer.WriteStartElement("Root");
                writer.WriteAttributeString("LookupSqlQuery", this.txtSqlText.Text);
                foreach (LookupPropertyColumn col in gridModel)
                {
                    col.WriteXmlString(writer);
                }
                writer.WriteEndElement();
            }
            writer.Close();

            return sb.ToString();
        }


        private void txtAliasName_Leave(object sender, EventArgs e)
        {
            if (this.txtSqlName.Text.Trim() == string.Empty)
            {
                this.txtSqlName.Text = this.txtAliasName.Text;
            }
        }

        private void LookupColumnsPropertyEditor_Load(object sender, EventArgs e)
        {

        }

        

        private void btnMoveUp_Click(object sender, EventArgs e)
        {
            if (this.grdLookupColumns.CurrentCell == null) return;
            int currentRowIndex = this.grdLookupColumns.CurrentCell.RowIndex;
            if(currentRowIndex<=0)
            {
                return;
            }
            
            SwapLookupColumnsInModelAndRefreshGrid(currentRowIndex, currentRowIndex - 1);
        }
        private void btnMoveDown_Click(object sender, EventArgs e)
        {
            if (this.grdLookupColumns.CurrentCell == null) return;
            int currentRowIndex = this.grdLookupColumns.CurrentCell.RowIndex;
            if (currentRowIndex == this.gridModel.Count-1)
            {
                return;
            }

            SwapLookupColumnsInModelAndRefreshGrid(currentRowIndex, currentRowIndex + 1);
        }

        private void SwapLookupColumnsInModelAndRefreshGrid(int currentRowIndex, int proposedIndex)
        {
            try
            {
                object objectAtCurrentRowIndex = this.gridModel[currentRowIndex];
                object objectAtProposedRowIndex = this.gridModel[proposedIndex];
                this.gridModel[currentRowIndex] = (LookupPropertyColumn)objectAtProposedRowIndex;
                this.gridModel[proposedIndex] = (LookupPropertyColumn)objectAtCurrentRowIndex;
                
                this.grdLookupColumns.RowCount = this.gridModel.Count;
                this.grdLookupColumns.CurrentCell = this.grdLookupColumns[0, proposedIndex];
                LoadColumnForEditing(gridModel[proposedIndex]);
            }
            catch (Exception ex)
            {
                //Do nothing.
            }
            finally
            {
                this.grdLookupColumns.Refresh();
            }
        }

        private void btnWizard_Click(object sender, EventArgs e)
        {
            LookupColumnCreatorDialog columnCreatorDialog = new LookupColumnCreatorDialog();
            string columnsXml = columnCreatorDialog.ShowModalDialog(this, this.txtSqlText.Text.Trim());
            if (string.IsNullOrEmpty(columnsXml))
            {
                return;
            }
            string lookupSqlString = string.Empty;
            List<LookupPropertyColumn> previousColumns = GetPreviousExistingColumns(columnsXml, ref lookupSqlString);
            this.txtSqlText.Text = lookupSqlString.Replace("(1=1)", "?");
            this.gridModel.Clear();
            foreach (LookupPropertyColumn col in previousColumns)
            {
                this.gridModel.Add(col);
            }
            this.grdLookupColumns.RowCount = this.gridModel.Count;
            this.tlpPropertyPairsContainerPanel.Enabled = true;
        }

        
        private void btnRemove_Click(object sender, EventArgs e)
        {
            if (this.grdLookupColumns.CurrentCell == null) return;
            this.gridModel.RemoveAt(this.grdLookupColumns.CurrentCell.RowIndex);
            this.grdLookupColumns.RowCount = this.gridModel.Count;
            this.grdLookupColumns.Refresh();
            if (this.grdLookupColumns.CurrentCell == null)//means there is no column to be loaded for editing
            {
                UnloadAllColumnsForEditing();
                return;
            }
            LookupPropertyColumn columnToBeLoaded = this.gridModel[this.grdLookupColumns.CurrentCell.RowIndex];
            LoadColumnForEditing(columnToBeLoaded);
        }

        
    }
}