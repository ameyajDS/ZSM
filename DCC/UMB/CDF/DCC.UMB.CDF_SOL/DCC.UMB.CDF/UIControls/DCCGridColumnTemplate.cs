using System;
using System.Collections.Generic;
using System.Text;

namespace DCC.UMB.CDF.UIControls
{
    public enum DCCGridCellTypes
    {
        TextField = 1,
        Date,
        DoubleFloat,
        LongInteger,
        Combobox,
        Label,
        CheckBox,
        Object,
        Button,
        Link
    }

    public class DCCGridColumnTemplate
    {
        private DCCGridCellTypes cellType;
        private string caption;
        private string percentageWidth;
        private bool lookup;
        private bool mandatory;
        private string lookupColumns;

        public virtual string LookupColumns
        {
            get { return lookupColumns; }
            set { lookupColumns = value; }
        }

        public virtual bool Mandatory
        {
            get { return mandatory; }
            set { mandatory = value; }
        }

        public virtual bool Lookup
        {
            get { return lookup; }
            set { lookup = value; }
        }

        public virtual string PercentageWidth
        {
            get { return percentageWidth; }
            set { percentageWidth = value; }
        }

        public virtual string ColumnCaption
        {
            get { return caption; }
            set { caption = value; }
        }

        public virtual DCCGridCellTypes CellType
        {
            get { return cellType; }
            set { cellType = value; }
        }
    }
}
