using System;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.UIControls.Grid;
using System.Drawing;
using DCC.UMB.CDF.Lookup.Modal;
using System.Data;

namespace DCC.UMB.CDF.UIControls.Grid.Column
{
    public class DCCGridCell : DataGridViewTextBoxCell
    {
        private EventHandler<LookupEventArgs> looupDialogShowingHandler = null;

        public DCCGridCell()
            : base()
        {
            looupDialogShowingHandler = new EventHandler<LookupEventArgs>(textFieldControl_LookupDialogShowing);
        }

        ///   Whenever the user is to begin editing a cell of this type, the editing
        ///   control must be created, which in this column type's
        ///   case is a subclass of the DCCLongIntTextField control.
        /// 
        ///   This routine sets up all the properties and values
        ///   on this control before the editing begins.
        public override void InitializeEditingControl(int rowIndex,
                                                      object initialFormattedValue,
                                                      DataGridViewCellStyle dataGridViewCellStyle)
        {
            DCCGridColumn owningCol = (DCCGridColumn)this.OwningColumn;
            try
            {
                base.InitializeEditingControl(rowIndex, initialFormattedValue,
                                              dataGridViewCellStyle);

                switch (owningCol.ColumnCellType)
                {
                    case DCCGridCellTypes.TextField:
                        InitializeTextFieldControl();
                        break;
                    case DCCGridCellTypes.Date:
                        InitializeDateTimeFieldControl();
                        break;
                    case DCCGridCellTypes.DoubleFloat:
                        InitializeDoubleFloatControl();
                        break;
                    case DCCGridCellTypes.LongInteger:
                        InitializeLongIntegerControl();
                        break;
                    case DCCGridCellTypes.Combobox:
                        InitializeComboboxControl();
                        break;
                    case DCCGridCellTypes.Label:
                        InitializeLabelControl();
                        break;
                    case DCCGridCellTypes.CheckBox:
                        InitializeCheckBoxControl();
                        break;
                    case DCCGridCellTypes.Object:
                        InitializeLabelControl();
                        break;
                    case DCCGridCellTypes.Button:
                        InitializeButtonControl();
                        break;
                    case DCCGridCellTypes.Link:
                        InitializeLinkControl();
                        break;
                }

            }
            catch (Exception ex)
            {
                throw;
            }
        }
        private void InitializeLinkControl()
        {
            throw new Exception("The method or operation is not implemented.");
        }
        private void InitializeButtonControl()
        {
            throw new Exception("The method or operation is not implemented.");
        }

        private void InitializeCheckBoxControl()
        {
            throw new Exception("The method or operation is not implemented.");
        }

        private void InitializeComboboxControl()
        {
            throw new Exception("The method or operation is not implemented.");
        }

        private void InitializeLabelControl()
        {
            DCCTextField editingControl = InitializeTextTypeControl();
            editingControl.txtField.ReadOnly = true;
        }



        private void InitializeLongIntegerControl()
        {
            InitializeTextTypeControl();
            DCCLongIntegerGridColumn owningColumn = (DCCLongIntegerGridColumn)this.OwningColumn;
            DCCLongIntegerField textFieldControl = (DCCLongIntegerField)DataGridView.EditingControl;
            textFieldControl.MaxValue = owningColumn.MaxValue;
            textFieldControl.MinValue = owningColumn.MinValue;
        }

        private void InitializeDoubleFloatControl()
        {
            InitializeTextTypeControl();
            DCCDoubleFloatGridColumn owningColumn = (DCCDoubleFloatGridColumn)this.OwningColumn;
            DCCDoubleFloatField textFieldControl = (DCCDoubleFloatField)DataGridView.EditingControl;
            textFieldControl.MaxValue = owningColumn.MaxValue;
            textFieldControl.MinValue = owningColumn.MinValue;
        }

        private void InitializeTextFieldControl()
        {
            InitializeTextTypeControl();

            DCCTextFieldGridColumn owningColumn = (DCCTextFieldGridColumn)this.OwningColumn;
            DCCTextField textFieldControl = (DCCTextField)DataGridView.EditingControl;
            textFieldControl.MaxCharacterLength = owningColumn.MaxCharacterLength;
            textFieldControl.RegularExpressionValidator = owningColumn.RegularExpressionValidator;            
        }

        private void InitializeDateTimeFieldControl()
        {
            DCCDateGridColumn owningColumn = (DCCDateGridColumn)this.OwningColumn;
            DCCDateTimeField textFieldControl = (DCCDateTimeField)DataGridView.EditingControl;
            textFieldControl.Title = string.Empty;
            textFieldControl.Lookup = false;
            textFieldControl.Mandatory = owningColumn.Mandatory;
            textFieldControl.ReadOnly = owningColumn.ReadOnly;
            textFieldControl.Padding = new Padding(textFieldControl.Padding.Left + 2,
                                                   textFieldControl.Padding.Top + 3, textFieldControl.Padding.Right,
                                                   textFieldControl.Padding.Bottom);

            textFieldControl.MinValue = owningColumn.MinValue;
            textFieldControl.MaxValue = owningColumn.MaxValue;
            if (this.Value is DateTime)
            {
                textFieldControl.DisplayTextAsDateTime = (DateTime)this.Value;
            }
            else
            {
                textFieldControl.DisplayTextAsDateTime = null;
            }
            ///[[Set the border style of the control itself and the embedded textfield to none
            //so that the border is not displayed in the grid cell. It looks bad and takes on 
            //some pixes in all the 4 sides.
            textFieldControl.BorderStyle = BorderStyle.None;
            textFieldControl.txtField.BorderStyle = BorderStyle.None;
            //]]
        }
        private DCCTextField InitializeTextTypeControl()
        {
            DCCGridColumn owningColumn = (DCCGridColumn)this.OwningColumn;

            DCCTextField textFieldControl = (DCCTextField)DataGridView.EditingControl;

            //[[If the DCCGridColumn has lookup enabled, then remove the previous lookup handler and add a new handler.
            if (owningColumn.Lookup)
            {
                textFieldControl.LookupDialogShowing -= looupDialogShowingHandler;
                textFieldControl.LookupDialogShowing += looupDialogShowingHandler;
            }
            //
            // set up props that are specific to the DCCTextField
            //

            textFieldControl.ClearControlValues();
            textFieldControl.txtField.ReadOnly = owningColumn.ReadOnly;
            textFieldControl.Title = string.Empty;
            textFieldControl.Mandatory = owningColumn.Mandatory;
            textFieldControl.Lookup = owningColumn.Lookup;
            textFieldControl.LookupColumns = owningColumn.LookupColumns;
            textFieldControl.LookupDialogSize = owningColumn.LookupDialogSize;
            textFieldControl.DisplayText = this.Value != null ? this.Value.ToString() : string.Empty;
            textFieldControl.Padding = new Padding(textFieldControl.Padding.Left + 2,
                                                   textFieldControl.Padding.Top + 3, textFieldControl.Padding.Right,
                                                   textFieldControl.Padding.Bottom);

            if (this.Value is LookupResult)
            {
                textFieldControl.LookupResult = (LookupResult)this.Value;
            }

            ///[[Set the border style of the control itself and the embedded textfield to none
            //so that the border is not displayed in the grid cell. It looks bad and takes on 
            //some pixes in all the 4 sides.
            textFieldControl.BorderStyle = BorderStyle.None;
            textFieldControl.txtField.BorderStyle = BorderStyle.None;
            //]]      
            return textFieldControl;
        }

        void textFieldControl_LookupDialogShowing(object sender, LookupEventArgs e)
        {
            DCCTextField editingField = (DCCTextField)sender;
            DCCGrid grid = (DCCGrid)editingField.EditingControlDataGridView;
            grid.RaiseLookupShowingEvent(e);
        }


        //  Returns the type of the control that will be used for editing
        //  cells of this type.  This control must be a valid Windows Forms
        //  control and must implement IDataGridViewEditingControl.
        public override Type EditType
        {
            get
            {
                DCCGridColumn owningCol = (DCCGridColumn)this.OwningColumn;
                switch (owningCol.ColumnCellType)
                {
                    case DCCGridCellTypes.TextField:
                        return typeof(DCCTextField);
                    case DCCGridCellTypes.Date:
                        return typeof(DCCDateTimeField);
                    case DCCGridCellTypes.DoubleFloat:
                        return typeof(DCCDoubleFloatField);
                    case DCCGridCellTypes.LongInteger:
                        return typeof(DCCLongIntegerField);
                    case DCCGridCellTypes.Combobox:
                        throw new Exception("Reached at wrong place");//control should never reach here as we will have default .net cell editors for this cell
                    case DCCGridCellTypes.Label:
                        return typeof(DCCTextField);
                    case DCCGridCellTypes.CheckBox:
                        throw new Exception("Reached at wrong place");//control should never reach here as we will have default .net cell editors for this cell
                }
                return null;
            }
        }

        /// <summary>
        /// Retrieves the data into the grid using the datatable. The bindingKey property
        /// of the grid column is used to pick appropriate values from the table.
        /// </summary>
        /// <param name="table">A DataTable where the column names match with one of the grid-column's
        /// BindingKey property.</param>
        public void RetrieveRecords(DataTable table, bool retainPreviousRows)
        {
            if (retainPreviousRows)
            {

            }
        }



        public override Type ValueType
        {
            get
            {
                DCCGridColumn owningCol = (DCCGridColumn)this.OwningColumn;
                switch (owningCol.ColumnCellType)
                {
                    case DCCGridCellTypes.TextField:
                        if (owningCol.Lookup) return typeof(LookupResult);
                        return typeof(string);
                    case DCCGridCellTypes.Date:
                        break;
                    case DCCGridCellTypes.DoubleFloat:
                        if (owningCol.Lookup) return typeof(LookupResult);
                        return typeof(string);
                    case DCCGridCellTypes.LongInteger:
                        if (owningCol.Lookup) return typeof(LookupResult);
                        return typeof(string);
                    case DCCGridCellTypes.Combobox:
                        return typeof(object);
                    case DCCGridCellTypes.Label:
                        return typeof(string);
                    case DCCGridCellTypes.CheckBox:
                        return typeof(bool);
                }
                return null;
            }
        }
        public override Type FormattedValueType
        {
            get
            {
                return typeof(string);
            }
        }

        public override object ParseFormattedValue(object formattedValue, DataGridViewCellStyle cellStyle, System.ComponentModel.TypeConverter formattedValueTypeConverter, System.ComponentModel.TypeConverter valueTypeConverter)
        {
            return formattedValue;
        }
    }
    public class DCCDataGridViewComboBoxCell : DataGridViewComboBoxCell
    {
        
        protected override void OnKeyDown(KeyEventArgs e, int rowIndex)
        {
            //Give the gird view a chance to handle the events to insert row
            //above, below, bottom and to delete the current row.
            if (this.DataGridView.EditingControl != null)
            {
                ((DCCGrid) this.DataGridView).HandleKeyDownEvent(e);
            }
        }
        

    }
}
