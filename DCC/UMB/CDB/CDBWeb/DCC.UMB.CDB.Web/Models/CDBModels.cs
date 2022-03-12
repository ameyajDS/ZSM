// Generated on : 13 Oct 14 - 11:42:42
//CAUTION: THIS IS AN AUTO GENERATED FILE. DON'T ALTER THE COTENTS.
//USE CDF TOOLS TO REGENERATE THIS FILE IF THERE ARE CHANGES IN THE SCHEMA
using System;
using DCC.UMB.WDF.Models;
using DCC.UMB.WDF.Models.Record;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using DCC.UMB.WDF.Views;
using System.Runtime.Serialization;
namespace CDBModel
{
	public partial class Address_type_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
	[MetadataType(typeof(Address_type_Meta))]
	[DataContract]
	public partial class Address_type : BaseEntity
	{
		public Address_type()
		{
			this.IdPropertyName = "address_type_id";
			this.DisplayPropertyName = "address_type_nm";
			this.CodePropertyName = "address_type_cd";
		}
		public enum flds
		{
			Id, 			Display, 			address_type_id, 			address_type_cd, 			address_type_nm, 			effective_from, 			effective_till		}
		private System.Int32? _address_type_id;
		private System.Int32? _address_type_id_to;
		private System.String _address_type_cd;
		private System.String _address_type_nm;
		private System.DateTime? _effective_from;
		private System.DateTime? _effective_from_to;
		private System.DateTime? _effective_till;
		private System.DateTime? _effective_till_to;


		[DatabaseMap("address_type_id")]
		[DataMember]
		[Display(Name="Address Type ID")]
		public virtual System.Int32? address_type_id
		{		get		{		return this._address_type_id;	}	set	{	this._address_type_id = value;}}
[DataMember]
public virtual System.Int32? address_type_id_to
{get{return this._address_type_id_to;}set{this._address_type_id_to = value;}}
public bool ShouldSerializeaddress_type_id_to() { return false; }


[DatabaseMap("address_type_cd")]
[DataMember(IsRequired = true)]
[MaxLength(1)]
[Display(Name="Address Type Code")]
public virtual System.String address_type_cd
{get{return this._address_type_cd;}set{this._address_type_cd = value;}}


[DatabaseMap("address_type_nm")]
[DataMember(IsRequired = true)]
[MaxLength(20)]
[Display(Name="Address Type Name")]
public virtual System.String address_type_nm
{get{return this._address_type_nm;}set{this._address_type_nm = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("address_type_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_address_type_id); }  }

[TSHint("address_type_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_address_type_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Assistant_service_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Assistant_service_Meta))]
[DataContract]
public partial class Assistant_service : BaseEntity
{
public Assistant_service()
{
this.IdPropertyName = "assistant_service_id";
this.DisplayPropertyName = "assistant_service_nm";
}
public enum flds
{
Id, Display, assistant_service_id, assistant_service_nm, effective_from, effective_till}
private System.Int16? _assistant_service_id;
private System.Int16? _assistant_service_id_to;
private System.String _assistant_service_nm;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("assistant_service_id")]
[DataMember]
[Display(Name="Assistant Service ID")]
public virtual System.Int16? assistant_service_id
{get{return this._assistant_service_id;}set{this._assistant_service_id = value;}}
[DataMember]
public virtual System.Int16? assistant_service_id_to
{get{return this._assistant_service_id_to;}set{this._assistant_service_id_to = value;}}
public bool ShouldSerializeassistant_service_id_to() { return false; }


[DatabaseMap("assistant_service_nm")]
[DataMember(IsRequired = true)]
[MaxLength(15)]
[Display(Name="Assistant Service Name")]
public virtual System.String assistant_service_nm
{get{return this._assistant_service_nm;}set{this._assistant_service_nm = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("assistant_service_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_assistant_service_id); }  }

[TSHint("assistant_service_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_assistant_service_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Camera_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Camera_Meta))]
[DataContract]
public partial class Camera : BaseEntity
{
public Camera()
{
}
public enum flds
{
Id, Display, camera_id, camera_model_nm, picture_quality, flash_mode, zoom_position, transfer_size, rotation_angle, txn_ts, effective_from, effective_till}
private System.Int16? _camera_id;
private System.Int16? _camera_id_to;
private System.String _camera_model_nm;
private System.String _picture_quality;
private System.String _flash_mode;
private System.Int16? _zoom_position;
private System.Int16? _zoom_position_to;
private System.String _transfer_size;
private System.Int16? _rotation_angle;
private System.Int16? _rotation_angle_to;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("camera_id")]
[DataMember]
[Display(Name="Camera ID")]
public virtual System.Int16? camera_id
{get{return this._camera_id;}set{this._camera_id = value;}}
[DataMember]
public virtual System.Int16? camera_id_to
{get{return this._camera_id_to;}set{this._camera_id_to = value;}}
public bool ShouldSerializecamera_id_to() { return false; }


[DatabaseMap("camera_model_nm")]
[DataMember(IsRequired = true)]
[MaxLength(30)]
[Display(Name="Camera Model Name")]
public virtual System.String camera_model_nm
{get{return this._camera_model_nm;}set{this._camera_model_nm = value;}}


[DatabaseMap("picture_quality")]
[DataMember(IsRequired = true)]
[MaxLength(10)]
[Display(Name="Picture Quality")]
public virtual System.String picture_quality
{get{return this._picture_quality;}set{this._picture_quality = value;}}


[DatabaseMap("flash_mode")]
[DataMember(IsRequired = true)]
[MaxLength(5)]
[Display(Name="Flash Mode")]
public virtual System.String flash_mode
{get{return this._flash_mode;}set{this._flash_mode = value;}}


[DatabaseMap("zoom_position")]
[DataMember(IsRequired = true)]
[Display(Name="Zoom Position")]
public virtual System.Int16? zoom_position
{get{return this._zoom_position;}set{this._zoom_position = value;}}
[DataMember]
public virtual System.Int16? zoom_position_to
{get{return this._zoom_position_to;}set{this._zoom_position_to = value;}}
public bool ShouldSerializezoom_position_to() { return false; }


[DatabaseMap("transfer_size")]
[DataMember(IsRequired = true)]
[MaxLength(10)]
[Display(Name="Transfer Size")]
public virtual System.String transfer_size
{get{return this._transfer_size;}set{this._transfer_size = value;}}


[DatabaseMap("rotation_angle")]
[DataMember]
[Display(Name="Rotation Angle")]
public virtual System.Int16? rotation_angle
{get{return this._rotation_angle;}set{this._rotation_angle = value;}}
[DataMember]
public virtual System.Int16? rotation_angle_to
{get{return this._rotation_angle_to;}set{this._rotation_angle_to = value;}}
public bool ShouldSerializerotation_angle_to() { return false; }


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("camera_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_camera_id); }  }

public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Country_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Country_Meta))]
[DataContract]
public partial class Country : BaseEntity
{
public Country()
{
this.IdPropertyName = "country_id";
this.DisplayPropertyName = "country_nm";
this.CodePropertyName = "country_cd";
}
public enum flds
{
Id, Display, country_id, country_cd, country_nm, isd_code, gmt_diff, txn_ts, effective_from, effective_till, is_authentic, level_1_address_component, level_2_address_component, level_3_address_component}
private System.Int16? _country_id;
private System.Int16? _country_id_to;
private System.String _country_cd;
private System.String _country_nm;
private System.String _isd_code;
private System.Decimal? _gmt_diff;
private System.Decimal? _gmt_diff_to;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;
private System.Boolean? _is_authentic;
private System.String _level_1_address_component;
private System.String _level_2_address_component;
private System.String _level_3_address_component;


[DatabaseMap("country_id")]
[DataMember]
[Display(Name="Country ID")]
public virtual System.Int16? country_id
{get{return this._country_id;}set{this._country_id = value;}}
[DataMember]
public virtual System.Int16? country_id_to
{get{return this._country_id_to;}set{this._country_id_to = value;}}
public bool ShouldSerializecountry_id_to() { return false; }


[DatabaseMap("country_cd")]
[DataMember(IsRequired = true)]
[MaxLength(5)]
[Display(Name="Country Code")]
public virtual System.String country_cd
{get{return this._country_cd;}set{this._country_cd = value;}}


[DatabaseMap("country_nm")]
[DataMember(IsRequired = true)]
[MaxLength(55)]
[Display(Name="Country Name")]
public virtual System.String country_nm
{get{return this._country_nm;}set{this._country_nm = value;}}


[DatabaseMap("isd_code")]
[DataMember]
[MaxLength(10)]
[Display(Name="Isd Code")]
public virtual System.String isd_code
{get{return this._isd_code;}set{this._isd_code = value;}}


[DatabaseMap("gmt_diff")]
[DataMember(IsRequired = true)]
[Display(Name="Gmt Diff")]
public virtual System.Decimal? gmt_diff
{get{return this._gmt_diff;}set{this._gmt_diff = value;}}
[DataMember]
public virtual System.Decimal? gmt_diff_to
{get{return this._gmt_diff_to;}set{this._gmt_diff_to = value;}}
public bool ShouldSerializegmt_diff_to() { return false; }


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[DatabaseMap("is_authentic")]
[DataMember(IsRequired = true)]
[Display(Name="Is Authentic")]
public virtual System.Boolean? is_authentic
{get{return this._is_authentic;}set{this._is_authentic = value;}}


[DatabaseMap("level_1_address_component")]
[DataMember]
[MaxLength(40)]
[Display(Name="Level 1 Address Component")]
public virtual System.String level_1_address_component
{get{return this._level_1_address_component;}set{this._level_1_address_component = value;}}


[DatabaseMap("level_2_address_component")]
[DataMember]
[MaxLength(40)]
[Display(Name="Level 2 Address Component")]
public virtual System.String level_2_address_component
{get{return this._level_2_address_component;}set{this._level_2_address_component = value;}}


[DatabaseMap("level_3_address_component")]
[DataMember]
[MaxLength(40)]
[Display(Name="Level 3 Address Component")]
public virtual System.String level_3_address_component
{get{return this._level_3_address_component;}set{this._level_3_address_component = value;}}


[TSHint("country_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_country_id); }  }

[TSHint("country_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_country_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Currency_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Currency_Meta))]
[DataContract]
public partial class Currency : BaseEntity
{
public Currency()
{
this.IdPropertyName = "currency_id";
this.DisplayPropertyName = "currency_nm";
this.CodePropertyName = "currency_cd";
}
public enum flds
{
Id, Display, currency_id, currency_nm, currency_abbr, effective_from, effective_till, currency_cd}
private System.Int16? _currency_id;
private System.Int16? _currency_id_to;
private System.String _currency_nm;
private System.String _currency_abbr;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;
private System.String _currency_cd;


[DatabaseMap("currency_id")]
[DataMember]
[Display(Name="Currency ID")]
public virtual System.Int16? currency_id
{get{return this._currency_id;}set{this._currency_id = value;}}
[DataMember]
public virtual System.Int16? currency_id_to
{get{return this._currency_id_to;}set{this._currency_id_to = value;}}
public bool ShouldSerializecurrency_id_to() { return false; }


[DatabaseMap("currency_nm")]
[DataMember(IsRequired = true)]
[MaxLength(60)]
[Display(Name="Currency Name")]
public virtual System.String currency_nm
{get{return this._currency_nm;}set{this._currency_nm = value;}}


[DatabaseMap("currency_abbr")]
[DataMember(IsRequired = true)]
[MaxLength(4)]
[Display(Name="Currency Abbr")]
public virtual System.String currency_abbr
{get{return this._currency_abbr;}set{this._currency_abbr = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[DatabaseMap("currency_cd")]
[DataMember(IsRequired = true)]
[MaxLength(3)]
[Display(Name="Currency Code")]
public virtual System.String currency_cd
{get{return this._currency_cd;}set{this._currency_cd = value;}}


[TSHint("currency_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_currency_id); }  }

[TSHint("currency_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_currency_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Department_group_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Department_group_Meta))]
[DataContract]
public partial class Department_group : BaseEntity
{
public Department_group()
{
this.IdPropertyName = "department_group_id";
this.DisplayPropertyName = "department_group_nm";
this.CodePropertyName = "department_group_cd";
}
public enum flds
{
Id, Display, department_group_id, department_group_cd, department_group_nm, txn_ts, effective_from, effective_till}
private System.Int16? _department_group_id;
private System.Int16? _department_group_id_to;
private System.String _department_group_cd;
private System.String _department_group_nm;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("department_group_id")]
[DataMember]
[Display(Name="Department Group ID")]
public virtual System.Int16? department_group_id
{get{return this._department_group_id;}set{this._department_group_id = value;}}
[DataMember]
public virtual System.Int16? department_group_id_to
{get{return this._department_group_id_to;}set{this._department_group_id_to = value;}}
public bool ShouldSerializedepartment_group_id_to() { return false; }


[DatabaseMap("department_group_cd")]
[DataMember(IsRequired = true)]
[MaxLength(2)]
[Display(Name="Department Group Code")]
public virtual System.String department_group_cd
{get{return this._department_group_cd;}set{this._department_group_cd = value;}}


[DatabaseMap("department_group_nm")]
[DataMember(IsRequired = true)]
[MaxLength(30)]
[Display(Name="Department Group Name")]
public virtual System.String department_group_nm
{get{return this._department_group_nm;}set{this._department_group_nm = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("department_group_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_department_group_id); }  }

[TSHint("department_group_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_department_group_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Department_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Department_Meta))]
[DataContract]
public partial class Department : BaseEntity
{
public Department()
{
this.IdPropertyName = "department_id";
this.DisplayPropertyName = "department_nm";
this.CodePropertyName = "department_cd";
}
public enum flds
{
Id, Display, department_id, department_cd, department_nm, department_group_id_lookup, fax_line_lookup, txn_ts, effective_from, effective_till, is_section, is_department}
private System.Int16? _department_id;
private System.Int16? _department_id_to;
private System.String _department_cd;
private System.String _department_nm;
private LookupRecord _department_group_id_lookup;
private LookupRecord _fax_line_lookup;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;
private System.String _is_section;
private System.String _is_department;


[DatabaseMap("department_id")]
[DataMember]
[Display(Name="Department ID")]
public virtual System.Int16? department_id
{get{return this._department_id;}set{this._department_id = value;}}
[DataMember]
public virtual System.Int16? department_id_to
{get{return this._department_id_to;}set{this._department_id_to = value;}}
public bool ShouldSerializedepartment_id_to() { return false; }


[DatabaseMap("department_cd")]
[DataMember(IsRequired = true)]
[MaxLength(5)]
[Display(Name="Department Code")]
public virtual System.String department_cd
{get{return this._department_cd;}set{this._department_cd = value;}}


[DatabaseMap("department_nm")]
[DataMember(IsRequired = true)]
[MaxLength(35)]
[Display(Name="Department Name")]
public virtual System.String department_nm
{get{return this._department_nm;}set{this._department_nm = value;}}


[DatabaseMap("department_group_id")]
[DataMember]
[WDFLookup(alias:"CDB_DEPARTMENT_GROUPS_DEPARTMENT_GROUP_ID", required:true)]
[Display(Name="Department Group")]
public virtual LookupRecord department_group_id_lookup
{get{return this._department_group_id_lookup;}set{this._department_group_id_lookup = value;}}


[DatabaseMap("fax_line")]
[DataMember]
[WDFLookup(alias:"CDB_P_AND_T_LINES_FAX_LINE", required:false)]
[Display(Name="Fax Line")]
public virtual LookupRecord fax_line_lookup
{get{return this._fax_line_lookup;}set{this._fax_line_lookup = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[DatabaseMap("is_section")]
[DataMember(IsRequired = true)]
[MaxLength(3)]
[Display(Name="Is Section")]
public virtual System.String is_section
{get{return this._is_section;}set{this._is_section = value;}}


[DatabaseMap("is_department")]
[DataMember(IsRequired = true)]
[MaxLength(3)]
[Display(Name="Is Department")]
public virtual System.String is_department
{get{return this._is_department;}set{this._is_department = value;}}


[TSHint("department_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_department_id); }  }

[TSHint("department_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_department_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Designation_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Designation_Meta))]
[DataContract]
public partial class Designation : BaseEntity
{
public Designation()
{
this.IdPropertyName = "designation_id";
this.DisplayPropertyName = "designation_nm";
this.CodePropertyName = "designation_cd";
}
public enum flds
{
Id, Display, designation_id, designation_cd, designation_nm, designation_sq, minimum_age, maximum_starting_age, retirement_age, txn_ts, effective_from, effective_till}
private System.Int16? _designation_id;
private System.Int16? _designation_id_to;
private System.String _designation_cd;
private System.String _designation_nm;
private System.Int16? _designation_sq;
private System.Int16? _designation_sq_to;
private System.Byte? _minimum_age;
private System.Byte? _minimum_age_to;
private System.Byte? _maximum_starting_age;
private System.Byte? _maximum_starting_age_to;
private System.Byte? _retirement_age;
private System.Byte? _retirement_age_to;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("designation_id")]
[DataMember]
[Display(Name="Designation ID")]
public virtual System.Int16? designation_id
{get{return this._designation_id;}set{this._designation_id = value;}}
[DataMember]
public virtual System.Int16? designation_id_to
{get{return this._designation_id_to;}set{this._designation_id_to = value;}}
public bool ShouldSerializedesignation_id_to() { return false; }


[DatabaseMap("designation_cd")]
[DataMember(IsRequired = true)]
[MaxLength(5)]
[Display(Name="Designation Code")]
public virtual System.String designation_cd
{get{return this._designation_cd;}set{this._designation_cd = value;}}


[DatabaseMap("designation_nm")]
[DataMember(IsRequired = true)]
[MaxLength(35)]
[Display(Name="Designation Name")]
public virtual System.String designation_nm
{get{return this._designation_nm;}set{this._designation_nm = value;}}


[DatabaseMap("designation_sq")]
[DataMember]
[Display(Name="Designation Seq.")]
public virtual System.Int16? designation_sq
{get{return this._designation_sq;}set{this._designation_sq = value;}}
[DataMember]
public virtual System.Int16? designation_sq_to
{get{return this._designation_sq_to;}set{this._designation_sq_to = value;}}
public bool ShouldSerializedesignation_sq_to() { return false; }


[DatabaseMap("minimum_age")]
[DataMember]
[Display(Name="Minimum Age")]
public virtual System.Byte? minimum_age
{get{return this._minimum_age;}set{this._minimum_age = value;}}
[DataMember]
public virtual System.Byte? minimum_age_to
{get{return this._minimum_age_to;}set{this._minimum_age_to = value;}}
public bool ShouldSerializeminimum_age_to() { return false; }


[DatabaseMap("maximum_starting_age")]
[DataMember]
[Display(Name="Maximum Starting Age")]
public virtual System.Byte? maximum_starting_age
{get{return this._maximum_starting_age;}set{this._maximum_starting_age = value;}}
[DataMember]
public virtual System.Byte? maximum_starting_age_to
{get{return this._maximum_starting_age_to;}set{this._maximum_starting_age_to = value;}}
public bool ShouldSerializemaximum_starting_age_to() { return false; }


[DatabaseMap("retirement_age")]
[DataMember]
[Display(Name="Retirement Age")]
public virtual System.Byte? retirement_age
{get{return this._retirement_age;}set{this._retirement_age = value;}}
[DataMember]
public virtual System.Byte? retirement_age_to
{get{return this._retirement_age_to;}set{this._retirement_age_to = value;}}
public bool ShouldSerializeretirement_age_to() { return false; }


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("designation_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_designation_id); }  }

[TSHint("designation_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_designation_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Districts_or_city_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Districts_or_city_Meta))]
[DataContract]
public partial class Districts_or_city : BaseEntity
{
public Districts_or_city()
{
}
public enum flds
{
Id, Display, district_or_city_id, district_cd, district_nm, state_id_lookup, txn_ts, effective_from, effective_till}
private System.Int32? _district_or_city_id;
private System.Int32? _district_or_city_id_to;
private System.String _district_cd;
private System.String _district_nm;
private LookupRecord _state_id_lookup;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("district_or_city_id")]
[DataMember]
[Display(Name="District Or City ID")]
public virtual System.Int32? district_or_city_id
{get{return this._district_or_city_id;}set{this._district_or_city_id = value;}}
[DataMember]
public virtual System.Int32? district_or_city_id_to
{get{return this._district_or_city_id_to;}set{this._district_or_city_id_to = value;}}
public bool ShouldSerializedistrict_or_city_id_to() { return false; }


[DatabaseMap("district_cd")]
[DataMember(IsRequired = true)]
[MaxLength(5)]
[Display(Name="District Code")]
public virtual System.String district_cd
{get{return this._district_cd;}set{this._district_cd = value;}}


[DatabaseMap("district_nm")]
[DataMember(IsRequired = true)]
[MaxLength(55)]
[Display(Name="District Name")]
public virtual System.String district_nm
{get{return this._district_nm;}set{this._district_nm = value;}}


[DatabaseMap("state_id")]
[DataMember]
[WDFLookup(alias:"CDB_STATES_STATE_ID", required:true)]
[Display(Name="State")]
public virtual LookupRecord state_id_lookup
{get{return this._state_id_lookup;}set{this._state_id_lookup = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("district_or_city_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_district_or_city_id); }  }

public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Document_type_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Document_type_Meta))]
[DataContract]
public partial class Document_type : BaseEntity
{
public Document_type()
{
this.IdPropertyName = "document_type_id";
this.DisplayPropertyName = "document_type_nm";
}
public enum flds
{
Id, Display, document_type_id, document_type_nm, effective_from, effective_till}
private System.Byte? _document_type_id;
private System.Byte? _document_type_id_to;
private System.String _document_type_nm;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("document_type_id")]
[DataMember]
[Display(Name="Document Type ID")]
public virtual System.Byte? document_type_id
{get{return this._document_type_id;}set{this._document_type_id = value;}}
[DataMember]
public virtual System.Byte? document_type_id_to
{get{return this._document_type_id_to;}set{this._document_type_id_to = value;}}
public bool ShouldSerializedocument_type_id_to() { return false; }


[DatabaseMap("document_type_nm")]
[DataMember(IsRequired = true)]
[MaxLength(15)]
[Display(Name="Document Type Name")]
public virtual System.String document_type_nm
{get{return this._document_type_nm;}set{this._document_type_nm = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("document_type_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_document_type_id); }  }

[TSHint("document_type_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_document_type_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Epabx_line_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Epabx_line_Meta))]
[DataContract]
public partial class Epabx_line : BaseEntity
{
public Epabx_line()
{
}
public enum flds
{
Id, Display, extension_no, txn_ts, effective_from, effective_till}
private System.String _extension_no;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("extension_no")]
[DataMember]
[MaxLength(5)]
[Display(Name="Extension No.")]
public virtual System.String extension_no
{get{return this._extension_no;}set{this._extension_no = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("extension_no")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_extension_no); }  }

public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Hospital_unit_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Hospital_unit_Meta))]
[DataContract]
public partial class Hospital_unit : BaseEntity
{
public Hospital_unit()
{
this.IdPropertyName = "hospital_unit_id";
this.DisplayPropertyName = "hospital_unit_nm";
}
public enum flds
{
Id, Display, hospital_unit_id, hospital_unit_nm, effective_from, effective_till}
private System.Int16? _hospital_unit_id;
private System.Int16? _hospital_unit_id_to;
private System.String _hospital_unit_nm;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("hospital_unit_id")]
[DataMember]
[Display(Name="Hospital Unit ID")]
public virtual System.Int16? hospital_unit_id
{get{return this._hospital_unit_id;}set{this._hospital_unit_id = value;}}
[DataMember]
public virtual System.Int16? hospital_unit_id_to
{get{return this._hospital_unit_id_to;}set{this._hospital_unit_id_to = value;}}
public bool ShouldSerializehospital_unit_id_to() { return false; }


[DatabaseMap("hospital_unit_nm")]
[DataMember(IsRequired = true)]
[MaxLength(25)]
[Display(Name="Hospital Unit Name")]
public virtual System.String hospital_unit_nm
{get{return this._hospital_unit_nm;}set{this._hospital_unit_nm = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("hospital_unit_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_hospital_unit_id); }  }

[TSHint("hospital_unit_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_hospital_unit_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Initiation_place_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Initiation_place_Meta))]
[DataContract]
public partial class Initiation_place : BaseEntity
{
public Initiation_place()
{
}
public enum flds
{
Id, Display, place_id, place_nm, txn_ts, effective_from, effective_till}
private System.Int16? _place_id;
private System.Int16? _place_id_to;
private System.String _place_nm;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("place_id")]
[DataMember]
[Display(Name="Place ID")]
public virtual System.Int16? place_id
{get{return this._place_id;}set{this._place_id = value;}}
[DataMember]
public virtual System.Int16? place_id_to
{get{return this._place_id_to;}set{this._place_id_to = value;}}
public bool ShouldSerializeplace_id_to() { return false; }


[DatabaseMap("place_nm")]
[DataMember(IsRequired = true)]
[MaxLength(35)]
[Display(Name="Place Name")]
public virtual System.String place_nm
{get{return this._place_nm;}set{this._place_nm = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("place_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_place_id); }  }

public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Language_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Language_Meta))]
[DataContract]
public partial class Language : BaseEntity
{
public Language()
{
this.IdPropertyName = "Language_Id";
this.DisplayPropertyName = "Language_Nm";
this.CodePropertyName = "Language_Cd";
}
public enum flds
{
Id, Display, Language_Id, Language_Cd, Language_Nm, Txn_Ts, Effective_from, Effective_till}
private System.Int32? _Language_Id;
private System.Int32? _Language_Id_to;
private System.String _Language_Cd;
private System.String _Language_Nm;
private System.Byte[] _Txn_Ts;
private System.DateTime? _Effective_from;
private System.DateTime? _Effective_from_to;
private System.DateTime? _Effective_till;
private System.DateTime? _Effective_till_to;


[DatabaseMap("Language_Id")]
[DataMember]
[Display(Name="Language ID")]
public virtual System.Int32? Language_Id
{get{return this._Language_Id;}set{this._Language_Id = value;}}
[DataMember]
public virtual System.Int32? Language_Id_to
{get{return this._Language_Id_to;}set{this._Language_Id_to = value;}}
public bool ShouldSerializeLanguage_Id_to() { return false; }


[DatabaseMap("Language_Cd")]
[DataMember(IsRequired = true)]
[MaxLength(2)]
[Display(Name="Language Code")]
public virtual System.String Language_Cd
{get{return this._Language_Cd;}set{this._Language_Cd = value;}}


[DatabaseMap("Language_Nm")]
[DataMember(IsRequired = true)]
[MaxLength(35)]
[Display(Name="Language Name")]
public virtual System.String Language_Nm
{get{return this._Language_Nm;}set{this._Language_Nm = value;}}


[DatabaseMap("Txn_Ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] Txn_Ts
{get{return this._Txn_Ts;}set{this._Txn_Ts = value;}}


[DatabaseMap("Effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? Effective_from
{get{return this._Effective_from;}set{this._Effective_from = value;}}
[DataMember]
public virtual System.DateTime? Effective_from_to
{get{return this._Effective_from_to;}set{this._Effective_from_to = value;}}
public bool ShouldSerializeEffective_from_to() { return false; }


[DatabaseMap("Effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? Effective_till
{get{return this._Effective_till;}set{this._Effective_till = value;}}
[DataMember]
public virtual System.DateTime? Effective_till_to
{get{return this._Effective_till_to;}set{this._Effective_till_to = value;}}
public bool ShouldSerializeEffective_till_to() { return false; }


[TSHint("Language_Id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_Language_Id); }  }

[TSHint("Language_Nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_Language_Nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._Effective_from && DateTime.Now<=this._Effective_till;}}
}
public partial class Level_1_address_component_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Level_1_address_component_Meta))]
[DataContract]
public partial class Level_1_address_component : BaseEntity
{
public Level_1_address_component()
{
this.IdPropertyName = "level_1_address_component_id";
this.DisplayPropertyName = "level_1_address_component_nm";
this.CodePropertyName = "level_1_address_component_cd";
}
public enum flds
{
Id, Display, level_1_address_component_id, level_1_address_component_cd, level_1_address_component_nm, country_id_lookup, is_authentic, txn_ts, effective_from, effective_till, state_id}
private System.Int32? _level_1_address_component_id;
private System.Int32? _level_1_address_component_id_to;
private System.String _level_1_address_component_cd;
private System.String _level_1_address_component_nm;
private LookupRecord _country_id_lookup;
private System.Boolean? _is_authentic;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;
private System.Int32? _state_id;
private System.Int32? _state_id_to;


[DatabaseMap("level_1_address_component_id")]
[DataMember]
[Display(Name="Level 1 Address Component ID")]
public virtual System.Int32? level_1_address_component_id
{get{return this._level_1_address_component_id;}set{this._level_1_address_component_id = value;}}
[DataMember]
public virtual System.Int32? level_1_address_component_id_to
{get{return this._level_1_address_component_id_to;}set{this._level_1_address_component_id_to = value;}}
public bool ShouldSerializelevel_1_address_component_id_to() { return false; }


[DatabaseMap("level_1_address_component_cd")]
[DataMember(IsRequired = true)]
[MaxLength(10)]
[Display(Name="Level 1 Address Component Code")]
public virtual System.String level_1_address_component_cd
{get{return this._level_1_address_component_cd;}set{this._level_1_address_component_cd = value;}}


[DatabaseMap("level_1_address_component_nm")]
[DataMember(IsRequired = true)]
[MaxLength(40)]
[Display(Name="Level 1 Address Component Name")]
public virtual System.String level_1_address_component_nm
{get{return this._level_1_address_component_nm;}set{this._level_1_address_component_nm = value;}}


[DatabaseMap("country_id")]
[DataMember]
[WDFLookup(alias:"CDB_COUNTRIES_COUNTRY_ID", required:true)]
[Display(Name="Country")]
public virtual LookupRecord country_id_lookup
{get{return this._country_id_lookup;}set{this._country_id_lookup = value;}}


[DatabaseMap("is_authentic")]
[DataMember(IsRequired = true)]
[Display(Name="Is Authentic")]
public virtual System.Boolean? is_authentic
{get{return this._is_authentic;}set{this._is_authentic = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[DatabaseMap("state_id")]
[DataMember]
[Display(Name="State ID")]
public virtual System.Int32? state_id
{get{return this._state_id;}set{this._state_id = value;}}
[DataMember]
public virtual System.Int32? state_id_to
{get{return this._state_id_to;}set{this._state_id_to = value;}}
public bool ShouldSerializestate_id_to() { return false; }


[TSHint("level_1_address_component_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_level_1_address_component_id); }  }

[TSHint("level_1_address_component_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_level_1_address_component_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Level_2_address_component_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Level_2_address_component_Meta))]
[DataContract]
public partial class Level_2_address_component : BaseEntity
{
public Level_2_address_component()
{
this.IdPropertyName = "level_2_address_component_id";
this.DisplayPropertyName = "level_2_address_component_nm";
this.CodePropertyName = "level_2_address_component_cd";
}
public enum flds
{
Id, Display, level_2_address_component_id, level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id_lookup, is_authentic, txn_ts, effective_from, effective_till, district_id}
private System.Int32? _level_2_address_component_id;
private System.Int32? _level_2_address_component_id_to;
private System.String _level_2_address_component_cd;
private System.String _level_2_address_component_nm;
private LookupRecord _level_1_address_component_id_lookup;
private System.Boolean? _is_authentic;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;
private System.Int32? _district_id;
private System.Int32? _district_id_to;


[DatabaseMap("level_2_address_component_id")]
[DataMember]
[Display(Name="Level 2 Address Component ID")]
public virtual System.Int32? level_2_address_component_id
{get{return this._level_2_address_component_id;}set{this._level_2_address_component_id = value;}}
[DataMember]
public virtual System.Int32? level_2_address_component_id_to
{get{return this._level_2_address_component_id_to;}set{this._level_2_address_component_id_to = value;}}
public bool ShouldSerializelevel_2_address_component_id_to() { return false; }


[DatabaseMap("level_2_address_component_cd")]
[DataMember(IsRequired = true)]
[MaxLength(10)]
[Display(Name="Level 2 Address Component Code")]
public virtual System.String level_2_address_component_cd
{get{return this._level_2_address_component_cd;}set{this._level_2_address_component_cd = value;}}


[DatabaseMap("level_2_address_component_nm")]
[DataMember(IsRequired = true)]
[MaxLength(40)]
[Display(Name="Level 2 Address Component Name")]
public virtual System.String level_2_address_component_nm
{get{return this._level_2_address_component_nm;}set{this._level_2_address_component_nm = value;}}


[DatabaseMap("level_1_address_component_id")]
[DataMember]
[WDFLookup(alias:"CDB_LEVEL_1_ADDRESS_COMPONENTS_LEVEL_1_ADDRESS_COMPONENT_ID", required:true)]
[Display(Name="Level 1 Address Component")]
public virtual LookupRecord level_1_address_component_id_lookup
{get{return this._level_1_address_component_id_lookup;}set{this._level_1_address_component_id_lookup = value;}}


[DatabaseMap("is_authentic")]
[DataMember(IsRequired = true)]
[Display(Name="Is Authentic")]
public virtual System.Boolean? is_authentic
{get{return this._is_authentic;}set{this._is_authentic = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[DatabaseMap("district_id")]
[DataMember]
[Display(Name="District ID")]
public virtual System.Int32? district_id
{get{return this._district_id;}set{this._district_id = value;}}
[DataMember]
public virtual System.Int32? district_id_to
{get{return this._district_id_to;}set{this._district_id_to = value;}}
public bool ShouldSerializedistrict_id_to() { return false; }


[TSHint("level_2_address_component_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_level_2_address_component_id); }  }

[TSHint("level_2_address_component_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_level_2_address_component_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Level_3_address_component_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Level_3_address_component_Meta))]
[DataContract]
public partial class Level_3_address_component : BaseEntity
{
public Level_3_address_component()
{
this.IdPropertyName = "level_3_address_component_id";
this.DisplayPropertyName = "level_3_address_component_nm";
this.CodePropertyName = "level_3_address_component_cd";
}
public enum flds
{
Id, Display, level_3_address_component_id, level_3_address_component_cd, level_3_address_component_nm, level_2_address_component_id_lookup, is_authentic, txn_ts, effective_from, effective_till, post_office_id}
private System.Int32? _level_3_address_component_id;
private System.Int32? _level_3_address_component_id_to;
private System.String _level_3_address_component_cd;
private System.String _level_3_address_component_nm;
private LookupRecord _level_2_address_component_id_lookup;
private System.Boolean? _is_authentic;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;
private System.Int32? _post_office_id;
private System.Int32? _post_office_id_to;


[DatabaseMap("level_3_address_component_id")]
[DataMember]
[Display(Name="Level 3 Address Component ID")]
public virtual System.Int32? level_3_address_component_id
{get{return this._level_3_address_component_id;}set{this._level_3_address_component_id = value;}}
[DataMember]
public virtual System.Int32? level_3_address_component_id_to
{get{return this._level_3_address_component_id_to;}set{this._level_3_address_component_id_to = value;}}
public bool ShouldSerializelevel_3_address_component_id_to() { return false; }


[DatabaseMap("level_3_address_component_cd")]
[DataMember(IsRequired = true)]
[MaxLength(10)]
[Display(Name="Level 3 Address Component Code")]
public virtual System.String level_3_address_component_cd
{get{return this._level_3_address_component_cd;}set{this._level_3_address_component_cd = value;}}


[DatabaseMap("level_3_address_component_nm")]
[DataMember(IsRequired = true)]
[MaxLength(60)]
[Display(Name="Level 3 Address Component Name")]
public virtual System.String level_3_address_component_nm
{get{return this._level_3_address_component_nm;}set{this._level_3_address_component_nm = value;}}


[DatabaseMap("level_2_address_component_id")]
[DataMember]
[WDFLookup(alias:"CDB_LEVEL_2_ADDRESS_COMPONENTS_LEVEL_2_ADDRESS_COMPONENT_ID", required:true)]
[Display(Name="Level 2 Address Component")]
public virtual LookupRecord level_2_address_component_id_lookup
{get{return this._level_2_address_component_id_lookup;}set{this._level_2_address_component_id_lookup = value;}}


[DatabaseMap("is_authentic")]
[DataMember(IsRequired = true)]
[Display(Name="Is Authentic")]
public virtual System.Boolean? is_authentic
{get{return this._is_authentic;}set{this._is_authentic = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[DatabaseMap("post_office_id")]
[DataMember]
[Display(Name="Post Office ID")]
public virtual System.Int32? post_office_id
{get{return this._post_office_id;}set{this._post_office_id = value;}}
[DataMember]
public virtual System.Int32? post_office_id_to
{get{return this._post_office_id_to;}set{this._post_office_id_to = value;}}
public bool ShouldSerializepost_office_id_to() { return false; }


[TSHint("level_3_address_component_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_level_3_address_component_id); }  }

[TSHint("level_3_address_component_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_level_3_address_component_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Marital_status_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Marital_status_Meta))]
[DataContract]
public partial class Marital_status : BaseEntity
{
public Marital_status()
{
}
public enum flds
{
Id, Display, marital_status, effective_from, effective_till}
private System.String _marital_status;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("marital_status")]
[DataMember]
[MaxLength(10)]
[Display(Name="Marital Status")]
public virtual System.String marital_status
{get{return this._marital_status;}set{this._marital_status = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("marital_status")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_marital_status); }  }

public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Md_entity_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Md_entity_Meta))]
[DataContract]
public partial class Md_entity : BaseEntity
{
public Md_entity()
{
}
public enum flds
{
Id, Display, entity_id, entity_nm, entity_db, entity_tbl, entity_id_column, entity_nm_column, effective_from_dt_column, effective_till_dt_column, active_column, active_value, inactive_value, additional_info_column, additional_info_label}
private System.Int32? _entity_id;
private System.Int32? _entity_id_to;
private System.String _entity_nm;
private System.String _entity_db;
private System.String _entity_tbl;
private System.String _entity_id_column;
private System.String _entity_nm_column;
private System.String _effective_from_dt_column;
private System.String _effective_till_dt_column;
private System.String _active_column;
private System.String _active_value;
private System.String _inactive_value;
private System.String _additional_info_column;
private System.String _additional_info_label;


[DatabaseMap("entity_id")]
[DataMember]
[Display(Name="Entity ID")]
public virtual System.Int32? entity_id
{get{return this._entity_id;}set{this._entity_id = value;}}
[DataMember]
public virtual System.Int32? entity_id_to
{get{return this._entity_id_to;}set{this._entity_id_to = value;}}
public bool ShouldSerializeentity_id_to() { return false; }


[DatabaseMap("entity_nm")]
[DataMember(IsRequired = true)]
[MaxLength(30)]
[Display(Name="Entity Name")]
public virtual System.String entity_nm
{get{return this._entity_nm;}set{this._entity_nm = value;}}


[DatabaseMap("entity_db")]
[DataMember(IsRequired = true)]
[MaxLength(15)]
[Display(Name="Entity Db")]
public virtual System.String entity_db
{get{return this._entity_db;}set{this._entity_db = value;}}


[DatabaseMap("entity_tbl")]
[DataMember(IsRequired = true)]
[MaxLength(50)]
[Display(Name="Entity Tbl")]
public virtual System.String entity_tbl
{get{return this._entity_tbl;}set{this._entity_tbl = value;}}


[DatabaseMap("entity_id_column")]
[DataMember(IsRequired = true)]
[MaxLength(50)]
[Display(Name="Entity ID Column")]
public virtual System.String entity_id_column
{get{return this._entity_id_column;}set{this._entity_id_column = value;}}


[DatabaseMap("entity_nm_column")]
[DataMember(IsRequired = true)]
[MaxLength(50)]
[Display(Name="Entity Name Column")]
public virtual System.String entity_nm_column
{get{return this._entity_nm_column;}set{this._entity_nm_column = value;}}


[DatabaseMap("effective_from_dt_column")]
[DataMember]
[MaxLength(50)]
[Display(Name="Effective From Date Column")]
public virtual System.String effective_from_dt_column
{get{return this._effective_from_dt_column;}set{this._effective_from_dt_column = value;}}


[DatabaseMap("effective_till_dt_column")]
[DataMember]
[MaxLength(50)]
[Display(Name="Effective Till Date Column")]
public virtual System.String effective_till_dt_column
{get{return this._effective_till_dt_column;}set{this._effective_till_dt_column = value;}}


[DatabaseMap("active_column")]
[DataMember]
[MaxLength(50)]
[Display(Name="Active Column")]
public virtual System.String active_column
{get{return this._active_column;}set{this._active_column = value;}}


[DatabaseMap("active_value")]
[DataMember]
[MaxLength(15)]
[Display(Name="Active Value")]
public virtual System.String active_value
{get{return this._active_value;}set{this._active_value = value;}}


[DatabaseMap("inactive_value")]
[DataMember]
[MaxLength(15)]
[Display(Name="Inactive Value")]
public virtual System.String inactive_value
{get{return this._inactive_value;}set{this._inactive_value = value;}}


[DatabaseMap("additional_info_column")]
[DataMember]
[MaxLength(50)]
[Display(Name="Additional Info Column")]
public virtual System.String additional_info_column
{get{return this._additional_info_column;}set{this._additional_info_column = value;}}


[DatabaseMap("additional_info_label")]
[DataMember]
[MaxLength(30)]
[Display(Name="Additional Info Label")]
public virtual System.String additional_info_label
{get{return this._additional_info_label;}set{this._additional_info_label = value;}}


[TSHint("entity_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_entity_id); }  }

}
public partial class Md_entities_operations_instances_log_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Md_entities_operations_instances_log_Meta))]
[DataContract]
public partial class Md_entities_operations_instances_log 
{
public enum flds
{
entity_operation_id_lookup, entity_reference_id_lookup, pk_column_1_value, pk_column_2_value, pk_column_3_value, pk_column_4_value, pk_column_5_value, pk_column_6_value, pk_column_7_value, pk_column_8_value, pk_column_9_value}
private LookupRecord _entity_operation_id_lookup;
private LookupRecord _entity_reference_id_lookup;
private System.String _pk_column_1_value;
private System.String _pk_column_2_value;
private System.String _pk_column_3_value;
private System.String _pk_column_4_value;
private System.String _pk_column_5_value;
private System.String _pk_column_6_value;
private System.String _pk_column_7_value;
private System.String _pk_column_8_value;
private System.String _pk_column_9_value;


[DatabaseMap("entity_operation_id")]
[DataMember]
[WDFLookup(alias:"CDB_MD_ENTITIES_OPERATIONS_LOG_ENTITY_OPERATION_ID", required:true)]
[Display(Name="Entity Operation")]
public virtual LookupRecord entity_operation_id_lookup
{get{return this._entity_operation_id_lookup;}set{this._entity_operation_id_lookup = value;}}


[DatabaseMap("entity_reference_id")]
[DataMember]
[WDFLookup(alias:"CDB_MD_ENTITIES_REFERENCES_ENTITY_REFERENCE_ID", required:true)]
[Display(Name="Entity Reference")]
public virtual LookupRecord entity_reference_id_lookup
{get{return this._entity_reference_id_lookup;}set{this._entity_reference_id_lookup = value;}}


[DatabaseMap("pk_column_1_value")]
[DataMember(IsRequired = true)]
[MaxLength(15)]
[Display(Name="Pk Column 1 Value")]
public virtual System.String pk_column_1_value
{get{return this._pk_column_1_value;}set{this._pk_column_1_value = value;}}


[DatabaseMap("pk_column_2_value")]
[DataMember]
[MaxLength(15)]
[Display(Name="Pk Column 2 Value")]
public virtual System.String pk_column_2_value
{get{return this._pk_column_2_value;}set{this._pk_column_2_value = value;}}


[DatabaseMap("pk_column_3_value")]
[DataMember]
[MaxLength(15)]
[Display(Name="Pk Column 3 Value")]
public virtual System.String pk_column_3_value
{get{return this._pk_column_3_value;}set{this._pk_column_3_value = value;}}


[DatabaseMap("pk_column_4_value")]
[DataMember]
[MaxLength(15)]
[Display(Name="Pk Column 4 Value")]
public virtual System.String pk_column_4_value
{get{return this._pk_column_4_value;}set{this._pk_column_4_value = value;}}


[DatabaseMap("pk_column_5_value")]
[DataMember]
[MaxLength(15)]
[Display(Name="Pk Column 5 Value")]
public virtual System.String pk_column_5_value
{get{return this._pk_column_5_value;}set{this._pk_column_5_value = value;}}


[DatabaseMap("pk_column_6_value")]
[DataMember]
[MaxLength(15)]
[Display(Name="Pk Column 6 Value")]
public virtual System.String pk_column_6_value
{get{return this._pk_column_6_value;}set{this._pk_column_6_value = value;}}


[DatabaseMap("pk_column_7_value")]
[DataMember]
[MaxLength(15)]
[Display(Name="Pk Column 7 Value")]
public virtual System.String pk_column_7_value
{get{return this._pk_column_7_value;}set{this._pk_column_7_value = value;}}


[DatabaseMap("pk_column_8_value")]
[DataMember]
[MaxLength(15)]
[Display(Name="Pk Column 8 Value")]
public virtual System.String pk_column_8_value
{get{return this._pk_column_8_value;}set{this._pk_column_8_value = value;}}


[DatabaseMap("pk_column_9_value")]
[DataMember]
[MaxLength(15)]
[Display(Name="Pk Column 9 Value")]
public virtual System.String pk_column_9_value
{get{return this._pk_column_9_value;}set{this._pk_column_9_value = value;}}



}
public partial class Md_entities_operations_log_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Md_entities_operations_log_Meta))]
[DataContract]
public partial class Md_entities_operations_log : BaseEntity
{
public Md_entities_operations_log()
{
}
public enum flds
{
Id, Display, entity_operation_id, entity_id_lookup, user_no, user_role_id, operation, operation_start_dtm, operation_finish_dtm, old_value, new_value, occurrences_replaced, references_affected}
private System.Int32? _entity_operation_id;
private System.Int32? _entity_operation_id_to;
private LookupRecord _entity_id_lookup;
private System.Int32? _user_no;
private System.Int32? _user_no_to;
private System.String _user_role_id;
private System.String _operation;
private System.DateTime? _operation_start_dtm;
private System.DateTime? _operation_start_dtm_to;
private System.DateTime? _operation_finish_dtm;
private System.DateTime? _operation_finish_dtm_to;
private System.String _old_value;
private System.String _new_value;
private System.Int32? _occurrences_replaced;
private System.Int32? _occurrences_replaced_to;
private System.String _references_affected;


[DatabaseMap("entity_operation_id")]
[DataMember]
[Display(Name="Entity Operation ID")]
public virtual System.Int32? entity_operation_id
{get{return this._entity_operation_id;}set{this._entity_operation_id = value;}}
[DataMember]
public virtual System.Int32? entity_operation_id_to
{get{return this._entity_operation_id_to;}set{this._entity_operation_id_to = value;}}
public bool ShouldSerializeentity_operation_id_to() { return false; }


[DatabaseMap("entity_id")]
[DataMember]
[WDFLookup(alias:"CDB_MD_ENTITIES_ENTITY_ID", required:true)]
[Display(Name="Entity")]
public virtual LookupRecord entity_id_lookup
{get{return this._entity_id_lookup;}set{this._entity_id_lookup = value;}}


[DatabaseMap("user_no")]
[DataMember(IsRequired = true)]
[Display(Name="User No.")]
public virtual System.Int32? user_no
{get{return this._user_no;}set{this._user_no = value;}}
[DataMember]
public virtual System.Int32? user_no_to
{get{return this._user_no_to;}set{this._user_no_to = value;}}
public bool ShouldSerializeuser_no_to() { return false; }


[DatabaseMap("user_role_id")]
[DataMember(IsRequired = true)]
[MaxLength(10)]
[Display(Name="User Role ID")]
public virtual System.String user_role_id
{get{return this._user_role_id;}set{this._user_role_id = value;}}


[DatabaseMap("operation")]
[DataMember(IsRequired = true)]
[MaxLength(10)]
[Display(Name="Operation")]
public virtual System.String operation
{get{return this._operation;}set{this._operation = value;}}


[DatabaseMap("operation_start_dtm")]
[DataMember(IsRequired = true)]
[Display(Name="Operation Start Date")]
public virtual System.DateTime? operation_start_dtm
{get{return this._operation_start_dtm;}set{this._operation_start_dtm = value;}}
[DataMember]
public virtual System.DateTime? operation_start_dtm_to
{get{return this._operation_start_dtm_to;}set{this._operation_start_dtm_to = value;}}
public bool ShouldSerializeoperation_start_dtm_to() { return false; }


[DatabaseMap("operation_finish_dtm")]
[DataMember]
[Display(Name="Operation Finish Date")]
public virtual System.DateTime? operation_finish_dtm
{get{return this._operation_finish_dtm;}set{this._operation_finish_dtm = value;}}
[DataMember]
public virtual System.DateTime? operation_finish_dtm_to
{get{return this._operation_finish_dtm_to;}set{this._operation_finish_dtm_to = value;}}
public bool ShouldSerializeoperation_finish_dtm_to() { return false; }


[DatabaseMap("old_value")]
[DataMember(IsRequired = true)]
[MaxLength(15)]
[Display(Name="Old Value")]
public virtual System.String old_value
{get{return this._old_value;}set{this._old_value = value;}}


[DatabaseMap("new_value")]
[DataMember(IsRequired = true)]
[MaxLength(15)]
[Display(Name="New Value")]
public virtual System.String new_value
{get{return this._new_value;}set{this._new_value = value;}}


[DatabaseMap("occurrences_replaced")]
[DataMember]
[Display(Name="Occurrences Replaced")]
public virtual System.Int32? occurrences_replaced
{get{return this._occurrences_replaced;}set{this._occurrences_replaced = value;}}
[DataMember]
public virtual System.Int32? occurrences_replaced_to
{get{return this._occurrences_replaced_to;}set{this._occurrences_replaced_to = value;}}
public bool ShouldSerializeoccurrences_replaced_to() { return false; }


[DatabaseMap("references_affected")]
[DataMember]
[MaxLength(6000)]
[Display(Name="References Affected")]
public virtual System.String references_affected
{get{return this._references_affected;}set{this._references_affected = value;}}


[TSHint("entity_operation_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_entity_operation_id); }  }

}
public partial class Md_entities_reference_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Md_entities_reference_Meta))]
[DataContract]
public partial class Md_entities_reference : BaseEntity
{
public Md_entities_reference()
{
}
public enum flds
{
Id, Display, entity_reference_id, entity_id_lookup, reference_db, reference_tbl, reference_column, reflect_change, retain_original}
private System.Int32? _entity_reference_id;
private System.Int32? _entity_reference_id_to;
private LookupRecord _entity_id_lookup;
private System.String _reference_db;
private System.String _reference_tbl;
private System.String _reference_column;
private System.Boolean? _reflect_change;
private System.Boolean? _retain_original;


[DatabaseMap("entity_reference_id")]
[DataMember]
[Display(Name="Entity Reference ID")]
public virtual System.Int32? entity_reference_id
{get{return this._entity_reference_id;}set{this._entity_reference_id = value;}}
[DataMember]
public virtual System.Int32? entity_reference_id_to
{get{return this._entity_reference_id_to;}set{this._entity_reference_id_to = value;}}
public bool ShouldSerializeentity_reference_id_to() { return false; }


[DatabaseMap("entity_id")]
[DataMember]
[WDFLookup(alias:"CDB_MD_ENTITIES_ENTITY_ID", required:true)]
[Display(Name="Entity")]
public virtual LookupRecord entity_id_lookup
{get{return this._entity_id_lookup;}set{this._entity_id_lookup = value;}}


[DatabaseMap("reference_db")]
[DataMember(IsRequired = true)]
[MaxLength(15)]
[Display(Name="Reference Db")]
public virtual System.String reference_db
{get{return this._reference_db;}set{this._reference_db = value;}}


[DatabaseMap("reference_tbl")]
[DataMember(IsRequired = true)]
[MaxLength(50)]
[Display(Name="Reference Tbl")]
public virtual System.String reference_tbl
{get{return this._reference_tbl;}set{this._reference_tbl = value;}}


[DatabaseMap("reference_column")]
[DataMember(IsRequired = true)]
[MaxLength(50)]
[Display(Name="Reference Column")]
public virtual System.String reference_column
{get{return this._reference_column;}set{this._reference_column = value;}}


[DatabaseMap("reflect_change")]
[DataMember(IsRequired = true)]
[Display(Name="Reflect Change")]
public virtual System.Boolean? reflect_change
{get{return this._reflect_change;}set{this._reflect_change = value;}}


[DatabaseMap("retain_original")]
[DataMember(IsRequired = true)]
[Display(Name="Retain Original")]
public virtual System.Boolean? retain_original
{get{return this._retain_original;}set{this._retain_original = value;}}


[TSHint("entity_reference_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_entity_reference_id); }  }

}
public partial class Measuring_unit_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Measuring_unit_Meta))]
[DataContract]
public partial class Measuring_unit : BaseEntity
{
public Measuring_unit()
{
this.IdPropertyName = "measuring_unit_id";
this.DisplayPropertyName = "measuring_unit_nm";
this.CodePropertyName = "measuring_unit_cd";
}
public enum flds
{
Id, Display, measuring_unit_id, measuring_unit_cd, measuring_unit_nm, unit_decimals, number_format_type, txn_ts, effective_from, effective_till, type_of_unit, tolerance_short, tolerance_overage}
private System.Int16? _measuring_unit_id;
private System.Int16? _measuring_unit_id_to;
private System.String _measuring_unit_cd;
private System.String _measuring_unit_nm;
private System.Byte? _unit_decimals;
private System.Byte? _unit_decimals_to;
private System.String _number_format_type;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;
private System.String _type_of_unit;
private System.Decimal? _tolerance_short;
private System.Decimal? _tolerance_short_to;
private System.Decimal? _tolerance_overage;
private System.Decimal? _tolerance_overage_to;


[DatabaseMap("measuring_unit_id")]
[DataMember]
[Display(Name="Measuring Unit ID")]
public virtual System.Int16? measuring_unit_id
{get{return this._measuring_unit_id;}set{this._measuring_unit_id = value;}}
[DataMember]
public virtual System.Int16? measuring_unit_id_to
{get{return this._measuring_unit_id_to;}set{this._measuring_unit_id_to = value;}}
public bool ShouldSerializemeasuring_unit_id_to() { return false; }


[DatabaseMap("measuring_unit_cd")]
[DataMember(IsRequired = true)]
[MaxLength(4)]
[Display(Name="Measuring Unit Code")]
public virtual System.String measuring_unit_cd
{get{return this._measuring_unit_cd;}set{this._measuring_unit_cd = value;}}


[DatabaseMap("measuring_unit_nm")]
[DataMember(IsRequired = true)]
[MaxLength(20)]
[Display(Name="Measuring Unit Name")]
public virtual System.String measuring_unit_nm
{get{return this._measuring_unit_nm;}set{this._measuring_unit_nm = value;}}


[DatabaseMap("unit_decimals")]
[DataMember(IsRequired = true)]
[Display(Name="Unit Decimals")]
public virtual System.Byte? unit_decimals
{get{return this._unit_decimals;}set{this._unit_decimals = value;}}
[DataMember]
public virtual System.Byte? unit_decimals_to
{get{return this._unit_decimals_to;}set{this._unit_decimals_to = value;}}
public bool ShouldSerializeunit_decimals_to() { return false; }


[DatabaseMap("number_format_type")]
[DataMember(IsRequired = true)]
[MaxLength(8)]
[Display(Name="Number Format Type")]
public virtual System.String number_format_type
{get{return this._number_format_type;}set{this._number_format_type = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[DatabaseMap("type_of_unit")]
[DataMember]
[MaxLength(100)]
[Display(Name="Type Of Unit")]
public virtual System.String type_of_unit
{get{return this._type_of_unit;}set{this._type_of_unit = value;}}


[DatabaseMap("tolerance_short")]
[DataMember]
[Display(Name="Tolerance Short")]
public virtual System.Decimal? tolerance_short
{get{return this._tolerance_short;}set{this._tolerance_short = value;}}
[DataMember]
public virtual System.Decimal? tolerance_short_to
{get{return this._tolerance_short_to;}set{this._tolerance_short_to = value;}}
public bool ShouldSerializetolerance_short_to() { return false; }


[DatabaseMap("tolerance_overage")]
[DataMember]
[Display(Name="Tolerance Overage")]
public virtual System.Decimal? tolerance_overage
{get{return this._tolerance_overage;}set{this._tolerance_overage = value;}}
[DataMember]
public virtual System.Decimal? tolerance_overage_to
{get{return this._tolerance_overage_to;}set{this._tolerance_overage_to = value;}}
public bool ShouldSerializetolerance_overage_to() { return false; }


[TSHint("measuring_unit_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_measuring_unit_id); }  }

[TSHint("measuring_unit_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_measuring_unit_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Occupation_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Occupation_Meta))]
[DataContract]
public partial class Occupation : BaseEntity
{
public Occupation()
{
this.IdPropertyName = "occupation_id";
this.DisplayPropertyName = "occupation_nm";
this.CodePropertyName = "occupation_cd";
}
public enum flds
{
Id, Display, occupation_id, occupation_cd, occupation_nm, txn_ts, effective_from, effective_till}
private System.Int16? _occupation_id;
private System.Int16? _occupation_id_to;
private System.String _occupation_cd;
private System.String _occupation_nm;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("occupation_id")]
[DataMember]
[Display(Name="Occupation ID")]
public virtual System.Int16? occupation_id
{get{return this._occupation_id;}set{this._occupation_id = value;}}
[DataMember]
public virtual System.Int16? occupation_id_to
{get{return this._occupation_id_to;}set{this._occupation_id_to = value;}}
public bool ShouldSerializeoccupation_id_to() { return false; }


[DatabaseMap("occupation_cd")]
[DataMember(IsRequired = true)]
[MaxLength(12)]
[Display(Name="Occupation Code")]
public virtual System.String occupation_cd
{get{return this._occupation_cd;}set{this._occupation_cd = value;}}


[DatabaseMap("occupation_nm")]
[DataMember(IsRequired = true)]
[MaxLength(40)]
[Display(Name="Occupation Name")]
public virtual System.String occupation_nm
{get{return this._occupation_nm;}set{this._occupation_nm = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("occupation_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_occupation_id); }  }

[TSHint("occupation_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_occupation_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class P_and_t_line_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(P_and_t_line_Meta))]
[DataContract]
public partial class P_and_t_line : BaseEntity
{
public P_and_t_line()
{
}
public enum flds
{
Id, Display, telephone_no, txn_ts, effective_from, effective_till}
private System.String _telephone_no;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("telephone_no")]
[DataMember]
[MaxLength(10)]
[Display(Name="Telephone No.")]
public virtual System.String telephone_no
{get{return this._telephone_no;}set{this._telephone_no = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("telephone_no")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_telephone_no); }  }

public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Party_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Party_Meta))]
[DataContract]
public partial class Party : BaseEntity
{
public Party()
{
this.IdPropertyName = "party_id";
this.DisplayPropertyName = "party_nm";
this.CodePropertyName = "party_cd";
}
public enum flds
{
Id, Display, party_id, party_cd, party_nm, pan, party_contact_nm, party_contact_designation, txn_ts}
private System.Int32? _party_id;
private System.Int32? _party_id_to;
private System.String _party_cd;
private System.String _party_nm;
private System.String _pan;
private System.String _party_contact_nm;
private System.String _party_contact_designation;
private System.Byte[] _txn_ts;


[DatabaseMap("party_id")]
[DataMember]
[Display(Name="Party ID")]
public virtual System.Int32? party_id
{get{return this._party_id;}set{this._party_id = value;}}
[DataMember]
public virtual System.Int32? party_id_to
{get{return this._party_id_to;}set{this._party_id_to = value;}}
public bool ShouldSerializeparty_id_to() { return false; }


[DatabaseMap("party_cd")]
[DataMember(IsRequired = true)]
[MaxLength(10)]
[Display(Name="Party Code")]
public virtual System.String party_cd
{get{return this._party_cd;}set{this._party_cd = value;}}


[DatabaseMap("party_nm")]
[DataMember(IsRequired = true)]
[MaxLength(50)]
[Display(Name="Party Name")]
public virtual System.String party_nm
{get{return this._party_nm;}set{this._party_nm = value;}}


[DatabaseMap("pan")]
[DataMember]
[MaxLength(10)]
[Display(Name="Pan")]
public virtual System.String pan
{get{return this._pan;}set{this._pan = value;}}


[DatabaseMap("party_contact_nm")]
[DataMember]
[MaxLength(50)]
[Display(Name="Party Contact Name")]
public virtual System.String party_contact_nm
{get{return this._party_contact_nm;}set{this._party_contact_nm = value;}}


[DatabaseMap("party_contact_designation")]
[DataMember]
[MaxLength(30)]
[Display(Name="Party Contact Designation")]
public virtual System.String party_contact_designation
{get{return this._party_contact_designation;}set{this._party_contact_designation = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[TSHint("party_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_party_id); }  }

[TSHint("party_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_party_nm); }  }
}
public partial class Party_address_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Party_address_Meta))]
[DataContract]
public partial class Party_address : BaseEntity
{
public Party_address()
{
}
public enum flds
{
Id, Display, party_address_id, party_id_lookup, address_type_id_lookup, address_no, contact_nm, contact_designation, address_line_1, address_line_2, state_id_lookup, district_or_city_id_lookup, post_office_id_lookup, pin_or_zip_code, country_id_lookup, cell_phones, telephones, email_addresses, fax_lines, effective_from, effective_till, website, other_info}
private System.Int32? _party_address_id;
private System.Int32? _party_address_id_to;
private LookupRecord _party_id_lookup;
private LookupRecord _address_type_id_lookup;
private System.Byte? _address_no;
private System.Byte? _address_no_to;
private System.String _contact_nm;
private System.String _contact_designation;
private System.String _address_line_1;
private System.String _address_line_2;
private LookupRecord _state_id_lookup;
private LookupRecord _district_or_city_id_lookup;
private LookupRecord _post_office_id_lookup;
private System.String _pin_or_zip_code;
private LookupRecord _country_id_lookup;
private System.String _cell_phones;
private System.String _telephones;
private System.String _email_addresses;
private System.String _fax_lines;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;
private System.String _website;
private System.String _other_info;


[DatabaseMap("party_address_id")]
[DataMember]
[Display(Name="Party Address ID")]
public virtual System.Int32? party_address_id
{get{return this._party_address_id;}set{this._party_address_id = value;}}
[DataMember]
public virtual System.Int32? party_address_id_to
{get{return this._party_address_id_to;}set{this._party_address_id_to = value;}}
public bool ShouldSerializeparty_address_id_to() { return false; }


[DatabaseMap("party_id")]
[DataMember]
[WDFLookup(alias:"CDB_PARTIES_PARTY_ID", required:true)]
[Display(Name="Party")]
public virtual LookupRecord party_id_lookup
{get{return this._party_id_lookup;}set{this._party_id_lookup = value;}}


[DatabaseMap("address_type_id")]
[DataMember]
[WDFLookup(alias:"CDB_ADDRESS_TYPES_ADDRESS_TYPE_ID", required:true)]
[Display(Name="Address Type")]
public virtual LookupRecord address_type_id_lookup
{get{return this._address_type_id_lookup;}set{this._address_type_id_lookup = value;}}


[DatabaseMap("address_no")]
[DataMember(IsRequired = true)]
[Display(Name="Address No.")]
public virtual System.Byte? address_no
{get{return this._address_no;}set{this._address_no = value;}}
[DataMember]
public virtual System.Byte? address_no_to
{get{return this._address_no_to;}set{this._address_no_to = value;}}
public bool ShouldSerializeaddress_no_to() { return false; }


[DatabaseMap("contact_nm")]
[DataMember]
[MaxLength(50)]
[Display(Name="Contact Name")]
public virtual System.String contact_nm
{get{return this._contact_nm;}set{this._contact_nm = value;}}


[DatabaseMap("contact_designation")]
[DataMember]
[MaxLength(35)]
[Display(Name="Contact Designation")]
public virtual System.String contact_designation
{get{return this._contact_designation;}set{this._contact_designation = value;}}


[DatabaseMap("address_line_1")]
[DataMember(IsRequired = true)]
[MaxLength(50)]
[Display(Name="Address Line 1")]
public virtual System.String address_line_1
{get{return this._address_line_1;}set{this._address_line_1 = value;}}


[DatabaseMap("address_line_2")]
[DataMember]
[MaxLength(50)]
[Display(Name="Address Line 2")]
public virtual System.String address_line_2
{get{return this._address_line_2;}set{this._address_line_2 = value;}}


[DatabaseMap("state_id")]
[DataMember]
[WDFLookup(alias:"CDB_STATES_STATE_ID", required:false)]
[Display(Name="State")]
public virtual LookupRecord state_id_lookup
{get{return this._state_id_lookup;}set{this._state_id_lookup = value;}}


[DatabaseMap("district_or_city_id")]
[DataMember]
[WDFLookup(alias:"CDB_DISTRICTS_OR_CITIES_DISTRICT_OR_CITY_ID", required:false)]
[Display(Name="District Or City")]
public virtual LookupRecord district_or_city_id_lookup
{get{return this._district_or_city_id_lookup;}set{this._district_or_city_id_lookup = value;}}


[DatabaseMap("post_office_id")]
[DataMember]
[WDFLookup(alias:"CDB_POST_OFFICES_POST_OFFICE_ID", required:false)]
[Display(Name="Post Office")]
public virtual LookupRecord post_office_id_lookup
{get{return this._post_office_id_lookup;}set{this._post_office_id_lookup = value;}}


[DatabaseMap("pin_or_zip_code")]
[DataMember]
[MaxLength(6)]
[Display(Name="Pin Or Zip Code")]
public virtual System.String pin_or_zip_code
{get{return this._pin_or_zip_code;}set{this._pin_or_zip_code = value;}}


[DatabaseMap("country_id")]
[DataMember]
[WDFLookup(alias:"CDB_COUNTRIES_COUNTRY_ID", required:false)]
[Display(Name="Country")]
public virtual LookupRecord country_id_lookup
{get{return this._country_id_lookup;}set{this._country_id_lookup = value;}}


[DatabaseMap("cell_phones")]
[DataMember]
[MaxLength(50)]
[Display(Name="Cell Phones")]
public virtual System.String cell_phones
{get{return this._cell_phones;}set{this._cell_phones = value;}}


[DatabaseMap("telephones")]
[DataMember]
[MaxLength(50)]
[Display(Name="Telephones")]
public virtual System.String telephones
{get{return this._telephones;}set{this._telephones = value;}}


[DatabaseMap("email_addresses")]
[DataMember]
[MaxLength(50)]
[Display(Name="Email Addresses")]
public virtual System.String email_addresses
{get{return this._email_addresses;}set{this._email_addresses = value;}}


[DatabaseMap("fax_lines")]
[DataMember]
[MaxLength(50)]
[Display(Name="Fax Lines")]
public virtual System.String fax_lines
{get{return this._fax_lines;}set{this._fax_lines = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[DatabaseMap("website")]
[DataMember]
[MaxLength(255)]
[Display(Name="Website")]
public virtual System.String website
{get{return this._website;}set{this._website = value;}}


[DatabaseMap("other_info")]
[DataMember]
[MaxLength(7500)]
[Display(Name="Other Info")]
public virtual System.String other_info
{get{return this._other_info;}set{this._other_info = value;}}


[TSHint("party_address_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_party_address_id); }  }

public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Patron_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Patron_Meta))]
[DataContract]
public partial class Patron : BaseEntity
{
public Patron()
{
this.IdPropertyName = "patron_id";
this.DisplayPropertyName = "patron_nm";
}
public enum flds
{
Id, Display, patron_id, patron_nm, effective_from, effective_till, initiation_from, initiation_till}
private System.Byte? _patron_id;
private System.Byte? _patron_id_to;
private System.String _patron_nm;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;
private System.DateTime? _initiation_from;
private System.DateTime? _initiation_from_to;
private System.DateTime? _initiation_till;
private System.DateTime? _initiation_till_to;


[DatabaseMap("patron_id")]
[DataMember]
[Display(Name="Patron ID")]
public virtual System.Byte? patron_id
{get{return this._patron_id;}set{this._patron_id = value;}}
[DataMember]
public virtual System.Byte? patron_id_to
{get{return this._patron_id_to;}set{this._patron_id_to = value;}}
public bool ShouldSerializepatron_id_to() { return false; }


[DatabaseMap("patron_nm")]
[DataMember(IsRequired = true)]
[MaxLength(60)]
[Display(Name="Patron Name")]
public virtual System.String patron_nm
{get{return this._patron_nm;}set{this._patron_nm = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[DatabaseMap("initiation_from")]
[DataMember]
[Display(Name="Initiation From")]
public virtual System.DateTime? initiation_from
{get{return this._initiation_from;}set{this._initiation_from = value;}}
[DataMember]
public virtual System.DateTime? initiation_from_to
{get{return this._initiation_from_to;}set{this._initiation_from_to = value;}}
public bool ShouldSerializeinitiation_from_to() { return false; }


[DatabaseMap("initiation_till")]
[DataMember]
[Display(Name="Initiation Till")]
public virtual System.DateTime? initiation_till
{get{return this._initiation_till;}set{this._initiation_till = value;}}
[DataMember]
public virtual System.DateTime? initiation_till_to
{get{return this._initiation_till_to;}set{this._initiation_till_to = value;}}
public bool ShouldSerializeinitiation_till_to() { return false; }


[TSHint("patron_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_patron_id); }  }

[TSHint("patron_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_patron_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Person_title_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Person_title_Meta))]
[DataContract]
public partial class Person_title : BaseEntity
{
public Person_title()
{
}
public enum flds
{
Id, Display, person_title}
private System.String _person_title;


[DatabaseMap("person_title")]
[DataMember]
[MaxLength(10)]
[Display(Name="Person Title")]
public virtual System.String person_title
{get{return this._person_title;}set{this._person_title = value;}}


[TSHint("person_title")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_person_title); }  }

}
public partial class Person_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Person_Meta))]
[DataContract]
public partial class Person : BaseEntity
{
public Person()
{
}
public enum flds
{
Id, Display, person_id, title_lookup, first_nm, middle_nm, last_nm, gender, is_dera_resident, contact_information, email_addresses, birth_dtm, additional_information, application_id, screen_id, initiation_id, effective_from, effective_till, txn_ts}
private System.Int32? _person_id;
private System.Int32? _person_id_to;
private LookupRecord _title_lookup;
private System.String _first_nm;
private System.String _middle_nm;
private System.String _last_nm;
private System.String _gender;
private System.String _is_dera_resident;
private System.String _contact_information;
private System.String _email_addresses;
private System.DateTime? _birth_dtm;
private System.DateTime? _birth_dtm_to;
private System.String _additional_information;
private System.String _application_id;
private System.String _screen_id;
private System.Int32? _initiation_id;
private System.Int32? _initiation_id_to;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;
private System.Byte[] _txn_ts;


[DatabaseMap("person_id")]
[DataMember]
[Display(Name="Person ID")]
public virtual System.Int32? person_id
{get{return this._person_id;}set{this._person_id = value;}}
[DataMember]
public virtual System.Int32? person_id_to
{get{return this._person_id_to;}set{this._person_id_to = value;}}
public bool ShouldSerializeperson_id_to() { return false; }


[DatabaseMap("title")]
[DataMember]
[WDFLookup(alias:"CDB_PERSON_TITLES_TITLE", required:true)]
[Display(Name="Title")]
public virtual LookupRecord title_lookup
{get{return this._title_lookup;}set{this._title_lookup = value;}}


[DatabaseMap("first_nm")]
[DataMember(IsRequired = true)]
[MaxLength(30)]
[Display(Name="First Name")]
public virtual System.String first_nm
{get{return this._first_nm;}set{this._first_nm = value;}}


[DatabaseMap("middle_nm")]
[DataMember]
[MaxLength(30)]
[Display(Name="Middle Name")]
public virtual System.String middle_nm
{get{return this._middle_nm;}set{this._middle_nm = value;}}


[DatabaseMap("last_nm")]
[DataMember(IsRequired = true)]
[MaxLength(30)]
[Display(Name="Last Name")]
public virtual System.String last_nm
{get{return this._last_nm;}set{this._last_nm = value;}}


[DatabaseMap("gender")]
[DataMember(IsRequired = true)]
[MaxLength(6)]
[Display(Name="Gender")]
public virtual System.String gender
{get{return this._gender;}set{this._gender = value;}}


[DatabaseMap("is_dera_resident")]
[DataMember(IsRequired = true)]
[MaxLength(3)]
[Display(Name="Is Dera Resident")]
public virtual System.String is_dera_resident
{get{return this._is_dera_resident;}set{this._is_dera_resident = value;}}


[DatabaseMap("contact_information")]
[DataMember]
[MaxLength(50)]
[Display(Name="Contact Information")]
public virtual System.String contact_information
{get{return this._contact_information;}set{this._contact_information = value;}}


[DatabaseMap("email_addresses")]
[DataMember]
[MaxLength(50)]
[Display(Name="Email Addresses")]
public virtual System.String email_addresses
{get{return this._email_addresses;}set{this._email_addresses = value;}}


[DatabaseMap("birth_dtm")]
[DataMember(IsRequired = true)]
[Display(Name="Birth Date")]
public virtual System.DateTime? birth_dtm
{get{return this._birth_dtm;}set{this._birth_dtm = value;}}
[DataMember]
public virtual System.DateTime? birth_dtm_to
{get{return this._birth_dtm_to;}set{this._birth_dtm_to = value;}}
public bool ShouldSerializebirth_dtm_to() { return false; }


[DatabaseMap("additional_information")]
[DataMember]
[MaxLength(50)]
[Display(Name="Additional Information")]
public virtual System.String additional_information
{get{return this._additional_information;}set{this._additional_information = value;}}


[DatabaseMap("application_id")]
[DataMember]
[MaxLength(7)]
[Display(Name="Application ID")]
public virtual System.String application_id
{get{return this._application_id;}set{this._application_id = value;}}


[DatabaseMap("screen_id")]
[DataMember]
[MaxLength(6)]
[Display(Name="Screen ID")]
public virtual System.String screen_id
{get{return this._screen_id;}set{this._screen_id = value;}}


[DatabaseMap("initiation_id")]
[DataMember]
[Display(Name="Initiation ID")]
public virtual System.Int32? initiation_id
{get{return this._initiation_id;}set{this._initiation_id = value;}}
[DataMember]
public virtual System.Int32? initiation_id_to
{get{return this._initiation_id_to;}set{this._initiation_id_to = value;}}
public bool ShouldSerializeinitiation_id_to() { return false; }


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[TSHint("person_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_person_id); }  }

public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Phone_type_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Phone_type_Meta))]
[DataContract]
public partial class Phone_type : BaseEntity
{
public Phone_type()
{
this.IdPropertyName = "phone_type_id";
this.DisplayPropertyName = "phone_type_nm";
}
public enum flds
{
Id, Display, phone_type_id, phone_type_nm, effective_from, effective_till}
private System.Int16? _phone_type_id;
private System.Int16? _phone_type_id_to;
private System.String _phone_type_nm;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("phone_type_id")]
[DataMember]
[Display(Name="Phone Type ID")]
public virtual System.Int16? phone_type_id
{get{return this._phone_type_id;}set{this._phone_type_id = value;}}
[DataMember]
public virtual System.Int16? phone_type_id_to
{get{return this._phone_type_id_to;}set{this._phone_type_id_to = value;}}
public bool ShouldSerializephone_type_id_to() { return false; }


[DatabaseMap("phone_type_nm")]
[DataMember(IsRequired = true)]
[MaxLength(10)]
[Display(Name="Phone Type Name")]
public virtual System.String phone_type_nm
{get{return this._phone_type_nm;}set{this._phone_type_nm = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("phone_type_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_phone_type_id); }  }

[TSHint("phone_type_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_phone_type_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Post_office_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Post_office_Meta))]
[DataContract]
public partial class Post_office : BaseEntity
{
public Post_office()
{
this.IdPropertyName = "post_office_id";
this.DisplayPropertyName = "post_office_nm";
this.CodePropertyName = "post_office_cd";
}
public enum flds
{
Id, Display, post_office_id, post_office_cd, post_office_nm, district_or_city_id_lookup, pin_or_zip_code, std_code, txn_ts, effective_from, effective_till}
private System.Int32? _post_office_id;
private System.Int32? _post_office_id_to;
private System.String _post_office_cd;
private System.String _post_office_nm;
private LookupRecord _district_or_city_id_lookup;
private System.String _pin_or_zip_code;
private System.String _std_code;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("post_office_id")]
[DataMember]
[Display(Name="Post Office ID")]
public virtual System.Int32? post_office_id
{get{return this._post_office_id;}set{this._post_office_id = value;}}
[DataMember]
public virtual System.Int32? post_office_id_to
{get{return this._post_office_id_to;}set{this._post_office_id_to = value;}}
public bool ShouldSerializepost_office_id_to() { return false; }


[DatabaseMap("post_office_cd")]
[DataMember(IsRequired = true)]
[MaxLength(10)]
[Display(Name="Post Office Code")]
public virtual System.String post_office_cd
{get{return this._post_office_cd;}set{this._post_office_cd = value;}}


[DatabaseMap("post_office_nm")]
[DataMember(IsRequired = true)]
[MaxLength(35)]
[Display(Name="Post Office Name")]
public virtual System.String post_office_nm
{get{return this._post_office_nm;}set{this._post_office_nm = value;}}


[DatabaseMap("district_or_city_id")]
[DataMember]
[WDFLookup(alias:"CDB_DISTRICTS_OR_CITIES_DISTRICT_OR_CITY_ID", required:true)]
[Display(Name="District Or City")]
public virtual LookupRecord district_or_city_id_lookup
{get{return this._district_or_city_id_lookup;}set{this._district_or_city_id_lookup = value;}}


[DatabaseMap("pin_or_zip_code")]
[DataMember]
[MaxLength(6)]
[Display(Name="Pin Or Zip Code")]
public virtual System.String pin_or_zip_code
{get{return this._pin_or_zip_code;}set{this._pin_or_zip_code = value;}}


[DatabaseMap("std_code")]
[DataMember]
[MaxLength(10)]
[Display(Name="Std Code")]
public virtual System.String std_code
{get{return this._std_code;}set{this._std_code = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("post_office_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_post_office_id); }  }

[TSHint("post_office_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_post_office_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Qlfctn_subject_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Qlfctn_subject_Meta))]
[DataContract]
public partial class Qlfctn_subject : BaseEntity
{
public Qlfctn_subject()
{
this.IdPropertyName = "qlfctn_subject_id";
this.DisplayPropertyName = "qlfctn_subject_nm";
this.CodePropertyName = "qlfctn_subject_cd";
}
public enum flds
{
Id, Display, qlfctn_subject_id, qlfctn_subject_cd, qlfctn_subject_nm, description, effective_from, effective_till}
private System.Int16? _qlfctn_subject_id;
private System.Int16? _qlfctn_subject_id_to;
private System.String _qlfctn_subject_cd;
private System.String _qlfctn_subject_nm;
private System.String _description;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("qlfctn_subject_id")]
[DataMember]
[Display(Name="Qlfctn Subject ID")]
public virtual System.Int16? qlfctn_subject_id
{get{return this._qlfctn_subject_id;}set{this._qlfctn_subject_id = value;}}
[DataMember]
public virtual System.Int16? qlfctn_subject_id_to
{get{return this._qlfctn_subject_id_to;}set{this._qlfctn_subject_id_to = value;}}
public bool ShouldSerializeqlfctn_subject_id_to() { return false; }


[DatabaseMap("qlfctn_subject_cd")]
[DataMember(IsRequired = true)]
[MaxLength(5)]
[Display(Name="Qlfctn Subject Code")]
public virtual System.String qlfctn_subject_cd
{get{return this._qlfctn_subject_cd;}set{this._qlfctn_subject_cd = value;}}


[DatabaseMap("qlfctn_subject_nm")]
[DataMember(IsRequired = true)]
[MaxLength(20)]
[Display(Name="Qlfctn Subject Name")]
public virtual System.String qlfctn_subject_nm
{get{return this._qlfctn_subject_nm;}set{this._qlfctn_subject_nm = value;}}


[DatabaseMap("description")]
[DataMember]
[MaxLength(50)]
[Display(Name="Description")]
public virtual System.String description
{get{return this._description;}set{this._description = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("qlfctn_subject_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_qlfctn_subject_id); }  }

[TSHint("qlfctn_subject_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_qlfctn_subject_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Qualification_type_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Qualification_type_Meta))]
[DataContract]
public partial class Qualification_type : BaseEntity
{
public Qualification_type()
{
}
public enum flds
{
Id, Display, qualification_type, qualification_type_sq, effective_from, effective_till}
private System.String _qualification_type;
private System.Int16? _qualification_type_sq;
private System.Int16? _qualification_type_sq_to;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("qualification_type")]
[DataMember]
[MaxLength(16)]
[Display(Name="Qualification Type")]
public virtual System.String qualification_type
{get{return this._qualification_type;}set{this._qualification_type = value;}}


[DatabaseMap("qualification_type_sq")]
[DataMember]
[Display(Name="Qualification Type Seq.")]
public virtual System.Int16? qualification_type_sq
{get{return this._qualification_type_sq;}set{this._qualification_type_sq = value;}}
[DataMember]
public virtual System.Int16? qualification_type_sq_to
{get{return this._qualification_type_sq_to;}set{this._qualification_type_sq_to = value;}}
public bool ShouldSerializequalification_type_sq_to() { return false; }


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("qualification_type")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_qualification_type); }  }

public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Qualification_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Qualification_Meta))]
[DataContract]
public partial class Qualification : BaseEntity
{
public Qualification()
{
this.IdPropertyName = "qualification_id";
this.DisplayPropertyName = "qualification_nm";
this.CodePropertyName = "qualification_cd";
}
public enum flds
{
Id, Display, qualification_id, qualification_type_lookup, qualification_cd, qualification_nm, remarks, effective_from, effective_till, txn_ts}
private System.Int16? _qualification_id;
private System.Int16? _qualification_id_to;
private LookupRecord _qualification_type_lookup;
private System.String _qualification_cd;
private System.String _qualification_nm;
private System.String _remarks;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;
private System.Byte[] _txn_ts;


[DatabaseMap("qualification_id")]
[DataMember]
[Display(Name="Qualification ID")]
public virtual System.Int16? qualification_id
{get{return this._qualification_id;}set{this._qualification_id = value;}}
[DataMember]
public virtual System.Int16? qualification_id_to
{get{return this._qualification_id_to;}set{this._qualification_id_to = value;}}
public bool ShouldSerializequalification_id_to() { return false; }


[DatabaseMap("qualification_type")]
[DataMember]
[WDFLookup(alias:"CDB_QUALIFICATION_TYPES_QUALIFICATION_TYPE", required:true)]
[Display(Name="Qualification Type")]
public virtual LookupRecord qualification_type_lookup
{get{return this._qualification_type_lookup;}set{this._qualification_type_lookup = value;}}


[DatabaseMap("qualification_cd")]
[DataMember(IsRequired = true)]
[MaxLength(8)]
[Display(Name="Qualification Code")]
public virtual System.String qualification_cd
{get{return this._qualification_cd;}set{this._qualification_cd = value;}}


[DatabaseMap("qualification_nm")]
[DataMember(IsRequired = true)]
[MaxLength(35)]
[Display(Name="Qualification Name")]
public virtual System.String qualification_nm
{get{return this._qualification_nm;}set{this._qualification_nm = value;}}


[DatabaseMap("remarks")]
[DataMember]
[MaxLength(200)]
[Display(Name="Remarks")]
public virtual System.String remarks
{get{return this._remarks;}set{this._remarks = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[TSHint("qualification_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_qualification_id); }  }

[TSHint("qualification_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_qualification_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Relation_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Relation_Meta))]
[DataContract]
public partial class Relation : BaseEntity
{
public Relation()
{
this.IdPropertyName = "relation_id";
this.DisplayPropertyName = "relation_nm";
}
public enum flds
{
Id, Display, relation_id, relation_nm, txn_ts, effective_from, effective_till}
private System.Int16? _relation_id;
private System.Int16? _relation_id_to;
private System.String _relation_nm;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("relation_id")]
[DataMember]
[Display(Name="Relation ID")]
public virtual System.Int16? relation_id
{get{return this._relation_id;}set{this._relation_id = value;}}
[DataMember]
public virtual System.Int16? relation_id_to
{get{return this._relation_id_to;}set{this._relation_id_to = value;}}
public bool ShouldSerializerelation_id_to() { return false; }


[DatabaseMap("relation_nm")]
[DataMember(IsRequired = true)]
[MaxLength(20)]
[Display(Name="Relation Name")]
public virtual System.String relation_nm
{get{return this._relation_nm;}set{this._relation_nm = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("relation_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_relation_id); }  }

[TSHint("relation_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_relation_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Representative_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Representative_Meta))]
[DataContract]
public partial class Representative : BaseEntity
{
public Representative()
{
}
public enum flds
{
Id, Display, representative_id, person_id_lookup, address_line_1, address_line_2, district_or_city_id_lookup, pin_or_zip_code, telephones_office, telephones_residence, cell_phone_no, fax_lines_office, fax_lines_residence, territory, txn_ts, effective_from, effective_till}
private System.Int32? _representative_id;
private System.Int32? _representative_id_to;
private LookupRecord _person_id_lookup;
private System.String _address_line_1;
private System.String _address_line_2;
private LookupRecord _district_or_city_id_lookup;
private System.String _pin_or_zip_code;
private System.String _telephones_office;
private System.String _telephones_residence;
private System.String _cell_phone_no;
private System.String _fax_lines_office;
private System.String _fax_lines_residence;
private System.String _territory;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("representative_id")]
[DataMember]
[Display(Name="Representative ID")]
public virtual System.Int32? representative_id
{get{return this._representative_id;}set{this._representative_id = value;}}
[DataMember]
public virtual System.Int32? representative_id_to
{get{return this._representative_id_to;}set{this._representative_id_to = value;}}
public bool ShouldSerializerepresentative_id_to() { return false; }


[DatabaseMap("person_id")]
[DataMember]
[WDFLookup(alias:"CDB_PERSONS_PERSON_ID", required:true)]
[Display(Name="Person")]
public virtual LookupRecord person_id_lookup
{get{return this._person_id_lookup;}set{this._person_id_lookup = value;}}


[DatabaseMap("address_line_1")]
[DataMember(IsRequired = true)]
[MaxLength(50)]
[Display(Name="Address Line 1")]
public virtual System.String address_line_1
{get{return this._address_line_1;}set{this._address_line_1 = value;}}


[DatabaseMap("address_line_2")]
[DataMember]
[MaxLength(50)]
[Display(Name="Address Line 2")]
public virtual System.String address_line_2
{get{return this._address_line_2;}set{this._address_line_2 = value;}}


[DatabaseMap("district_or_city_id")]
[DataMember]
[WDFLookup(alias:"CDB_DISTRICTS_OR_CITIES_DISTRICT_OR_CITY_ID", required:true)]
[Display(Name="District Or City")]
public virtual LookupRecord district_or_city_id_lookup
{get{return this._district_or_city_id_lookup;}set{this._district_or_city_id_lookup = value;}}


[DatabaseMap("pin_or_zip_code")]
[DataMember]
[MaxLength(6)]
[Display(Name="Pin Or Zip Code")]
public virtual System.String pin_or_zip_code
{get{return this._pin_or_zip_code;}set{this._pin_or_zip_code = value;}}


[DatabaseMap("telephones_office")]
[DataMember]
[MaxLength(50)]
[Display(Name="Telephones Office")]
public virtual System.String telephones_office
{get{return this._telephones_office;}set{this._telephones_office = value;}}


[DatabaseMap("telephones_residence")]
[DataMember]
[MaxLength(50)]
[Display(Name="Telephones Residence")]
public virtual System.String telephones_residence
{get{return this._telephones_residence;}set{this._telephones_residence = value;}}


[DatabaseMap("cell_phone_no")]
[DataMember]
[MaxLength(20)]
[Display(Name="Cell Phone No.")]
public virtual System.String cell_phone_no
{get{return this._cell_phone_no;}set{this._cell_phone_no = value;}}


[DatabaseMap("fax_lines_office")]
[DataMember]
[MaxLength(50)]
[Display(Name="Fax Lines Office")]
public virtual System.String fax_lines_office
{get{return this._fax_lines_office;}set{this._fax_lines_office = value;}}


[DatabaseMap("fax_lines_residence")]
[DataMember]
[MaxLength(50)]
[Display(Name="Fax Lines Residence")]
public virtual System.String fax_lines_residence
{get{return this._fax_lines_residence;}set{this._fax_lines_residence = value;}}


[DatabaseMap("territory")]
[DataMember(IsRequired = true)]
[MaxLength(100)]
[Display(Name="Territory")]
public virtual System.String territory
{get{return this._territory;}set{this._territory = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("representative_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_representative_id); }  }

public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Responsibility_type_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Responsibility_type_Meta))]
[DataContract]
public partial class Responsibility_type : BaseEntity
{
public Responsibility_type()
{
}
public enum flds
{
Id, Display, responsibility_type_id, working_unit_id_lookup, responsibility_nm, responsibility_cnt, responsibility_sq}
private System.Int16? _responsibility_type_id;
private System.Int16? _responsibility_type_id_to;
private LookupRecord _working_unit_id_lookup;
private System.String _responsibility_nm;
private System.Byte? _responsibility_cnt;
private System.Byte? _responsibility_cnt_to;
private System.Int16? _responsibility_sq;
private System.Int16? _responsibility_sq_to;


[DatabaseMap("responsibility_type_id")]
[DataMember]
[Display(Name="Responsibility Type ID")]
public virtual System.Int16? responsibility_type_id
{get{return this._responsibility_type_id;}set{this._responsibility_type_id = value;}}
[DataMember]
public virtual System.Int16? responsibility_type_id_to
{get{return this._responsibility_type_id_to;}set{this._responsibility_type_id_to = value;}}
public bool ShouldSerializeresponsibility_type_id_to() { return false; }


[DatabaseMap("working_unit_id")]
[DataMember]
[WDFLookup(alias:"CDB_WORKING_UNITS_WORKING_UNIT_ID", required:true)]
[Display(Name="Working Unit")]
public virtual LookupRecord working_unit_id_lookup
{get{return this._working_unit_id_lookup;}set{this._working_unit_id_lookup = value;}}


[DatabaseMap("responsibility_nm")]
[DataMember(IsRequired = true)]
[MaxLength(20)]
[Display(Name="Responsibility Name")]
public virtual System.String responsibility_nm
{get{return this._responsibility_nm;}set{this._responsibility_nm = value;}}


[DatabaseMap("responsibility_cnt")]
[DataMember(IsRequired = true)]
[Display(Name="Responsibility Cnt")]
public virtual System.Byte? responsibility_cnt
{get{return this._responsibility_cnt;}set{this._responsibility_cnt = value;}}
[DataMember]
public virtual System.Byte? responsibility_cnt_to
{get{return this._responsibility_cnt_to;}set{this._responsibility_cnt_to = value;}}
public bool ShouldSerializeresponsibility_cnt_to() { return false; }


[DatabaseMap("responsibility_sq")]
[DataMember(IsRequired = true)]
[Display(Name="Responsibility Seq.")]
public virtual System.Int16? responsibility_sq
{get{return this._responsibility_sq;}set{this._responsibility_sq = value;}}
[DataMember]
public virtual System.Int16? responsibility_sq_to
{get{return this._responsibility_sq_to;}set{this._responsibility_sq_to = value;}}
public bool ShouldSerializeresponsibility_sq_to() { return false; }


[TSHint("responsibility_type_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_responsibility_type_id); }  }

}
public partial class Role_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Role_Meta))]
[DataContract]
public partial class Role : BaseEntity
{
public Role()
{
this.IdPropertyName = "role_cd";
this.DisplayPropertyName = "role_nm";
this.CodePropertyName = "role_cd";
}
public enum flds
{
Id, Display, role_cd, role_nm, address_requirement, txn_ts, effective_from, effective_till}
private System.String _role_cd;
private System.String _role_nm;
private System.String _address_requirement;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("role_cd")]
[DataMember]
[MaxLength(3)]
[Display(Name="Role Code")]
public virtual System.String role_cd
{get{return this._role_cd;}set{this._role_cd = value;}}


[DatabaseMap("role_nm")]
[DataMember(IsRequired = true)]
[MaxLength(15)]
[Display(Name="Role Name")]
public virtual System.String role_nm
{get{return this._role_nm;}set{this._role_nm = value;}}


[DatabaseMap("address_requirement")]
[DataMember(IsRequired = true)]
[MaxLength(12)]
[Display(Name="Address Requirement")]
public virtual System.String address_requirement
{get{return this._address_requirement;}set{this._address_requirement = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("role_cd")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_role_cd); }  }

[TSHint("role_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_role_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Satsang_centre_type_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Satsang_centre_type_Meta))]
[DataContract]
public partial class Satsang_centre_type : BaseEntity
{
public Satsang_centre_type()
{
}
public enum flds
{
Id, Display, satsang_centre_type}
private System.String _satsang_centre_type;


[DatabaseMap("satsang_centre_type")]
[DataMember]
[MaxLength(20)]
[Display(Name="Satsang Centre Type")]
public virtual System.String satsang_centre_type
{get{return this._satsang_centre_type;}set{this._satsang_centre_type = value;}}


[TSHint("satsang_centre_type")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_satsang_centre_type); }  }

}
public partial class Satsang_centre_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Satsang_centre_Meta))]
[DataContract]
public partial class Satsang_centre : BaseEntity
{
public Satsang_centre()
{
this.IdPropertyName = "satsang_centre_id";
this.DisplayPropertyName = "satsang_centre_nm";
this.CodePropertyName = "satsang_centre_cd";
}
public enum flds
{
Id, Display, satsang_centre_id, satsang_centre_cd, satsang_centre_nm, satsang_centre_type_lookup, address_line_1, address_line_2, district_or_city_id_lookup, pin_or_zip_code, secretary_lookup, telephones, email_addresses, fax_lines, txn_ts, effective_from, effective_till, file_no, area_nm}
private System.Int32? _satsang_centre_id;
private System.Int32? _satsang_centre_id_to;
private System.String _satsang_centre_cd;
private System.String _satsang_centre_nm;
private LookupRecord _satsang_centre_type_lookup;
private System.String _address_line_1;
private System.String _address_line_2;
private LookupRecord _district_or_city_id_lookup;
private System.String _pin_or_zip_code;
private LookupRecord _secretary_lookup;
private System.String _telephones;
private System.String _email_addresses;
private System.String _fax_lines;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;
private System.String _file_no;
private System.String _area_nm;


[DatabaseMap("satsang_centre_id")]
[DataMember]
[Display(Name="Satsang Centre ID")]
public virtual System.Int32? satsang_centre_id
{get{return this._satsang_centre_id;}set{this._satsang_centre_id = value;}}
[DataMember]
public virtual System.Int32? satsang_centre_id_to
{get{return this._satsang_centre_id_to;}set{this._satsang_centre_id_to = value;}}
public bool ShouldSerializesatsang_centre_id_to() { return false; }


[DatabaseMap("satsang_centre_cd")]
[DataMember(IsRequired = true)]
[MaxLength(8)]
[Display(Name="Satsang Centre Code")]
public virtual System.String satsang_centre_cd
{get{return this._satsang_centre_cd;}set{this._satsang_centre_cd = value;}}


[DatabaseMap("satsang_centre_nm")]
[DataMember(IsRequired = true)]
[MaxLength(40)]
[Display(Name="Satsang Centre Name")]
public virtual System.String satsang_centre_nm
{get{return this._satsang_centre_nm;}set{this._satsang_centre_nm = value;}}


[DatabaseMap("satsang_centre_type")]
[DataMember]
[WDFLookup(alias:"CDB_SATSANG_CENTRE_TYPES_SATSANG_CENTRE_TYPE", required:true)]
[Display(Name="Satsang Centre Type")]
public virtual LookupRecord satsang_centre_type_lookup
{get{return this._satsang_centre_type_lookup;}set{this._satsang_centre_type_lookup = value;}}


[DatabaseMap("address_line_1")]
[DataMember(IsRequired = true)]
[MaxLength(75)]
[Display(Name="Address Line 1")]
public virtual System.String address_line_1
{get{return this._address_line_1;}set{this._address_line_1 = value;}}


[DatabaseMap("address_line_2")]
[DataMember]
[MaxLength(75)]
[Display(Name="Address Line 2")]
public virtual System.String address_line_2
{get{return this._address_line_2;}set{this._address_line_2 = value;}}


[DatabaseMap("district_or_city_id")]
[DataMember]
[WDFLookup(alias:"CDB_DISTRICTS_OR_CITIES_DISTRICT_OR_CITY_ID", required:true)]
[Display(Name="District Or City")]
public virtual LookupRecord district_or_city_id_lookup
{get{return this._district_or_city_id_lookup;}set{this._district_or_city_id_lookup = value;}}


[DatabaseMap("pin_or_zip_code")]
[DataMember]
[MaxLength(6)]
[Display(Name="Pin Or Zip Code")]
public virtual System.String pin_or_zip_code
{get{return this._pin_or_zip_code;}set{this._pin_or_zip_code = value;}}


[DatabaseMap("secretary")]
[DataMember]
[WDFLookup(alias:"CDB_PERSONS_SECRETARY", required:false)]
[Display(Name="Secretary")]
public virtual LookupRecord secretary_lookup
{get{return this._secretary_lookup;}set{this._secretary_lookup = value;}}


[DatabaseMap("telephones")]
[DataMember]
[MaxLength(50)]
[Display(Name="Telephones")]
public virtual System.String telephones
{get{return this._telephones;}set{this._telephones = value;}}


[DatabaseMap("email_addresses")]
[DataMember]
[MaxLength(50)]
[Display(Name="Email Addresses")]
public virtual System.String email_addresses
{get{return this._email_addresses;}set{this._email_addresses = value;}}


[DatabaseMap("fax_lines")]
[DataMember]
[MaxLength(50)]
[Display(Name="Fax Lines")]
public virtual System.String fax_lines
{get{return this._fax_lines;}set{this._fax_lines = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[DatabaseMap("file_no")]
[DataMember]
[MaxLength(20)]
[Display(Name="File No.")]
public virtual System.String file_no
{get{return this._file_no;}set{this._file_no = value;}}


[DatabaseMap("area_nm")]
[DataMember]
[MaxLength(30)]
[Display(Name="Area Name")]
public virtual System.String area_nm
{get{return this._area_nm;}set{this._area_nm = value;}}


[TSHint("satsang_centre_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_satsang_centre_id); }  }

[TSHint("satsang_centre_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_satsang_centre_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Satsang_programme_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Satsang_programme_Meta))]
[DataContract]
public partial class Satsang_programme : BaseEntity
{
public Satsang_programme()
{
}
public enum flds
{
Id, Display, satsang_centre_id_lookup, satsang_date}
private LookupRecord _satsang_centre_id_lookup;
private System.DateTime? _satsang_date;
private System.DateTime? _satsang_date_to;


[DatabaseMap("satsang_centre_id")]
[DataMember]
[WDFLookup(alias:"CDB_SATSANG_CENTRES_SATSANG_CENTRE_ID", required:true)]
[Display(Name="Satsang Centre")]
public virtual LookupRecord satsang_centre_id_lookup
{get{return this._satsang_centre_id_lookup;}set{this._satsang_centre_id_lookup = value;}}


[DatabaseMap("satsang_date")]
[DataMember]
[Display(Name="Satsang Date")]
public virtual System.DateTime? satsang_date
{get{return this._satsang_date;}set{this._satsang_date = value;}}
[DataMember]
public virtual System.DateTime? satsang_date_to
{get{return this._satsang_date_to;}set{this._satsang_date_to = value;}}
public bool ShouldSerializesatsang_date_to() { return false; }


[TSHint("satsang_date")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_satsang_date); }  }

}
public partial class Sewadar_Status_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Sewadar_Status_Meta))]
[DataContract]
public partial class Sewadar_Status : BaseEntity
{
public Sewadar_Status()
{
}
public enum flds
{
Id, Display, sewadarstatus_id, sewadarstatus_nm, txn_ts, effective_from, effective_till}
private System.Int32? _sewadarstatus_id;
private System.Int32? _sewadarstatus_id_to;
private System.String _sewadarstatus_nm;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("sewadarstatus_id")]
[DataMember]
[Display(Name="Sewadarstatus ID")]
public virtual System.Int32? sewadarstatus_id
{get{return this._sewadarstatus_id;}set{this._sewadarstatus_id = value;}}
[DataMember]
public virtual System.Int32? sewadarstatus_id_to
{get{return this._sewadarstatus_id_to;}set{this._sewadarstatus_id_to = value;}}
public bool ShouldSerializesewadarstatus_id_to() { return false; }


[DatabaseMap("sewadarstatus_nm")]
[DataMember(IsRequired = true)]
[MaxLength(35)]
[Display(Name="Sewadarstatus Name")]
public virtual System.String sewadarstatus_nm
{get{return this._sewadarstatus_nm;}set{this._sewadarstatus_nm = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("sewadarstatus_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_sewadarstatus_id); }  }

public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Sewadar_type_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Sewadar_type_Meta))]
[DataContract]
public partial class Sewadar_type : BaseEntity
{
public Sewadar_type()
{
}
public enum flds
{
Id, Display, sewadartype_id, sewadartype_nm, txn_ts, effective_from, effective_till, is_used_in_RMS}
private System.Int32? _sewadartype_id;
private System.Int32? _sewadartype_id_to;
private System.String _sewadartype_nm;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;
private System.String _is_used_in_RMS;


[DatabaseMap("sewadartype_id")]
[DataMember]
[Display(Name="Sewadartype ID")]
public virtual System.Int32? sewadartype_id
{get{return this._sewadartype_id;}set{this._sewadartype_id = value;}}
[DataMember]
public virtual System.Int32? sewadartype_id_to
{get{return this._sewadartype_id_to;}set{this._sewadartype_id_to = value;}}
public bool ShouldSerializesewadartype_id_to() { return false; }


[DatabaseMap("sewadartype_nm")]
[DataMember(IsRequired = true)]
[MaxLength(35)]
[Display(Name="Sewadartype Name")]
public virtual System.String sewadartype_nm
{get{return this._sewadartype_nm;}set{this._sewadartype_nm = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[DatabaseMap("is_used_in_RMS")]
[DataMember(IsRequired = true)]
[MaxLength(3)]
[Display(Name="Is Used In RMS")]
public virtual System.String is_used_in_RMS
{get{return this._is_used_in_RMS;}set{this._is_used_in_RMS = value;}}


[TSHint("sewadartype_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_sewadartype_id); }  }

public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Skill_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Skill_Meta))]
[DataContract]
public partial class Skill : BaseEntity
{
public Skill()
{
this.IdPropertyName = "skill_id";
this.DisplayPropertyName = "skill_nm";
}
public enum flds
{
Id, Display, skill_id, skill_nm, txn_ts, effective_from, effective_till}
private System.Int16? _skill_id;
private System.Int16? _skill_id_to;
private System.String _skill_nm;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("skill_id")]
[DataMember]
[Display(Name="Skill ID")]
public virtual System.Int16? skill_id
{get{return this._skill_id;}set{this._skill_id = value;}}
[DataMember]
public virtual System.Int16? skill_id_to
{get{return this._skill_id_to;}set{this._skill_id_to = value;}}
public bool ShouldSerializeskill_id_to() { return false; }


[DatabaseMap("skill_nm")]
[DataMember(IsRequired = true)]
[MaxLength(20)]
[Display(Name="Skill Name")]
public virtual System.String skill_nm
{get{return this._skill_nm;}set{this._skill_nm = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("skill_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_skill_id); }  }

[TSHint("skill_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_skill_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Society_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Society_Meta))]
[DataContract]
public partial class Society : BaseEntity
{
public Society()
{
this.IdPropertyName = "society_id";
this.DisplayPropertyName = "society_nm";
this.CodePropertyName = "society_cd";
}
public enum flds
{
Id, Display, society_id, society_cd, society_nm, effective_from, effective_till}
private System.Int16? _society_id;
private System.Int16? _society_id_to;
private System.String _society_cd;
private System.String _society_nm;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("society_id")]
[DataMember]
[Display(Name="Society ID")]
public virtual System.Int16? society_id
{get{return this._society_id;}set{this._society_id = value;}}
[DataMember]
public virtual System.Int16? society_id_to
{get{return this._society_id_to;}set{this._society_id_to = value;}}
public bool ShouldSerializesociety_id_to() { return false; }


[DatabaseMap("society_cd")]
[DataMember(IsRequired = true)]
[MaxLength(10)]
[Display(Name="Society Code")]
public virtual System.String society_cd
{get{return this._society_cd;}set{this._society_cd = value;}}


[DatabaseMap("society_nm")]
[DataMember(IsRequired = true)]
[MaxLength(50)]
[Display(Name="Society Name")]
public virtual System.String society_nm
{get{return this._society_nm;}set{this._society_nm = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("society_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_society_id); }  }

[TSHint("society_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_society_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class State_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(State_Meta))]
[DataContract]
public partial class State : BaseEntity
{
public State()
{
this.IdPropertyName = "state_id";
this.DisplayPropertyName = "state_nm";
this.CodePropertyName = "state_cd";
}
public enum flds
{
Id, Display, state_id, state_cd, state_nm, country_id_lookup, txn_ts, effective_from, effective_till}
private System.Int32? _state_id;
private System.Int32? _state_id_to;
private System.String _state_cd;
private System.String _state_nm;
private LookupRecord _country_id_lookup;
private System.Byte[] _txn_ts;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("state_id")]
[DataMember]
[Display(Name="State ID")]
public virtual System.Int32? state_id
{get{return this._state_id;}set{this._state_id = value;}}
[DataMember]
public virtual System.Int32? state_id_to
{get{return this._state_id_to;}set{this._state_id_to = value;}}
public bool ShouldSerializestate_id_to() { return false; }


[DatabaseMap("state_cd")]
[DataMember(IsRequired = true)]
[MaxLength(5)]
[Display(Name="State Code")]
public virtual System.String state_cd
{get{return this._state_cd;}set{this._state_cd = value;}}


[DatabaseMap("state_nm")]
[DataMember(IsRequired = true)]
[MaxLength(55)]
[Display(Name="State Name")]
public virtual System.String state_nm
{get{return this._state_nm;}set{this._state_nm = value;}}


[DatabaseMap("country_id")]
[DataMember]
[WDFLookup(alias:"CDB_COUNTRIES_COUNTRY_ID", required:true)]
[Display(Name="Country")]
public virtual LookupRecord country_id_lookup
{get{return this._country_id_lookup;}set{this._country_id_lookup = value;}}


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("state_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_state_id); }  }

[TSHint("state_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_state_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Sync_add_type_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Sync_add_type_Meta))]
[DataContract]
public partial class Sync_add_type 
{
public enum flds
{
address_type, mps_type_id, cdb_type_id}
private System.String _address_type;
private System.Int32? _mps_type_id;
private System.Int32? _mps_type_id_to;
private System.Int32? _cdb_type_id;
private System.Int32? _cdb_type_id_to;


[DatabaseMap("address_type")]
[DataMember]
[MaxLength(50)]
[Display(Name="Address Type")]
public virtual System.String address_type
{get{return this._address_type;}set{this._address_type = value;}}


[DatabaseMap("mps_type_id")]
[DataMember]
[Display(Name="Mps Type ID")]
public virtual System.Int32? mps_type_id
{get{return this._mps_type_id;}set{this._mps_type_id = value;}}
[DataMember]
public virtual System.Int32? mps_type_id_to
{get{return this._mps_type_id_to;}set{this._mps_type_id_to = value;}}
public bool ShouldSerializemps_type_id_to() { return false; }


[DatabaseMap("cdb_type_id")]
[DataMember]
[Display(Name="Cdb Type ID")]
public virtual System.Int32? cdb_type_id
{get{return this._cdb_type_id;}set{this._cdb_type_id = value;}}
[DataMember]
public virtual System.Int32? cdb_type_id_to
{get{return this._cdb_type_id_to;}set{this._cdb_type_id_to = value;}}
public bool ShouldSerializecdb_type_id_to() { return false; }



}
public partial class Sync_city_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Sync_city_Meta))]
[DataContract]
public partial class Sync_city 
{
public enum flds
{
mps_party_nm, mps_city_id, mps_city_nm, cdb_city_id, cdb_city_nm}
private System.String _mps_party_nm;
private System.Int32? _mps_city_id;
private System.Int32? _mps_city_id_to;
private System.String _mps_city_nm;
private System.Int32? _cdb_city_id;
private System.Int32? _cdb_city_id_to;
private System.String _cdb_city_nm;


[DatabaseMap("mps_party_nm")]
[DataMember]
[MaxLength(50)]
[Display(Name="Mps Party Name")]
public virtual System.String mps_party_nm
{get{return this._mps_party_nm;}set{this._mps_party_nm = value;}}


[DatabaseMap("mps_city_id")]
[DataMember]
[Display(Name="Mps City ID")]
public virtual System.Int32? mps_city_id
{get{return this._mps_city_id;}set{this._mps_city_id = value;}}
[DataMember]
public virtual System.Int32? mps_city_id_to
{get{return this._mps_city_id_to;}set{this._mps_city_id_to = value;}}
public bool ShouldSerializemps_city_id_to() { return false; }


[DatabaseMap("mps_city_nm")]
[DataMember]
[MaxLength(100)]
[Display(Name="Mps City Name")]
public virtual System.String mps_city_nm
{get{return this._mps_city_nm;}set{this._mps_city_nm = value;}}


[DatabaseMap("cdb_city_id")]
[DataMember]
[Display(Name="Cdb City ID")]
public virtual System.Int32? cdb_city_id
{get{return this._cdb_city_id;}set{this._cdb_city_id = value;}}
[DataMember]
public virtual System.Int32? cdb_city_id_to
{get{return this._cdb_city_id_to;}set{this._cdb_city_id_to = value;}}
public bool ShouldSerializecdb_city_id_to() { return false; }


[DatabaseMap("cdb_city_nm")]
[DataMember]
[MaxLength(100)]
[Display(Name="Cdb City Name")]
public virtual System.String cdb_city_nm
{get{return this._cdb_city_nm;}set{this._cdb_city_nm = value;}}



}
public partial class Sync_city_manually_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Sync_city_manually_Meta))]
[DataContract]
public partial class Sync_city_manually 
{
public enum flds
{
mps_city_id, mps_city_nm, cdb_city_id, cdb_city_nm, post_office_id}
private System.Int32? _mps_city_id;
private System.Int32? _mps_city_id_to;
private System.String _mps_city_nm;
private System.Int32? _cdb_city_id;
private System.Int32? _cdb_city_id_to;
private System.String _cdb_city_nm;
private System.Int32? _post_office_id;
private System.Int32? _post_office_id_to;


[DatabaseMap("mps_city_id")]
[DataMember]
[Display(Name="Mps City ID")]
public virtual System.Int32? mps_city_id
{get{return this._mps_city_id;}set{this._mps_city_id = value;}}
[DataMember]
public virtual System.Int32? mps_city_id_to
{get{return this._mps_city_id_to;}set{this._mps_city_id_to = value;}}
public bool ShouldSerializemps_city_id_to() { return false; }


[DatabaseMap("mps_city_nm")]
[DataMember]
[MaxLength(100)]
[Display(Name="Mps City Name")]
public virtual System.String mps_city_nm
{get{return this._mps_city_nm;}set{this._mps_city_nm = value;}}


[DatabaseMap("cdb_city_id")]
[DataMember]
[Display(Name="Cdb City ID")]
public virtual System.Int32? cdb_city_id
{get{return this._cdb_city_id;}set{this._cdb_city_id = value;}}
[DataMember]
public virtual System.Int32? cdb_city_id_to
{get{return this._cdb_city_id_to;}set{this._cdb_city_id_to = value;}}
public bool ShouldSerializecdb_city_id_to() { return false; }


[DatabaseMap("cdb_city_nm")]
[DataMember]
[MaxLength(100)]
[Display(Name="Cdb City Name")]
public virtual System.String cdb_city_nm
{get{return this._cdb_city_nm;}set{this._cdb_city_nm = value;}}


[DatabaseMap("post_office_id")]
[DataMember]
[Display(Name="Post Office ID")]
public virtual System.Int32? post_office_id
{get{return this._post_office_id;}set{this._post_office_id = value;}}
[DataMember]
public virtual System.Int32? post_office_id_to
{get{return this._post_office_id_to;}set{this._post_office_id_to = value;}}
public bool ShouldSerializepost_office_id_to() { return false; }



}
public partial class Sync_party_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Sync_party_Meta))]
[DataContract]
public partial class Sync_party 
{
public enum flds
{
party_nm, mps_party_id, cdb_party_id}
private System.String _party_nm;
private System.Int32? _mps_party_id;
private System.Int32? _mps_party_id_to;
private System.Int32? _cdb_party_id;
private System.Int32? _cdb_party_id_to;


[DatabaseMap("party_nm")]
[DataMember]
[MaxLength(50)]
[Display(Name="Party Name")]
public virtual System.String party_nm
{get{return this._party_nm;}set{this._party_nm = value;}}


[DatabaseMap("mps_party_id")]
[DataMember]
[Display(Name="Mps Party ID")]
public virtual System.Int32? mps_party_id
{get{return this._mps_party_id;}set{this._mps_party_id = value;}}
[DataMember]
public virtual System.Int32? mps_party_id_to
{get{return this._mps_party_id_to;}set{this._mps_party_id_to = value;}}
public bool ShouldSerializemps_party_id_to() { return false; }


[DatabaseMap("cdb_party_id")]
[DataMember]
[Display(Name="Cdb Party ID")]
public virtual System.Int32? cdb_party_id
{get{return this._cdb_party_id;}set{this._cdb_party_id = value;}}
[DataMember]
public virtual System.Int32? cdb_party_id_to
{get{return this._cdb_party_id_to;}set{this._cdb_party_id_to = value;}}
public bool ShouldSerializecdb_party_id_to() { return false; }



}
public partial class Tempperson_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Tempperson_Meta))]
[DataContract]
public partial class Tempperson 
{
public enum flds
{
title, first_nm, last_nm, gender, birth_dtm, cou}
private System.String _title;
private System.String _first_nm;
private System.String _last_nm;
private System.String _gender;
private System.DateTime? _birth_dtm;
private System.DateTime? _birth_dtm_to;
private System.Int32? _cou;
private System.Int32? _cou_to;


[DatabaseMap("title")]
[DataMember(IsRequired = true)]
[MaxLength(10)]
[Display(Name="Title")]
public virtual System.String title
{get{return this._title;}set{this._title = value;}}


[DatabaseMap("first_nm")]
[DataMember(IsRequired = true)]
[MaxLength(30)]
[Display(Name="First Name")]
public virtual System.String first_nm
{get{return this._first_nm;}set{this._first_nm = value;}}


[DatabaseMap("last_nm")]
[DataMember(IsRequired = true)]
[MaxLength(30)]
[Display(Name="Last Name")]
public virtual System.String last_nm
{get{return this._last_nm;}set{this._last_nm = value;}}


[DatabaseMap("gender")]
[DataMember(IsRequired = true)]
[MaxLength(6)]
[Display(Name="Gender")]
public virtual System.String gender
{get{return this._gender;}set{this._gender = value;}}


[DatabaseMap("birth_dtm")]
[DataMember(IsRequired = true)]
[Display(Name="Birth Date")]
public virtual System.DateTime? birth_dtm
{get{return this._birth_dtm;}set{this._birth_dtm = value;}}
[DataMember]
public virtual System.DateTime? birth_dtm_to
{get{return this._birth_dtm_to;}set{this._birth_dtm_to = value;}}
public bool ShouldSerializebirth_dtm_to() { return false; }


[DatabaseMap("cou")]
[DataMember]
[Display(Name="Cou")]
public virtual System.Int32? cou
{get{return this._cou;}set{this._cou = value;}}
[DataMember]
public virtual System.Int32? cou_to
{get{return this._cou_to;}set{this._cou_to = value;}}
public bool ShouldSerializecou_to() { return false; }



}
public partial class Unsync_address_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Unsync_address_Meta))]
[DataContract]
public partial class Unsync_address 
{
public enum flds
{
mps_party_id, mps_add_type_id}
private System.Int32? _mps_party_id;
private System.Int32? _mps_party_id_to;
private System.Int32? _mps_add_type_id;
private System.Int32? _mps_add_type_id_to;


[DatabaseMap("mps_party_id")]
[DataMember]
[Display(Name="Mps Party ID")]
public virtual System.Int32? mps_party_id
{get{return this._mps_party_id;}set{this._mps_party_id = value;}}
[DataMember]
public virtual System.Int32? mps_party_id_to
{get{return this._mps_party_id_to;}set{this._mps_party_id_to = value;}}
public bool ShouldSerializemps_party_id_to() { return false; }


[DatabaseMap("mps_add_type_id")]
[DataMember]
[Display(Name="Mps Add Type ID")]
public virtual System.Int32? mps_add_type_id
{get{return this._mps_add_type_id;}set{this._mps_add_type_id = value;}}
[DataMember]
public virtual System.Int32? mps_add_type_id_to
{get{return this._mps_add_type_id_to;}set{this._mps_add_type_id_to = value;}}
public bool ShouldSerializemps_add_type_id_to() { return false; }



}
public partial class Working_unit_entity_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Working_unit_entity_Meta))]
[DataContract]
public partial class Working_unit_entity : BaseEntity
{
public Working_unit_entity()
{
}
public enum flds
{
Id, Display, entity_id, entity_singular_nm, entity_plural_nm, effective_from, effective_till}
private System.Int16? _entity_id;
private System.Int16? _entity_id_to;
private System.String _entity_singular_nm;
private System.String _entity_plural_nm;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;


[DatabaseMap("entity_id")]
[DataMember]
[Display(Name="Entity ID")]
public virtual System.Int16? entity_id
{get{return this._entity_id;}set{this._entity_id = value;}}
[DataMember]
public virtual System.Int16? entity_id_to
{get{return this._entity_id_to;}set{this._entity_id_to = value;}}
public bool ShouldSerializeentity_id_to() { return false; }


[DatabaseMap("entity_singular_nm")]
[DataMember(IsRequired = true)]
[MaxLength(20)]
[Display(Name="Entity Singular Name")]
public virtual System.String entity_singular_nm
{get{return this._entity_singular_nm;}set{this._entity_singular_nm = value;}}


[DatabaseMap("entity_plural_nm")]
[DataMember(IsRequired = true)]
[MaxLength(20)]
[Display(Name="Entity Plural Name")]
public virtual System.String entity_plural_nm
{get{return this._entity_plural_nm;}set{this._entity_plural_nm = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[TSHint("entity_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_entity_id); }  }

public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
public partial class Working_unit_sanctioned_strength_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Working_unit_sanctioned_strength_Meta))]
[DataContract]
public partial class Working_unit_sanctioned_strength : BaseEntity
{
public Working_unit_sanctioned_strength()
{
}
public enum flds
{
Id, Display, working_unit_id_lookup, honorary_sewadar_cnt, parshadi_sewadar_cnt}
private LookupRecord _working_unit_id_lookup;
private System.Int16? _honorary_sewadar_cnt;
private System.Int16? _honorary_sewadar_cnt_to;
private System.Int16? _parshadi_sewadar_cnt;
private System.Int16? _parshadi_sewadar_cnt_to;


[DatabaseMap("working_unit_id")]
[DataMember]
[WDFLookup(alias:"CDB_WORKING_UNITS_WORKING_UNIT_ID", required:true)]
[Display(Name="Working Unit")]
public virtual LookupRecord working_unit_id_lookup
{get{return this._working_unit_id_lookup;}set{this._working_unit_id_lookup = value;}}


[DatabaseMap("honorary_sewadar_cnt")]
[DataMember(IsRequired = true)]
[Display(Name="Honorary Sewadar Cnt")]
public virtual System.Int16? honorary_sewadar_cnt
{get{return this._honorary_sewadar_cnt;}set{this._honorary_sewadar_cnt = value;}}
[DataMember]
public virtual System.Int16? honorary_sewadar_cnt_to
{get{return this._honorary_sewadar_cnt_to;}set{this._honorary_sewadar_cnt_to = value;}}
public bool ShouldSerializehonorary_sewadar_cnt_to() { return false; }


[DatabaseMap("parshadi_sewadar_cnt")]
[DataMember(IsRequired = true)]
[Display(Name="Parshadi Sewadar Cnt")]
public virtual System.Int16? parshadi_sewadar_cnt
{get{return this._parshadi_sewadar_cnt;}set{this._parshadi_sewadar_cnt = value;}}
[DataMember]
public virtual System.Int16? parshadi_sewadar_cnt_to
{get{return this._parshadi_sewadar_cnt_to;}set{this._parshadi_sewadar_cnt_to = value;}}
public bool ShouldSerializeparshadi_sewadar_cnt_to() { return false; }


[TSHint("working_unit_id_lookup")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_working_unit_id_lookup.Id); }  }

}
public partial class Working_unit_Meta {}//The contents of this class should be defined by developer in other file containing partial class. This fragment is for compilation only.
[MetadataType(typeof(Working_unit_Meta))]
[DataContract]
public partial class Working_unit : BaseEntity
{
public Working_unit()
{
this.IdPropertyName = "working_unit_id";
this.DisplayPropertyName = "working_unit_nm";
this.CodePropertyName = "working_unit_cd";
}
public enum flds
{
Id, Display, working_unit_id, working_unit_cd, working_unit_nm, is_root, is_leaf, society_id_lookup, is_staff_posted, working_unit_entity_id_lookup, group_working_unit_id_lookup, effective_from, effective_till, txn_ts}
private System.Int16? _working_unit_id;
private System.Int16? _working_unit_id_to;
private System.String _working_unit_cd;
private System.String _working_unit_nm;
private System.String _is_root;
private System.String _is_leaf;
private LookupRecord _society_id_lookup;
private System.String _is_staff_posted;
private LookupRecord _working_unit_entity_id_lookup;
private LookupRecord _group_working_unit_id_lookup;
private System.DateTime? _effective_from;
private System.DateTime? _effective_from_to;
private System.DateTime? _effective_till;
private System.DateTime? _effective_till_to;
private System.Byte[] _txn_ts;


[DatabaseMap("working_unit_id")]
[DataMember]
[Display(Name="Working Unit ID")]
public virtual System.Int16? working_unit_id
{get{return this._working_unit_id;}set{this._working_unit_id = value;}}
[DataMember]
public virtual System.Int16? working_unit_id_to
{get{return this._working_unit_id_to;}set{this._working_unit_id_to = value;}}
public bool ShouldSerializeworking_unit_id_to() { return false; }


[DatabaseMap("working_unit_cd")]
[DataMember(IsRequired = true)]
[MaxLength(10)]
[Display(Name="Working Unit Code")]
public virtual System.String working_unit_cd
{get{return this._working_unit_cd;}set{this._working_unit_cd = value;}}


[DatabaseMap("working_unit_nm")]
[DataMember(IsRequired = true)]
[MaxLength(50)]
[Display(Name="Working Unit Name")]
public virtual System.String working_unit_nm
{get{return this._working_unit_nm;}set{this._working_unit_nm = value;}}


[DatabaseMap("is_root")]
[DataMember(IsRequired = true)]
[MaxLength(3)]
[Display(Name="Is Root")]
public virtual System.String is_root
{get{return this._is_root;}set{this._is_root = value;}}


[DatabaseMap("is_leaf")]
[DataMember(IsRequired = true)]
[MaxLength(3)]
[Display(Name="Is Leaf")]
public virtual System.String is_leaf
{get{return this._is_leaf;}set{this._is_leaf = value;}}


[DatabaseMap("society_id")]
[DataMember]
[WDFLookup(alias:"CDB_SOCIETIES_SOCIETY_ID", required:true)]
[Display(Name="Society")]
public virtual LookupRecord society_id_lookup
{get{return this._society_id_lookup;}set{this._society_id_lookup = value;}}


[DatabaseMap("is_staff_posted")]
[DataMember(IsRequired = true)]
[MaxLength(3)]
[Display(Name="Is Staff Posted")]
public virtual System.String is_staff_posted
{get{return this._is_staff_posted;}set{this._is_staff_posted = value;}}


[DatabaseMap("working_unit_entity_id")]
[DataMember]
[WDFLookup(alias:"CDB_WORKING_UNIT_ENTITIES_WORKING_UNIT_ENTITY_ID", required:true)]
[Display(Name="Working Unit Entity")]
public virtual LookupRecord working_unit_entity_id_lookup
{get{return this._working_unit_entity_id_lookup;}set{this._working_unit_entity_id_lookup = value;}}


[DatabaseMap("group_working_unit_id")]
[DataMember]
[WDFLookup(alias:"CDB_WORKING_UNITS_GROUP_WORKING_UNIT_ID", required:false)]
[Display(Name="Group Working Unit")]
public virtual LookupRecord group_working_unit_id_lookup
{get{return this._group_working_unit_id_lookup;}set{this._group_working_unit_id_lookup = value;}}


[DatabaseMap("effective_from")]
[DataMember(IsRequired = true)]
[Display(Name="Effective From")]
public virtual System.DateTime? effective_from
{get{return this._effective_from;}set{this._effective_from = value;}}
[DataMember]
public virtual System.DateTime? effective_from_to
{get{return this._effective_from_to;}set{this._effective_from_to = value;}}
public bool ShouldSerializeeffective_from_to() { return false; }


[DatabaseMap("effective_till")]
[DataMember(IsRequired = true)]
[Display(Name="Effective Till")]
public virtual System.DateTime? effective_till
{get{return this._effective_till;}set{this._effective_till = value;}}
[DataMember]
public virtual System.DateTime? effective_till_to
{get{return this._effective_till_to;}set{this._effective_till_to = value;}}
public bool ShouldSerializeeffective_till_to() { return false; }


[DatabaseMap("txn_ts")]
[DataMember(IsRequired = true)]
[Display(Name="Txn Ts")]
public virtual System.Byte[] txn_ts
{get{return this._txn_ts;}set{this._txn_ts = value;}}


[TSHint("working_unit_id")]
[DataMember]
[ReadOnly(true)]
public override string Id { get { return Convert.ToString(_working_unit_id); }  }

[TSHint("working_unit_nm")]
[DataMember]
public override string Display { get { return Convert.ToString(_working_unit_nm); }  }
public override bool IsActive {get { return DateTime.Now >=this._effective_from && DateTime.Now<=this._effective_till;}}
}
}
