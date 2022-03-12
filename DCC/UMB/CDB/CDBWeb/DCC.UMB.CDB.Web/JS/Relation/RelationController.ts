/// <reference path="../app-include.ts"/>

module CDB {
    export class RelationManager extends wdf.BaseScreenManager implements wdf.IScreenManager {
        model = new CDBModel.RelationViewModel();       

        date: Date = new Date(Date.now());
        IsCallFromSave: boolean = false; 
        constructor(scope: wdf.IScope, http: ng.IHttpService, routeProvider: ng.route.IRouteService, routeParams: ng.route.IRouteParamsService) {
            super(wdf.UIModes.Insert, scope, http, routeProvider, routeParams);
            console.log("Relation constructor called");
            this.setDates();
            this.loadScreenForPassedInId();
        }

        getScreenId(): string {
            return "CDB_01";
        }

        setDates() {
            this.model.effective_from = this.date;
            this.model.effective_till = new Date(2070, 0, 1, 0, 0, 0, 0);
        }

        getFirstFocusableElement() {
            return $("#" + CDBModel.RelationViewModel.fld_relation_nm);
        }

        save(closeAndReturn?: boolean) {
            this.httpService.post("/cdb/api/CDBRelation/save", this.model).then((response: any) => {
                this.model = response.data;
                wdf.utils.showSuccessMessage("Successfully saved Relation with relation id : " + this.model.relation_id);

                if (closeAndReturn && closeAndReturn === true) {//if it is a called screen, then return to the caller
                    this.model.relation_id = response.data.Id;
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
            this.httpService.get("/cdb/api/CDBRelation/Get?Id=" + rowObj.Id).then((response: any) => {
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
            return this.httpService.post("/cdb/api/CDBRelation/GridListing", this.model);
        }
        
        isReadyToSave(): boolean {
            return true;
        }


        isReadyToDelete(): boolean {
            return true;
        }

        deleteRecord() {
            this.httpService.post("/cdb/api/CDBRelation/delete", this.model).then(
            () => {//On Success
                this.clear();
                wdf.utils.getCoreManager().fireQuery();
                wdf.utils.showSuccessMessage("Relation deleted successfully!");

            },
            () => {//On Failure
                wdf.utils.showErrorMessage("Relation can not be deleted!");
            }
            );
        }

        clear() {
            this.model = new CDBModel.RelationViewModel();
            if (this.currentUIMode == wdf.UIModes.Insert) {
                this.setDates();
            }

        }

       
        getDebugJson(): string {
            return angular.toJson(this.model, true);
        }
        isFieldEditable(fieldId: string) {
            switch (fieldId) {
                case CDBModel.RelationViewModel.fld_relation_id:
                    return this.currentUIMode == wdf.UIModes.Query;
                    break;
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
            this.httpService.post("/cdb/api/CDBRelation/delete", this.model).then(
                () => {//On Success
                    this.clear();
                    wdf.utils.getCoreManager().fireQuery();
                    wdf.utils.showSuccessMessage("Relation deleted successfully!");

                },
                () => {//On Failure
                    wdf.utils.showErrorMessage("Relation can not be deleted!");
                }
                );
        }
    }

    export class RelationController {
        constructor(scope: wdf.IScope, http: ng.IHttpService, location: ng.ILocationService, routeProvider: ng.route.IRouteService, routeParams: ng.route.IRouteParamsService) {
            console.log("RelationController Constructor Called");
            scope.mgr = new CDB.RelationManager(scope, http, routeProvider, routeParams);
        }
    }
    export class RelationRouter {
        constructor($routeProvider: ng.route.IRouteProvider) {
            console.debug("RelationRouter invoked");

            $routeProvider.when("/Relation", {
                templateUrl: '/cdb/Partials/Relation'
            });
        }
    }
}

console.log("Inside RelationController");
cdbApp.controller("RelationController", ['$scope', '$http', '$location', '$route', '$routeParams', CDB.RelationController]);
cdbApp.config(['$routeProvider', CDB.RelationRouter]);
 