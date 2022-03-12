using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Design;
using System.Windows.Forms;
using System.Windows.Forms.Design;


namespace DCC.UMB.CDF.UIControls.TextControls.Lookup
{    
    public class TableCreator : UITypeEditor
    {
        private IWindowsFormsEditorService windowsFormsEditorService;

        public override UITypeEditorEditStyle GetEditStyle(System.ComponentModel.ITypeDescriptorContext context)
        {
            return UITypeEditorEditStyle.Modal;
        }

        public override object EditValue(System.ComponentModel.ITypeDescriptorContext context, IServiceProvider provider, object value)
        {
            LookupColumnsPropertyEditor objLokupColumnsPropertyEditor = null;
            try
            {
                //use IWindowsFormsEditorService object to display a control in the dropdown area                
                windowsFormsEditorService = (IWindowsFormsEditorService)provider.GetService(typeof(IWindowsFormsEditorService));
                if (windowsFormsEditorService == null)
                    return null;
                objLokupColumnsPropertyEditor = new LookupColumnsPropertyEditor(""+value);
                
                windowsFormsEditorService.ShowDialog(objLokupColumnsPropertyEditor);
                
            }
            catch { MessageBox.Show("Some error"); }
            return objLokupColumnsPropertyEditor.ReturnValue;
        }
    }
}
