using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.MGMT.View;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.UIControls.UIAutomation;

namespace DCC.UMB.CDF.UIControls
{
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.SummaryDetailNavigator.bmp")]
    public partial class SummaryDetailNavigator : UserControl, IUIAutomationCodeProvider, IDCCControl
    {
        public enum NavigatorDisplayStyle
        {
            Text,
            Icons
        }
        public enum NavigatorLayoutStyle
        {
            SingleColumn = 1,
            DoubleColumn
        }
        private NavigatorDisplayStyle displayStyle = NavigatorDisplayStyle.Icons;
        private NavigatorLayoutStyle layoutStyle = NavigatorLayoutStyle.SingleColumn;

        private bool moveVisible = true;
        private bool navigateVisible = true;
        private bool addDeleteVisible = true;
        private bool counterVisible = true;

        private DCCGrid grid = null;
        private ISummaryDetailEditor summaryDetailEditor = null;
        private static string DETAIL_VIEW_TEXT = "DETL";
        private static string SUMMARY_VIEW_TEXT = "SMRY";


        public SummaryDetailNavigator()
        {
            InitializeComponent();
            this.SizeChanged += new EventHandler(UserControl1_SizeChanged);
            this.SetLayout();
            EnableInsertBefore = true;
        }
        public string UserFriendlyName
        {
            get
            {
                return this.Name ;
            }
        }
        public new string Name
        {
            get { return base.Name; }
            set
            {
                base.Name = value;
                this.toolStrip1.Name = value;
                this.btnToggle.Name = "btnToggle_" + value;
            }
        }
        [System.ComponentModel.Browsable(false)]
        [System.ComponentModel.ReadOnly(true)]
        public NavigatorDisplayStyle DisplayStyle
        {
            get { return displayStyle; }
            set
            {
                displayStyle = value;
                //SetDisplayStyle();
            }
        }
        [System.ComponentModel.Browsable(false)]
        [System.ComponentModel.ReadOnly(true)]
        public NavigatorLayoutStyle LayoutStyle
        {
            get { return layoutStyle; }
            set
            {
                layoutStyle = value;
            }
        }
        /// <summary>
        /// Gets and Sets an instance of ISummaryDetailEditor with this control. Typically this is 
        /// the screen which is using SummaryDetailNavigator control
        /// </summary>
        public ISummaryDetailEditor SummaryDetailEditor
        {
            get { return summaryDetailEditor; }
            set
            {
                //[[Check if the UserMode property of the passed grid is set to "Program". If it is any other
                //value than "Program" then throw an error
                if (value != null && value.Grid.UserMode != UserModes.Program)
                {
                    throw new Exception("UserMode property must be \"Program\" for summary view grids");
                }
                //]]

                this.summaryDetailEditor = value;
                if (value != null)
                {
                    value.Grid.RowSelectionModified += new EventHandler<GridRowSelectionModifiedEventArgs>(Grid_RowSelectionModified);
                    value.Grid.RecordsRetrieved += new EventHandler<RecordsRetrievedEventArgs>(Grid_RecordsRetrieved);
                    value.Grid.GridCleared += new EventHandler<EventArgs>(Grid_GridCleared);
                    value.Grid.DoubleClick += new EventHandler(Grid_DoubleClick);
                    //[[force the detailed view as disalbed for the first time.
                    this.summaryDetailEditor.EnableDetailView(false);
                    //]]                  

                }
            }
        }

        void Grid_DoubleClick(object sender, EventArgs e)
        {
            this.ToggleView(true);
        }


        void UserControl1_SizeChanged(object sender, EventArgs e)
        {
            SetLayout();
        }
        private void SetLayout()
        {
            LayoutSettings settings = this.toolStrip1.LayoutSettings;
            TableLayoutSettings tls = (TableLayoutSettings)settings;

            if (this.Width <= 45)
            {
                int leftMargin = (this.toolStrip1.Width - this.btnBefore.Width) / 2;
                tls.ColumnCount = 1;
                tls.SetColumnSpan(this.lblCounter, 1);
                //tls.SetColumnSpan(this.btnToggleSummaryDetail, 1);


                this.btnBefore.Margin = new Padding(leftMargin, 1, 0, 2);
                this.btnAfter.Margin = new Padding(leftMargin, 1, 0, 2);
                this.btnLast.Margin = new Padding(leftMargin, 1, 0, 2);
                this.btnDelete.Margin = new Padding(leftMargin, 1, 0, 10);

                this.btnPrevious.Margin = new Padding(leftMargin, 1, 0, 2);
                this.btnNext.Margin = new Padding(leftMargin, 1, 0, 10);

                this.btnUp.Margin = new Padding(leftMargin, 1, 0, 2);
                this.btnDown.Margin = new Padding(leftMargin, 1, 0, 10);

                this.toolStrip1.Items.Clear();
                this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[]
                                                   {
                                                       this.btnBefore,
                                                       this.btnAfter,
                                                       this.btnLast,
                                                       this.btnDelete,
                                                       this.btnPrevious,
                                                       this.btnNext,
                                                       this.btnUp,
                                                       this.btnDown,
                                                       this.lblCounter
                                                   });

            }
            else
            {
                tls.ColumnCount = 2;
                int leftMargin = (this.toolStrip1.Width / 2 - this.btnBefore.Width) / 2;

                tls.SetColumnSpan(this.lblCounter, 2);
                //tls.SetColumnSpan(this.btnToggleSummaryDetail, 2);

                this.btnBefore.Margin = new Padding(leftMargin, 1, 0, 2);
                this.btnAfter.Margin = new Padding(leftMargin, 1, 0, 2);
                this.btnLast.Margin = new Padding(leftMargin, 1, 0, 10);
                this.btnDelete.Margin = new Padding(leftMargin, 1, 0, 10);

                this.btnPrevious.Margin = new Padding(leftMargin, 1, 0, 10);
                this.btnNext.Margin = new Padding(leftMargin, 1, 0, 10);

                this.btnUp.Margin = new Padding(leftMargin, 1, 0, 10);
                this.btnDown.Margin = new Padding(leftMargin, 1, 0, 10);

                this.toolStrip1.Items.Clear();
                this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[]
                                                   {
                                                       this.btnBefore,
                                                       this.btnLast,
                                                       this.btnAfter,
                                                       this.btnDelete,
                                                       this.btnPrevious,
                                                       this.btnNext,
                                                       this.btnUp,
                                                       this.btnDown,
                                                       this.lblCounter
                                                   });
            }


            //SetFillStyleOfButton(this.btnToggleSummaryDetail);

            SetFillStyleOfButton(this.btnLast);
            SetFillStyleOfButton(this.btnBefore);
            SetFillStyleOfButton(this.btnAfter);
            SetFillStyleOfButton(this.btnDelete);

            SetFillStyleOfButton(this.btnUp);
            SetFillStyleOfButton(this.btnDown);

            SetFillStyleOfButton(this.btnPrevious);
            SetFillStyleOfButton(this.btnNext);

            SetFillStyleOfButton(this.lblCounter);


            this.btnLast.Visible = this.addDeleteVisible;
            this.btnBefore.Visible = this.addDeleteVisible;
            this.btnAfter.Visible = this.addDeleteVisible;
            this.btnDelete.Visible = this.addDeleteVisible;

            this.btnUp.Visible = this.moveVisible;
            this.btnDown.Visible = this.moveVisible;

            this.btnPrevious.Visible = this.navigateVisible;
            this.btnNext.Visible = this.navigateVisible;



        }

        private void SetFillStyleOfButton(ToolStripItem item)
        {
            item.Dock = DockStyle.Fill;
            item.Anchor = AnchorStyles.Top;
        }


        public bool PanelMoveVisible
        {
            get { return moveVisible; }
            set
            {
                moveVisible = value;
                SetLayout();
            }
        }

        public bool PanelShowVisible
        {
            get { return navigateVisible; }
            set
            {
                navigateVisible = value;
                SetLayout();
            }
        }

        public bool PanelInsertVisible
        {
            get { return addDeleteVisible; }
            set
            {
                addDeleteVisible = value;
                SetLayout();
            }
        }

        public bool CounterVisible
        {
            get { return counterVisible; }
            set
            {
                counterVisible = value;
                SetLayout();
            }
        }

        private void UserControl1_Load(object sender, EventArgs e)
        {

        }

        void Grid_GridCleared(object sender, EventArgs e)
        {
            this.GetSummaryDetailEditor().EnableDetailView(false);
            this.GetSummaryDetailEditor().ClearDetailView();
            UpdateCounter();
            EnableDisableNavigationButtons();
        }

        void Grid_RecordsRetrieved(object sender, RecordsRetrievedEventArgs e)
        {
            try
            {
                this.GetSummaryDetailEditor().EnableDetailView(false);
                this.GetSummaryDetailEditor().ClearDetailView();
                if (this.GetSummaryDetailEditor().Grid.Rows.Count > 0)
                {
                    this.GetSummaryDetailEditor().Grid.SetCurrentRow(0);
                }
            }
            finally
            {
                UpdateCounter();
                EnableDisableNavigationButtons();
            }

        }

        void Grid_RowSelectionModified(object sender, GridRowSelectionModifiedEventArgs e)
        {
            Guid uiTxn = Guid.Empty;
            try
            {
                uiTxn = CursorManager.BeginTransaction("Loading data, please wait...", false, this.grid);
                this.GetSummaryDetailEditor().EnableDetailView(false);
                this.GetSummaryDetailEditor().ClearDetailView();
                if (this.GetSummaryDetailEditor().Grid.CurrentRow != null)
                {
                    this.GetSummaryDetailEditor().EnableDetailView(true);
                    this.GetSummaryDetailEditor().LoadSumaryToDetail();
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                UpdateCounter();
                EnableDisableNavigationButtons();
                CursorManager.EndTransaction(uiTxn);
            }
        }

        private void EnableDisableNavigationButtons()
        {
            if (this.GetSummaryDetailEditor().Grid.Rows.Count == 0)
            {
                ///[[Toolbar items
                this.btnDown.Enabled = false;
                this.btnUp.Enabled = false;
                this.btnNext.Enabled = false;
                this.btnPrevious.Enabled = false;
                this.btnBefore.Enabled = false;
                this.btnAfter.Enabled = false;
                this.btnLast.Enabled = EnableInsertLast && true;
                this.btnDelete.Enabled = false;
                ///]]
                return;
            }
            this.btnDown.Enabled = !IsSummaryGridLastRow() && EnableMoveDown;
            this.btnUp.Enabled = !IsSummaryGridFirstRow() && EnableMoveUp;
            this.btnNext.Enabled = !IsSummaryGridLastRow() && EnableNext &&
                                                this.GetSummaryDetailEditor().Grid.Rows.Count > 0;
            this.btnPrevious.Enabled = !IsSummaryGridFirstRow() && enablePrevious &&
                                                this.GetSummaryDetailEditor().Grid.Rows.Count > 0;
            this.btnBefore.Enabled = EnableInsertBefore && this.GetSummaryDetailEditor().Grid.Rows.Count > 0;
            this.btnAfter.Enabled = EnableInsertAfter && this.GetSummaryDetailEditor().Grid.Rows.Count > 0;
            this.btnDelete.Enabled = EnableDeleteRow && this.GetSummaryDetailEditor().Grid.Rows.Count > 0; ;
            this.btnLast.Enabled = EnableInsertLast && this.GetSummaryDetailEditor().Grid.Rows.Count > 0;
        }
        private bool IsSummaryGridLastRow()
        {
            return this.GetSummaryDetailEditor().Grid.CurrentRowIndex == (this.GetSummaryDetailEditor().Grid.Rows.Count - 1);
        }
        private bool IsSummaryGridFirstRow()
        {
            return this.GetSummaryDetailEditor().Grid.CurrentRowIndex == 0;
        }

        private ISummaryDetailEditor GetSummaryDetailEditor()
        {
            if (this.summaryDetailEditor == null)
            {
                throw new Exception("Property \"SummaryDetailEditor\" of this SummaryDetailNavigator object is not set.");
            }
            return this.SummaryDetailEditor;
        }


        private void btnAfter_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Adding a record, please wait...", true, this);
                if (!PrepareForNewRow())
                {
                    return;
                }
                string rowIdentifier = this.GetSummaryDetailEditor().Grid.InsertRowBelow();
                this.GetSummaryDetailEditor().Grid.SetCurrentRow(rowIdentifier);
                this.ToggleView(true);
            }
            catch (DCCException ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }

        private void btnBefore_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Adding a record, please wait...", true, this);
                if (!PrepareForNewRow())
                {
                    return;
                }
                string rowIdentifier = this.GetSummaryDetailEditor().Grid.InsertRowAbove();
                this.GetSummaryDetailEditor().Grid.SetCurrentRow(rowIdentifier);
                this.ToggleView(true);
            }
            catch (DCCException ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }

        private void btnLast_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Adding a record, please wait...", true, this);
                if (!PrepareForNewRow())
                {
                    return;
                }
                string rowIdentifier = this.GetSummaryDetailEditor().Grid.InsertRowBottom();
                this.GetSummaryDetailEditor().Grid.SetCurrentRow(rowIdentifier);
                this.ToggleView(true);
            }
            catch (DCCException ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }

        private bool PrepareForNewRow()
        {
            ///[[first see if the detials view is valid, if yes, load the details view data into
            //summary view, else get out of here.
            //But also check that if there is no row loaded in the detailed view, then simply exit
            if (this.GetSummaryDetailEditor().Grid.CurrentCell == null)
            {
                return true;
            }
            if (!this.GetSummaryDetailEditor().IsDetailViewValid())
            {
                return false;
            }
            else
            {
                this.GetSummaryDetailEditor().LoadDetailToSummary();
                return true;
            }
            //]]
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Moving to next record, please wait...", true, this);
                if (!this.GetSummaryDetailEditor().IsDetailViewValid())
                {
                    return;
                }
                //Load the current detailview data to summary view.
                if (IsDetailView())
                {
                    this.GetSummaryDetailEditor().LoadDetailToSummary();
                }
                if (this.GetSummaryDetailEditor().Grid.CurrentRowIndex < this.GetSummaryDetailEditor().Grid.Rows.Count - 1)
                {
                    this.GetSummaryDetailEditor().Grid.SetCurrentRow(this.GetSummaryDetailEditor().Grid.CurrentRowIndex + 1);
                }
            }
            catch (DCCException ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }

        private void btnPrevious_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Moving to next record, please wait...", true, this);
                if (!this.GetSummaryDetailEditor().IsDetailViewValid())
                {
                    return;
                }
                //Load the current detailview data to summary view.
                if (IsDetailView())
                {
                    this.GetSummaryDetailEditor().LoadDetailToSummary();
                }
                if (this.GetSummaryDetailEditor().Grid.CurrentRowIndex > 0)
                {
                    this.GetSummaryDetailEditor().Grid.SetCurrentRow(this.GetSummaryDetailEditor().Grid.CurrentRowIndex - 1);
                }
            }
            catch (DCCException ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }

        private void btnUp_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Moving up the record, please wait....", true, this);
                if (!this.GetSummaryDetailEditor().IsDetailViewValid())
                {
                    return;
                }
                //Load the current detailview data to summary view.
                if (IsDetailView())
                {
                    this.GetSummaryDetailEditor().LoadDetailToSummary();
                }
                //]]
                this.GetSummaryDetailEditor().Grid.SwapRows(this.GetSummaryDetailEditor().Grid.CurrentRowIndex,
                                                            this.GetSummaryDetailEditor().Grid.CurrentRowIndex - 1);
            }
            catch (DCCException ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }


        }

        private void btnDown_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Moving up the record, please wait....", true, this);
                if (!this.GetSummaryDetailEditor().IsDetailViewValid())
                {
                    return;
                }
                //Load the current detailview data to summary view.
                if (IsDetailView())
                {
                    this.GetSummaryDetailEditor().LoadDetailToSummary();
                }
                //]]
                this.GetSummaryDetailEditor().Grid.SwapRows(this.GetSummaryDetailEditor().Grid.CurrentRowIndex,
                                                            this.GetSummaryDetailEditor().Grid.CurrentRowIndex + 1);
            }
            catch (DCCException ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Deleting the record, please wait....", true, this);
                this.GetSummaryDetailEditor().Grid.DeleteRow();
                Grid_RowSelectionModified(null, null);
            }
            catch (DCCException ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }
        public void ClearControlValues()
        {
            if (this.grid != null)
            {
                this.grid.RemoveAllRecords();
            }
            this.GetSummaryDetailEditor().ClearDetailView();
        }

        //This method updates the counter shwoing the current record vs. max records in the summary grid.
        private void UpdateCounter()
        {
            try
            {
                //int deletedRowsCount = this.GetSummaryDetailEditor().Grid.GetRowsForState(RowStates.Deleted).Count;
                //int totalRowsCount = this.GetSummaryDetailEditor().Grid.RowCount;
                DCCGrid grid = this.GetSummaryDetailEditor().Grid;
                int activeRowCount = grid.GetRowsForState(RowStates.Old).Count +
                                     grid.GetRowsForState(RowStates.Updated).Count +
                                     grid.GetRowsForState(RowStates.New).Count;
                this.lblCounter.Text = this.GetSummaryDetailEditor().Grid.CurrentRowIndex + 1 + " / " + activeRowCount;
            }
            catch (Exception e)
            {
                this.lblCounter.Text = "ERR";
            }
        }

        private bool enableInsertAfter = true;

        /// <summary>
        /// Enables/Disables the "Insert After" Button on this control
        /// </summary>
        public bool EnableInsertAfter
        {
            get { return enableInsertAfter; }
            set { enableInsertAfter = value; }
        }

        private bool enableInsertBefore = true;

        /// <summary>
        /// Enables/Disables the "Insert Before" Button on this control
        /// </summary>
        public bool EnableInsertBefore
        {
            get { return enableInsertBefore; }
            set { enableInsertBefore = value; }
        }

        private bool enableInsertLast = true;

        /// <summary>
        /// Enables/Disables the "Insert Last" Button on this control
        /// </summary>
        public bool EnableInsertLast
        {
            get { return enableInsertLast; }
            set { enableInsertLast = value; }
        }

        private bool enableNext = true;

        /// <summary>
        /// Enables/Disables the "Next" button on this control
        /// </summary>
        public bool EnableNext
        {
            get { return enableNext; }
            set { enableNext = value; }
        }

        private bool enablePrevious = true;

        /// <summary>
        /// Enables/Disables the "Previous" button on this control
        /// </summary>
        public bool EnablePrevious
        {
            get { return enablePrevious; }
            set { enablePrevious = value; }
        }

        private bool enableMoveUp = true;

        /// <summary>
        /// Enables/Disables the "Move Up" button on this control
        /// </summary>
        public bool EnableMoveUp
        {
            get { return enableMoveUp; }
            set { enableMoveUp = value; }
        }


        private bool enableMoveDown = true;

        /// <summary>
        /// Enables/Disables the "Move Down" button on this control
        /// </summary>
        public bool EnableMoveDown
        {
            get { return enableMoveDown; }
            set { enableMoveDown = value; }
        }

        private bool enableDeleteRow = true;

        /// <summary>
        /// Enables/Disables the "Delete" button on this control
        /// </summary>
        public bool EnableDeleteRow
        {
            get { return enableDeleteRow; }
            set { enableDeleteRow = value; }
        }


        public void ToggleView(bool showDetails)
        {
            Guid uiTxn = Guid.Empty;
            try
            {
                uiTxn = CursorManager.BeginTransaction("Loading data, please wait...", false, this);
                if (this.GetSummaryDetailEditor().Grid.CurrentRowIndex < 0) return;
                if (!showDetails)
                {
                    if (this.GetSummaryDetailEditor().IsDetailViewValid())
                    {
                        this.GetSummaryDetailEditor().LoadDetailToSummary();
                        this.btnToggle.Tag = DETAIL_VIEW_TEXT;
                        this.btnToggle.Image = global::DCC.UMB.CDF.Properties.Resources.SD_Show_Details;
                        this.toolTip1.SetToolTip(this.btnToggle, "Switch to Detail View");
                        this.GetSummaryDetailEditor().ToggleView(false);
                    }
                }
                else
                {
                    this.GetSummaryDetailEditor().LoadSumaryToDetail();
                    this.btnToggle.Tag = SUMMARY_VIEW_TEXT;
                    this.btnToggle.Image = global::DCC.UMB.CDF.Properties.Resources.SD_Show_Summary;
                    this.toolTip1.SetToolTip(this.btnToggle, "Switch to Summary View");
                    this.GetSummaryDetailEditor().ToggleView(true);
                }
            }
            catch (Exception ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(uiTxn);
            }
        }
        /// <summary>
        /// Specifies whether or not the current view is deails view.
        /// </summary>
        /// <returns></returns>
        public bool IsDetailView()
        {
            //return string.Equals(this.btnToggleSummaryDetail.Text.Trim(), SUMMARY_VIEW_TEXT);
            return string.Equals(this.btnToggle.Tag.ToString().Trim(), SUMMARY_VIEW_TEXT);
        }
        /// <summary>
        /// This method prepares the summary-detail view for saving. The following
        /// actions are taken
        /// 1. The detial view data is validated by invoking function IsDetailViewValid()
        /// 2. The detail view data is transferred to summary view.
        /// </summary>
        /// <returns></returns>
        public bool PrepareForSave()
        {
            //Check if the detail view is valid. If yes, then transfer the detail view 
            //data to summary view
            if (this.GetSummaryDetailEditor().Grid.CurrentCell == null)//This means that there is no row in summary view.
            {
                return true;
            }
            if (this.GetSummaryDetailEditor().IsDetailViewValid())
            {
                this.GetSummaryDetailEditor().LoadDetailToSummary();
                return true;
            }
            return false;
        }

        private void btnToggle_Click(object sender, EventArgs e)
        {
            Guid tranGuid = Guid.Empty;
            try
            {
                tranGuid = CursorManager.BeginTransaction("Toggling view...");
                ToggleView(!IsDetailView());
            }
            catch (DCCException ex)
            {
                UIManager.DisposeException(ex);
            }
            finally
            {
                CursorManager.EndTransaction(tranGuid);
            }
        }






        #region IUIAutomationCodeProvider Members

        public string GetAutomationCode()
        {
            string template = "public TAFSummaryDetailNavigator uiAutomationId{get{return this.GetTextField(\"uiAutomationId\");}}";
            return template.Replace("uiAutomationId", this.toolStrip1.Name);
        }

        #endregion

        public bool IsValid()
        {
            return PrepareForSave();
        }

        public bool ReadOnly
        {
            get
            {
                return false;
            }
            set
            {
                //do nothing.
            }
        }

        public bool Mandatory
        {
            get
            {
                return false;
            }
            set
            {
                //Do nothing.
            }
        }
    }
    /// <summary>
    /// This interface defines methods to implement the summary and detail view through SummaryDetailNavigator Control
    /// This interface must be implemented by a screen which has a summary detail type of scenerio.
    /// </summary>
    public interface ISummaryDetailEditor
    {
        /// <summary>
        /// Returns the instance of the DCCGrid which is serving as the SummaryView grid.
        /// </summary>
        DCCGrid Grid { get; }

        /// <summary>
        /// Returns a bool specifying whether or not the current detialed view is valid.
        /// This method will be invoked by SummaryDetailNavigator control at all those times
        /// when the current detail view must be sent back to summary view and a different record
        /// from summary view must be loaded. If this method returns false, then the detail view is
        /// retained as such unless user fixes the detail view data. It is in this method, the 
        /// screen will show messages to the user about the descrepancies in the detail view.
        /// </summary>
        /// <returns></returns>
        bool IsDetailViewValid();

        /// <summary>
        /// This method is invoked by SummaryDetailNavigator when the contents of the summary view 
        /// should be loaded to the detailed view. In this method conents from the CurrentRow of the summary
        /// view must be loaded on to the detailed view.
        /// </summary>
        void LoadSumaryToDetail();

        /// <summary>
        /// This method is invoked by SummaryDetailNavigator when the contents of the detailed view 
        /// should be loaded to the summary view. In this method conents from the detailed view
        /// must be loaded into the CurrentRow of the summary view grid
        /// </summary>
        void LoadDetailToSummary();

        /// <summary>
        /// This method is invoked by the SummaryDetailNavigator when the user presses the button "Summary"/"Detail"
        /// to toggle the view from summary to deail or vice versa. Assuming the layout of the summary and detailed
        /// view is done in SplitContainer, then use the properties Panel2Collapsed or Panel1Collapsed to provide
        /// appropriate view to the user.
        /// </summary>
        /// <param name="showDetails"></param>
        void ToggleView(bool showDetails);

        /// <summary>
        /// This method is invoked by the SummaryDetailNavigator when there is no appropriate row in the summary view
        /// to be displayed in the detail view. The typical implementation would be to set the Enable property 
        /// of the entire panel, containing the detail view, to false/true
        /// </summary>
        /// <param name="enable"></param>
        void EnableDetailView(bool enable);

        /// <summary>
        /// This method is invoked by SummaryDetailNavigator when it wants to clear the contnets of the detail view
        /// e.g. there is only one row in the summary view grid. The detailed view is filled corresponding to 
        /// the ONLY row of the summary view. Users presses on the "Delete" button on the SummaryDetailNavigator. 
        /// The row gets deleted from the summary view, however there is no row for which the detail view should show the
        /// data and hence this function is called.
        /// </summary>
        void ClearDetailView();

        /// <summary>
        /// This function is invoked by SummaryDetailNavigator when it tries to check if the current detail view
        /// is empty. In true, the current record of the summary view, can be ignored while any save operations.
        /// </summary>
        /// <returns></returns>
        //bool IsDetailViewEmpty();
    }

}
