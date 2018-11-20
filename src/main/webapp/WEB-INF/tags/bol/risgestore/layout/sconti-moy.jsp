
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.AnagraficheDiSistemaAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div ng-controller="moyDiscCtrl" ng-cloak>
    <div class="row box-border" style="margin-right: 10px; padding-left: 20px;">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2>Sconti Per Mese Dell'Anno</h2>
            </div>
        </div>
        <div class="row table-min-height-258">
            <table class="table gestione">
                <thead>
                    <tr>
                        <th>
                            Mese
                        </th>
                        <th>
                            Sconto
                        </th>
                        <th>
                            Gestisci
                        </th>
                    </tr>
                </thead>
                <tbody id="moyDiscountsResult">
                    <tr ng-repeat="month in moys">
                        <td class="in-place-editable-md">
                            {{month.monthName}}
                        </td>
                        <td class="in-place-editable-md">
                            <div editable-text="month.discount" e-name="discount" e-form="moyform">
                                {{month.discount}}
                            </div>
                        </td>
                        <td>
                            <form editable-form name="moyform" class="form-buttons form-inline" 
                                  ng-show="moyform.$visible" onbeforesave="saveMoyDiscount($data, month.id)"
                                  shown="inserted == month">
                                <button type="submit" ng-disabled="moyform.$waiting" class="btn btn-primary" title="Salva le modifiche">
                                    Salva
                                </button>
                                <button type="button" ng-disabled="moyform.$waiting"
                                        ng-click="moyform.$cancel()" class="btn btn-default" title="Annulla le modifiche">
                                    Annulla
                                </button>
                            </form>
                            <div class="buttons" ng-show="!moyform.$visible">
                                <button class="btn btn-primary" ng-click="moyform.$show()" title="Modifica">
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

    app.controller('moyDiscCtrl', function ($scope, $http) {

        $scope.updateMoyDiscounts = function () {
            console.log("updateMoyDiscounts");
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            //data to be requested
            var data = {};

            // request 
            var req = '<c:url value="<%= AnagraficheDiSistemaAjaxController.AX_GET_MOY_DISCOUNTS%>"/>';
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
                        $scope.moys = response.data.moys;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };

        $scope.saveMoyDiscount = function (dataToBeSent, id) {
            if (!checkDiscount(dataToBeSent.discount)) {
                return "Lo sconto deve essere compreso tra 0 e 99.99";
            }

            angular.extend(dataToBeSent, {id: id});
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            var request = '<c:url value="<%= AnagraficheDiSistemaAjaxController.AX_SAVE_MOY_DISCOUNT%>"/>';
            console.log("save MoY discount " + request);
            $http({
                url: request,
                method: 'POST',
                data: dataToBeSent,
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        $scope.moys = response.data.moys;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            }
                    );
        };

        $scope.updateMoyDiscounts();

    });
</script>                


