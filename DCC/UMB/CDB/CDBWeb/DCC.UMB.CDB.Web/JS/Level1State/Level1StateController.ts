/// <reference path="../app-include.ts"/>

module CDB {
    export class Level1StateManager extends wdf.BaseScreenManager implements wdf.IScreenManager {
        model = new CDBModel.Level1StateViewModel();      

        date: Date = new Date(Date.now());
        IsCallFromSave: boolean = false; 
        constructor(scope: wdf.IScope, http: ng.IHttpService, routeProvider: ng.route.IRouteService, routeParams: ng.route.IRouteParamsService) {
            super(wdf.UIModes.Insert, scope, http, routeProvider, routeParams);
            console.log("Level1State constructor called");
            this.setDates();
            this.loadScreenForPassedInId();
            this.SetupLookupSuggestionsForAllLookupsOnThisScreen();
        }

        getScreenId(): string {
            return "GEO_02";
        }

        setDates() {
            this.model.effective_from = this.date;
            this.model.effective_till = new Date(2070, 0, 1, 0, 0, 0, 0);
        }

        getFirstFocusableElement() {
            return $("#" + CDBModel.Level1StateViewModel.fld_level_1_address_component_nm);
        }

        save(closeAndReturn?: boolean) {
            this.httpService.post("/cdb/api/CDBLevel1State/save", this.model).then((response: any) => {
                this.model = response.data;
                wdf.utils.showSuccessMessage("Successfully saved Level 1 address with level_2_address_component_id : " + this.model.level_1_address_component_id);

                if (closeAndReturn && closeAndReturn === true) {//if it is a called screen, then return to the caller
                    this.model.level_1_address_component_id = response.data.Id;
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
            this.httpService.get("/cdb/api/CDBLevel1State/Get?Id=" + rowObj.Id).then((response: any) => {
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
            return this.httpService.post("/cdb/api/CDBLevel1State/GridListing", this.model);
        }
        
        isReadyToSave(): boolean {
            return true;
        }


        isReadyToDelete(): boolean {
            return true;
        }       

        clear() {
            this.model = new CDBModel.Level1StateViewModel();
            if (this.currentUIMode == wdf.UIModes.Insert) {
                this.setDates();
            }

        }
       
        getDebugJson(): string {
            return angular.toJson(this.model, true);
        }

        isFieldEditable(fieldId: string) {
            switch (fieldId) {
                case CDBModel.Level1StateViewModel.fld_level_1_address_component_id:
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
            this.httpService.post("/cdb/api/CDBLevel1State/delete", this.model).then(
                () => {//On Success
                    this.clear();
                    wdf.utils.getCoreManager().fireQuery();
                    wdf.utils.showSuccessMessage("Level1 address deleted successfully!");

                },
                () => {//On Failure
                    wdf.utils.showErrorMessage("Level1 address can not be deleted!");
                }
                );
        }

        delete() {
            this.httpService.post("/cdb/api/CDBLevel1State/delete", this.model).then(
                () => {//On Success
                    this.clear();
                    wdf.utils.getCoreManager().fireQuery();
                    wdf.utils.showSuccessMessage("Level1 address deleted successfully!");

                },
                () => {//On Failure
                    wdf.utils.showErrorMessage("Level1 address can not be deleted!");
                }
                );
        }
        country_id_lookup_LookupFired(event: any, targetModel: wdf.BaseEntity, lookupPropertyName: string, isLogicalSearch: boolean) {
           return wdf.LookupManager.ShowLookupDialog(event, targetModel, lookupPropertyName, isLogicalSearch,
                null,
                (args: wdf.LookupResultSelectedEventArgs) => {
                    console.log("Country Selected");
                });
        }
    }

    export class Level1StateController {
        constructor(scope: wdf.IScope, http: ng.IHttpService, location: ng.ILocationService, routeProvider: ng.route.IRouteService, routeParams: ng.route.IRouteParamsService) {
            console.log("Level1StateController Constructor Called");
            scope.mgr = new CDB.Level1StateManager(scope, http, routeProvider, routeParams);
        }
    }
    export class Level1StateRouter {
        constructor($routeProvider: ng.route.IRouteProvider) {
            console.debug("Level1StateRouter invoked");

            $routeProvider.when("/Level-1States", {
                templateUrl: '/cdb/Partials/Level_1_States'
            });
        }
    }
}

console.log("Inside Level1StateController");
cdbApp.controller("Level1StateController", ['$scope', '$http', '$location', '$route', '$routeParams', CDB.Level1StateController]);
cdbApp.config(['$routeProvider', CDB.Level1StateRouter]);
 