using DCC.UMB.WDF.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace CDBModel 
{
    public class Level1StateViewModel : Level_1_address_component 
    {
        [DataMember]
        [DatabaseMap("country_id_display")]
        [Display(Name = "Country Name")]
        public string country_id_display { get; set; }
    }
}