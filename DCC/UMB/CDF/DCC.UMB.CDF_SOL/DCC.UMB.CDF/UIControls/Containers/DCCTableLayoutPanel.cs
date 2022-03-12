using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace DCC.UMB.CDF.UIControls.Containers
{
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCTableLayoutPanel.bmp")]
    public partial class DCCTableLayoutPanel : TableLayoutPanel
    {
        public DCCTableLayoutPanel()
        {
            CellBorderStyle = TableLayoutPanelCellBorderStyle.None;
            SetStyle(ControlStyles.AllPaintingInWmPaint |
              ControlStyles.OptimizedDoubleBuffer |
              ControlStyles.UserPaint, true);
            this.DoubleBuffered = true;
        }

        public DCCTableLayoutPanel(IContainer container)
        {
            container.Add(this);
            CellBorderStyle = TableLayoutPanelCellBorderStyle.None;
            SetStyle(ControlStyles.AllPaintingInWmPaint |
              ControlStyles.OptimizedDoubleBuffer |
              ControlStyles.UserPaint, true);
            this.DoubleBuffered = true;
        }
    }
}
