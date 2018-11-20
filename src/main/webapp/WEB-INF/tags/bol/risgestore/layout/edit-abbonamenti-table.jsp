<%@ page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreAjaxController"%>
<%@ page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<div id="controller-container" ng-controller="AbbonamentiMgmtController" ng-cloak>
    <h1>Gestione Abbonamenti</h1>
    <table class="abbonamenti-table">
        <tr>
            <td class="abbonamenti-edit">
                Nome
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="text" size="10" ng-model="abb.nome">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                Costo (&euro;)
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="number" size="8" ng-model="abb.costoEuro">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                Crediti
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="text" size="8" ng-model="abb.crediti">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                Postazione riservata alla Reception
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="checkbox" ng-model="abb.postazioneRiservataReception">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                Disponibilità sala riunione (ore)
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="text" size="8" ng-model="abb.oreSalaRiunione">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                Pagamento in un'unica soluzione
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="checkbox" ng-model="abb.unicaSoluzionePagamento">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                Pagamento con rata trimestrale
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="checkbox" ng-model="abb.rate4">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                Prima rata trimestrale &euro;
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="number" ng-model="abb.rata1Di4Euro">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                Prima rata trimestrale Crediti
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="number" ng-model="abb.rata1Di4Crediti">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                N-esima rata trimestrale &euro;
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="number" ng-model="abb.rataNDi4Euro">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                N-esima rata trimestrale Crediti
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="number" ng-model="abb.rataNDi4Crediti">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                Pagamento con rata mensile
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="checkbox" ng-model="abb.rate12">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                Prima rata mensile &euro;
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="number" ng-model="abb.rata1Di12Euro">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                Prima rata mensile Crediti
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="number" ng-model="abb.rata1Di12Crediti">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                N-esima rata mensile &euro;
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="number" ng-model="abb.rataNDi12Euro">
            </td>
        </tr>
        <tr>
            <td class="abbonamenti-edit">
                N-esima rata mensile Crediti
            </td>
            <td class="abbonamenti-edit" ng-repeat="abb in abbonamenti">
                <input type="number" ng-model="abb.rataNDi12Crediti">
            </td>
        </tr>
    </table>
    <button class="btn btn-primary btn-lg" ng-click="save()">Salva</button>
    <button type="button" class="btn btn-secondary btn-lg" ng-click="annulla()">Annulla</button>


</div>
<script>
    app.controller('AbbonamentiMgmtController', function ($scope, $window, $http) {

        $scope.annulla = function () {
            $window.location.href = "<c:url value='<%= RisGestoreController.RQ_MI_RIEPILOGO%>'/>";
        };

        $scope.save = function () {
            console.log("entering save ");
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            //data to be requested
            var data = $scope.abbonamenti;
            // request 
            var req = '<c:url value="<%= RisGestoreAjaxController.AX_UPDATE_ABBONAMENTI%>"/>';
//                console.log(req);
//                console.log(JSON.stringify(data));
            $http({
                url: req,
                method: 'POST',
                data: data,
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        // in case of success ...
//                            console.log(JSON.stringify(response.data));
                        $window.location.href = "<c:url value='<%= RisGestoreController.RQ_MI_RIEPILOGO%>'/>";
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });

        };

        $scope.initSelectWindow = function () {
            var jsonData = JSON.parse('${jsonData}');
            $scope.abbonamenti = jsonData;
            console.log(JSON.stringify($scope.abbonamenti));
        };

        $scope.initSelectWindow();
    });
</script>
