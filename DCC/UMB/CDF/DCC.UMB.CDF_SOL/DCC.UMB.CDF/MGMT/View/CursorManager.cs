using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.Modal;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.MGMT.Controller;

namespace DCC.UMB.CDF.MGMT.View
{
    public class CursorManager
    {
        private static DataTable transactionTable = new DataTable();
        private static string PREVIOUS_CURSOR = "previousCursor";
        private static string GUID = "guid";
        private static string PREVIOUS_STATUS_TEXT = "previousStatusText";
        private static string CONTROL_TO_LOCK = "CONTROL_TO_LOCK";
        private static string OLD_STATE_OF_LOCKED_CONTROL = "OLD_STATE_OF_LOCKED_CONTROL";

        static CursorManager()
        {
            transactionTable.Columns.Add(GUID, typeof(Guid));
            transactionTable.Columns.Add(PREVIOUS_CURSOR, typeof(Cursor));
            transactionTable.Columns.Add(PREVIOUS_STATUS_TEXT, typeof(string));
            transactionTable.Columns.Add(CONTROL_TO_LOCK, typeof(Control));
            transactionTable.Columns.Add(OLD_STATE_OF_LOCKED_CONTROL, typeof(bool));
            transactionTable.AcceptChanges();
        }
        public static Guid BeginTransaction(string statusText)
        {
            return BeginTransaction(statusText, false, null);
        }
        public static Guid BeginTransaction(string statusText, bool forceExclusive, Control controlToLock)
        {
            if (forceExclusive)
            {
                if (transactionTable.Rows.Count > 0)
                {
                    throw new DCCException(null, MsgCodes.OperationNotAllowed, "This operation|system is busy right now");
                }
            }
            try
            {
                //UIManager.ClearMessageBar(); 
                DataRow row = transactionTable.NewRow();
                Guid tranGuid = Guid.NewGuid();
                row[PREVIOUS_CURSOR] = GlobalAppVariables.ObjMDIMain.Cursor;
                row[PREVIOUS_STATUS_TEXT] = GlobalAppVariables.ObjMDIMain.StatusText;
                row[GUID] = tranGuid;
                if (controlToLock != null)
                {
                    row[CONTROL_TO_LOCK] = controlToLock;
                    row[OLD_STATE_OF_LOCKED_CONTROL] = controlToLock.Enabled;
                }
                transactionTable.Rows.Add(row);
                GlobalAppVariables.ObjMDIMain.Cursor = Cursors.WaitCursor;
                GlobalAppVariables.ObjMDIMain.StatusText = statusText;
                return tranGuid;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                Application.DoEvents();
            }
        }
       
        public static void EndTransaction(Guid tranGuid)
        {
            if (tranGuid == Guid.Empty) return;
            try
            {
                DataRow[] rows = transactionTable.Select(GUID+"='" + tranGuid.ToString() + "'");
                if (rows == null || rows.Length <= 0)
                {
                    throw new Exception("No matching transaction found for the specified GUID: " + tranGuid);
                }
                if (rows.Length > 1)
                {
                    throw new Exception("Multiple matching transactions found for the specified GUID: " + tranGuid);
                }
                DataRow matchingRow = rows[0];
                GlobalAppVariables.ObjMDIMain.Cursor = (Cursor)matchingRow[PREVIOUS_CURSOR];
                GlobalAppVariables.ObjMDIMain.StatusText = (string)matchingRow[PREVIOUS_STATUS_TEXT];
                var lockedControl = matchingRow[CONTROL_TO_LOCK];
                if (lockedControl != null && lockedControl!=DBNull.Value)
                {
                    ((Control)lockedControl).Enabled = (bool)matchingRow[OLD_STATE_OF_LOCKED_CONTROL];                    
                }
                transactionTable.Rows.Remove(matchingRow);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                Application.DoEvents();
            }
        }
    }
}
