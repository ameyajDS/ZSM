﻿using DCC.UMB.WDF.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace CDBModel 
{
    public class Level3CityViewModel : Level_3_address_component 
    {
        [DataMember]
        [DatabaseMap("level_2_address_component_id_display")]
        [Display(Name = "Level 2 Address")]
        public string level_2_address_component_id_display { get; set; }

        [DataMember]
        [DatabaseMap("level_1_address_component_nm")]
        [Display(Name = "Level 1 Address")]
        public string level_1_address_component_nm { get; set; }

        [DataMember]
        [DatabaseMap("country_nm")]
        [Display(Name = "Country Name")]
        public string country_nm { get; set; }
    }
}