/// <reference path="../app-include.ts"/>

module CDB {
    export class WorkingUnitManager extends wdf.BaseScreenManager implements wdf.IScreenManager {
        model = new CDBModel.WorkingUnitViewModel();       

        date: Date = new Date(Date.now());
        IsCallFromSave: boolean = false; 

        constructor(scope: wdf.IScope, http: ng.IHttpService, routeProvider: ng.route.IRouteService, routeParams: ng.route.IRouteParamsService) {
            super(wdf.UIModes.Insert, scope, http, routeProvider, routeParams);
            console.log("WorkingUnit constructor called");
            this.setDates();
            this.loadScreenForPassedInId();
        }

        getScreenId(): string {
            return "CDB_02";
        }

        setDates() {
            this.model.effective_from = this.date;
            this.model.effective_till = new Date(2070, 0, 1, 0, 0, 0, 0);
        }

        getFirstFocusableElement() {
            return $("#" + CDBModel.WorkingUnitViewModel.fld_working_unit_nm);
        }
        Is_root_changed() {
            if (this.model.Is_root == undefined || this.model.Is_root === true) {
                this.model.group_working_unit_id_lookup = null;
            }
        }
        uiModeChanged(oldMode: wdf.UIModes, newMode: wdf.UIModes) {
            console.log("**** UI MODE CHANGED");           
        }
        save(closeAndReturn?: boolean) {
           
            this.httpService.post("/cdb/api/CDBWorkingUnit/save", this.model).then((response: any) => {
                this.model = response.data;
                wdf.utils.showSuccessMessage("Successfully saved Department with department id : " + this.model.working_unit_id);

                if (closeAndReturn && closeAndReturn === true) {//if it is a called screen, then return to the caller
                    this.model.working_unit_id = response.data.Id;
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
            this.httpService.get("/cdb/api/CDBWorkingUnit/Get?Id=" + rowObj.Id).then((response: any) => {
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
            return this.httpService.post("/cdb/api/CDBWorkingUnit/GridListing", this.model);
        }
        
        isReadyToSave(): boolean {
            return true;
        }


        isReadyToDelete(): boolean {
            return true;
        }

        deleteRecord() {
            this.httpService.post("/cdb/api/CDBWorkingUnit/delete", this.model).then(
            () => {//On Success
                this.clear();
                wdf.utils.getCoreManager().fireQuery();
                wdf.utils.showSuccessMessage("WorkingUnit deleted successfully!");

            },
            () => {//On Failure
                wdf.utils.showErrorMessage("WorkingUnit can not be deleted!");
            }
            );
        }

        clear() {
            this.model = new CDBModel.WorkingUnitViewModel();
            if (this.currentUIMode == wdf.UIModes.Insert) {
                this.setDates();
            }
            if (this.currentUIMode == wdf.UIModes.Query) {
                    this.model.Is_root = null;
                    this.model.Is_leaf = null;
                    this.model.Is_staff_posted = null;
            }

        }
       
        getDebugJson(): string {
            return angular.toJson(this.model, true);
        }
        isFieldMandatory(fieldId: string) {
            switch (fieldId) {                
                case CDBModel.WorkingUnitViewModel.fld_group_working_unit_id_lookup:
                    return this.model.Is_root ===false;
            }
            return false;
        }
        isFieldEditable(fieldId: string) {                     
            switch (fieldId) {
                case CDBModel.WorkingUnitViewModel.fld_working_unit_id:
                    return this.currentUIMode == wdf.UIModes.Query;
                    break;
                case CDBModel.WorkingUnitViewModel.fld_Is_root:
                    this.model.is_root = this.model.Is_root === true ? "Yes" : this.model.Is_root === false ? "No" : null;
                    break;
                case CDBModel.WorkingUnitViewModel.fld_Is_leaf:
                    this.model.is_leaf = this.model.Is_leaf === true ? "Yes" : this.model.Is_leaf === false ? "No" : null;
                    break;
                case CDBModel.WorkingUnitViewModel.fld_Is_staff_posted:
                    this.model.is_staff_posted = this.model.Is_staff_posted === true ? "Yes" : this.model.Is_staff_posted === false ? "No" : null;
                    break;
                case CDBModel.WorkingUnitViewModel.fld_group_working_unit_id_lookup:
                    return this.model.Is_root != true;    
            }            
            return true;
        }
        isElementVisible(elementId: string): boolean {
            return true;
        }
        print() { }

        getActionsPromise(): ng.IHttpPromise<any> { return null; }
        executeScreenAction(actionName: string): ng.IHttpPromise<any> {
            return null;
        }
        delete() {
            this.httpService.post("/cdb/api/CDBWorkingUnit/delete", this.model).then(
                () => {//On Success
                    this.clear();
                    wdf.utils.getCoreManager().fireQuery();
                    wdf.utils.showSuccessMessage("WorkingUnit deleted successfully!");

                },
                () => {//On Failure
                    wdf.utils.showErrorMessage("WorkingUnit can not be deleted!");
                }
                );
        }
        society_id_lookup_LookupFired(event: any, targetModel: wdf.BaseEntity, lookupPropertyName: string, isLogicalSearch: boolean) {
            wdf.LookupManager.ShowLookupDialog(event, targetModel, lookupPropertyName, isLogicalSearch,
                null,
                (args: wdf.LookupResultSelectedEventArgs) => {
                    console.log("Society Selected");
                });
        }

        working_unit_entity_id_lookup_LookupFired(event: any, targetModel: wdf.BaseEntity, lookupPropertyName: string, isLogicalSearch: boolean) {
            wdf.LookupManager.ShowLookupDialog(event, targetModel, lookupPropertyName, isLogicalSearch,
                null,
                (args: wdf.LookupResultSelectedEventArgs) => {
                    console.log("Working unit entity Selected");
                });
        }

        group_working_unit_id_lookup_LookupFired(event: any, targetModel: wdf.BaseEntity, lookupPropertyName: string, isLogicalSearch: boolean) {
            wdf.LookupManager.ShowLookupDialog(event, targetModel, lookupPropertyName, isLogicalSearch,
                null,
                (args: wdf.LookupResultSelectedEventArgs) => {
                    console.log("Group working unit Selected");
                });
        }
    }

    export class WorkingUnitController {
        constructor(scope: wdf.IScope, http: ng.IHttpService, location: ng.ILocationService, routeProvider: ng.route.IRouteService, routeParams: ng.route.IRouteParamsService) {
            console.log("WorkingUnitController Constructor Called");
            scope.mgr = new CDB.WorkingUnitManager(scope, http, routeProvider, routeParams);
        }
    }
    export class WorkingUnitRouter {
        constructor($routeProvider: ng.route.IRouteProvider) {
            console.debug("WorkingUnitRouter invoked");

            $routeProvider.when("/WorkingUnits", {
                templateUrl: '/cdb/Partials/WorkingUnits'
            });
        }
    }
}

console.log("Inside WorkingUnitController");
cdbApp.controller("WorkingUnitController", ['$scope', '$http', '$location', '$route', '$routeParams', CDB.WorkingUnitController]);
cdbApp.config(['$routeProvider', CDB.WorkingUnitRouter]);
 