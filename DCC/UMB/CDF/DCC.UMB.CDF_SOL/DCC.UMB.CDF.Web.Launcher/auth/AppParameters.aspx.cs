using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DCC.UMB.CDF.Web.Launcher.auth
{
    public partial class AppParameters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string tobeReturned = "";
            string strGuidParam = this.Request.Params["guid"];
            if (string.IsNullOrEmpty(strGuidParam))
            {
                tobeReturned = "Error:: Missing context!! How did you come here?";
            }
            else
            {
                string args = CommandArgsProvider.GetArgsAndDisposeGuid(new Guid(strGuidParam));
                if (string.IsNullOrEmpty(args))
                {
                    tobeReturned = "Error:: Disposed context!! How did you come here?";
                }
                else
                {
                    tobeReturned = args;
                }
            }

            Response.Clear();
            Response.Write(tobeReturned);
            //Response.Write("ZSM_APP|Zonal Sewadar Management|ZSM|Zonal Sewadar Management|1   |20-09-2005          |ZSM|bserver     |       |DCC|1|DCC|ZSM_ADM|password|50   |No|Error|1 ||||||STR|1|10||");
            //                ZSM_APP|Zonal Sewadar Management|ZSM|Zonal Sewadar Management|1.00|1/1/2010 12:00:00 AM|ZSM|nbharti-mobl|NOT SET|dcc|1|dcc|ZSM_ADM|NOTSET  |83876|No|Error|10||||||   | |  |||
            Response.Flush();
            Response.End();
        }
    }
}
