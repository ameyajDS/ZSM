using DCC.UMB.WDF.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace CDBModel {
    public class WorkingUnitViewModel : Working_unit {       
        [DataMember(IsRequired = true)]
        [Display(Name = "Is Root")]
        public System.Boolean Is_root {
            get {
                return this.is_root == "Yes" ? true : false;
            }
            set {
                this.is_root = value == true ? "Yes" : "No";
            }
        }

        [DataMember(IsRequired = true)]
        [Display(Name = "Is Leaf")]
        public System.Boolean Is_leaf {
            get {
                return this.is_leaf == "Yes" ? true : false;
            }
            set {
                this.is_leaf = value == true ? "Yes" : "No";
            }
        }

        [DataMember(IsRequired = true)]
        [Display(Name = "Is Staff Posted")]
        public System.Boolean Is_staff_posted {
            get {
                return this.is_staff_posted == "Yes" ? true : false;
            }
            set {
                this.is_staff_posted = value == true ? "Yes" : "No";
            }
        }
    }
}