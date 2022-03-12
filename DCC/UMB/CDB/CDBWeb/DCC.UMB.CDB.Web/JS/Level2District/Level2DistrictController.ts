/// <reference path="../app-include.ts"/>

module CDB {
    export class Level2DistrictManager extends wdf.BaseScreenManager implements wdf.IScreenManager {
        model = new CDBModel.Level2DistrictViewModel();      

        date: Date = new Date(Date.now());
        IsCallFromSave: boolean = false; 

        constructor(scope: wdf.IScope, http: ng.IHttpService, routeProvider: ng.route.IRouteService, routeParams: ng.route.IRouteParamsService) {
            super(wdf.UIModes.Insert, scope, http, routeProvider, routeParams);
            console.log("Level2District constructor called");
            this.setDates();
            this.loadScreenForPassedInId();  
            this.SetupLookupSuggestionsForAllLookupsOnThisScreen();          
        }

        getScreenId(): string {
            return "GEO_03";
        }

        setDates() {
            this.model.effective_from = this.date;
            this.model.effective_till = new Date(2070, 0, 1, 0, 0, 0, 0);
        }

        getFirstFocusableElement() {
            return $("#" + CDBModel.Level2DistrictViewModel.fld_level_2_address_component_nm);
        }

        save(closeAndReturn?: boolean) {
            this.httpService.post("/cdb/api/CDBLevel2District/save", this.model).then((response: any) => {
                this.model = response.data;
                wdf.utils.showSuccessMessage("Successfully saved Level 2 address with level_2_address_component_id : " + this.model.level_2_address_component_id);

                if (closeAndReturn && closeAndReturn === true) {//if it is a called screen, then return to the caller
                    this.model.level_2_address_component_id = response.data.Id;
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
            this.httpService.get("/cdb/api/CDBLevel2District/Get?Id=" + rowObj.Id).then((response: any) => {
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
            return this.httpService.post("/cdb/api/CDBLevel2District/GridListing", this.model);
        }
        
        isReadyToSave(): boolean {
            return true;
        }


        isReadyToDelete(): boolean {
            return true;
        }       

        clear() {
            this.model = new CDBModel.Level2DistrictViewModel();
            if (this.currentUIMode == wdf.UIModes.Insert) {
                this.setDates();
            }

        }
       
        getDebugJson(): string {
            return angular.toJson(this.model, true);
        }

        isFieldEditable(fieldId: string) {
            switch (fieldId) {
                case CDBModel.Level2DistrictViewModel.fld_level_2_address_component_id:
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
            this.httpService.post("/cdb/api/CDBLevel2District/delete", this.model).then(
                () => {//On Success
                    this.clear();
                    wdf.utils.getCoreManager().fireQuery();
                    wdf.utils.showSuccessMessage("Level2 address deleted successfully!");

                },
                () => {//On Failure
                    wdf.utils.showErrorMessage("Level2 address can not be deleted!");
                }
                );
        }

        delete() {
            this.httpService.post("/cdb/api/CDBLevel2District/delete", this.model).then(
                () => {//On Success
                    this.clear();
                    wdf.utils.getCoreManager().fireQuery();
                    wdf.utils.showSuccessMessage("Level2 address deleted successfully!");

                },
                () => {//On Failure
                    wdf.utils.showErrorMessage("Level2 address can not be deleted!");
                }
                );
        }
        level_1_address_component_id_lookup_LookupFired(event: any, targetModel: wdf.BaseEntity, lookupPropertyName: string, isLogicalSearch: boolean) {
            return wdf.LookupManager.ShowLookupDialog(event, targetModel, lookupPropertyName, isLogicalSearch,
                null,
                (args: wdf.LookupResultSelectedEventArgs) => {
                    console.log("Level 1 Address Selected");
                });
        //level_1_address_component_id_lookup_LookupFired(event: any, targetModel: wdf.BaseEntity, lookupPropertyName: string, isLogicalSearch: boolean) {
        //    wdf.LookupManager.ShowLookupDialog(event, targetModel, lookupPropertyName, isLogicalSearch,
        //        (args: wdf.LookupDialogShowingEventArgs) => {//filtering on dialog showing
        //            if (!this.model.level_1_address_component_id_lookup) {
        //                args.cancel = true;
        //                return;
        //            }//return if country is not defined.
        //            var districtCriteria = new CDBModel.Level_2_address_component();
        //            districtCriteria.level_1_address_component_id_lookup = new wdf.EmptyLookupRecord(this.model.level_1_address_component_id_lookup.Id);
        //            districtCriteria.parentId = this.model.level_1_address_component_id_lookup.Id;
        //            args.imposeQueryCriteria(districtCriteria);
        //        },(args: wdf.LookupResultSelectedEventArgs) => {
        //            console.log("Level 1 Address Selected");
        //        });
        }
        SetupLookupSuggestions() {
            $(".wdf-lkup-suggestion").each((index: number, element: Element) => {
                var modelPropertyFullName = element.getAttribute("ng-model");//mgr.model.PersonAddress.GeoLocation.level_1_address_component_id_lookup.Display
                var displayPropertyName = element.getAttribute("wdf-lkup-prop-mm");
                var finalModelPropertyName = modelPropertyFullName.replace("mgr.", "").replace('.Display', '').replace('.' + displayPropertyName, '');
                var lookupModel = wdf.utils.getNestedPropertyValue(this, finalModelPropertyName);
                this.addAutoCompleteLookupSuggestions(element.getAttribute("id"), lookupModel, element.getAttribute("wdf-lkup-prop-mm"));
            });
        }
    }

    export class Level2DistrictController {
        constructor(scope: wdf.IScope, http: ng.IHttpService, location: ng.ILocationService, routeProvider: ng.route.IRouteService, routeParams: ng.route.IRouteParamsService) {
            console.log("Level2DistrictController Constructor Called");
            scope.mgr = new CDB.Level2DistrictManager(scope, http, routeProvider, routeParams);
        }
    }
    export class Level2DistrictRouter {
        constructor($routeProvider: ng.route.IRouteProvider) {
            console.debug("Level2DistrictRouter invoked");

            $routeProvider.when("/Level-2Districts", {
                templateUrl: '/cdb/Partials/Level_2_Districts'
            });
        }
    }
}

console.log("Inside Level2DistrictController");
cdbApp.controller("Level2DistrictController", ['$scope', '$http', '$location', '$route', '$routeParams', CDB.Level2DistrictController]);
cdbApp.config(['$routeProvider', CDB.Level2DistrictRouter]);
 