using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace DCC.UMB.CDF.UIControls.Grid.Column
{
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCCheckBoxGridColumn.bmp")]
    public class DCCCheckBoxGridColumn : DCCGridColumn
    {
        public DCCCheckBoxGridColumn()
            : base(DCCGridCellTypes.CheckBox)
        {
            this.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
        }
    }
    
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCComboboxGridColumn.bmp")]
    public class DCCComboboxGridColumn : DCCGridColumn
    {
        public DCCComboboxGridColumn()
            : base(DCCGridCellTypes.Combobox)
        {
        }
    }
    
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCDateGridColumn.bmp")]
    public class DCCDateGridColumn : DCCGridColumn
    {
        private DateTime maxValue = DateTime.MaxValue;
        private DateTime minValue = DateTime.MinValue;
        public DCCDateGridColumn()
            : base(DCCGridCellTypes.Date)
        {
            this.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public DateTime MaxValue
        {
            get { return maxValue; }
            set { maxValue = value; }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public DateTime MinValue
        {
            get { return minValue; }
            set { minValue = value; }
        }
        public override object Clone()
        {
            DCCDateGridColumn clonedColumn = (DCCDateGridColumn)base.Clone();
            clonedColumn.MaxValue = this.MaxValue;
            clonedColumn.MinValue = this.MinValue;
            return clonedColumn;
        }
    }
    
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCDoubleFloatGridColumn.bmp")]
    public class DCCDoubleFloatGridColumn : DCCGridColumn
    {
        private double maxValue = double.MaxValue;
        private double minValue = double.MinValue;
        public DCCDoubleFloatGridColumn()
            : base(DCCGridCellTypes.DoubleFloat)
        {
            this.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public double MaxValue
        {
            get { return maxValue; }
            set { maxValue = value; }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public double MinValue
        {
            get { return minValue; }
            set { minValue = value; }
        }
        public override object Clone()
        {
            DCCDoubleFloatGridColumn clonedColumn = (DCCDoubleFloatGridColumn)base.Clone();
            clonedColumn.MaxValue = this.MaxValue;
            clonedColumn.MinValue = this.MinValue;
            return clonedColumn;
        }
    }
    
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCLabelGridColumn.bmp")]
    public class DCCLabelGridColumn : DCCGridColumn
    {
        public DCCLabelGridColumn()
            : base(DCCGridCellTypes.Label)
        {
        }
    }
    
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCLongIntegerGridColumn.bmp")]
    public class DCCLongIntegerGridColumn : DCCGridColumn
    {
        private long maxValue = long.MaxValue;
        private long minValue = long.MinValue;
        public DCCLongIntegerGridColumn()
            : base(DCCGridCellTypes.LongInteger)
        {
            this.DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public long MaxValue
        {
            get { return maxValue; }
            set { maxValue = value; }
        }

        [Category("DCC.UMB.CDF.UIControls")]
        public long MinValue
        {
            get { return minValue; }
            set { minValue = value; }
        }
        public override object Clone()
        {
            DCCLongIntegerGridColumn clonedColumn = (DCCLongIntegerGridColumn)base.Clone();
            clonedColumn.MaxValue = this.MaxValue;
            clonedColumn.MinValue = this.MinValue;
            return clonedColumn;
        }
    }
   
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCTextFieldGridColumn.bmp")]
    public class DCCTextFieldGridColumn : DCCGridColumn
    {
        private int maxCharacterLength = int.MaxValue;
        private string regularExpressionValidator = string.Empty;

        public DCCTextFieldGridColumn()
            : base(DCCGridCellTypes.TextField)
        {
        }
        [Category("DCC.UMB.CDF.UIControls")]
        [Description("A regular expression string used during validation of the control. For more information on building regular expressions visit http://www.regular-expressions.info/quickstart.html")]
        public string RegularExpressionValidator
        {
            get { return regularExpressionValidator; }
            set { regularExpressionValidator = value; }
        }
        
        [Category("DCC.UMB.CDF.UIControls")]
        public int MaxCharacterLength
        {
            get { return maxCharacterLength; }
            set { maxCharacterLength = value; }
        }

        public override object Clone()
        {
            DCCTextFieldGridColumn clonedColumn = (DCCTextFieldGridColumn)base.Clone();
            clonedColumn.MaxCharacterLength = this.MaxCharacterLength;
            clonedColumn.RegularExpressionValidator = this.RegularExpressionValidator;
            return clonedColumn;
        }
    }
    
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCObjectGridColumn.bmp")]
    public class DCCObjectGridColumn : DCCGridColumn
    {
        public DCCObjectGridColumn()
            : base(DCCGridCellTypes.Object)
        {
        }
    }
    
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCButtonGridColumn.bmp")]
    public class DCCButtonGridColumn : DCCGridColumn
    {
        public DCCButtonGridColumn()
            : base(DCCGridCellTypes.Button)
        {
        }
    }
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCButtonGridColumn.bmp")]
    public class DCCLinkGridColumn : DCCGridColumn
    {
        public DCCLinkGridColumn()
            : base(DCCGridCellTypes.Link)
        {
        }
    }
}
