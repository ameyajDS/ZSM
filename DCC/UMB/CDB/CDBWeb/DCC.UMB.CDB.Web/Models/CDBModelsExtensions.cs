using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using DCC.UMB.WDF.Models;
using DCC.UMB.WDF.Models.Record;
using DCC.UMB.WDF.Views;
namespace CDBModel {
    
   /* public partial class Audit_log {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }*/
    public partial class Camera {
        public override string Display {
            get { return Convert.ToString(this.camera_id); }
        }
    }
    public partial class Md_entities_operations_log {
        public override string Display {
            get { return this.Id; }
        }
    }
    public partial class Md_entities_reference {
        public override string Display {
            get { return this.Id; }
        }
    }
 public partial class Md_entity{
        public override string Display {
            get { return this.Id; }
        }
    }

    public partial class Districts_or_city {
        [DataMember]
        public override string Display {
            get { return Convert.ToString(this.district_nm); }
        }
    }
    public partial class Epabx_line {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }
    public partial class Initiation_place {
        public override string Display {
            get { return Convert.ToString(this.place_id); }
        }
    }
    public partial class Marital_status {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }
    public partial class P_and_t_line {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }
    public partial class Party_address {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }
    public partial class Responsibility_type {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }
    public partial class Satsang_centre_type {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }
    public partial class Sewadar_Status {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }
    public partial class Sewadar_type {
        public override string Display {
            get { return Convert.ToString(this.sewadartype_nm); }
        }
    }
    public partial class Working_unit_entity {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }
    public partial class Working_unit_sanctioned_strength {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }
    public partial class Qualification_type {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }
    public partial class Person {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }
    public partial class Person_title {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }
    public partial class Representative {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }
    public partial class Satsang_programme {
        public override string Display {
            get { return Convert.ToString(this.Id); }
        }
    }
    
    //[DataContract]
    //public partial class GeoLocation : BaseEntity {
    //    public enum flds {
    //        Id, Display, geoLocation_id, country_id_lookup, state_id_lookup, district_or_city_id_lookup, post_office_id_lookup,
    //    }
    //    private System.Int32 _geoLocation_id;
    //    private LookupRecord _country_id_lookup;
    //    private LookupRecord _state_id_lookup;
    //    private LookupRecord _district_or_city_id_lookup;
    //    private LookupRecord _post_office_id_lookup;


    //    [DatabaseMap("geoLocation_id")]
    //    [ReadOnly(true)]
    //    [DataMember]
    //    [Display(Name = "GeoLocation ID")]
    //    public virtual System.Int32 geoLocation_id { get { return this._geoLocation_id; } set { this._geoLocation_id = value; } }


    //    [DatabaseMap("country_id")]
    //    [DataMember(IsRequired = true)]
    //    [WDFLookup(alias: "CDB_GEOLOCATION_COUNTRY_ID", required: true)]
    //    [Display(Name = "Country")]
    //    public virtual LookupRecord country_id_lookup { get { return this._country_id_lookup; } set { this._country_id_lookup = value; } }


    //    [DatabaseMap("state_id")]
    //    [DataMember]
    //    [WDFLookup(alias: "CDB_GEOLOCATION_STATE_ID", required: true)]
    //    [Display(Name = "State")]
    //    public virtual LookupRecord state_id_lookup { get { return this._state_id_lookup; } set { this._state_id_lookup = value; } }


    //    [DatabaseMap("district_or_city_id")]
    //    [DataMember]
    //    [WDFLookup(alias: "CDB_GEOLOCATION_DISTRICT_OR_CITY_ID", required: false)]
    //    [Display(Name = "District Or City")]
    //    public virtual LookupRecord district_or_city_id_lookup { get { return this._district_or_city_id_lookup; } set { this._district_or_city_id_lookup = value; } }


    //    [DatabaseMap("post_office_id")]
    //    [DataMember]
    //    [WDFLookup(alias: "CDB_GEOLOCATION_POST_OFFICE_ID", required: false)]
    //    [Display(Name = "Post Office")]
    //    public virtual LookupRecord post_office_id_lookup { get { return this._post_office_id_lookup; } set { this._post_office_id_lookup = value; } }

    //    [DataMember]
    //    [ReadOnly(true)]
    //    public override string Id { get { return Convert.ToString(this._geoLocation_id); } }
    //    public override string Display { get { return Convert.ToString(this._geoLocation_id); } }

    //}
    //public class LookupServiceAlias {
    //    public const string CDB_GEOLOCATION_COUNTRY_ID = "/auth/api/CDBCountry/LookupListing";
    //    public const string CDB_GEOLOCATION_STATE_ID = "/auth/api/CDBState/LookupListing";
    //    public const string CDB_GEOLOCATION_DISTRICT_OR_CITY_ID = "/auth/api/CDBDistricts_or_city/LookupListing";
    //    public const string CDB_GEOLOCATION_POST_OFFICE_ID = "/auth/api/CDBPost_office/LookupListing";
    //}
}
