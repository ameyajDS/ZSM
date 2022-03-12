using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DCC.UMB.CDF.Tools.GeneratePackageSetupScripts
{
    public partial class SimpleObjectEditor : UserControl
    {
        private object currentlySelectedObject = null;
        private IObjectProvider provider = null;
        public SimpleObjectEditor()
        {
            InitializeComponent();
            
            this.grdObjects.CurrentCellChanged += new EventHandler(grdObjects_CurrentCellChanged);
            this.grdObjects.VirtualMode = true;
            this.grdObjects.CellValuePushed += new DataGridViewCellValueEventHandler(grdObjects_CellValuePushed);
            this.grdObjects.CellValueNeeded += new DataGridViewCellValueEventHandler(grdObjects_CellValueNeeded);
            this.grdObjects.RowHeadersVisible = false;
            this.grdObjects.ColumnHeadersVisible = false;
            this.grdObjects.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            this.grdObjects.AllowUserToResizeColumns = false;
            this.grdObjects.AllowUserToResizeRows = false;
            this.grdObjects.MultiSelect = false;
            this.grdObjects.Columns.Add("object","object");
            this.grdObjects.SizeChanged += new EventHandler(grdObjects_SizeChanged);
            
        }

        void grdObjects_SizeChanged(object sender, EventArgs e)
        {
            this.grdObjects.Columns[0].Width = this.grdObjects.Width;
        }

        void grdObjects_CellValueNeeded(object sender, DataGridViewCellValueEventArgs e)
        {
            e.Value= this.provider.GetObjectAt(e.RowIndex).ToString();
        }

        void grdObjects_CellValuePushed(object sender, DataGridViewCellValueEventArgs e)
        {
            throw new NotImplementedException();
        }

        public object CurrentlySelectedObject
        {
            get { return currentlySelectedObject; }
            set
            {
                bool objectChanged = currentlySelectedObject != value;
                currentlySelectedObject = value;

                if(objectChanged)
                {
                    this.propEditor.SelectedObject = currentlySelectedObject;
                }
            }
        }

        void grdObjects_CurrentCellChanged(object sender, EventArgs e)
        {
            //if(this.provider.GetObjectAt(grdObjects.CurrentCell.RowIndex)==this.CurrentlySelectedObject)
            //{
            //    return;
            //}
            if (this.provider == null)
            {
                return;
            }
            if (this.grdObjects.CurrentCell == null)
            {
                this.CurrentlySelectedObject = null;
                return;
            }
            this.CurrentlySelectedObject = this.provider.GetObjectAt(grdObjects.CurrentCell.RowIndex);
        }

        public void RegisterObjectProvider(IObjectProvider provider)
        {
            try
            {
                this.provider = provider;
                RefreshGrid();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void RefreshGrid()
        {
            try
            {
                this.grdObjects.RowCount = provider.GetObjectList().Count;
                this.grdObjects.Invalidate();
                if (this.grdObjects.Rows.Count > 0)
                {
                    this.grdObjects.CurrentCell = this.grdObjects[0, 0];
                }
                this.CurrentlySelectedObject = this.provider.GetObjectAt(grdObjects.CurrentCell.RowIndex);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if(this.provider==null)
            {
                return;
            }
            this.provider.AddObject();
            this.RefreshGrid();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (this.provider == null)
            {
                return;
            }
            if(this.grdObjects.CurrentCell == null)
            {
                return;
            }
            this.provider.RemoveObject(this.provider.GetObjectAt(this.grdObjects.CurrentCell.RowIndex));
            this.RefreshGrid();
        }
    }
}
