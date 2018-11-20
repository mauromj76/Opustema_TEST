
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.AnagraficheDiSistemaAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div ng-controller="dowDiscCtrl" ng-cloak>
    <div class="row box-border" style="margin-right: 10px; padding-left: 20px;">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2>Sconti Per Giorno Della Settimana</h2>
            </div>
        </div>
        <div class="row table-min-height-258">
            <table class="table gestione">
                <thead>
                    <tr>
                        <th>
                            Giorno
                        </th>
                        <th>
                            Sconto
                        </th>
                        <th>
                            Gestisci
                        </th>
                    </tr>
                </thead>
                <tbody id="dowDiscountsResult">
                    <tr ng-repeat="dow in dows">
                        <td class="in-place-editable-md">
                            {{dow.dowName}}
                        </td>
                        <td class="in-place-editable-md">
                            <div editable-text="dow.discount" e-name="discount" e-form="rowform">
                                {{dow.discount}}
                            </div>
                        </td>
                        <td>
                            <form editable-form name="rowform" class="form-buttons form-inline" 
                                  ng-show="rowform.$visible" onbeforesave="saveDowDiscount($data, dow.id)"
                                  shown="inserted == dow">
                                <button type="submit" ng-disabled="rowform.$waiting" class="btn btn-primary" title="Salva le modifiche">
                                    Salva
                                </button>
                                <button type="button" ng-disabled="rowform.$waiting"
                                        ng-click="rowform.$cancel()" class="btn btn-default" title="Annulla le modifiche">
                                    Annulla
                                </button>
                            </form>
                            <div class="buttons" ng-show="!rowform.$visible">
                                <button class="btn btn-primary" ng-click="rowform.$show()" title="Modifica">
                                    <span class="glyphicon glyphicon-edit"></span>
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

    app.controller('dowDiscCtrl', function ($scope, $http) {

        $scope.updateDowDiscounts = function () {
            console.log("updateDowDiscounts ");
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            //data to be requested
            var data = {};

            // request 
            var req = '<c:url value="<%= AnagraficheDiSistemaAjaxController.AX_GET_DOW_DISCOUNTS%>"/>';
//            console.log(req);
//            console.log(JSON.stringify(data));
//        $http.defaults.headers.common['X-Csrf-Token'] = csrfToken;
            $http({
                url: req,
                method: 'POST',
                data: JSON.stringify(data),
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        // in case of success ...
                        $scope.dows = response.data.dows;
                        console.log($scope.dows);
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };

        $scope.saveDowDiscount = function (dataToBeSent, id) {
            if (!checkDiscount(dataToBeSent.discount)) {
                return "Lo sconto deve essere compreso tra 0 e 99.99";
            }

            angular.extend(dataToBeSent, {id: id});
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            var request = '<c:url value="<%= AnagraficheDiSistemaAjaxController.AX_SAVE_DOW_DISCOUNT%>"/>';
            console.log("save DoW discount " + request);
            $http({
                url: request,
                method: 'POST',
                data: dataToBeSent,
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        $scope.dows = response.data.dows;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            }
                    );
        };

        $scope.updateDowDiscounts();

    });
</script>                


