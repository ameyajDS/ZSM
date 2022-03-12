using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace DCC.UMB.CDFWS.DBManager
{
    public partial class OpenedConnections : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ConnectionPool.GetConnectionTransactionRow("Some guild for forcing the closure of connections");
            }
            catch
            {
                //do nothing
            }
            DataTable table = ConnectionPool.transactionalConnectionPool.Clone();
            table.Columns.Add("Status");
            table.Columns.Add("Sr.");
            table.Columns.Add("Db");
            table.AcceptChanges();
            int i=1;

            foreach (DataRow row in ConnectionPool.transactionalConnectionPool.Rows)
            {
                if (((SqlConnection)row[ConnectionPool.CONNECTION_COLUMN_NAME]).State.ToString().ToUpper() == "CLOSED") continue;
                DataRow newRow = table.NewRow();
                newRow[ConnectionPool.APPLICATION_COLUMN_NAME] = row[ConnectionPool.APPLICATION_COLUMN_NAME];
                newRow[ConnectionPool.TRANSACTION_COLUMN_NAME] = row[ConnectionPool.TRANSACTION_COLUMN_NAME];
                newRow[ConnectionPool.CONNECTION_COLUMN_NAME] = row[ConnectionPool.CONNECTION_COLUMN_NAME];
                newRow[ConnectionPool.LAST_ACCESS_DTM_COLUMN_NAME] = row[ConnectionPool.LAST_ACCESS_DTM_COLUMN_NAME];
                newRow[ConnectionPool.CLIENT_COLUMN_NAME] = row[ConnectionPool.CLIENT_COLUMN_NAME];
                newRow["Status"] = ((SqlConnection) row[ConnectionPool.CONNECTION_COLUMN_NAME]).State.ToString();
                newRow["Db"] = ((SqlConnection)row[ConnectionPool.CONNECTION_COLUMN_NAME]).Database;
                newRow["Sr."] = i.ToString() ;
                i++;
                table.Rows.Add(newRow);
            }
            table.Columns.Remove(ConnectionPool.GUID_COLUMN_NAME);
            table.AcceptChanges();
            this.GridView1.DataSource = table;
            this.GridView1.DataBind();
            if(table.Rows.Count==0)
            {
                Response.Write("Not connections at present!");
            }
        }
    }
}
