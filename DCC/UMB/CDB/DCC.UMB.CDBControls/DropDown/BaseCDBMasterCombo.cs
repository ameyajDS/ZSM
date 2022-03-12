using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.TextControls;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Utils;

namespace DCC.UMB.CDBControls.DropDown
{
    public partial class BaseCDBMasterCombo : DCCComboBox
    {
        public BaseCDBMasterCombo()
            : base()
        {
            InitializeComponent();
        }

        [System.ComponentModel.ReadOnly(true)]
        public override string ApplicationIdForDbConnection
        {
            get
            {
                return base.ApplicationIdForDbConnection;
            }
            set
            {
                base.ApplicationIdForDbConnection = value;
            }
        }

        private void InitializeComponent()
        {
            this.SuspendLayout();
            this.ApplicationIdForDbConnection = "CDB_APP";
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 14F);
            this.Name = "BaseCDBMasterCombo";
            this.ResumeLayout(false);
        }
    }
}
