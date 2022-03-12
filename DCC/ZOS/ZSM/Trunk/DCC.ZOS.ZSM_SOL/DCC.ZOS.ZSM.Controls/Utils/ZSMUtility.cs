using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DCC.UMB.CDF.UIControls.Grid.Column;
using System.IO;
using DCC.DBFacade;
using System.Data;
using System.Drawing;
using DCC.UMB.CDF.UIControls.Grid;
using System.Windows.Forms;
using DCC.UMB.CDF.UIControls;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.UIControls.TextControls;
using System.Drawing.Imaging;
using System.Collections;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.UIControls.Windows;
using DCC.UMB.CDF.Configuration;

namespace DCC.ZOS.ZSM.Controls.Utils
{
    public enum SewadarHeaderType
    {
        SewadarIDWise,
        SewadarGRNoWise
    }

    public class ImageCache
    {
        static Hashtable imgCache = new Hashtable();


        public static bool ContainsSewadarImage(int? sewadarID)
        {
            return imgCache.Contains(sewadarID);
        }

        public static void SetSewadarImage(int? sewadarID, DataTable dtPersonPhoto)
        {
            imgCache[sewadarID] = dtPersonPhoto;
        }

        public static void InvalidateSewadarImage(int? sewadarID)
        {
            imgCache.Remove(sewadarID);
        }

        public static DataTable GetSewadarImage(int? sewadarID)
        {
            return (DataTable)imgCache[sewadarID];
        }

        public static DataTable GetSewadarImage(int? sewadarID, ZSM_MUMDbFacade dbFacade)
        {
            if (imgCache.Contains(sewadarID))
            {
                return (DataTable)imgCache[sewadarID];
            }
            else
            {
                DataTable dtPersonPhoto = dbFacade.QuerySewadarsPhoto(sewadarID).Tables[0];
                imgCache[sewadarID] = dtPersonPhoto;
                return dtPersonPhoto;
            }
        }

    }

    public class ZSMUtility
    {
        static DataTable dtActiveSwdStatus = null;
        static DataTable dtAddressProof = null;
        static DataTable dtOccupations = null;
        static DataTable dtRemarksTypes = null;
        static DataTable dtSewadarListUse = null;

        public static object EscapeSingleQuote(object value)
        {
            if (value != null)
                return value.ToString().Replace("'", "''");
            return value;
        }

        public static DataTable GetSewadarListUse(ZSM_MUMDbFacade dbFacade)
        {
            if (dtSewadarListUse == null)
            {
                dtSewadarListUse = dbFacade.ObjDBManager.ExecuteSQL("select sewadar_list_use from sewadar_list_uses WHERE (GETDATE() BETWEEN effective_from AND effective_till) ORDER BY sewadar_list_use_sq").Tables[0];
            }
            return dtSewadarListUse;
        }

        public static DataTable GetOccupations(ZSM_MUMDbFacade dbFacade)
        {
            if (dtOccupations == null)
            {
                dtOccupations = dbFacade.ObjDBManager.ExecuteSQL("select occupation from occupations where GETDATE() BETWEEN effective_from AND effective_till").Tables[0];
            }
            return dtOccupations;
        }

        public static DataTable GetRemarkTypes(ZSM_MUMDbFacade dbFacade)
        {
            if (dtRemarksTypes == null)
            {
                dtRemarksTypes = dbFacade.ObjDBManager.ExecuteSQL("select remarks_type_sq, remarks_type from remarks_types WHERE GETDATE() BETWEEN effective_from AND effective_till ORDER BY remarks_type_sq").Tables[0];
            }
            return dtRemarksTypes;
        }

        public static DataTable GetAddressProof(ZSM_MUMDbFacade dbFacade)
        {
            if (dtAddressProof == null)
            {
                dtAddressProof = dbFacade.ObjDBManager.ExecuteSQL("select address_proof from address_proofs where GETDATE() BETWEEN effective_from AND effective_till").Tables[0];
            }
            return dtAddressProof;
        }

        public static Byte[] GetByteArrayForImage(string fileName, string ext)
        {
            Image im = Image.FromFile(fileName);
            ImageFormat imgf = (string.Compare(ext, "gif", true) == 0) ? ImageFormat.Gif
                           : (string.Compare(ext, "jpg", true) == 0) ? ImageFormat.Jpeg
                           : (string.Compare(ext, "png", true) == 0) ? ImageFormat.Png
                           : null;
            MemoryStream ms = new MemoryStream();
            im.Save(ms, imgf);
            //Read from MemoryStream into Byte array.
            Byte[] byteImageData = new Byte[ms.Length];
            ms.Position = 0;
            ms.Read(byteImageData, 0, Convert.ToInt32(ms.Length));
            return byteImageData;
        }

        public static string CreateStringUsingItems(DCCListBox box, bool selectedOnly, char sep)
        {
            string retVal = default(string);
            List<DropDownItem> lstDropDownItems = box.GetItems(selectedOnly);
            foreach (DropDownItem item in lstDropDownItems)
            {
                if (item.ValueMember == null)
                {
                    continue;
                }
                retVal += string.IsNullOrEmpty(retVal) ? item.ValueMember.ToString() : sep + item.ValueMember.ToString();
            }
            retVal = retVal.TrimEnd(sep);
            return retVal;
        }


        public static string GetInStatementUsingItems(DCCListBox box, bool selectedOnly)
        {
            string retVal = default(string);
            List<DropDownItem> lstDropDownItems = box.GetItems(selectedOnly);
            if (lstDropDownItems.Count == 0)
            {
                retVal = "null";
            }
            foreach (DropDownItem item in lstDropDownItems)
            {
                if (item.ValueMember == null)
                {
                    continue;
                }
                retVal += string.IsNullOrEmpty(retVal) ? item.ValueMember.ToString() : " , " + item.ValueMember.ToString();
            }
            retVal = retVal.TrimEnd(',');
            retVal = "IN  ( " + retVal + " ) ";
            return retVal;
        }

        public static int? GetIndexOfItem(DCCListBox box, string id)
        {
            int? retVal = null;
            List<DropDownItem> lstDropDownItems = box.GetItems(false);
            int idx = 0;
            foreach (DropDownItem item in lstDropDownItems)
            {
                if (string.Compare(DbManager.GetString(item.ValueMember), id, true) == 0)
                {
                    return idx;
                }
                idx++;
            }
            return retVal;
        }

        public static string GetUserName()
        {
            return GlobalAppVariables.AppContext.UserName;
        }

        public static int? GetSatsangCentreId()
        {
            return int.Parse(GlobalAppVariables.AppContext.Argument1);
        }

        public static string GetSatsangCentreName()
        {
            return GlobalAppVariables.AppContext.Argument2;
        }

        public static void setDisplayValueText(DCCTextField f, string val)
        {
            f.DisplayText = val;
            f.ValueText = val;
        }
        public static void MakeGridReadOnly(DCCGrid grd)
        {
            grd.InsertRowsMenuItemsEnabled = false;
            grd.DeleteRowMenuEnabled = false;
            grd.ReadOnly = true;
            foreach (DCCGridColumn col in grd.Columns)
            {
                col.ReadOnly = true;
            }
        }

        public static void MakeGridNotReadOnly(DCCGrid grd)
        {
            grd.InsertRowsMenuItemsEnabled = true;
            grd.DeleteRowMenuEnabled = true;
            grd.ReadOnly = false;
            foreach (DCCGridColumn col in grd.Columns)
            {
                col.ReadOnly = false;
            }
        }

        public static byte[] getByteArray(Image image)
        {
            //[[Get rid of Bitmap.save(): A generic error occurred in GDI+
            if (DbManager.IsNotNull(image))
            {
                Bitmap clonedImage = new Bitmap(image);
                MemoryStream ms = new MemoryStream();
                clonedImage.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                return ms.ToArray();
            }
            return null;
        }

        public static void LoadOnlySewadarImageFromDBToPictureBox(int? sewadarID, ref PictureBox pictureBox)
        {
            DCCLabel dummy = new DCCLabel();
            ZSMUtility.LoadSewadarImageFromDBToPictureBox(sewadarID, GlobalAppVariables.AppContext.ApplicationId, ref pictureBox, ref dummy);
        }


        public static DateTime GetDate()
        {
            ZSM_MUMDbFacade dbFacade = new ZSM_MUMDbFacade(GlobalAppVariables.AppContext.ApplicationId);
            DateTime dt = DbManager.GetDateTime(dbFacade.ObjDBManager.ExecuteSQL("SELECT GETDATE()").Tables[0].Rows[0][0]);
            return dt.Date;
        }

        public static void LoadSewadarImageFromDBToPictureBox(int? sewadarID,
            string ApplicationId, ref PictureBox pictureBox, ref DCCLabel lblPhotoClickedDate)
        {
            ZSM_MUMDbFacade dbFacade = new ZSM_MUMDbFacade(ApplicationId);
            if (sewadarID == null)
                return;

            DataTable dtPersonPhoto = ImageCache.GetSewadarImage(sewadarID, dbFacade);
            if (dtPersonPhoto.Rows.Count > 0)
            {
                lblPhotoClickedDate.Text = (dtPersonPhoto.Rows[0]["photo_dt"] as DateTime?).Value.ToString("dd-MMM-yyyy");
                byte[] photo = (byte[])dtPersonPhoto.Rows[0]["sewadar_photo"];
                using (MemoryStream ms = new MemoryStream(photo, 0, photo.Length))
                {
                    ms.Write(photo, 0, photo.Length);
                    pictureBox.Image = Image.FromStream(ms, true);
                }
            }
            else
            {
                pictureBox.Image = null;
                lblPhotoClickedDate.Text = string.Empty;
            }
        }

        public static void SortDataTable(DataTable dt, string sort)
        {
            DataTable newDT = dt.Clone();
            int rowCount = dt.Rows.Count;

            DataRow[] foundRows = dt.Select(null, sort);
            // Sort with Column name 
            for (int i = 0; i < rowCount; i++)
            {
                object[] arr = new object[dt.Columns.Count];
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    arr[j] = foundRows[i][j];
                }
                DataRow data_row = newDT.NewRow();
                data_row.ItemArray = arr;
                newDT.Rows.Add(data_row);
            }

            //clear the incoming dt 
            dt.Rows.Clear();

            for (int i = 0; i < newDT.Rows.Count; i++)
            {
                object[] arr = new object[dt.Columns.Count];
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    arr[j] = newDT.Rows[i][j];
                }

                DataRow data_row = dt.NewRow();
                data_row.ItemArray = arr;
                dt.Rows.Add(data_row);
            }
        }


        public static void changeControlProperties(DCCTextField column, string requirementObj)
        {
            if (!string.IsNullOrEmpty(requirementObj))
            {
                //[[value is mandatory or optional based on Scale Requirement defined for the Condition.
                column.Visible = true;
                switch (requirementObj)
                {
                    case "O":
                        column.Mandatory = false;
                        column.ReadOnly = false;
                        break;
                    case "R":
                        column.Mandatory = true;
                        column.ReadOnly = false;
                        break;
                    case "N":
                        column.Mandatory = false;
                        column.Visible = false;
                        column.ReadOnly = true;
                        break;
                }
            }
        }

        public static void changeControlProperties(DCCListBox column, string requirementObj)
        {
            if (!string.IsNullOrEmpty(requirementObj))
            {
                //[[value is mandatory or optional based on Scale Requirement defined for the Condition.
                column.Visible = true;
                switch (requirementObj)
                {
                    case "O":
                        column.Mandatory = false;
                        column.ReadOnly = false;
                        break;
                    case "R":
                        column.Mandatory = true;
                        column.ReadOnly = false;
                        break;
                    case "N":
                        column.Mandatory = false;
                        column.ReadOnly = true;
                        column.Visible = false;
                        break;
                }
            }
        }

        public static void changeControlProperties(DCCCheckBox column, string requirementObj)
        {
            if (!string.IsNullOrEmpty(requirementObj))
            {
                column.Visible = true;

                //[[value is mandatory or optional based on Scale Requirement defined for the Condition.
                switch (requirementObj)
                {
                    case "O":
                        column.Enabled = true;
                        break;
                    case "R":
                        column.Enabled = true;
                        break;
                    case "N":
                        column.Enabled = false;
                        column.Visible = false;
                        break;
                }
            }
        }

        public static void changeControlProperties(DCCComboBox column, string requirementObj)
        {
            if (!string.IsNullOrEmpty(requirementObj))
            {
                column.Visible = true;
                //[[value is mandatory or optional based on Scale Requirement defined for the Condition.
                switch (requirementObj)
                {
                    case "O":
                        column.Mandatory = false;
                        column.ReadOnly = false;
                        break;
                    case "R":
                        column.Mandatory = true;
                        column.ReadOnly = false;
                        break;
                    case "N":
                        column.Mandatory = false;
                        column.ReadOnly = true;
                        column.Visible = false;
                        break;
                }
            }
        }

        public static void changeControlProperties(DateRangePair column, string requirementObj, string ToDateObj)
        {
            if (!string.IsNullOrEmpty(requirementObj))
            {
                //[[value is mandatory or optional based on Scale Requirement defined for the Condition.
                switch (requirementObj)
                {
                    case "O":
                        column.FromDateMandatory = false;
                        //column.ReadOnly = false;
                        break;
                    case "R":
                        column.FromDateMandatory = true;
                        //column.ReadOnly = false;
                        break;
                    case "N":
                        column.FromDateMandatory = false;
                        //column.ReadOnly = true;
                        break;
                }
                switch (ToDateObj)
                {
                    case "O":
                        column.ToDateMandatory = false;
                        //column.ReadOnly = false;
                        break;
                    case "R":
                        column.ToDateMandatory = true;
                        //column.ReadOnly = false;
                        break;
                    case "N":
                        column.ToDateMandatory = false;
                        //column.ReadOnly = true;
                        break;
                }
            }
            if (string.Compare(requirementObj, "N", true) == 0
                && string.Compare(ToDateObj, "N", true) == 0)
            {
                column.Visible = false;
            }
            else
            {
                column.Visible = true;
            }
        }

        public static void changeControlProperties(DCCLongIntegerField column, string requirementObj)
        {
            if (!string.IsNullOrEmpty(requirementObj))
            {
                column.Visible = true;
                //[[value is mandatory or optional based on Scale Requirement defined for the Condition.
                switch (requirementObj)
                {
                    case "O":
                        column.Mandatory = false;
                        column.ReadOnly = false;
                        break;
                    case "R":
                        column.Mandatory = true;
                        column.ReadOnly = false;
                        break;
                    case "N":
                        column.Mandatory = false;
                        column.ReadOnly = true;
                        column.Visible = false;
                        break;
                }
            }
        }

        public static List<DCCDataRowView> GetAllRows(DCCGrid grd)
        {
            List<DCCDataRowView> retVal = new List<DCCDataRowView>();
            retVal.AddRange(grd.GetRowsForState(RowStates.Old));
            retVal.AddRange(grd.GetRowsForState(RowStates.New));
            retVal.AddRange(grd.GetRowsForState(RowStates.Updated));
            retVal.AddRange(grd.GetRowsForState(RowStates.Deleted));
            return retVal;
        }

        public static void LogAction(AbstractScreen screen, ZSM_MUMDbFacade dbFacade, AudiLogActions action, string pObjectId, int? sewadarId, int? sewaId, DateTime? transactionDt, int? satsangCentreId, string sewadarGRNo)
        {
            Hashtable hash = new Hashtable();
            if (!string.IsNullOrEmpty(pObjectId))
                hash.Add("p_object_id", pObjectId);
            if (DbManager.IsNotNull(sewadarId))
                hash.Add("p_sewadar_id", sewadarId);
            if (DbManager.IsNotNull(sewaId))
                hash.Add("p_sewa_id", sewaId);
            if (DbManager.IsNotNull(transactionDt))
                hash.Add("p_transaction_dt", transactionDt);
            if (DbManager.IsNotNull(satsangCentreId))
                hash.Add("p_satsang_centre_id", satsangCentreId);
            if (!string.IsNullOrEmpty(sewadarGRNo))
                hash.Add("p_sewadar_grno", sewadarGRNo);
            UIManager.LogOperation(dbFacade.ObjDBManager, screen, action, hash);
        }

        public static void LogAction(AbstractScreen screen, ZSM_MUMDbFacade dbFacade, string pObjectId, int? sewadarId, int? sewaId, DateTime? transactionDt, int? satsangCentreId, string sewadarGRNo)
        {
            LogAction(screen, dbFacade, AudiLogActions.Action, pObjectId, sewadarId, sewaId, transactionDt, satsangCentreId, sewadarGRNo);
        }

        public static int GetRecordCount(ZSM_MUMDbFacade dbFacade, string tableNm, string gr_no, int? sewa_id, int? satsang_centre_id)
        {
            String sqlQuery = String.Format("SELECT COUNT(1) FROM {0} WHERE	sewadar_grno = '{1}' " +
                          " AND	sewa_id = {2} AND satsang_centre_id = {3}", tableNm, gr_no, sewa_id, satsang_centre_id);

            DataTable dT = dbFacade.ObjDBManager.ExecuteSQL(sqlQuery).Tables[0];

            return (int)dT.Rows[0][0];
        }

    }
}
