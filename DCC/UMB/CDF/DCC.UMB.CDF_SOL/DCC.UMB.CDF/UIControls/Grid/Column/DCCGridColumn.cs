using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing.Design;
using System.Windows.Forms;
using System.Drawing;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.UIControls.TextControls.Lookup;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.Lookup;

namespace DCC.UMB.CDF.UIControls.Grid.Column
{
    //  The base object for the custom column type.  Programmers manipulate
    //  the column types most often when working with the DataGridView, and
    //  this one sets the basics and Cell Template values controlling the
    //  default behaviour for cells of this column type.
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCTextFieldGridColumn.bmp")]
    public class DCCGridColumn : DataGridViewColumn
    {
        float percentageWidth = 25;
        bool lookup = false;
        string toolTipLookupField = "information";
        string lookupColumns = string.Empty;
        bool mandatory = false;
        private DCCGridCellTypes columnCellType = DCCGridCellTypes.Label;
        private string bindingKey;
        internal event EventHandler<EventArgs> LookupPropertyChanged = null;
        private SortOrder sortOrder = SortOrder.None;
        private LookupDialogSizes lookupDialogSize = LookupDialogSizes.Normal;
        ////[[ This property is defined to initalize to a guid value, as the columns is added into the grid first
        /// and then the name property is set. But on the columnAdded event, we are adding a corresponding column in
        /// the GridDataModel class, where we must have a valid column name to add a column. Later, when the Name property
        /// of grid column is changed, we are capturing that event in GridDataModel and changing the name of that column
        /// where the name matches with this guidName property.
        private string guidName = string.Empty;
        ///]]

        //  Initializes a new instance of this class, making sure to pass
        //  to its base constructor an instance of a MaskedTextBoxCell 
        //  class to use as the basic template.
        public DCCGridColumn()
            : this(DCCGridCellTypes.TextField)
        {
        }

        public DCCGridColumn(DCCGridCellTypes aCellType)
        {
            this.Name = Guid.NewGuid().ToString();
            this.guidName = this.Name;
            SetColumnCellType(aCellType);
            this.SortMode = DataGridViewColumnSortMode.Programmatic;            
            this.HeaderCell.Style = new DCCDataGridViewCellStyle();                        
        }
              
        internal SortOrder SortOrder
        {
            get { return sortOrder; }
            set
            {
                sortOrder = value;
                this.HeaderCell.SortGlyphDirection = value;
            }
        }
        public void RemoveSort()
        {
            this.SortOrder = SortOrder.None;
        }
        internal string GuidName
        {
            get { return guidName; }
        }

        

        /// <summary>
        /// Overrideen this property just to adjust the colors of the readonly column.
        /// </summary>
        [Category("DCC.UMB.CDF.UIControls")]
        public override bool ReadOnly
        {
            get
            {
                return base.ReadOnly;
            }
            set
            {
                base.ReadOnly = value;
                AdjustColors();
            }
        }
        [Category("DCC.UMB.CDF.UIControls")]
        [Browsable(false)]
        public string ToolTipLookupField
        {
            get { return toolTipLookupField; }
            set { toolTipLookupField = value; }
        }
       

        //This method has to be overridden to copy over custom properties (like mandatory, percentage width etc) on to the 
        //cloned object. This will allow the visual column editor to edit our columns.
        public override object Clone()
        {
            DCCGridColumn clonedColumn = (DCCGridColumn)base.Clone();
            clonedColumn.Name = this.Name;
            clonedColumn.guidName = this.GuidName;
            clonedColumn.Mandatory = this.mandatory;
            clonedColumn.percentageWidth = this.percentageWidth;
            clonedColumn.LookupColumns = this.LookupColumns;
            clonedColumn.Lookup = this.Lookup;
            clonedColumn.BindingKey = this.BindingKey;
            clonedColumn.ReadOnly = this.ReadOnly;
            clonedColumn.lookupDialogSize = this.lookupDialogSize;                
            return clonedColumn;
        }



        public void SetColumnCellType(DCCGridCellTypes aCellType)
        {
            this.columnCellType = aCellType;
            ///[[base upon the cell type of this column set the editing celltype
            //that is the cellTemplate. For all the derivatives of DCCTextField,
            //assign the DCCGridCell, and for combo and check box type of cells, 
            //assign the default .net cell editors.
            switch (aCellType)
            {
                case DCCGridCellTypes.TextField:
                    this.CellTemplate = new DCCGridCell();
                    break;
                case DCCGridCellTypes.Date:
                    this.CellTemplate = new DCCGridCell();
                    break;
                case DCCGridCellTypes.DoubleFloat:
                    this.CellTemplate = new DCCGridCell();
                    break;
                case DCCGridCellTypes.LongInteger:
                    this.CellTemplate = new DCCGridCell();
                    break;
                case DCCGridCellTypes.Combobox:
                    DCCDataGridViewComboBoxCell comboTemplate = new DCCDataGridViewComboBoxCell();
                    comboTemplate.DisplayStyle = DataGridViewComboBoxDisplayStyle.ComboBox;
                    this.CellTemplate = comboTemplate;
                    break;
                case DCCGridCellTypes.Label:
                    this.CellTemplate = new DCCGridCell();
                    this.ReadOnly = true;
                    break;
                case DCCGridCellTypes.CheckBox:
                    this.CellTemplate = new DataGridViewCheckBoxCell();
                    break;
                case DCCGridCellTypes.Object:
                    this.CellTemplate = new DCCGridCell();
                    this.ReadOnly = true;
                    break;
                case DCCGridCellTypes.Button:
                    DataGridViewButtonCell template = new DataGridViewButtonCell();
                    template.UseColumnTextForButtonValue = true;
                    template.FlatStyle = FlatStyle.Popup;
                    this.CellTemplate = template;
                    break;
                case DCCGridCellTypes.Link:
                    DataGridViewLinkCell linkCellTemplate = new DataGridViewLinkCell();
                    this.CellTemplate = linkCellTemplate;
                    break;
            }
            //]]
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public virtual bool Mandatory
        {
            get { return mandatory; }
            set
            {
                mandatory = value;
                AdjustColors();
            }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        [Description("LookupColumn"), Editor(typeof(TableCreator), typeof(UITypeEditor))]
        public virtual string LookupColumns
        {
            get { return lookupColumns; }
            set { lookupColumns = value; }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public virtual bool Lookup
        {
            get { return lookup; }
            set
            {
                lookup = value;
                if (LookupPropertyChanged != null)
                {
                    EventHandler<EventArgs> handler = LookupPropertyChanged;
                    // Event will be null if there are no subscribers
                    //LookupPropertyChangedEventArgs args = new LookupPropertyChangedEventArgs(this);
                    if (handler != null)
                    {
                        handler(this, new EventArgs());
                    }
                }
            }
        }
        
        [Category("DCC.UMB.CDF.UIControls")]
        public virtual LookupDialogSizes LookupDialogSize
        {
            get { return this.lookupDialogSize; }
            set { this.lookupDialogSize = value; }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public virtual float PercentageWidth
        {
            get { return percentageWidth; }
            set
            {
                percentageWidth = value;

                //hide the column if the %age width specified is 0.
                this.Visible = value == 0 ? false : true;
            }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public virtual DCCGridCellTypes ColumnCellType
        {
            get { return this.columnCellType; }
            set
            {
                this.columnCellType = value;
                this.SetColumnCellType(value);
            }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public virtual string BindingKey
        {
            get { return bindingKey; }
            set { bindingKey = value; }
        }

        private void AdjustColors()
        {
            //if (true) return;
            if (this.DataGridView == null || this.DataGridView.GetType() != typeof(DCCGrid))
            {
                return;
            }

            //[[Now evaluate the fore and back colors based upon the properties.
            Color foreColor = Constants.DEFAULT_READWRITE_FORE_COLOR;
            if (this.ReadOnly)
            {
                foreColor = Constants.DEFAULT_READONLY_FORE_COLOR;
            }
            Color backColor = Constants.DEFAULT_NON_MANDATORY_BACK_COLOR;
            if (this.Mandatory)
            {
                backColor = Constants.DEFAULT_MANDATORY_BACK_COLOR;
            }
            //]]
           
            //[[Now form a DataGridViewCellStyle object and apply to this Column's Header.
            
            DataGridViewCellStyle existingDefaultHeaderStyle = DCCGrid.DccGridColumnHeaderCellStyle;
            DataGridViewCellStyle styleForThisColumnHeader = existingDefaultHeaderStyle.Clone();
            if (this.ReadOnly)
            {
                styleForThisColumnHeader.ForeColor = foreColor; //If the Column is readonly, then show header in Maroon color
            }
            else
            {
                styleForThisColumnHeader.ForeColor = System.Drawing.SystemColors.HotTrack;//If the column is editable, then show the fore color of the header as HotTrack.
            }
            
            if (this.DataGridView != null && this.DataGridView.GetType() == typeof(DCCGrid))
            {
                if (((DCCGrid)this.DataGridView).Mandatory)
                {
                    styleForThisColumnHeader.BackColor = Constants.DEFAULT_MANDATORY_BACK_COLOR;
                }
                else
                {
                    styleForThisColumnHeader.BackColor = Constants.DEFAULT_NON_MANDATORY_BACK_COLOR;
                }

            }
            
            //[[//Add some padding to the Header cell, so that it stands out.
            Padding headerPadding = new Padding(0,3,0,3);
            styleForThisColumnHeader.Padding = headerPadding;
            //]]
            //[[If this column has lookup enabled on it, then show the header text as underlined.
            if(this.Lookup)
            {
                Font existingFont = existingDefaultHeaderStyle.Font;
                Font newFontForLookupColumnHeader = new Font(existingFont, FontStyle.Underline);
                styleForThisColumnHeader.Font = newFontForLookupColumnHeader;
            }
            //]]

            //finally apply the style.
            this.HeaderCell.Style = styleForThisColumnHeader;
            //]]

            if (this.ReadOnly)
            {
                this.DefaultCellStyle.ForeColor = Constants.DEFAULT_READONLY_FORE_COLOR;                                 
            }
            if (this.mandatory)
            {
                this.DefaultCellStyle.BackColor = Constants.DEFAULT_MANDATORY_BACK_COLOR;
            }
            else
            {
                this.DefaultCellStyle.BackColor = Constants.DEFAULT_NON_MANDATORY_BACK_COLOR;
            }
        }
    }

    public class DCCDataGridViewCellStyle : DataGridViewCellStyle
    {
        public DCCDataGridViewCellStyle()
            : base()
        {
            this.Alignment = DataGridViewContentAlignment.MiddleCenter;
            this.BackColor = SystemColors.Control;
            this.Font = new Font("Verdana", 9F, FontStyle.Regular, GraphicsUnit.Point, ((byte)(0)));
            this.ForeColor = SystemColors.HotTrack;            
            this.SelectionBackColor = SystemColors.Highlight;
            this.SelectionForeColor = SystemColors.HighlightText;
            this.WrapMode = DataGridViewTriState.True;
        }
    }
    public class LookupPropertyChangedEventArgs : EventArgs
    {
        private DCCGridColumn column;
        public LookupPropertyChangedEventArgs(DCCGridColumn column)
        {
            this.column = column;
        }
        public DCCGridColumn Column
        {
            get { return column; }
        }
    }


}