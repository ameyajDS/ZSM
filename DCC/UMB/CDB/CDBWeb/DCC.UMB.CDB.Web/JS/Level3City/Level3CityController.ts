/// <reference path="../app-include.ts"/>

module CDB {
    export class Level3CityManager extends wdf.BaseScreenManager implements wdf.IScreenManager {
        model = new CDBModel.Level3CityViewModel();      

        date: Date = new Date(Date.now());
        IsCallFromSave: boolean = false; 

        constructor(scope: wdf.IScope, http: ng.IHttpService, routeProvider: ng.route.IRouteService, routeParams: ng.route.IRouteParamsService) {
            super(wdf.UIModes.Insert, scope, http, routeProvider, routeParams);
            console.log("Level3City constructor called");
            this.setDates();
            this.loadScreenForPassedInId();   
            this.SetupLookupSuggestionsForAllLookupsOnThisScreen();         
        }

        getScreenId(): string {
            return "GEO_04";
        }

        setDates() {
            this.model.effective_from = this.date;
            this.model.effective_till = new Date(2070, 0, 1, 0, 0, 0, 0);
        }

        getFirstFocusableElement() {
            return $("#" + CDBModel.Level3CityViewModel.fld_level_3_address_component_nm);
        }

        save(closeAndReturn?: boolean) {
            this.httpService.post("/cdb/api/CDBLevel3City/save", this.model).then((response: any) => {
                this.model = response.data;
                wdf.utils.showSuccessMessage("Successfully saved Level 3 Address with level_3_address_component_id : " + this.model.level_3_address_component_id);

                if (closeAndReturn && closeAndReturn === true) {//if it is a called screen, then return to the caller
                    this.model.level_3_address_component_id = response.data.Id;
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
            this.httpService.get("/cdb/api/CDBLevel3City/Get?Id=" + rowObj.Id).then((response: any) => {
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
            return this.httpService.post("/cdb/api/CDBLevel3City/GridListing", this.model);
        }
        
        isReadyToSave(): boolean {
            return true;
        }


        isReadyToDelete(): boolean {
            return true;
        }       

        clear() {
            this.model = new CDBModel.Level3CityViewModel();
            if (this.currentUIMode == wdf.UIModes.Insert) {
                this.setDates();
            }

        }
       
        getDebugJson(): string {
            return angular.toJson(this.model, true);
        }

        isFieldEditable(fieldId: string) {
            switch (fieldId) {
                case CDBModel.Level3CityViewModel.fld_level_3_address_component_id:
                    return this.currentUIMode == wdf.UIModes.Query;
                    break;
            }
            return true;
        }

        isElementVisible(elementId: string): boolean {
            return true;
        }

        print() { }

        getActionsPromise(): ng.IHttpPromise<any> {
            return null;
        }

        executeScreenAction(actionName: string): ng.IHttpPromise<any> {
            return null;
        }

        deleteRecord() {
            this.httpService.post("/cdb/api/CDBLevel3City/delete", this.model).then(
                () => {//On Success
                    this.clear();
                    wdf.utils.getCoreManager().fireQuery();
                    wdf.utils.showSuccessMessage("Level3 address deleted successfully!");

                },
                () => {//On Failure
                    wdf.utils.showErrorMessage("Level3 address can not be deleted!");
                }
                );
        }

        delete() {
            this.httpService.post("/cdb/api/CDBLevel3City/delete", this.model).then(
                () => {//On Success
                    this.clear();
                    wdf.utils.getCoreManager().fireQuery();
                    wdf.utils.showSuccessMessage("Level3 address deleted successfully!");

                },
                () => {//On Failure
                    wdf.utils.showErrorMessage("Level3 address can not be deleted!");
                }
                );
        }
                
        level_2_address_component_id_lookup_LookupFired(event: any, targetModel: wdf.BaseEntity, lookupPropertyName: string, isLogicalSearch: boolean) {
            return wdf.LookupManager.ShowLookupDialog(event, targetModel, lookupPropertyName, isLogicalSearch,
                null,
                (args: wdf.LookupResultSelectedEventArgs) => {
                    console.log("Level 2 Address Selected");
                });
        }
    }

    export class Level3CityController {
        constructor(scope: wdf.IScope, http: ng.IHttpService, location: ng.ILocationService, routeProvider: ng.route.IRouteService, routeParams: ng.route.IRouteParamsService) {
            console.log("Level3CityController Constructor Called");
            scope.mgr = new CDB.Level3CityManager(scope, http, routeProvider, routeParams);
        }
    }
    export class Level3CityRouter {
        constructor($routeProvider: ng.route.IRouteProvider) {
            console.debug("Level3CityRouter invoked");

            $routeProvider.when("/Level-3Cities", {
                templateUrl: '/cdb/Partials/Level_3_Cities'
            });
        }
    }
}

console.log("Inside Level3CityController");
cdbApp.controller("Level3CityController", ['$scope', '$http', '$location', '$route', '$routeParams', CDB.Level3CityController]);
cdbApp.config(['$routeProvider', CDB.Level3CityRouter]);
 