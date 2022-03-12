/// <reference path="../app-include.ts"/>

module CDBModel {
    export class WorkingUnitViewModel extends Working_unit {

        constructor(
            public Is_root?: boolean 
            , public Is_leaf?: boolean
            , public Is_staff_posted?: boolean
            ) {
                super();                                        

                //this.Is_root = (this.is_root == "Yes" ? true : this.is_root == "No"? false :  undefined);
                //this.Is_leaf = (this.is_leaf == "Yes" ? true : this.is_leaf == "No"? false : undefined);
                //this.Is_staff_posted = (this.is_staff_posted == "Yes" ? true : this.is_staff_posted == "No" ? false : undefined);
                this.Is_root = (this.is_root == "Yes" ? true : false);
                this.Is_leaf = (this.is_leaf == "Yes" ? true : false);
                this.Is_staff_posted = (this.is_staff_posted == "Yes" ? true : false);
        }        
        static fld_Is_root: string = "Is_root";
        static fld_Is_leaf: string = "Is_leaf";
        static fld_Is_staff_posted: string = "Is_staff_posted";
    }
}