using System;
using System.Collections.Generic;
using System.Text;
using White.Core.UIItems;
using White.Core.UIItems.WindowItems;
using White.Core.InputDevices;
using White.Core.UIItems.MenuItems;
using White.Core.WindowsAPI;
using White.Core.UIItems.ListBoxItems;
using White.Core.UIItems.Finders;
using White.Core.UIItems.WindowStripControls;


namespace DCC.UMB.TAF.View
{
    public class TAFSummaryDetailNavigator : TAFAbstractControl
    {
        private ToolStrip toolStrip = null;
        public TAFSummaryDetailNavigator(ToolStrip objToolStrip, Window containerWindow)
            : base(objToolStrip)
        {
            this.toolStrip = objToolStrip;
            this.ParentWindow = containerWindow;
        }
        public ToolStrip EmbeddedUIItem
        {
            get { return this.toolStrip; }
        }
        public void InsertLast()
        {
            Button button = this.toolStrip.Get<Button>(SearchCriteria.ByText("btnLast"));
            button.RaiseClickEvent();
        }
        public void InsertBefore()
        {
            Button button = this.toolStrip.Get<Button>(SearchCriteria.ByText("btnBefore"));
            button.RaiseClickEvent();
        }
        public void InsertAfter()
        {
            Button button = this.toolStrip.Get<Button>(SearchCriteria.ByText("btnAfter"));
            button.RaiseClickEvent();
        }
        public void Delete()
        {
            Button button = this.toolStrip.Get<Button>(SearchCriteria.ByText("btnDelete"));
            button.RaiseClickEvent();
        }
        public void Previous()
        {
            Button button = this.toolStrip.Get<Button>(SearchCriteria.ByText("btnPrevious"));
            button.RaiseClickEvent();
        }
        public void Next()
        {
            Button button = this.toolStrip.Get<Button>(SearchCriteria.ByText("btnNext"));
            button.RaiseClickEvent();
        }
        public void Up()
        {
            Button button = this.toolStrip.Get<Button>(SearchCriteria.ByText("btnUp"));
            button.RaiseClickEvent();
        }
        public void Down()
        {
            Button button = this.toolStrip.Get<Button>(SearchCriteria.ByText("btnDown"));
            button.RaiseClickEvent();
        }
    }
}
