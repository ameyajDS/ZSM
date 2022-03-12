using System;
using System.Windows.Forms;
namespace DCC.UMB.CDB2.ENT
{
    public class WorkingUnit : TreeNode
    {
        private short workingUnitId;
        private string workingUnitCode;
        private string workingUnitName;
        private short societyId;
        private bool isLeaf;
        private string societyName;
        private bool isStaffPosted;
        private short entityId;
        private short parentWorkingUnitId;
        private DateTime effectiveFrom;
        private DateTime effectiveTill;
        private string singularName;
        private string pluralName;
        private int honorarySanctionedSewadarCount;
        private int parshadiSanctionedSewadarCount;
        private byte[] txnTs;
        private bool valueChanged;

        public WorkingUnit(string code, string name, short parentId)
        {
            WorkingUnitCode = code;
            WorkingUnitName = name;
            ParentWorkingUnitId = parentId;
        }

        public short WorkingUnitId
        {
            get { return workingUnitId; }
            internal set
            {
                workingUnitId = value;
                base.Name = workingUnitId.ToString();
            }
        }

        public int HonorarySanctionedSewadarCount
        {
            get { return honorarySanctionedSewadarCount; }
            set
            {
                if (value < 0)
                    honorarySanctionedSewadarCount = 0;
                else
                    honorarySanctionedSewadarCount = value;
            }
        }

        public int ParshadiSanctionedSewadarCount
        {
            get { return parshadiSanctionedSewadarCount; }
            set
            {
                if (value < 0) parshadiSanctionedSewadarCount = 0;
                else parshadiSanctionedSewadarCount = value;
            }
        }

        public int TotalSanctionedSewadarCount
        {
            get { return honorarySanctionedSewadarCount + parshadiSanctionedSewadarCount; }
        }

        public string WorkingUnitName
        {
            get { return workingUnitName; }
            set
            {
                workingUnitName = value;
                base.Text = workingUnitName;
            }
        }

        public string WorkingUnitCode
        {
            get { return workingUnitCode; }
            set { workingUnitCode = value; }
        }

        public bool IsRoot
        {
            get { return parentWorkingUnitId <= 0; }
        }

        public bool IsLeaf
        {
            get { return isLeaf; }
            set { isLeaf = value; }
        }

        public short ParentWorkingUnitId
        {
            get { return parentWorkingUnitId; }
            set { parentWorkingUnitId = value; }
        }

        public bool ValueChanged
        {
            get { return valueChanged; }
            set { valueChanged = value; }
        }

        public DateTime EffectiveFrom
        {
            get { return effectiveFrom; }
            set { effectiveFrom = value; }
        }

        public DateTime EffectiveTill
        {
            get { return effectiveTill; }
            set { effectiveTill = value; }
        }

        public short SocietyId
        {
            get { return societyId; }
            set { societyId = value; }
        }

        public string SocietyName
        {
            get { return societyName; }
            set { societyName = value; }
        }

        public bool IsStaffPosted
        {
            get { return isStaffPosted; }
            set { isStaffPosted = value; }
        }

        public short EntityId
        {
            get { return entityId; }
            set { entityId = value; }
        }

        public string SingularName
        {
            get { return singularName; }
            set { singularName = value; }
        }

        public string PluralName
        {
            get { return pluralName; }
            set { pluralName = value; }
        }

        public byte[] TxnTs
        {
            get { return txnTs; }
            set { txnTs = value; }
        }
    }
}