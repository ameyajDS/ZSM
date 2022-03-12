/// <reference path="../app-include.ts"/>

module CDBModel {
    export class CountriesViewModel extends Country {
        constructor() {
            super();
            this.is_authentic = true;
        }
    }
}