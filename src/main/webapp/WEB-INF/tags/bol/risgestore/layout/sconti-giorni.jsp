
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.AnagraficheDiSistemaAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div ng-controller="DaysDiscCtrl" ng-cloak>
    <div class="row box-border" style="margin-right: 10px; padding-left: 20px;">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2>Sconti Per Numero Di Giornate Prenotate</h2>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                <h3>
                    <button class="btn btn-default" ng-click="addDaysDiscount()"> Aggiungi sconto per numero di giornate</button>
                </h3>
            </div>

        </div>
        <div class="row table-min-height-258">
            <table class="table gestione">
                <thead>
                    <tr>
                        <th>
                            Da
                        </th>
                        <th>
                            A
                        </th>
                        <th>
                            Sconto (%)
                        </th>
                        <th>
                            Gestisci
                        </th>
                    </tr>
                </thead>
                <tbody id="daysDiscountsResult">
                    <tr ng-repeat="day in days">
                        <td class="in-place-editable-md">
                            <div editable-number="day.daysFrom" e-name="daysFrom" e-form="dayform" >
                                {{day.daysFrom}}
                            </div>
                        </td>
                        <td class="in-place-editable-md">
                            <div editable-number="day.daysTo" e-name="daysTo" e-form="dayform" e-maxlength="5">
                                {{day.daysTo}}
                            </div>
                        </td>
                        <td class="in-place-editable-md">
                            <div editable-number="day.discount" e-name="discount" e-form="dayform">
                                {{day.discount}}
                            </div>
                        </td>
                        <td>
                            <form editable-form name="dayform" class="form-buttons form-inline" 
                                  ng-show="dayform.$visible" onbeforesave="saveDaysDiscount($data, day.id)"
                                  shown="inserted == day">
                                <button type="submit" ng-disabled="dayform.$waiting" class="btn btn-primary" title="Salva le modifiche">
                                    Salva
                                </button>
                                <button type="button" ng-disabled="dayform.$waiting"
                                        ng-click="cancelUpdate(dayform)" class="btn btn-default" title="Annulla le modifiche">
                                    Annulla
                                </button>
                            </form>
                            <div class="buttons" ng-show="!dayform.$visible">
                                <button class="btn btn-primary" ng-click="dayform.$show()" title="Modifica">
                                    <span class="glyphicon glyphicon-edit"></span>
                                </button>
                                <button class="btn btn-danger" ng-click="deleteDaysDiscount(day.id)" title="Elimina">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </button>
                            </div> 
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>

    app.controller('DaysDiscCtrl', function ($scope, $http) {

        $scope.updateDaysDiscounts = function () {
            console.log("updateDaysDiscounts");
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            //data to be requested
            var data = {};
            // request 
            var req = '<c:url value="<%= AnagraficheDiSistemaAjaxController.AX_GET_DAYS_DISCOUNTS%>"/>';
            $http({
                url: req,
                method: 'POST',
                data: JSON.stringify(data),
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        // in case of success ...
                        $scope.days = response.data.days;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            }
                    );
        };
        $scope.saveDaysDiscount = function (dataToBeSent, id) {
            // validation
            if (!checkDays(dataToBeSent.daysFrom)) {
                return "Il campo deve contenere un valore tra 0 e 99999";
            }
            if (!checkDays(dataToBeSent.daysTo)) {
                return "Il campo deve contenere un valore tra 0 e 99999";
            }

            if (dataToBeSent.daysFrom >= dataToBeSent.daysTo) {
                return "Il primo valore deve essere minore del secondo";
            }

            if (!checkDiscount(dataToBeSent.discount)) {
                return "Lo sconto deve essere compreso tra 0 e 99.99";
            }

            angular.extend(dataToBeSent, {id: id});
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            var request = '<c:url value="<%= AnagraficheDiSistemaAjaxController.AX_SAVE_DAYS_DISCOUNT%>"/>';
            console.log("save Days discount " + request);
            $http({
                url: request,
                method: 'POST',
                data: dataToBeSent,
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        $scope.days = response.data.days;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            }
                    );
        };
        $scope.deleteDaysDiscount = function (id) {
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            var data = {};
            data["id"] = id;
            var request = '<c:url value="<%= AnagraficheDiSistemaAjaxController.AX_DELETE_DAYS_DISCOUNT%>"/>';
            $http({
                url: request,
                method: 'POST',
                data: data,
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        $scope.days = response.data.days;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            }
                    );
        };
        $scope.addDaysDiscount = function () {
            console.log("addDaysDiscount");
            $scope.inserted = {
                daysFrom: 0,
                daysTo: 0,
                discount: 0
            };

            $scope.days.push($scope.inserted);
        };

        $scope.cancelUpdate = function (xeditform) {
            xeditform.$cancel();
            $scope.updateDaysDiscounts();
        }

        $scope.checkSconto = function (data) {
            if ((data === null) || (data > 99.99) || (data < 0)) {
                return "Lo sconto deve essere compreso fra 0.00 e 99.99";
            } else {
                return null;
            }
        };

        $scope.updateDaysDiscounts();
    });
</script>                


