using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.UMB.CDF.DB;
using DCC.DBFacade;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.MGMT.Global;
using System.IO;
using DCC.ZOS.ZSM.Controls.Utils;

namespace DCC.ZOS.ZSM.RPT
{
    public partial class PostBadgePrintingDialog : Form
    {
        private ZSM_MUMDbFacade dbFacade = null;
        private DataTable dT = null;
        public PostBadgePrintingDialog()
        {
            InitializeComponent();
            this.dbFacade = new ZSM_MUMDbFacade(GlobalAppVariables.AppContext.ApplicationId);
        }

        public void ShowDialog(IDbManager objDbManager, DataTable dT, Form owner)
        {
            this.ShowDialog(owner);
            this.grdSewadarsPrinted.RetrieveRecords(dT, false, RowStates.New);
            this.dT = dT;
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private enum GridColumns
        {
            sewadar_grno,
            appointment_dt,
            grd_satsang_centre_id,
            department,
            full_nm,
            sewadar_id,
            department_id,
            weekly_sewa_location_id,
            expiry_dt,
            printing_dtm,
            sewadar_status_nm,
            photo_dt,
            remarks
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            try
            {
                this.dbFacade.BeginTrans();
                int rowCount = 0;
                foreach (DCCDataRowView item in this.grdSewadarsPrinted.GetRowsForState(RowStates.New))
                {
                    if (item.AsBln("printed").Value)
                    {
                        //int badgeId = 0;
                        //this.dbFacade.InsertSewadarsBadgeAsTask(ref badgeId, ZSMUtility.GetSatsangCentreId()
                        //                , DbManager.GetString(dT.Rows[rowCount][GridColumns.sewadar_grno.ToString()])
                        //                , DbManager.GetString(dT.Rows[rowCount][GridColumns.sewadar_grno.ToString()])
                        //                , DbManager.GetNullableShort(dT.Rows[rowCount][GridColumns.department_id.ToString()])
                        //                , DbManager.GetNullableInteger(dT.Rows[rowCount][GridColumns.weekly_sewa_location_id.ToString()])
                        //                , DbManager.GetNullableDateTime(dT.Rows[rowCount][GridColumns.expiry_dt.ToString()])
                        //                , DbManager.GetNullableDateTime(dT.Rows[rowCount][GridColumns.printing_dtm.ToString()])
                        //                , DbManager.GetString(dT.Rows[rowCount][GridColumns.remarks.ToString()]));
                    }
                    rowCount++;
                }
                this.dbFacade.CommitTrans();
            }
            catch (Exception ex)
            {
                this.dbFacade.RollbackTrans();
                throw;
            }
            finally
            {
                this.Dispose();
            }
        }

    }
}
