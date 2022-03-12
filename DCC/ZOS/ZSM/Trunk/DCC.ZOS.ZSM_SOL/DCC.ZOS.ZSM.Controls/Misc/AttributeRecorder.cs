using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DCC.DBFacade;
using DCC.UMB.CDF.DB;
using DCC.UMB.CDF.MGMT.Global;
using DCC.UMB.CDF.MGMT.Controller;
using DCC.UMB.CDF.Configuration;

namespace DCC.SSM.ZMS.Controls.Misc
{
    public partial class AttributeRecorder : UserControl
    {
        public event EventHandler<EventArgs> RecorderDataChanged;
        public AttributeRecorder()
        {
            InitializeComponent();            
        }
        public string GetAttributeType()
        {
            return attributeType;
        }

        public DCC.UMB.CDF.UIControls.DCCCheckBox GetBooleanValueCheckBox()
        {
            return this.chkBooleanValue;
        }

        public DateTime? GetDateTimeValue()
        {
            return this.txtDateValue.DisplayTextAsDateTime;
        }

        public string GetStringValue()
        {
            return this.txtStringValue.DisplayText;
        }

        public int? GetIntegerValue()
        {
            return this.txtIntegerValue.DisplayTextAsInteger;
        }

        public Decimal? GetDecimalValue()
        {
            return this.txtNumericValue.DisplayTextAsDecimal;
        }

        public string GetListValue()
        {
            return ( string.Compare(attributeType, "List", true) == 0 ? this.cmbListValue.SelectedValue.ToString() : default(string));
        }

        public string GetRemarks()
        {
            return this.txtRemarks.DisplayText;
        }

        public DateTime? GetEffectiveFrom()
        {
            return this.txtEffectiveFrom.DisplayTextAsDateTime;
        }

        public DateTime? GetEffectiveTill()
        {
            return this.txtEffectiveTill.DisplayTextAsDateTime;
        }

        private int satsangCentreid = 0;
        private string sewadarGrno = null;
        private short attributeId = 0;
        private string attributeType = null;
        private bool isTemporal = false;
        string sqlString = string.Empty;
        public string GetInsertSQLString()
        {
            switch (attributeType)
            {
                case "Boolean":
                    if (string.IsNullOrEmpty(this.chkBooleanValue.BlnString)) return "";
                    if (!this.chkBooleanValue.Checked) return "";
                    sqlString = dbfacade.InsertSewadarsAttributeAsTask(this.satsangCentreid, sewadarGrno, attributeId,
                        null, this.chkBooleanValue.BlnString, null,
                        null,null,
                        null,
                        this.txtRemarks.DisplayText, this.txtEffectiveFrom.DisplayTextAsDateTime, this.txtEffectiveTill.DisplayTextAsDateTime);
                    break;
                case "Date":
                    if (string.IsNullOrEmpty(this.txtDateValue.DisplayText)) return "";
                    sqlString = dbfacade.InsertSewadarsAttributeAsTask(this.satsangCentreid, sewadarGrno, attributeId,
                        null,null, this.txtDateValue.DisplayTextAsDateTime,
                        null,null,
                        null,
                        this.txtRemarks.DisplayText, this.txtEffectiveFrom.DisplayTextAsDateTime, this.txtEffectiveTill.DisplayTextAsDateTime);
                    break;
                case "Timestamp":
                    if (string.IsNullOrEmpty(this.txtDateValue.DisplayText)) return "";
                    sqlString = dbfacade.InsertSewadarsAttributeAsTask(this.satsangCentreid, sewadarGrno, attributeId,
                        null, null, this.txtDateValue.DisplayTextAsDateTime,
                        null, null,
                        null,
                        this.txtRemarks.DisplayText, this.txtEffectiveFrom.DisplayTextAsDateTime, this.txtEffectiveTill.DisplayTextAsDateTime);
                    break;
                case "String":
                    if (string.IsNullOrEmpty(this.txtStringValue.DisplayText)) return "";                    
                    sqlString = dbfacade.InsertSewadarsAttributeAsTask(this.satsangCentreid, sewadarGrno, attributeId,
                        this.txtStringValue.DisplayText, null, null,
                        null,null,
                        null,
                        this.txtRemarks.DisplayText, this.txtEffectiveFrom.DisplayTextAsDateTime, this.txtEffectiveTill.DisplayTextAsDateTime);
                    break;
                case "Integer":
                    if (string.IsNullOrEmpty(this.txtIntegerValue.DisplayText)) return "";                    
                    sqlString = dbfacade.InsertSewadarsAttributeAsTask(this.satsangCentreid, sewadarGrno, attributeId,
                        null, null, null,
                        this.txtIntegerValue.DisplayTextAsInteger, null,
                        null,
                        this.txtRemarks.DisplayText, this.txtEffectiveFrom.DisplayTextAsDateTime, this.txtEffectiveTill.DisplayTextAsDateTime);
                    break;
                case "Number":
                    if (string.IsNullOrEmpty(this.txtNumericValue.DisplayText)) return "";                    
                    sqlString = dbfacade.InsertSewadarsAttributeAsTask(this.satsangCentreid, sewadarGrno, attributeId,
                        null, null, null,
                        null, this.txtNumericValue.DisplayTextAsDecimal,
                        null,
                        this.txtRemarks.DisplayText, this.txtEffectiveFrom.DisplayTextAsDateTime, this.txtEffectiveTill.DisplayTextAsDateTime);
                    break;
                case "List":
                    if (string.IsNullOrEmpty(this.cmbListValue.SelectedValueAsStr)) return "";                    
                    sqlString = dbfacade.InsertSewadarsAttributeAsTask(this.satsangCentreid, sewadarGrno, attributeId,
                        null, null,null,
                        null,null,
                        this.cmbListValue.SelectedValue.ToString(),
                        this.txtRemarks.DisplayText, this.txtEffectiveFrom.DisplayTextAsDateTime, this.txtEffectiveTill.DisplayTextAsDateTime);
                    break;
                default:
                    throw new Exception("Invalid attribute type..How did you come here");
            }
            return sqlString;
        }


        private static DataTable attributesCache = null;
        private static DataTable attributeValuesCache = null;
        private static DataTable listTypeAttributeValuesCache = null;
        private static ZSM_MUMDbFacade dbfacade = new ZSM_MUMDbFacade(GlobalAppVariables.AppContext.ApplicationId);

        public static AttributeRecorder CreateRecorder(short attributeId, int satsangCentreid, string sewadarGrno, DataRow existingAttributeValues)
        {
            AttributeRecorder recorder = new AttributeRecorder();
            recorder.satsangCentreid = satsangCentreid;
            recorder.sewadarGrno = sewadarGrno;
            recorder.attributeId = attributeId;
            DataRow attributeRow = GetAttributeDataRowFromCache(attributeId);
            string attributeName = DbManager.GetString(attributeRow["attribute_nm"]);
            recorder.attributeType = DbManager.GetString(attributeRow["attribute_type"]);
            byte? attributeLength = DbManager.GetNullableByte(attributeRow["attribute_length"]);
            byte? attributeScale = DbManager.GetNullableByte(attributeRow["attribute_scale"]);
            recorder.isTemporal = DbManager.GetBool(attributeRow["is_temporal"]);
            bool isMandatory = DbManager.GetBool(attributeRow["is_mandatory"]);
            bool isStatusApplicable = DbManager.GetBool(attributeRow["is_status_applicable"]);

            recorder.lblAttributeName.Text = attributeName;
            //[[Now hide the value captureing control and the effective range controls based upon the 
            //values specified in database for this attribute.
            //First we will hide everything, then baesd upon the values from databaes we will open up
            //the control whichever needs to be shown (based upon attributeType column)
            for (int i = 1; i < 7; i++)//we have to keep the first (name column) and last (effective dates and remarks columns) visible
            {
                recorder.tlpBasePanel.ColumnStyles[i].Width = 0F;
                recorder.tlpBasePanel.ColumnStyles[i].SizeType = SizeType.Percent;
                recorder.tlpBasePanel.GetControlFromPosition(i, 0).Visible = false;
            }
            switch (recorder.attributeType)
            {
                case "Boolean":
                    recorder.tlpBasePanel.ColumnStyles[1].Width = 32;
                    recorder.tlpBasePanel.GetControlFromPosition(1, 0).Visible = true;
                    break;
                case "Date":
                    recorder.tlpBasePanel.ColumnStyles[2].Width = 32;
                    recorder.txtDateValue.ShowTime = false;
                    recorder.txtDateValue.Mandatory = isMandatory;
                    recorder.tlpBasePanel.GetControlFromPosition(2, 0).Visible = true;
                    break;
                case "Timestamp":
                    recorder.tlpBasePanel.ColumnStyles[2].Width = 32F;
                    recorder.txtDateValue.ShowTime = true;
                    recorder.txtDateValue.Mandatory = isMandatory;                    
                    recorder.tlpBasePanel.GetControlFromPosition(2, 0).Visible = true;                    
                    break;
                case "String":
                    recorder.tlpBasePanel.ColumnStyles[3].Width = 32F;
                    recorder.txtStringValue.Mandatory = isMandatory;
                    recorder.tlpBasePanel.GetControlFromPosition(3, 0).Visible = true;
                    break;
                case "Integer":
                    recorder.tlpBasePanel.ColumnStyles[4].Width = 32F;
                    recorder.txtIntegerValue.Mandatory = isMandatory;
                    recorder.tlpBasePanel.GetControlFromPosition(4, 0).Visible = true;
                    break;
                case "Number":
                    recorder.tlpBasePanel.ColumnStyles[5].Width = 32F;
                    recorder.txtNumericValue.Mandatory = isMandatory;
                    recorder.tlpBasePanel.GetControlFromPosition(5, 0).Visible = true;

                    break;
                case "List":
                    recorder.tlpBasePanel.ColumnStyles[6].Width = 32F;
                    recorder.cmbListValue.Mandatory = isMandatory;
                    DataTable lstValuesTable = GetListTypeAttributeVaues(attributeId);
                    recorder.cmbListValue.SetDataSource(lstValuesTable, "attribute_value", "attribute_value");
                    recorder.tlpBasePanel.GetControlFromPosition(6, 0).Visible = true;
                    break;
                default:
                    throw new Exception("Invalid attribute type..How did you come here");
            }
            //[[show the date fields always, but will be disabled if "isTemporal" is false.
            //recorder.tlpBasePanel.ColumnStyles[8].Width = 16F;
            //recorder.tlpBasePanel.ColumnStyles[9].Width = 16F;
            recorder.txtEffectiveFrom.Visible = false;
            recorder.txtEffectiveTill.Visible = false;
            //]]    
            if (recorder.isTemporal)
            {
                recorder.txtEffectiveFrom.Visible = true;
                recorder.txtEffectiveTill.Visible = true;
            }
            if (DbManager.IsNotNull(existingAttributeValues))
            {
                //[[Now fill the values of this attribute in the appropriate controls
                //satsang_centre_id,sewadar_grno,attribute_id,boolean_value,date_value,int_value,number_value,list_value,effective_from,effective_till
                bool boolean_value = DbManager.GetBool(existingAttributeValues["boolean_value"]);
                DateTime? date_value = DbManager.GetNullableDateTime(existingAttributeValues["date_value"]);
                int? int_value = DbManager.GetNullableInteger(existingAttributeValues["int_value"]);
                decimal? number_value = DbManager.GetNullableDecimal(existingAttributeValues["number_value"]);
                string list_value = DbManager.GetString(existingAttributeValues["list_value"]);
                DateTime? effective_from = DbManager.GetNullableDateTime(existingAttributeValues["effective_from"]);
                DateTime? effective_till = DbManager.GetNullableDateTime(existingAttributeValues["effective_till"]);
                string remarks = DbManager.GetString(existingAttributeValues["remarks"]);
                //]]

                recorder.cmbListValue.SelectedValue = list_value;
                if (boolean_value)
                {
                    recorder.chkBooleanValue.CheckState = boolean_value ? CheckState.Checked : CheckState.Unchecked;
                }
                else
                {
                    recorder.chkBooleanValue.CheckState = CheckState.Indeterminate;
                }
                recorder.txtDateValue.DisplayTextAsDateTime = date_value;
                recorder.txtIntegerValue.DisplayText = int_value.ToString();
                recorder.txtNumericValue.DisplayText = number_value.ToString();
                recorder.txtEffectiveFrom.DisplayTextAsDateTime = effective_from;
                recorder.txtEffectiveTill.DisplayTextAsDateTime = effective_till;
                recorder.txtRemarks.DisplayText = remarks;
            }
            return recorder;
        }

        private static DataRow GetAttributeDataRowFromCache(short attributeId)
        {
            LoadCache();
            DataRow attributeRow = attributesCache.Select("attribute_id=" + attributeId)[0];
            return attributeRow;
        }
        public static DataTable GetListTypeAttributeVaues(short attributeId)
        {
            LoadCache();
            return new DataView(listTypeAttributeValuesCache, "attribute_id=" + attributeId, "attribute_value_sq", DataViewRowState.CurrentRows).ToTable();
        }
        private static void LoadCache()
        {
            //[[If the cache is not loaded load it
            if (attributesCache == null)
            {
                attributesCache = dbfacade.ObjDBManager.ExecuteSQL("Select * from generic_attributes ").Tables[0];
                listTypeAttributeValuesCache = dbfacade.ObjDBManager.ExecuteSQL("SELECT * FROM generic_attributes_list_values").Tables[0];
            }//]]
        }

        public void MarkAllFieldsReadOnly()
        {
            this.txtDateValue.ReadOnly = true;
            this.txtIntegerValue.ReadOnly = true;
            this.txtNumericValue.ReadOnly = true;
            this.cmbListValue.ReadOnly = true;
            this.chkBooleanValue.Enabled = false;
            this.txtRemarks.ReadOnly = true;
            this.txtStringValue.ReadOnly = true;
            this.txtEffectiveFrom.ReadOnly = true;
            this.txtEffectiveTill.ReadOnly = true;
        }

        public bool IsReadyToSave()
        {
            switch (attributeType)
            {
                case "Boolean":
                    if (string.IsNullOrEmpty(this.chkBooleanValue.BlnString)) return true;
                    if (!this.chkBooleanValue.Checked) return true;
                    break;
                case "Date":
                    if (string.IsNullOrEmpty(this.txtDateValue.DisplayText)) return true;
                    break;
                case "Timestamp":
                    if (string.IsNullOrEmpty(this.txtDateValue.DisplayText)) return true;
                    break;
                case "String":
                    if (string.IsNullOrEmpty(this.txtStringValue.DisplayText)) return true;                    
                    break;
                case "Integer":
                    if (string.IsNullOrEmpty(this.txtIntegerValue.DisplayText)) return true;                    
                    break;
                case "Number":
                    if (string.IsNullOrEmpty(this.txtNumericValue.DisplayText)) return true;
                    break;
                case "List":
                    if (string.IsNullOrEmpty(this.cmbListValue.SelectedValueAsStr)) return true;
                    break;
                default:
                    throw new Exception("Invalid attribute type..How did you come here");
            }
            if (isTemporal)
            {
                if (GetEffectiveFrom() == null)
                {
                    this.txtEffectiveFrom.Focus();
                    UIManager.ShowMessage(MsgCodes.BothValuesAreRequired, "'Effective From' and 'Effective Till'|attribute '" + this.lblAttributeName.Text + "'", MessageTypes.Warning);
                    return false;
                }
                if (GetEffectiveTill() == null)
                {
                    this.txtEffectiveTill.Focus();
                    UIManager.ShowMessage(MsgCodes.BothValuesAreRequired, "'Effective From' and 'Effective Till'|attribute '" + this.lblAttributeName.Text + "'", MessageTypes.Warning);
                    return false;
                }
            }
            return true;
        }
    }
}
