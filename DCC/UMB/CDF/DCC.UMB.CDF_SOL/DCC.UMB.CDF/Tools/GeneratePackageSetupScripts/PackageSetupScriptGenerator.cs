using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DCC.UMB.CDF.Tools.GeneratePackageSetupScripts
{
    public partial class PackageSetupScriptGenerator : Form
    {
        public PackageSetupScriptGenerator()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.simpleObjectEditor1.RegisterObjectProvider(new ObjectManager());
        }

        
    }
    public class ObjectManager : IObjectProvider
    {
        List<UserRolePrivileges> lstUserRolePrivileges = new List<UserRolePrivileges>();
        public ObjectManager()
        {
            this.lstUserRolePrivileges.Add(new UserRolePrivileges("RES_Gnrc", "RES", "ENT_01"));
            this.lstUserRolePrivileges.Add(new UserRolePrivileges("RES_Gnrc", "RES", "ENT_02"));
            this.lstUserRolePrivileges.Add(new UserRolePrivileges("RES_Gnrc", "RES", "ENT_03"));
            this.lstUserRolePrivileges.Add(new UserRolePrivileges("RES_Devpr", "RES", "ENT_01"));
            this.lstUserRolePrivileges.Add(new UserRolePrivileges("RES_Devpr", "RES", "ENT_02"));
            this.lstUserRolePrivileges.Add(new UserRolePrivileges("RES_Devpr", "RES", "ENT_03"));
        }
        public ICollection GetObjectList()
        {
            return this.lstUserRolePrivileges;
        }

        public void RemoveObject(object obj)
        {
            this.lstUserRolePrivileges.Remove((UserRolePrivileges)obj);
        }

        public object AddObject()
        {
            UserRolePrivileges item = new UserRolePrivileges("RES_Devpr", "RES", "ENT_03");
            this.lstUserRolePrivileges.Add(item);
            return item;
        }

        public object GetObjectAt(int index)
        {
            return this.lstUserRolePrivileges[index];
        }

        public void SetObjectAt(int index, object obj)
        {
            this.lstUserRolePrivileges[index] = (UserRolePrivileges)obj;
        }
    }

    public class UserRolePrivileges
    {
        private string userRoleId;
        private string packageId;
        private string screenId;
        private bool isSelectGranted;
        private bool isInsertGranted;
        private bool isDeleteGranted;
        private bool isUpdateGranted;
        private bool isPrintGranted;
        public UserRolePrivileges(string userRoleId, string packageId, string screenId)
        {
            this.userRoleId = userRoleId;
            this.packageId = packageId;
            this.screenId = screenId;
        }
        public override string ToString()
        {
            return string.Format("{0}_{1}", userRoleId, screenId);
        }
        public bool IsSelectGranted
        {
            get { return isSelectGranted; }
            set { isSelectGranted = value; }
        }

        public bool IsInsertGranted
        {
            get { return isInsertGranted; }
            set { isInsertGranted = value; }
        }

        public bool IsDeleteGranted
        {
            get { return isDeleteGranted; }
            set { isDeleteGranted = value; }
        }

        public bool IsUpdateGranted
        {
            get { return isUpdateGranted; }
            set { isUpdateGranted = value; }
        }

        public bool IsPrintGranted
        {
            get { return isPrintGranted; }
            set { isPrintGranted = value; }
        }

        public string UserRoleId
        {
            get { return userRoleId; }
            set { userRoleId = value; }
        }

        public string PackageId
        {
            get { return packageId; }
            set { packageId = value; }
        }

        public string ScreenId
        {
            get { return screenId; }
            set { screenId = value; }
        }
    }

}
