using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using DCC.DBFacade;
using DCC.UMB.CDF.Configuration;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.Lookup.Modal;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.Grid;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.MGMT.Global;
using DCC.SSM.CDB2.Utils;

namespace DCC.UMB.CDB2.ENT
{
    public partial class WorkingUnits : AbstractScreen
    {
        private CDB_AppDbFacade dbFacade;
        private WorkingUnit objCurrentWorkingUnit;

        private enum grdListGridCols
        {
            working_unit_id = 0,
            working_unit_cd,
            working_unit_nm,
            is_root,
            is_leaf,
            society_id,
            society_nm,
            is_staff_posted,
            working_unit_entity_id,
            entity_singular_nm,
            entity_plural_nm,
            group_working_unit_id,
            effective_from,
            effective_till,
            txn_ts
        }

        private enum grdSubDeptCols
        {
            child_working_unit_id = 0,
            responsibilities_data,
            child_working_unit_cd,
            child_working_unit_nm,
            child_is_root,
            child_is_leaf,
            child_society_id,
            child_society_nm,
            child_is_staff_posted,
            child_working_unit_entity_id,
            child_entity_singular_nm,
            child_entity_plural_nm,
            child_group_working_unit_id,
            child_effective_from,
            child_effective_till,
            child_txn_ts
        }

        private enum grdPTLinesCols
        {
            p_and_t_line = 0,
            p_and_t_line_old,
            line_sq
        }

        private enum grdExtnCols
        {
            epabx_extension = 0,
            epabx_extension_old,
            seq_no
        }

        private enum grdFaxCols
        {
            fax_no = 0,
            fax_no_old,
            seq_n
        }

        private enum grdResponsiblitiesChildCols
        {
            child_responsibility_type_id,
            child_responsibility_working_unit_id,
            child_responsibility_nm,
            child_responsibility_cnt,
            child_responsibility_sq
        }

        private enum grdResponsiblitiesCols
        {
            res_type_id,
            responsibility,
            resSewadarId,
            resOldSewadarId
        }

        public WorkingUnits()
        {
            InitializeComponent();
            trvDepartments.AfterSelect += new TreeViewEventHandler(trvDepartments_AfterSelect);
        }

        void trvDepartments_AfterSelect(object sender, TreeViewEventArgs e)
        {
            objCurrentWorkingUnit = (WorkingUnit)e.Node;
            txtId.DisplayText = objCurrentWorkingUnit.WorkingUnitId.ToString();
            txtCode.DisplayText = objCurrentWorkingUnit.WorkingUnitCode;
            txtDepartmentGroup.DisplayText = objCurrentWorkingUnit.WorkingUnitName;
            txtLevel.DisplayText = (e.Node.Level + 1).ToString();
            txtEffectiveFrom.DisplayTextAsDateTime = objCurrentWorkingUnit.EffectiveFrom;
            txtEffectiveTill.DisplayTextAsDateTime = objCurrentWorkingUnit.EffectiveTill;
            chkIsStaffPosted.Checked = objCurrentWorkingUnit.IsStaffPosted;
            //txtSociety.SetControlValues(objCurrentWorkingUnit.SocietyName, objCurrentWorkingUnit.SocietyName, objCurrentWorkingUnit.SocietyId.ToString());
            txtSacHon.DisplayText = objCurrentWorkingUnit.HonorarySanctionedSewadarCount.ToString();
            txtSacParshadi.DisplayText = objCurrentWorkingUnit.ParshadiSanctionedSewadarCount.ToString();
            txtSacTotal.DisplayText = objCurrentWorkingUnit.TotalSanctionedSewadarCount.ToString();

            if (objCurrentWorkingUnit.Nodes != null && objCurrentWorkingUnit.Nodes.Count > 0)
            {
                WorkingUnit objFirstChild = ((WorkingUnit)objCurrentWorkingUnit.Nodes[0]);
                tabControl1.TabPages[0].Text = objFirstChild.PluralName;
                txtEntityName.SetControlValues(objFirstChild.SingularName, objFirstChild.SingularName, objFirstChild.EntityId.ToString());
                txtSociety.SetControlValues(objFirstChild.SocietyName, objFirstChild.SocietyName, objFirstChild.SocietyId.ToString());
            }
            else
            {
                tabControl1.TabPages[0].Text = "";
                txtEntityName.ClearControlValues();
                txtSociety.ClearControlValues();
            }

            DataSet ds = dbFacade.QryWorkingUnitWrapper((short)objCurrentWorkingUnit.WorkingUnitId);

            DataTable dtPTLine = ds.Tables[0];
            grdPTLines.RetrieveRecords(dtPTLine, false, RowStates.Old);

            DataTable dtExtn = ds.Tables[1];
            grdExtn.RetrieveRecords(dtExtn, false, RowStates.Old);

            DataTable dtFax = ds.Tables[2];
            grdFax.RetrieveRecords(dtFax, false, RowStates.Old);

            //DataTable dtResponsibilities = ds.Tables[3];
            //grdResponsiblities.RetrieveRecords(dtResponsibilities, false, RowStates.Old);
            DataTable dtResponsibilitiesChild = ds.Tables[3];
            grdResponsiblitiesChild.RetrieveRecords(dtResponsibilitiesChild, false, RowStates.Old);

            DataTable dtCurrentStrength = ds.Tables[4];
            int currentHonoraryStrength = 0;
            int currentParshadiStrength = 0;
            int currentTotalStrength = 0;
            if (dtCurrentStrength.Rows != null && dtCurrentStrength.Rows.Count > 0)
            {
                DataRow currentStrengthRow = dtCurrentStrength.Rows[0];
                currentHonoraryStrength = int.Parse(currentStrengthRow["honorary_current_cnt"].ToString());
                currentParshadiStrength = int.Parse(currentStrengthRow["parshadi_current_cnt"].ToString());
                currentTotalStrength = currentHonoraryStrength + currentParshadiStrength;
            }
            txtCurHon.DisplayText = currentHonoraryStrength.ToString();
            txtCurParshadi.DisplayText = currentParshadiStrength.ToString();
            txtCurTotal.DisplayText = currentTotalStrength.ToString();

            DataTable dtSubDept = ds.Tables[5];
            grdSubDept.RetrieveRecords(dtSubDept, false, RowStates.Old);


            //DisplayRecordsInResponsibilitiesGrid(-1);
            bool isStaffPostedForCurrentNode = objCurrentWorkingUnit.IsStaffPosted;
            if (objCurrentWorkingUnit.Parent != null)
            {
                bool isStaffPostedForParent = ((WorkingUnit)objCurrentWorkingUnit.Parent).IsStaffPosted;
                bool bSanctionStrength = !isStaffPostedForParent && isStaffPostedForCurrentNode;
                txtSacParshadi.ReadOnly = !bSanctionStrength;
                txtSacHon.ReadOnly = !bSanctionStrength;
                chkIsStaffPosted.Enabled = !isStaffPostedForParent && objCurrentWorkingUnit.HonorarySanctionedSewadarCount <= 0 && objCurrentWorkingUnit.ParshadiSanctionedSewadarCount <= 0;
                chkIsStaffPosted.Checked = isStaffPostedForParent || isStaffPostedForCurrentNode;
                DataTable dtResponsibilities = dbFacade.WorkingUnitsResponsibilities_SelPr((short)objCurrentWorkingUnit.WorkingUnitId, objCurrentWorkingUnit.ParentWorkingUnitId).Tables[0];
                grdResponsiblities.RetrieveRecords(dtResponsibilities, false, RowStates.Old);


                //objCurrentWorkingUnit.IsStaffPosted = chkIsStaffPosted.Checked;
            }
            else
            {
                txtSacParshadi.ReadOnly = true;
                txtSacHon.ReadOnly = true;
                chkIsStaffPosted.Enabled = false;
                grdResponsiblities.RemoveAllRecords();
            }

            if (objCurrentWorkingUnit.Parent != null)
            {
                if (objCurrentWorkingUnit.Nodes != null && objCurrentWorkingUnit.Nodes.Count > 0 && !((WorkingUnit)objCurrentWorkingUnit.Parent).IsStaffPosted)
                {
                    bool doesAnyOfChildHaveSanctionedStrengthMentioned = DoesAnyOfChildHaveSanctionedStrengthMentioned(objCurrentWorkingUnit);
                    if (doesAnyOfChildHaveSanctionedStrengthMentioned)
                    {
                        txtSacParshadi.ReadOnly = true;
                        txtSacHon.ReadOnly = true;
                        chkIsStaffPosted.Enabled = false;
                    }
                    else
                    {
                        chkIsStaffPosted.Enabled = objCurrentWorkingUnit.HonorarySanctionedSewadarCount <= 0 && objCurrentWorkingUnit.ParshadiSanctionedSewadarCount <= 0;
                    }
                }
            }
            else
            {
                txtSacParshadi.ReadOnly = true;
                txtSacHon.ReadOnly = true;
                chkIsStaffPosted.Enabled = false;
            }

            chkIsStaffPosted.Checked = isStaffPostedForCurrentNode;

            txtDepartmentGroup.Title = objCurrentWorkingUnit.SingularName;
        }

        private bool DoesAnyOfChildHaveSanctionedStrengthMentioned(WorkingUnit objWorkingUnit)
        {
            foreach (TreeNode node in objWorkingUnit.Nodes)
            {
                WorkingUnit wu = ((WorkingUnit)node);
                if (wu.HonorarySanctionedSewadarCount > 0 || wu.ParshadiSanctionedSewadarCount > 0)
                {
                    return true;
                }
            }
            return false;
        }

        private void LoadSummaryToDetailTOREMOVE(int subDepartmentRow)
        {
            short? departmentId = grdSubDept.AsShort(grdSubDeptCols.child_working_unit_id.ToString(), subDepartmentRow);
            grdResponsiblitiesChild.RemoveAllRecords();
            grdResponsiblitiesChild.Refresh();
            object responsiblitiesChildData = grdSubDept.GetCellValue(grdSubDeptCols.responsibilities_data.ToString(), subDepartmentRow);
            if (responsiblitiesChildData == null)
            {
                if (departmentId == null)
                {
                    grdResponsiblitiesChild.InsertRowBelow();
                }
                else
                {
                    DataSet dsResponsiblitiesChildData = dbFacade.ResponsibilityTypes_SelPr(departmentId);
                    if (dsResponsiblitiesChildData.Tables.Count > 0)
                    {
                        DataTable dtResponsiblitiesChildData = dsResponsiblitiesChildData.Tables[0];
                        grdResponsiblitiesChild.RetrieveRecords(dtResponsiblitiesChildData, false, RowStates.Old);
                        grdSubDept.SetCellValue(grdSubDeptCols.responsibilities_data.ToString(), subDepartmentRow, grdResponsiblitiesChild.ExportGridModelData(true, true));
                    }
                }
            }
            else
            {
                grdSubDept.RetrieveRecords((DataTable)responsiblitiesChildData, false, RowStates.None);
            }
        }

        private void LoadDetailToSummaryTOREMOVE(int subDepartmentRow)
        {
            if (grdSubDept.GetRowState(subDepartmentRow) != RowStates.None)
            {
                grdSubDept.SetCellValue(grdSubDeptCols.responsibilities_data.ToString(), subDepartmentRow, grdResponsiblitiesChild.ExportGridModelData(true, true));
            }
        }

        protected override void InitializeDbFacade()
        {
            if (dbFacade == null)
                dbFacade = new CDB_AppDbFacade(ApplicationId);
            // Initialize DBFacade for Specify Application ID
        }

        public override DCCSqlDataReader GetQueryModeRetrivalResults()
        {
            return dbFacade.Qryworking_unitsAsReader(null, null);
        }

        public override void LoadBrowseView(int rowIndex)
        {
            string nodeNameToSelect = grdList.AsStr(grdListGridCols.working_unit_id.ToString(), rowIndex);
            TreeNode[] nodes = trvDepartments.Nodes.Find(nodeNameToSelect, true);
            trvDepartments.SelectedNode = nodes[0];
            trvDepartments.Focus();
        }

        public override void ShowScreen(UIModes uiMode, string screenParameters)
        {
            base.ShowScreen(uiMode, screenParameters);
        }

        public override bool IsReadyToSave()
        {
            if (!grdSubDept.IsGridEmpty())
            {
                if (txtSociety.DisplayText == null || txtSociety.DisplayText.Trim().Length <= 0)
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "Society");
                    return false;
                }
                if (txtEntityName.DisplayText == null || txtEntityName.DisplayText.Trim().Length <= 0)
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "Entity Name");
                    return false;
                }

                List<DCCDataRowView> grdSubDeptUpdatedRows = grdSubDept.GetRowsForState(RowStates.Updated);
                foreach (DCCDataRowView rv in grdSubDeptUpdatedRows)
                {
                    string workingUnitCode = rv.AsStr(grdSubDeptCols.child_working_unit_cd.ToString());
                    string workingUnitName = rv.AsStr(grdSubDeptCols.child_working_unit_nm.ToString());
                    if (workingUnitCode == null || workingUnitCode.Trim().Length <= 0)
                    {
                        UIManager.ShowMessage(MsgCodes.ValueReqd, "Working Unit Code in grid");
                        return false;
                    }
                    if (workingUnitName == null || workingUnitName.Trim().Length <= 0)
                    {
                        UIManager.ShowMessage(MsgCodes.ValueReqd, "Working Unit Name in grid");
                        return false;
                    }
                }
                List<DCCDataRowView> grdSubDeptNewRows = grdSubDept.GetRowsForState(RowStates.New);
                foreach (DCCDataRowView rv in grdSubDeptNewRows)
                {
                    string workingUnitCode = rv.AsStr(grdSubDeptCols.child_working_unit_cd.ToString());
                    string workingUnitName = rv.AsStr(grdSubDeptCols.child_working_unit_nm.ToString());
                    if (workingUnitCode == null || workingUnitCode.Trim().Length <= 0)
                    {
                        UIManager.ShowMessage(MsgCodes.ValueReqd, "Working Unit Code in grid");
                        return false;
                    }
                    if (workingUnitName == null || workingUnitName.Trim().Length <= 0)
                    {
                        UIManager.ShowMessage(MsgCodes.ValueReqd, "Working Unit Name in grid");
                        return false;
                    }
                }
            }

            //LoadDetailToSummary(grdSubDept.CurrentRowIndex);
            return true;
        }

        public override void Save()
        {
            try
            {
                string UpdateAuditOperation = string.Empty;
                dbFacade.ClearDbTasks(); // Clear All the DbTasks before Begining of Transaction    
                dbFacade.BeginTrans(); // Transaction Begin

                objCurrentWorkingUnit.EffectiveFrom = txtEffectiveFrom.DisplayTextAsDateTime.GetValueOrDefault(DateTime.Now);
                objCurrentWorkingUnit.EffectiveTill = txtEffectiveTill.DisplayTextAsDateTime.GetValueOrDefault(DateTime.MaxValue);
                objCurrentWorkingUnit.IsStaffPosted = chkIsStaffPosted.Checked;
                // this entity name and society is for children not for current WU
                //objCurrentWorkingUnit.EntityId = (short) txtEntityName.IdTextAsInteger();
                //objCurrentWorkingUnit.SocietyId = (short) txtSociety.IdTextAsInteger();
                objCurrentWorkingUnit.IsLeaf = grdSubDept.RowCount <= 0;
                objCurrentWorkingUnit.HonorarySanctionedSewadarCount = txtSacHon.DisplayTextAsInteger.Value;
                objCurrentWorkingUnit.ParshadiSanctionedSewadarCount = txtSacParshadi.DisplayTextAsInteger.Value;

                //Audit update operation . 
                UpdateAuditOperation = this.dbFacade.CDBAuditLogOperationAsTask(int.Parse(GlobalAppVariables.AppContext.SessionId),
                    ApplicationId, GlobalAppVariables.AppContext.UserNumber,
                     GlobalAppVariables.AppContext.UserRoleId, CDBUtility.Modify_Operation, ScreenId, objCurrentWorkingUnit.WorkingUnitId.ToString(), null);
                this.dbFacade.AddDbTask(UpdateAuditOperation);

                string strUpdWorkingUnitsAsTask =
                    dbFacade.UpdWorkingUnitsAsTask(objCurrentWorkingUnit.WorkingUnitId,
                                                   objCurrentWorkingUnit.WorkingUnitCode,
                                                   objCurrentWorkingUnit.WorkingUnitName,
                                                   objCurrentWorkingUnit.IsRoot ? "Yes" : "No",
                                                   objCurrentWorkingUnit.IsLeaf ? "Yes" : "No",
                                                   objCurrentWorkingUnit.SocietyId,
                                                   objCurrentWorkingUnit.IsStaffPosted ? "Yes" : "No",
                                                   objCurrentWorkingUnit.EntityId,
                                                   objCurrentWorkingUnit.ParentWorkingUnitId == -1
                                                       ? null
                                                       : (short?)objCurrentWorkingUnit.ParentWorkingUnitId,
                                                   objCurrentWorkingUnit.EffectiveFrom,
                                                   objCurrentWorkingUnit.EffectiveTill,
                                                   objCurrentWorkingUnit.HonorarySanctionedSewadarCount < 0 ? (short)0 : (short)objCurrentWorkingUnit.HonorarySanctionedSewadarCount,
                                                   objCurrentWorkingUnit.ParshadiSanctionedSewadarCount < 0 ? (short)0 : (short)objCurrentWorkingUnit.ParshadiSanctionedSewadarCount,
                                                   objCurrentWorkingUnit.TxnTs);
                dbFacade.AddDbTask(strUpdWorkingUnitsAsTask);

                List<string> lstResponsibilitesDBTasks = getResponsibilitiesDBTasks();
                dbFacade.AddDbTasks(lstResponsibilitesDBTasks);

                List<string> lstSubDepartmentsDBTasks = getSubDepartmentsDBTasks();
                dbFacade.AddDbTasks(lstSubDepartmentsDBTasks);

                List<string> lstResponsibilitesChildDBTasks = getResponsibilitiesChildDBTasks();
                dbFacade.AddDbTasks(lstResponsibilitesChildDBTasks);

                List<string> lstPTLinesDBTasks = getPTLinesDBTasks();
                dbFacade.AddDbTasks(lstPTLinesDBTasks);

                List<string> lstExtnDBTasks = getExtnsDBTasks();
                dbFacade.AddDbTasks(lstExtnDBTasks);

                List<string> lstFaxLinesDBTasks = getFaxsDBTasks();
                dbFacade.AddDbTasks(lstFaxLinesDBTasks);

                dbFacade.ExecuteDbTasks(); // All DbTasks Executed
                dbFacade.CommitTrans(); // Commited All Transaction
                UIManager.ShowMessage(MsgCodes.SaveMsg, "", MessageTypes.Plain);

                GenerateTree();
                trvDepartments.SelectedNode =
                    trvDepartments.Nodes.Find(objCurrentWorkingUnit.WorkingUnitId.ToString(), true)[0];
            }
            catch
            {
                dbFacade.RollbackTrans(); // RollBack of Transaction if Any Exception Found
                throw;
            }
            finally
            {
                dbFacade.ClearDbTasks(); // Finally Clear All the DbTasks
            }
        }

        private List<string> getFaxsDBTasks()
        {
            List<string> dbTasks = new List<string>();
            dbFacade.Upd_fax_lines_WU_displayOrder(objCurrentWorkingUnit.WorkingUnitId);

            List<DCCDataRowView> grdFaxDeletedRows = grdFax.GetRowsForState(RowStates.Deleted);
            foreach (DCCDataRowView rv in grdFaxDeletedRows)
            {
                string fax = rv.AsStr(grdFaxCols.fax_no_old.ToString());
                string strDelFaxAsTask = dbFacade.Del_fax_lines_WUAsTask(objCurrentWorkingUnit.WorkingUnitId, fax);
                dbTasks.Add(strDelFaxAsTask);
            }

            List<DCCDataRowView> grdFaxOldRows = grdFax.GetRowsForState(RowStates.Old);
            foreach (DCCDataRowView rv in grdFaxOldRows)
            {
                string fax = ((LookupResult)rv[grdFaxCols.fax_no.ToString()]).ValueMember.ToString();
                string faxOld = rv.AsStr(grdFaxCols.fax_no_old.ToString());
                string strUpd_p_and_t_lines_WUAsTask =
                    dbFacade.Upd_fax_lines_WUAsTask(objCurrentWorkingUnit.WorkingUnitId, fax, faxOld, (short?)rv.DisplayOrder);
                dbTasks.Add(strUpd_p_and_t_lines_WUAsTask);
            }

            List<DCCDataRowView> grdFaxUpdatedRows = grdFax.GetRowsForState(RowStates.Updated);
            foreach (DCCDataRowView rv in grdFaxUpdatedRows)
            {
                string fax = ((LookupResult)rv[grdFaxCols.fax_no.ToString()]).ValueMember.ToString();
                string faxOld = rv.AsStr(grdFaxCols.fax_no_old.ToString());
                string strUpd_p_and_t_lines_WUAsTask =
                    dbFacade.Upd_fax_lines_WUAsTask(objCurrentWorkingUnit.WorkingUnitId, fax, faxOld, (short?)rv.DisplayOrder);
                dbTasks.Add(strUpd_p_and_t_lines_WUAsTask);
            }

            List<DCCDataRowView> grdFaxNewRows = grdFax.GetRowsForState(RowStates.New);
            foreach (DCCDataRowView rv in grdFaxNewRows)
            {
                string fax = ((LookupResult)rv[grdFaxCols.fax_no.ToString()]).ValueMember.ToString();
                string strIns_p_and_t_linesAsTask =
                    dbFacade.Ins_fax_lines_WUAsTask(objCurrentWorkingUnit.WorkingUnitId, fax, (short?)rv.DisplayOrder);
                dbTasks.Add(strIns_p_and_t_linesAsTask);
            }
            return dbTasks;
        }

        private List<string> getExtnsDBTasks()
        {
            List<string> dbTasks = new List<string>();
            dbFacade.Upd_epabx_extensions_WU_displayOrder(objCurrentWorkingUnit.WorkingUnitId);

            List<DCCDataRowView> grdExtnsDeletedRows = grdExtn.GetRowsForState(RowStates.Deleted);
            foreach (DCCDataRowView rv in grdExtnsDeletedRows)
            {
                string extn = rv.AsStr(grdExtnCols.epabx_extension_old.ToString());
                string strDelExtnAsTask = dbFacade.Del_epabx_extensions_WUAsTask(objCurrentWorkingUnit.WorkingUnitId, extn);
                dbTasks.Add(strDelExtnAsTask);
            }

            List<DCCDataRowView> grdExtnsOldRows = grdExtn.GetRowsForState(RowStates.Old);
            foreach (DCCDataRowView rv in grdExtnsOldRows)
            {
                string extn = ((LookupResult)rv[grdExtnCols.epabx_extension.ToString()]).ValueMember.ToString();
                string extnOld = rv.AsStr(grdExtnCols.epabx_extension_old.ToString());
                string strUpd_epabx_extensions_WUAsTask =
                    dbFacade.Upd_epabx_extensions_WUAsTask(objCurrentWorkingUnit.WorkingUnitId, extn, extnOld, (short?)rv.DisplayOrder);
                dbTasks.Add(strUpd_epabx_extensions_WUAsTask);
            }

            List<DCCDataRowView> grdExtnsUpdatedRows = grdExtn.GetRowsForState(RowStates.Updated);
            foreach (DCCDataRowView rv in grdExtnsUpdatedRows)
            {
                string extn = ((LookupResult)rv[grdExtnCols.epabx_extension.ToString()]).ValueMember.ToString();
                string extnOld = rv.AsStr(grdExtnCols.epabx_extension_old.ToString());
                string strUpd_epabx_extensions_WUAsTask =
                    dbFacade.Upd_epabx_extensions_WUAsTask(objCurrentWorkingUnit.WorkingUnitId, extn, extnOld, (short?)rv.DisplayOrder);
                dbTasks.Add(strUpd_epabx_extensions_WUAsTask);
            }

            List<DCCDataRowView> grdExtnsNewRows = grdExtn.GetRowsForState(RowStates.New);
            foreach (DCCDataRowView rv in grdExtnsNewRows)
            {
                string extn = ((LookupResult)rv[grdExtnCols.epabx_extension.ToString()]).ValueMember.ToString();
                string strIns_epabx_extensions_WUAsTask =
                    dbFacade.Ins_epabx_extensions_WUAsTask(objCurrentWorkingUnit.WorkingUnitId, extn, (short?)rv.DisplayOrder);
                dbTasks.Add(strIns_epabx_extensions_WUAsTask);
            }
            return dbTasks;
        }

        private List<string> getPTLinesDBTasks()
        {
            List<string> dbTasks = new List<string>();
            dbFacade.Upd_p_and_t_lines_WU_displayOrder(objCurrentWorkingUnit.WorkingUnitId);

            List<DCCDataRowView> grdPTLinesDeletedRows = grdPTLines.GetRowsForState(RowStates.Deleted);
            foreach (DCCDataRowView rv in grdPTLinesDeletedRows)
            {
                string ptLine = rv.AsStr(grdPTLinesCols.p_and_t_line_old.ToString());
                string strDelPTLineAsTask = dbFacade.Del_p_and_t_lines_WUAsTask(objCurrentWorkingUnit.WorkingUnitId, ptLine);
                dbTasks.Add(strDelPTLineAsTask);
            }

            List<DCCDataRowView> grdPTLinesOldRows = grdPTLines.GetRowsForState(RowStates.Old);
            foreach (DCCDataRowView rv in grdPTLinesOldRows)
            {
                string ptLine = ((LookupResult)rv[grdPTLinesCols.p_and_t_line.ToString()]).ValueMember.ToString();
                string ptLineOld = rv.AsStr(grdPTLinesCols.p_and_t_line_old.ToString());
                string strUpd_p_and_t_lines_WUAsTask =
                    dbFacade.Upd_p_and_t_lines_WUAsTask(objCurrentWorkingUnit.WorkingUnitId, ptLine, ptLineOld, (short?)rv.DisplayOrder);
                dbTasks.Add(strUpd_p_and_t_lines_WUAsTask);
            }

            List<DCCDataRowView> grdPTLinesUpdatedRows = grdPTLines.GetRowsForState(RowStates.Updated);
            foreach (DCCDataRowView rv in grdPTLinesUpdatedRows)
            {
                string ptLine = ((LookupResult)rv[grdPTLinesCols.p_and_t_line.ToString()]).ValueMember.ToString();
                string ptLineOld = rv.AsStr(grdPTLinesCols.p_and_t_line_old.ToString());
                string strUpd_p_and_t_lines_WUAsTask =
                    dbFacade.Upd_p_and_t_lines_WUAsTask(objCurrentWorkingUnit.WorkingUnitId, ptLine, ptLineOld, (short?)rv.DisplayOrder);
                dbTasks.Add(strUpd_p_and_t_lines_WUAsTask);
            }

            List<DCCDataRowView> grdPTLinesNewRows = grdPTLines.GetRowsForState(RowStates.New);
            foreach (DCCDataRowView rv in grdPTLinesNewRows)
            {
                string ptLine = ((LookupResult)rv[grdPTLinesCols.p_and_t_line.ToString()]).ValueMember.ToString();
                string strIns_p_and_t_linesAsTask =
                    dbFacade.Ins_p_and_t_lines_WUAsTask(objCurrentWorkingUnit.WorkingUnitId, ptLine, (short?)rv.DisplayOrder);
                dbTasks.Add(strIns_p_and_t_linesAsTask);
            }
            return dbTasks;
        }

        private List<string> getSubDepartmentsDBTasks()
        {
            string UpdateAuditOperation = string.Empty;
            string insAuditOperation = string.Empty;
            string deleteAuditOperation = string.Empty;

            List<string> dbTasks = new List<string>();
            List<DCCDataRowView> grdSubDeptDeletedRows = grdSubDept.GetRowsForState(RowStates.Deleted);
            foreach (DCCDataRowView rv in grdSubDeptDeletedRows)
            {
                short? workingUnitId = rv.AsShort(grdSubDeptCols.child_working_unit_id.ToString());
                //audit operation for delete
                deleteAuditOperation = this.dbFacade.CDBAuditLogOperationAsTask(int.Parse(GlobalAppVariables.AppContext.SessionId), ApplicationId, GlobalAppVariables.AppContext.UserNumber,
                       GlobalAppVariables.AppContext.UserRoleId, CDBUtility.Delete_Operation, ScreenId, workingUnitId.ToString(), null);
                this.dbFacade.AddDbTask(deleteAuditOperation);

                //dbFacade.ResponsibilityTypes_DelPr(workingUnitId);
                dbFacade.DelWorkingUnits(workingUnitId);
            }

            short? entityId = txtEntityName.IdTextAsShort;
            short? societyId = txtSociety.IdTextAsShort;
            List<DCCDataRowView> grdSubDeptUpdatedRows = grdSubDept.GetRowsForState(RowStates.Updated);
            foreach (DCCDataRowView rv in grdSubDeptUpdatedRows)
            {
                short? workingUnitId = rv.AsShort(grdSubDeptCols.child_working_unit_id.ToString());
                string workingUnitCode = rv.AsStr(grdSubDeptCols.child_working_unit_cd.ToString());
                string workingUnitName = rv.AsStr(grdSubDeptCols.child_working_unit_nm.ToString());
                byte[] txnTs = rv.AsByteArr(grdSubDeptCols.child_txn_ts.ToString());

                if (!entityId.HasValue || entityId.Value <= 0)
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "As there are values in the grid so Entity");
                    throw new Exception("As there are values in the grid so Entity must be specified.");
                }

                if (!societyId.HasValue || societyId.Value <= 0)
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "As there are values in the grid so Society");
                    throw new Exception("As there are values in the grid so Society must be specified.");
                }

                //audit operation for update.     
                UpdateAuditOperation = this.dbFacade.CDBAuditLogOperationAsTask(int.Parse(GlobalAppVariables.AppContext.SessionId), ApplicationId, GlobalAppVariables.AppContext.UserNumber,
                       GlobalAppVariables.AppContext.UserRoleId, CDBUtility.Modify_Operation, ScreenId, workingUnitId.ToString(), null);
                this.dbFacade.AddDbTask(UpdateAuditOperation);

                string strUpdWorkingUnitNameAndCodeAsTask =
                    dbFacade.UpdWorkingUnitNameAndCodeAsTask(workingUnitId, workingUnitCode, workingUnitName, societyId, entityId, txnTs);
                dbTasks.Add(strUpdWorkingUnitNameAndCodeAsTask);

                //object responsiblityTableData = rv.AsObject(grdSubDeptCols.responsibilities_data.ToString());
                //List<string> lstDbTasksForResponsiblityGrid = GetDBTaskForGridResponsiblities(workingUnitId, (DataTable)responsiblityTableData);
                //dbFacade.AddDbTasks(lstDbTasksForResponsiblityGrid);

            }

            List<DCCDataRowView> grdSubDeptNewRows = grdSubDept.GetRowsForState(RowStates.New);
            foreach (DCCDataRowView rv in grdSubDeptNewRows)
            {
                string workingUnitCode = rv.AsStr(grdSubDeptCols.child_working_unit_cd.ToString());
                string workingUnitName = rv.AsStr(grdSubDeptCols.child_working_unit_nm.ToString());
                short workingUnitId = 0;

                if (!entityId.HasValue || entityId.Value <= 0)
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "As there are values in the grid so Entity");
                    throw new Exception("As there are values in the grid so Entity must be specified.");
                }

                if (!societyId.HasValue || societyId.Value <= 0)
                {
                    UIManager.ShowMessage(MsgCodes.ValueReqd, "As there are values in the grid so Society");
                    throw new Exception("As there are values in the grid so Society must be specified.");
                }

                // passing parent's value in child node....
                dbFacade.InsWorkingUnits(workingUnitCode, workingUnitName, "No", "Yes", societyId, objCurrentWorkingUnit.IsStaffPosted ? "Yes" : "No",
                entityId, objCurrentWorkingUnit.WorkingUnitId, DateTime.Now, DateTime.MaxValue, (short)0, (short)0, ref workingUnitId);
                //object responsiblityTableData = rv.AsObject(grdSubDeptCols.responsibilities_data.ToString());
                //List<string> lstDbTasksForResponsiblityGrid = GetDBTaskForGridResponsiblities(workingUnitId, (DataTable)responsiblityTableData);
                //dbFacade.AddDbTasks(lstDbTasksForResponsiblityGrid);

                //Insert Auditing for new row.
                if (workingUnitId != -1)
                {
                    insAuditOperation = this.dbFacade.CDBAuditLogOperationAsTask(int.Parse(GlobalAppVariables.AppContext.SessionId), ApplicationId, GlobalAppVariables.AppContext.UserNumber,
                                           GlobalAppVariables.AppContext.UserRoleId, CDBUtility.Insert_Operation, ScreenId, workingUnitId.ToString(), null);
                    this.dbFacade.AddDbTask(insAuditOperation);
                }
            }
            return dbTasks;
        }

        private List<string> getResponsibilitiesChildDBTasks()
        {
            string responsiblityTitle;
            byte? count;
            short? order;
            short? typeId;
            short? workingUnitId = objCurrentWorkingUnit.WorkingUnitId;

            List<string> dbTasks = new List<string>();

            //List<string> dbTasks = new List<string>();
            List<DCCDataRowView> childResponsiblityTableDataDeletedRows = grdResponsiblitiesChild.GetRowsForState(RowStates.Deleted);

            foreach (DCCDataRowView rv in childResponsiblityTableDataDeletedRows)
            {
                string DelDetails = this.dbFacade.ResponsibilityTypes_DelPrAsTask(workingUnitId);

                dbTasks.Add(DelDetails);
            }

            List<DCCDataRowView> childResponsiblityTableDataUpdatedRows = grdResponsiblitiesChild.GetRowsForState(RowStates.Updated);
            foreach (DCCDataRowView rv in childResponsiblityTableDataUpdatedRows)
            {
                responsiblityTitle = rv.AsStr(grdResponsiblitiesChildCols.child_responsibility_nm.ToString());
                count = (byte)rv.AsByte(grdResponsiblitiesChildCols.child_responsibility_cnt.ToString());
                order = (short)rv.AsShort(grdResponsiblitiesChildCols.child_responsibility_sq.ToString());
                typeId = (short)rv.AsShort(grdResponsiblitiesChildCols.child_responsibility_type_id.ToString());

                string UpdDetails = dbFacade.ResponsibilityTypes_UpdPrAsTask(workingUnitId, responsiblityTitle, count, order, typeId);
                dbTasks.Add(UpdDetails);
            }

            List<DCCDataRowView> childResponsiblityTableDataNewRows = grdResponsiblitiesChild.GetRowsForState(RowStates.New);
            foreach (DCCDataRowView rv in childResponsiblityTableDataNewRows)
            {
                responsiblityTitle = rv.AsStr(grdResponsiblitiesChildCols.child_responsibility_nm.ToString());
                count = (byte)rv.AsByte(grdResponsiblitiesChildCols.child_responsibility_cnt.ToString());
                order = (short)rv.AsShort(grdResponsiblitiesChildCols.child_responsibility_sq.ToString());
                short newTypeId = 0;
                string InsDetails = dbFacade.ResponsibilityTypes_InsPrAsTask(workingUnitId, responsiblityTitle, count, order, ref newTypeId);
                dbTasks.Add(InsDetails);
            }

            return dbTasks;
        }

        private List<string> getResponsibilitiesDBTasks()
        {
            List<string> dbTasks = new List<string>();
            short? workingUnitId = objCurrentWorkingUnit.WorkingUnitId;
            dbFacade.ResponsibilitiesSequence_UpdPr(workingUnitId);
            List<DCCDataRowView> grdResponsiblitiesUpdatedRows = grdResponsiblities.GetRowsForState(RowStates.Updated);
            foreach (DCCDataRowView rv in grdResponsiblitiesUpdatedRows)
            {
                int? oldSewadarId = rv.AsInt(grdResponsiblitiesCols.resOldSewadarId.ToString());
                LookupResult sewadarLookup = rv.AsLookupResult(grdResponsiblitiesCols.resSewadarId.ToString());
                short? responsibilityTypeId = rv.AsShort(grdResponsiblitiesCols.res_type_id.ToString());
                if (oldSewadarId.HasValue && (sewadarLookup == null || sewadarLookup.ValueMember == null))
                {
                    dbTasks.Add(dbFacade.Responsibilities_DelPrAsTask(workingUnitId, oldSewadarId));
                }
                else
                {
                    int? newSewadarId = null;
                    if (sewadarLookup != null)
                    {
                        newSewadarId = int.Parse(sewadarLookup.ValueMember.ToString());
                        dbTasks.Add(dbFacade.Responsibilities_UpdPrAsTask(workingUnitId, responsibilityTypeId, newSewadarId, oldSewadarId, (short)rv.DisplayOrder));
                    }
                }
            }

            // this is to set sequence of old rows back, as we set sequence order to negative earlier.
            List<DCCDataRowView> grdResponsiblitiesOldRows = grdResponsiblities.GetRowsForState(RowStates.Old);
            foreach (DCCDataRowView rv in grdResponsiblitiesOldRows)
            {
                int? oldSewadarId = rv.AsInt(grdResponsiblitiesCols.resOldSewadarId.ToString());
                LookupResult sewadarLookup = rv.AsLookupResult(grdResponsiblitiesCols.resSewadarId.ToString());
                short? responsibilityTypeId = rv.AsShort(grdResponsiblitiesCols.res_type_id.ToString());
                if (oldSewadarId.HasValue && (sewadarLookup == null || sewadarLookup.ValueMember == null))
                {
                    dbTasks.Add(dbFacade.Responsibilities_DelPrAsTask(workingUnitId, oldSewadarId));
                }
                else
                {
                    int? newSewadarId = null;
                    if (sewadarLookup != null)
                    {
                        newSewadarId = int.Parse(sewadarLookup.ValueMember.ToString());
                        dbTasks.Add(dbFacade.Responsibilities_UpdPrAsTask(workingUnitId, responsibilityTypeId, newSewadarId, oldSewadarId, (short)rv.DisplayOrder));
                    }
                }
            }
            return dbTasks;
        }

        public override void ClearControls()
        {

        }

        public override void DeleteRecord()
        {

        }

        public override string ScreenId
        {
            get
            {
                // Screen ID goes here
                return Screens.ENT_WORKINGUNITS;
            }
        }

        public override DCCGrid ListViewGrid
        {
            get
            {
                return grdList; //return this.grdlist;
            }
        }

        private void AddTreeNode(DataTable dtWorkingUnits, WorkingUnit parent)
        {
            DataRow[] nodesData = dtWorkingUnits.Select("group_working_unit_id = " + parent.WorkingUnitId);
            if (nodesData == null || nodesData.Length <= 0)
            {
                return;
            }

            foreach (DataRow row in nodesData)
            {
                WorkingUnit node = GenerateNode(row);
                node.IsStaffPosted = parent.IsStaffPosted || node.IsStaffPosted;
                parent.Nodes.Add(node);
                AddTreeNode(dtWorkingUnits, node);
            }
        }

        private static WorkingUnit GenerateNode(DataRow row)
        {
            short workingUnitId = CDBUtility.GetShort(row, "working_unit_id");
            string workingUnitCode = CDBUtility.GetString(row, "working_unit_cd");
            string workingUnitName = CDBUtility.GetString(row, "working_unit_nm");
            short societyId = CDBUtility.GetShort(row, "society_id");
            string societyName = CDBUtility.GetString(row, "society_nm");
            bool isStaffPosted = CDBUtility.GetBool(row, "is_staff_posted");
            bool isLeaf = CDBUtility.GetBool(row, "is_leaf");
            short entityId = CDBUtility.GetShort(row, "working_unit_entity_id");
            short parentWorkingUnitId = CDBUtility.GetShort(row, "group_working_unit_id");
            DateTime effectiveFrom = CDBUtility.GetDateTime(row, "effective_from");
            DateTime effectiveTill = CDBUtility.GetDateTime(row, "effective_till");
            string singularName = CDBUtility.GetString(row, "entity_singular_nm");
            string pluralName = CDBUtility.GetString(row, "entity_plural_nm");
            int honorarySanctionedSewadarCount = CDBUtility.GetInt(row, "honorary_sewadar_cnt");
            int parshadiSanctionedSewadarCount = CDBUtility.GetInt(row, "parshadi_sewadar_cnt");
            byte[] txnTs = row["txn_ts"] as byte[];

            WorkingUnit node = new WorkingUnit(workingUnitCode, workingUnitName, parentWorkingUnitId);
            node.WorkingUnitId = workingUnitId;
            node.SocietyId = societyId;
            node.SocietyName = societyName;
            node.IsStaffPosted = isStaffPosted;
            node.EntityId = entityId;
            node.IsLeaf = isLeaf;
            node.ParentWorkingUnitId = parentWorkingUnitId;
            node.EffectiveFrom = effectiveFrom;
            node.EffectiveTill = effectiveTill;
            node.SingularName = singularName;
            node.PluralName = pluralName;
            node.HonorarySanctionedSewadarCount = honorarySanctionedSewadarCount;
            node.ParshadiSanctionedSewadarCount = parshadiSanctionedSewadarCount;
            node.TxnTs = txnTs;
            return node;
        }

        private void Departments_Load(object sender, EventArgs e)
        {
            GenerateTree();
        }

        private void GenerateTree()
        {
            trvDepartments.Nodes.Clear();
            DataSet dsWorkingUnits = dbFacade.Qryworking_units(null, null);
            DataTable dtWorkingUnits = dsWorkingUnits.Tables[0];
            DataRow[] rootNodesData = dtWorkingUnits.Select("group_working_unit_id IS NULL");
            if (rootNodesData == null || rootNodesData.Length <= 0)
            {
                trvDepartments.Nodes.Clear();
                return;
            }

            foreach (DataRow row in rootNodesData)
            {
                WorkingUnit rootNode = GenerateNode(row);
                trvDepartments.Nodes.Add(rootNode);
                AddTreeNode(dtWorkingUnits, rootNode);
            }
        }

        private void btnPTLinesUp_Click(object sender, EventArgs e)
        {
            grdPTLines.MoveRowUp();
        }

        private void btnPTLinesDown_Click(object sender, EventArgs e)
        {
            grdPTLines.MoveRowDown();
        }

        private void btnExtnUp_Click(object sender, EventArgs e)
        {
            grdExtn.MoveRowUp();
        }

        private void btnExtnDown_Click(object sender, EventArgs e)
        {
            grdExtn.MoveRowDown();
        }

        private void btnFaxUp_Click(object sender, EventArgs e)
        {
            grdFax.MoveRowUp();
        }

        private void btnFaxDown_Click(object sender, EventArgs e)
        {
            grdFax.MoveRowDown();
        }

        private void grdPTLines_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void grdResponsiblitiesChild_FillDefaultCellValues(object sender, FillDefaultCellValuesEventArgs e)
        {
            // Set Cell Value for Automatically Generate Sr. No.
            //grdResponsiblitiesChild.SetCellValue(grdResponsiblitiesChildCols.child_responsibility_sq.ToString(), e.RowIndex, e.RowIndex + 1);
        }

        private void DisplayRecordsInResponsibilitiesGridTOREMOVE(int previousSelectedRow)
        {
            if (grdSubDept.RowCount <= 0)
            {
                return;
            }
            if (grdSubDept.RowCount > previousSelectedRow && previousSelectedRow >= 0 && grdSubDept.GetRowState(previousSelectedRow) != RowStates.None)
            {
                DataTable dtResponsibilitiesToBeExported = grdResponsiblitiesChild.ExportGridModelData(true, true);
                grdSubDept.SetCellValue(grdSubDeptCols.responsibilities_data.ToString(), previousSelectedRow, dtResponsibilitiesToBeExported);
            }

            grdResponsiblitiesChild.RemoveAllRecords();
            int currentRow = grdSubDept.CurrentRowIndex;
            if (currentRow <= 0 && grdSubDept.RowCount > 0)
            {
                currentRow = 0;
            }

            RowStates state = grdSubDept.GetRowState(currentRow);
            if (state == RowStates.None)
            {
                return;
            }
            object responsibilitiesData = grdSubDept.GetCellValue(grdSubDeptCols.responsibilities_data.ToString(), currentRow);
            if (responsibilitiesData == null)
            {
                object childWorkingUnitId = grdSubDept.GetCellValue(grdSubDeptCols.child_working_unit_id.ToString(), currentRow);
                if (childWorkingUnitId == null)
                {
                    grdResponsiblitiesChild.RemoveAllRecords();
                }
                else
                {
                    short workingUnitId = short.Parse(childWorkingUnitId.ToString());
                    DataSet dsResponsibilities = dbFacade.ResponsibilityTypes_SelPr(workingUnitId);
                    if (dsResponsibilities.Tables.Count > 0)
                    {
                        DataTable dtResponsibilities = dsResponsibilities.Tables[0];
                        grdResponsiblitiesChild.RetrieveRecords(dtResponsibilities, false, RowStates.Old);
                        DataTable dtResponsibilitiesToBeExported = grdResponsiblitiesChild.ExportGridModelData(true, true);
                        grdSubDept.SetCellValue(grdSubDeptCols.responsibilities_data.ToString(), currentRow, dtResponsibilitiesToBeExported);
                    }
                }
            }
            else
            {
                grdResponsiblitiesChild.RetrieveRecords((DataTable)responsibilitiesData, false, RowStates.None);
            }

        }

        private void grdSubDept_RowSelectionModifiedTOREMOVE(object sender, GridRowSelectionModifiedEventArgs e)
        {
            DisplayRecordsInResponsibilitiesGridTOREMOVE(e.PreviousRowIndex);
        }

        private void tabControl1_SelectedIndexChangedTOREMOVE(object sender, EventArgs e)
        {
            LoadDetailToSummaryTOREMOVE(grdSubDept.CurrentRowIndex);
        }

        private void btnOpenStaff_Click(object sender, EventArgs e)
        {
            if (txtId.DisplayText != string.Empty)
            {
                Staff scrStaff = (Staff)UIManager.OpenForm(typeof(Staff), UIModes.Reference, ApplicationId, txtId.DisplayText);
                scrStaff.CurrentWorkingUnit = objCurrentWorkingUnit;
            }
        }

        private void txtEntityName_LookupResultSet(object sender, DCC.UMB.CDF.UIControls.TextControls.LookupResultEventArgs e)
        {
            if (e.LookupResult != null && e.LookupResult.SelectedRecords != null && e.LookupResult.SelectedRecords.Count > 0)
            {
                tabControl1.TabPages[0].Text = e.LookupResult.SelectedRecords[0]["entity_plural_nm"].ToString();
            }
        }

        private void dccTableLayoutPanel7_Paint(object sender, PaintEventArgs e)
        {

        }

        private void txtSacHon_Validated(object sender, EventArgs e)
        {
            EnableDisableIsStaffPostedCheckBox();
        }

        private void txtSacParshadi_Validated(object sender, EventArgs e)
        {
            EnableDisableIsStaffPostedCheckBox();
        }

        private void EnableDisableIsStaffPostedCheckBox()
        {
            int sanctionedHonStrength = txtSacHon.DisplayTextAsInteger.Value;
            int sanctionedParshadiStrength = txtSacParshadi.DisplayTextAsInteger.Value;
            chkIsStaffPosted.Enabled = (sanctionedHonStrength + sanctionedParshadiStrength) <= 0;
        }
    }
}