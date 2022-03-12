using System;
using System.Drawing;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls.UIAutomation;
using DCC.UMB.CDF.Lookup.Modal;

namespace DCC.UMB.CDF.UIControls.TextControls
{
    [ToolboxBitmap(typeof(ResourceFinder), "DCC.UMB.CDF.Resources.DCCTextArea.bmp")]
    public partial class DCCTextArea : DCCTextField, IUIAutomationCodeProvider
    {
        public DCCTextArea()
        {
            InitializeComponent();
            this.txtField.Multiline = true;
            this.txtField.ScrollBars = ScrollBars.Vertical;
            this.MaximumSize = new Size(this.MaximumSize.Width, 2000);
            this.txtField.Dock = DockStyle.Fill;
            this.txtField.Margin = new Padding(this.txtField.Margin.Left, 5, this.txtField.Margin.Right, this.txtField.Margin.Bottom);
            this.Height = 60;
            //this.MouseMove += new MouseEventHandler(DCCTextArea_MouseMove);
        }
        protected override bool RenderRightSideIcon()
        {
            return true;
        }

        protected override int GetPaddingWidthForRightSideIcon()
        {
            return 0;//as icon is rendered on top
        }
        
        protected override void PerformRightHandSideIconClickAction(object sender, EventArgs e)
        {
            if (this.Lookup == false)
            {
                DCCTextEditor edit = new DCCTextEditor(this, this.txtField.Text, this.ReadOnly);
                edit.ShowDialog();
            }
            else
            {
                this.txtField.Focus();
                this.ShowLookupDialog(LookupSearchModes.Absolute);
            }
        }
        protected override Rectangle GetLookupIconRectangle()
        {
            Point startingPointForLookupIcon = new Point(this.Size.Width - PADDING_WIDTH_FOR_RIGHT_SIDE_ICON, 2);
            return new Rectangle(startingPointForLookupIcon,
                                 new Size(PADDING_WIDTH_FOR_RIGHT_SIDE_ICON, PADDING_WIDTH_FOR_TOP_TITLE));
        }
        #region IUIAutomationCodeProvider Members

        public new string GetAutomationCode()
        {
            string template = "public TAFTextArea uiAutomationId{get{return this.GetTextArea(\"uiAutomationId\");}}";
            return template.Replace("uiAutomationId", this.txtField.Name);
        }

        #endregion
        

    }
}
