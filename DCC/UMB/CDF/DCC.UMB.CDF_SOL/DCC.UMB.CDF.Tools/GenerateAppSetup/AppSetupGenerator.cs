using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Data;
using System.Diagnostics;
using System.IO;

namespace DCC.UMB.CDF.Tools.GenerateAppSetup
{
    public class AppSetupGenerator
    {
        string runningScreenId = default(string);
        string runningMenuId = default(string);
        static string outFilePath = default(string);
        int colMenuNm = 0;
        int colScreenNm = 0;
        int colCtrKeyAccessor = 0;
        int colMenuGroupDsc = 0;
        int colScreenId = 0;
        int colOperationsSupported = 0;
        int colOperationsAudited = 0;
        int colActionNm = 0;
        int menuOrder = 1;
        int screenOrder = 1;
        int actionOrder = 1;
        DataSet dSet = null;
        const int NUM_INFO_COLUMNS = 8;
        long lRowCount = 0;
        long lColumnCount = 0;
        string packageId = default(string);


        private string GetUserRoleName(int colIdx)
        {
            Object oTemp = GetCellValue(3, colIdx);
            String roleName = oTemp.ToString().Trim();
            return roleName;
        }

        private string GetCellValue(int rowIdx, int colIdx)
        {
            Object oTemp = dSet.Tables[0].Rows[rowIdx - 1][colIdx - 1];    //  HAD TO DO THIS BECAUSE OF DYNAMIC BINDING TO GET
            String cellVal = oTemp != null ? oTemp.ToString().Trim() : string.Empty;
            return cellVal;
        }


        private void SetupColumns()
        {
            for (int i = 1; i <= lColumnCount; i++)
            {
                switch (GetCellValue(2, i))
                {
                    case "menu_nm":
                        colMenuNm = i;
                        break;
                    case "screen_nm":
                        colScreenNm = i;
                        break;
                    case "ctrl_key_accessor":
                        colCtrKeyAccessor = i;
                        break;
                    case "menu_group_dsc":
                        colMenuGroupDsc = i;
                        break;
                    case "screen_id":
                        colScreenId = i;
                        break;
                    case "operations_supported":
                        colOperationsSupported = i;
                        break;
                    case "operations_audited":
                        colOperationsAudited = i;
                        break;
                    case "action_nm":
                        colActionNm = i;
                        break;
                    default:
                        break;
                }
            }
        }
        private string GetConcatOfRolesWithPermissions(int rowIdx)
        {
            string retVal = string.Empty;
            for (int i = 1; i <= lColumnCount; i++)
            {
                if (IsUserRole(i) && !string.IsNullOrEmpty(GetCellValue(rowIdx, i)))
                {
                    retVal += GetUserRoleName(i) + ":" + GetCellValue(rowIdx, i) + "|";
                }
            }
            return retVal.TrimEnd('|');
        }


        private void SetPackageId()
        {
            for (int i = 1; i <= lColumnCount; i++)
            {
                if (IsUserRole(i))
                {
                    packageId = GetCellValue(3, i).Substring(0, 3);
                    break;
                }
            }
        }
        private bool IsUserRole(int colIdx)
        {
            switch (GetCellValue(2, colIdx))
            {
                case "user_role":
                    return true;
                default:
                    return false;
            }
        }


        private string GetCommaSeparatedScreenIds()
        {
            string retVal = string.Empty;
            for (int i = 3; i <= lRowCount; i++)
            {
                if (!string.IsNullOrEmpty(GetCellValue(i, colScreenNm)))
                {
                    retVal += "'" + GetCellValue(i, colScreenId) + "'" + ",";
                }
            }
            return retVal.TrimEnd(',');
        }

        private string GetCommaSeparatedMenuGroupIds()
        {
            string retVal = string.Empty;
            for (int i = 3; i <= lRowCount; i++)
            {
                if (!string.IsNullOrEmpty(GetCellValue(i, colMenuNm)))
                {
                    retVal += "'" + GetCellValue(i, colScreenId) + "'" + ",";
                }
            }
            return retVal.TrimEnd(',');
        }
        private string GetCommaSeparatedRoles()
        {
            string retVal = string.Empty;
            for (int i = 1; i <= lColumnCount; i++)
            {
                if (IsUserRole(i))
                {
                    retVal += "'" + GetUserRoleName(i) + "'" + ",";
                }
            }
            return retVal.TrimEnd(',');
        }

        private string GetConcatOfRolesMarkedYes(int rowIdx)
        {
            string retVal = string.Empty;
            for (int i = 1; i <= lColumnCount; i++)
            {
                if (IsUserRole(i) && (string.Compare(GetCellValue(rowIdx, i), "Y", true) == 0))
                {
                    retVal += GetUserRoleName(i) + "|";
                }
            }
            return retVal.TrimEnd('|');
        }

        private string GetPackageId()
        {
            return packageId;
        }

        private string GetPackageIdAsSQLString()
        {
            return "'" + packageId + "'";
        }
        private string CreateDeleteSQL()
        {
            string allUserRoles = GetCommaSeparatedRoles();
            string allScreenIds = GetCommaSeparatedScreenIds();
            string allMenuGrpIds = GetCommaSeparatedMenuGroupIds();
            string s = string.Format("update package_user_roles set default_user_role_menu_id=null where user_role_id in ({0}) ", this.GetCommaSeparatedRoles());
            s += "\n";
            s += "\n";
            s += string.Format(@"DELETE m
FROM user_role_menus m
JOIN user_role_menu_groups g ON (m.user_role_menu_group_id=g.user_role_menu_group_id)
WHERE g.user_role_id IN ({0}) 
AND g.menu_group_id in ({1});", allUserRoles, allMenuGrpIds);
            return s
            + "\n"
            + "\nDELETE FROM user_role_menu_groups"
            + "\nWHERE user_role_id IN (" + allUserRoles + ")"
            + "\nAND menu_group_id IN (" + allMenuGrpIds + ")"
            + "\n"
            + "\nDELETE FROM user_role_granted_actions"
            + "\nWHERE package_id = " + GetPackageIdAsSQLString()
            + "\nAND screen_id IN (" + allScreenIds + ")"
            + "\n"
            + "\nDELETE FROM package_screen_actions"
            + "\nWHERE package_id = " + GetPackageIdAsSQLString()
            + "\nAND screen_id IN (" + allScreenIds + ")"
            + "\n"
            + "\nDELETE sa"
            + "\nFROM application_screen_audits sa"
            + "\nJOIN applications a ON sa.application_id = a.application_id"
            + "\nWHERE a.package_id = " + GetPackageIdAsSQLString()
            + "\nAND screen_id IN (" + allScreenIds + ")"
            + "\n"

            + "\nDELETE FROM user_role_privileges"
            + "\nWHERE package_id = " + GetPackageIdAsSQLString()
            + "\nAND screen_id IN (" + allScreenIds + ")"
            + "\n"

            + "\nDELETE FROM package_screens"
            + "\nWHERE package_id = " + GetPackageIdAsSQLString()
            + "\nAND screen_id IN (" + allScreenIds + ")";
        }
        private string CreateSQLForEachRow(int rowIdx)
        {
            string retVal = default(string);
            //There are three kinds of rows
            String menuName = GetCellValue(rowIdx, colMenuNm);
            String screenName = GetCellValue(rowIdx, colScreenNm);
            String actionName = GetCellValue(rowIdx, colActionNm);
            //1.Creates menu entry
            //SetMenuGroup  (list_of_user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_key_accessor, display_order)
            if (!string.IsNullOrEmpty(menuName))
            {
                if (string.IsNullOrEmpty(GetCellValue(rowIdx, colScreenId)))
                {
                    runningMenuId = string.Empty;
                    screenOrder = 1;
                    actionOrder = 1;
                }
                else
                {

                    retVal += "\n\n";
                    retVal = string.Format("EXEC SetMenuGroup  '{0}', NULL, '{1}', '{2}', '{3}', '{4}', '{5}'"
                        , GetCellValue(rowIdx, colScreenId), GetCellValue(rowIdx, colMenuNm)
                        , string.IsNullOrEmpty(GetCellValue(rowIdx, colMenuGroupDsc)) ? GetCellValue(rowIdx, colMenuNm) : GetCellValue(rowIdx, colMenuGroupDsc)
                        , GetCellValue(rowIdx, colCtrKeyAccessor)
                        , menuOrder, GetConcatOfRolesMarkedYes(rowIdx));
                    menuOrder++;
                    runningMenuId = GetCellValue(rowIdx, colScreenId);
                    screenOrder = 1;
                    actionOrder = 1;
                }
            }
            //2.Creates screen entry
            //SetPackageScreen (package_id, screen_id, screen_nm, operations_supported (IUDRPSMX), operations_audited (IUDAPMX), menu_group_id, menu_dsc, ctrl_key_accessor, display_order, user_roles_and_operations_list) (list is separated by | whereas each role and operations (IUDRP) separated by a colon)
            else if (!string.IsNullOrEmpty(screenName))
            {
                retVal += "\n";
                retVal += string.Format("EXEC SetPackageScreen  '{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', {7}, '{8}', '{9}'"
                        , GetPackageId(), GetCellValue(rowIdx, colScreenId)
                        , GetCellValue(rowIdx, colScreenNm), GetCellValue(rowIdx, colOperationsSupported)
                        , GetCellValue(rowIdx, colOperationsAudited), runningMenuId
                        , string.IsNullOrEmpty(GetCellValue(rowIdx, colMenuGroupDsc)) ? GetCellValue(rowIdx, colScreenNm) : GetCellValue(rowIdx, colMenuGroupDsc)
                        , string.IsNullOrEmpty(GetCellValue(rowIdx, colCtrKeyAccessor))?"null":string.Format("'{0}'",GetCellValue(rowIdx,colCtrKeyAccessor))
                        , screenOrder
                        , GetConcatOfRolesWithPermissions(rowIdx));
                retVal += "\n\n";
                runningScreenId = GetCellValue(rowIdx, colScreenId);
                screenOrder++;
                actionOrder = 1;
            }
            //3.Creates action entry
            //SetPackageAction (package_id, screen_id, action_nm, display_order, user_roles_list (list is separated by |)
            else if (!string.IsNullOrEmpty(actionName))
            {
                retVal = string.Format("EXEC SetPackageAction  '{0}', '{1}', '{2}', '{3}', '{4}'"
                            , GetPackageId(), runningScreenId
                            , GetCellValue(rowIdx, colActionNm), actionOrder
                            , GetConcatOfRolesMarkedYes(rowIdx));
                actionOrder++;
            }
            return retVal;
        }

        private void GenerateSQL()
        {
            try
            {
                try{
                    //reset values
                    runningMenuId = string.Empty;
                    screenOrder = 1;
                    actionOrder = 1;
                    menuOrder = 1;
                    runningScreenId = string.Empty;
                    lRowCount = dSet.Tables[0].Rows.Count;
                    lColumnCount = dSet.Tables[0].Columns.Count;
                    SetupColumns();

                    // PROCESS EACH SPREADSHHET ROW
                    String generatedScript = default(string);
                    if (lRowCount < 3)
                        return;
                    SetPackageId();
                    
                    generatedScript = CreateDeleteSQL();
                    generatedScript += "\n";
                    for (int i = 3; i <= lRowCount; i++){
                        generatedScript += CreateSQLForEachRow(i);
                        generatedScript += "\n";
                    }
                    // Write the string to a file.
                    System.IO.StreamWriter file = new System.IO.StreamWriter(outFilePath);
                    file.WriteLine("Use Sysadmin");
                    file.WriteLine("Go");

                    file.WriteLine(generatedScript.Trim());
                    file.Close();

                }
                catch{
                    throw;
                }
            }
            catch (Exception ex)
            {
            }
        }

        public static void GenerateAppSetupScript(string odsFilePath)
        {
            FileInfo odsFileInfo = new FileInfo(odsFilePath);
            string duplicateFileName = odsFileInfo.DirectoryName + "\\" + odsFileInfo.Name.Replace(odsFileInfo.Extension, ".wdfods");
            if (File.Exists(duplicateFileName)) {
                File.Delete(duplicateFileName);
            }
            try{
                OdsReaderWriter writer = new OdsReaderWriter();
                if (File.Exists(odsFilePath)){
                    outFilePath = odsFilePath.ToLower().Replace(".ods", ".sql");
                    if (File.Exists(outFilePath)){
                        File.Delete(outFilePath);
                    }

                    File.Copy(odsFilePath,duplicateFileName);
                    DataSet dset = writer.ReadOdsFile(duplicateFileName);
                    AppSetupGenerator app = new AppSetupGenerator();
                    app.SetDataSet(dset);
                    app.GenerateSQL();
                    app.AddAdditionalRoles();
                    app.AddDefaultMenus();
                    app.AddPostScript();
                    
                }
            }
            finally{
                if (File.Exists(duplicateFileName)) {
                    File.Delete(duplicateFileName);
                }
            }

        }

        private void AddPostScript(){
            DataTable postScriptTable = null;
            foreach (DataTable table in this.dSet.Tables) {
                if (table.TableName.ToLower().Equals("postscript")) {
                    postScriptTable = table;
                    break;
                }
            }
            if (postScriptTable == null) return;
            System.IO.StreamWriter file = new System.IO.StreamWriter(outFilePath, true);//open for appending
            file.WriteLine();
            try {
                file.WriteLine("--[[Now adding any script written in sheet named PostScript");
                for (int i = 0; i < postScriptTable.Rows.Count; i++) {
                    DataRow row = postScriptTable.Rows[i];
                    string line = row[0].ToString();
                    file.WriteLine(line);
                }
                file.WriteLine("--]]");
            } finally {
                file.Close();
            }
            
        }

        private void AddDefaultMenus(){
            DataTable defaultMenuTable = null;
            foreach (DataTable table in this.dSet.Tables) {
                if (table.TableName.ToLower().Equals("defaultmenus")) {
                    defaultMenuTable = table;
                    break;
                }
            }
            if (defaultMenuTable == null) return;
            System.IO.StreamWriter file = new System.IO.StreamWriter(outFilePath, true);
            file.WriteLine();
            try {
                file.WriteLine("--[[Now adding update statements for default menu");
                for (int i = 1; i < defaultMenuTable.Rows.Count; i++) {
                    DataRow row = defaultMenuTable.Rows[i];
                    string userRoleId = row[0].ToString();
                    string defaultMenuGroupId = row[1].ToString();
                    string defaultMenuId = row[2].ToString();
                    file.WriteLine(string.Format("exec WDF_SetDefaultMenuForUserRole '{0}','{1}','{2}'", userRoleId, defaultMenuGroupId, defaultMenuId));
                }
                file.WriteLine("--]]");
            } finally {
                file.Close();
            }
        }
        private void AddAdditionalRoles(){
            DataTable additionalRolesTable = null;
            foreach (DataTable table in this.dSet.Tables){
                if ( table.TableName.ToLower().Equals("additionaluserroles")){
                    additionalRolesTable = table;
                    break;
                }
            }
            if (additionalRolesTable == null) return;
            System.IO.StreamWriter file = new System.IO.StreamWriter(outFilePath,true);
            file.WriteLine();
            try {
                file.WriteLine("--[[Now adding insert statements for additional role");
                for(int i=1;i<additionalRolesTable.Rows.Count;i++){
                    DataRow row = additionalRolesTable.Rows[i];
                    string baseUserRoleId = row[0].ToString();
                    string additionalAppId = row[1].ToString();
                    string additionalRoleId = row[2].ToString();
                    file.WriteLine(string.Format("exec WDF_SetAdditionalUserRole '{0}','{1}','{2}'", baseUserRoleId, additionalAppId, additionalRoleId));
                }
                file.WriteLine("--]]");
            } finally {
                file.Close();
            }
            //foreach (DataColumn col in additionalRolesTable.Columns){
            //    if (col.ColumnName.ToLower() == "baseuserrole"){
            //        baseUserRoleCol = col;
            //    }else if (col.ColumnName.ToLower() == "additionalappid"){
            //        additionalAppIdCol = col;
            //    } else if (col.ColumnName.ToLower() == "additionalroleid") {
            //        additionalRoleCol = col;
            //    }
            //}
            //if (baseUserRoleCol == null || additionalAppIdCol == null || additionalRoleCol == null){
            //    throw new Exception("Invalid format, the ods file contains a data sheet named AdditionalUserRoles, but does not contain the requried three columns viz. BaseUserRole, AdditionalAppId, AdditionalRoleId");
            //}

        }

        private void SetDataSet(DataSet dset)
        {
            this.dSet = dset;
        }
    }
}
