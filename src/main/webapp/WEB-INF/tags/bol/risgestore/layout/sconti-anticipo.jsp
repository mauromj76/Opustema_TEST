
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.AnagraficheDiSistemaAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div ng-controller="AdvanceDiscCtrl" ng-cloak>
    <div class="row box-border" style="margin-right: 10px; padding-left: 20px;">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2>Sconti Per Numero Di Giorni Di Anticipo</h2>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                <h3>
                    <button class="btn btn-default" ng-click="addAdvDiscount()"> Aggiungi sconto per numero di giorni di anticipo</button>
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
                <tbody id="advsDiscountsResult">
                    <tr ng-repeat="adv in advs">
                        <td class="in-place-editable-md">
                            <span editable-number="adv.advanceFrom" e-name="advanceFrom" e-form="advform" e-ng-pattern="[0-9]{1-4}">
                                {{adv.advanceFrom}}
                            </span>
                        </td>
                        <td class="in-place-editable-md">
                            <span editable-number="adv.advanceTo" e-name="advanceTo" e-form="advform" e-maxlength="5">
                                {{adv.advanceTo}}
                            </span>
                        </td>
                        <td class="in-place-editable-md">
                            <span editable-number="adv.discount" e-name="discount" e-form="advform">
                                {{adv.discount}}
                            </span>
                        </td>
                        <td>
                            <form editable-form name="advform" class="form-buttons form-inline" 
                                  ng-show="advform.$visible" onbeforesave="saveAdvDiscount($data, adv.id)"
                                  shown="inserted == adv">
                                <button type="submit" ng-disabled="advform.$waiting" class="btn btn-primary" title="Salva le modifiche">
                                    Conferma
                                </button>
                                <button type="button" ng-disabled="advform.$waiting"
                                        ng-click="cancelUpdate(advform)" class="btn btn-default"  title="Annulla le modifiche">
                                    Annulla
                                </button>
                            </form>
                            <div class="buttons" ng-show="!advform.$visible">
                                <button class="btn btn-primary" ng-click="advform.$show()" title="Modifica">
                                    <span class="glyphicon glyphicon-edit"></span>
                                </button>
                                <button class="btn btn-danger" ng-click="deleteAdvDiscount(adv.id)" title="Elimina">
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

    app.controller('AdvanceDiscCtrl', function ($scope, $http) {

        $scope.updateAdvDiscounts = function () {
            console.log("updateAdvDiscounts");
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            //data to be requested
            var data = {};
            // request 
            var req = '<c:url value="<%= AnagraficheDiSistemaAjaxController.AX_GET_ADV_DISCOUNTS%>"/>';
            $http({
                url: req,
                method: 'POST',
                data: JSON.stringify(data),
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        // in case of success ...
                        $scope.advs = response.data.advs;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            }
                    );
        };
        $scope.saveAdvDiscount = function (dataToBeSent, id) {
            // validation
            if (!checkDays(dataToBeSent.advanceFrom)) {
                return "Il campo deve contenere un valore tra 0 e 99999";
            }
            if (!checkDays(dataToBeSent.advanceTo)) {
                return "Il campo deve contenere un valore tra 0 e 99999";
            }

            if ((dataToBeSent.advanceFrom / 1) >= (dataToBeSent.advanceTo / 1)) {
                return "Il primo valore deve essere minore del secondo";
            }

            if (!checkDiscount(dataToBeSent.discount)) {
                return "Lo sconto deve essere compreso tra 0 e 99.99";
            }

            angular.extend(dataToBeSent, {id: id});
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            var request = '<c:url value="<%= AnagraficheDiSistemaAjaxController.AX_SAVE_ADV_DISCOUNT%>"/>';
            console.log("save Days discount " + request);
            $http({
                url: request,
                method: 'POST',
                data: dataToBeSent,
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        $scope.advs = response.data.advs;
                        console.log(JSON.stringify($scope.advs));
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            }
                    );
        };
        $scope.deleteAdvDiscount = function (id) {
            console.log("deleteAdvDiscount");
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            var data = {};
            data["id"] = id;
            var request = '<c:url value="<%= AnagraficheDiSistemaAjaxController.AX_DELETE_ADV_DISCOUNT%>"/>';
            $http({
                url: request,
                method: 'POST',
                data: data,
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        $scope.advs = response.data.advs;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            }
                    );
        };
        $scope.addAdvDiscount = function () {
            console.log("addAdvDiscount");
            $scope.inserted = {
                advanceFrom: 0,
                advanceTo: 0,
                discount: 0
            };

            $scope.advs.push($scope.inserted);
        };

        $scope.cancelUpdate = function (xeditform) {
            xeditform.$cancel();
            $scope.updateAdvDiscounts();
        }

        $scope.updateAdvDiscounts();
    });
</script>                


