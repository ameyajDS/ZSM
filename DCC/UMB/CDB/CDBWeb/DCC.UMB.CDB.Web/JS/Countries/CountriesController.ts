/// <reference path="../app-include.ts"/>
module CDB {
    export class CountriesManager extends wdf.BaseScreenManager implements wdf.IScreenManager {
        model = new CDBModel.CountriesViewModel();

        location: ng.ILocationService;
        date: Date = new Date(Date.now());
        grdController: wdf.grid.gridController = null;
        listCountries: Array<CDBModel.CountriesViewModel>;//represents the search results.
        bankGridFilterOptions = new wdf.grid.FilterOptions("", true);
        IsCallFromSave: boolean = false;     

        constructor(scope: wdf.IScope, http: ng.IHttpService, routeProvider: ng.route.IRouteService, routeParams: ng.route.IRouteParamsService) {            
            super(wdf.UIModes.Insert, scope, http, routeProvider, routeParams);
            console.log("Countries constructor called");
            this.setDates();
            this.loadScreenForPassedInId(); 
            this.SetupLookupSuggestionsForAllLookupsOnThisScreen();
        }

        setDates() {
            this.model.effective_from = this.date;
            this.model.effective_till = new Date(2070, 0, 1, 0, 0, 0, 0);
        }

        getFirstFocusableElement() {
            return $("#" + CDBModel.CountriesViewModel.fld_country_nm);
        }

        save(closeAndReturn?: boolean) {
            this.httpService.post("/cdb/api/CDBCountry/save", this.model).then((response: any) => {
                this.model = response.data;
                wdf.utils.showSuccessMessage("Successfully saved country with country id : " + this.model.country_id);

                if (closeAndReturn && closeAndReturn === true) {//if it is a called screen, then return to the caller
                    this.model.country_id = response.data.Id;
                    this.closeAndReturn(this.model);
                } else {
                    if (this.isInsertMode()) {
                        this.clear();
                    } else {
                        this.loadBrowseView(new wdf.EmptyLookupRecord(this.model.Id));
                    }
                }
                this.clear();
                wdf.utils.showSuccessMessage(response.data.message);
            }, (response: any) => {
                    if (response.data.message) {
                        wdf.utils.showErrorMessage(response.data.message);
                    } else {
                        wdf.utils.showErrorMessage(response.data);
                    }
                });
        }
        loadBrowseView(rowObj: wdf.ILookupRecord) {
            this.httpService.get("/cdb/api/CDBCountry/Get?Id=" + rowObj.Id).then((response: any) => {
                wdf.utils.parseAndConvertDates(response.data);
                this.model = response.data;

                if (this.IsCallFromSave) {
                    this.IsCallFromSave = false;
                    wdf.utils.showSuccessMessage("Sucessfully saved !!");
                }
            }, (response: any) => {
                    wdf.utils.showErrorMessage(response.data);
                }
                ); // Get record
        }

        getSearchResults(): ng.IHttpPromise<wdf.BaseEntity> {
            return this.httpService.post("/cdb/api/CDBCountry/GridListing", this.model);
        }

        isReadyToSave(): boolean {
            return true;
        }
        
        isReadyToDelete(): boolean {
            return true;
        }

        
        clear() {
            this.model = new CDBModel.CountriesViewModel();
            if (this.currentUIMode == wdf.UIModes.Insert) {
                this.setDates();
            }

        }
        
        getScreenId(): string {
            return "GEO_01";
        }

        getDebugJson(): string {
            return angular.toJson(this.model, true);
        }

        isFieldEditable(fieldId: string) {
            switch (fieldId) {
                case CDBModel.CountriesViewModel.fld_country_id:
                    return this.currentUIMode == wdf.UIModes.Query;
                    break;
            }
            return true;
        }

        isElementVisible(elementId: string): boolean {
            return true;
        }

        print() {
        }

        getActionsPromise(): ng.IHttpPromise<any> {
            return null;
        }

        executeScreenAction(actionName: string): ng.IHttpPromise<any> {
            return null;
        }
        delete() {
            this.httpService.post("/cdb/api/CDBCountry/delete", this.model).then(
                () => {//On Success
                    this.clear();
                    wdf.utils.getCoreManager().fireQuery();
                    wdf.utils.showSuccessMessage("Country deleted successfully!");

                },
                () => {//On Failure
                    wdf.utils.showErrorMessage("Country can not be deleted!");
                }
                );
        }

        deleteRecord() {
            this.httpService.post("/cdb/api/CDBCountry/delete", this.model).then(
                () => {//On Success
                    this.clear();
                    wdf.utils.getCoreManager().fireQuery();
                    wdf.utils.showSuccessMessage("Country deleted successfully!");

                },
                () => {//On Failure
                    wdf.utils.showErrorMessage("Country can not be deleted!");
                }
                );
        }

    }
    export class CountriesController {
        constructor(scope: wdf.IScope, http: ng.IHttpService, location: ng.ILocationService, routeProvider: ng.route.IRouteService, routeParams: ng.route.IRouteParamsService) {
            console.log("ContriesController Constructor Called");
            scope.mgr = new CDB.CountriesManager(scope, http, routeProvider, routeParams);
        }
    }
    export class CountriesRouter {
        constructor($routeProvider: ng.route.IRouteProvider) {
            console.debug("ContriesRouter invoked");
            $routeProvider.when("/Level-0Countries", {
                templateUrl: '/cdb/Partials/Level_0_Countries'
            });
            $routeProvider.when("/Level-0Countries/:Id", {
                templateUrl: '/cdb/Partials/Level-0Countries'
            });
        }
    }
}
console.log("Inside countriesController");
cdbApp.controller("CountriesController", ['$scope', '$http', '$location', '$route', '$routeParams', CDB.CountriesController]);
cdbApp.config(['$routeProvider', CDB.CountriesRouter]);