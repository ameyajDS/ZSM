using DCC.UMB.WDF.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace CDBModel 
{
    public class WorkingUnitEnititiesViewModel : Working_unit_entity 
    {
        [TSHint("entity_singular_nm")]
        [DataMember]
        public override string Display { get { return Convert.ToString(entity_singular_nm); } }
    }
}