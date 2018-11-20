
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.AnagraficheDiSistemaAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div ng-controller="clientiCtrl" ng-cloak>
    <div class="row box-border" style="margin-right: 10px; padding-left: 20px;">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2>Elenco clienti</h2>
            </div>
        </div>
        <div class="row table-min-height-258">
            <table class="table gestione">
                <thead>
                    <tr>
                        <th>
                            Nome Utente Cliente
                        </th>
                        <th>
                            Ragione Sociale
                        </th>
                        <th>
                            Indirizzo
                        </th>
                        <th>
                            Confermato
                        </th>
                        <th>
                            Attivo
                        </th>
                        <th>
                            Gestisci
                        </th>
                    </tr>
                </thead>
                <tbody id="dowDiscountsResult">
                    <tr ng-repeat="cliente in clienti">
                        <td class="in-place-editable-md">
                            <div editable-text="cliente.userName" e-name="userName" e-form="rowform">
                                {{cliente.userName}}
                            </div>
                        </td>
                        <td class="in-place-editable-md">
                            {{cliente.fatRagSoc}}
                        </td>
                        <td class="in-place-editable-md">
                            {{cliente.fatIndirizzo}}
                        </td>
                        <td class="in-place-editable-xs">
                            <div editable-checkbox="cliente.confermato" e-name="confermato" e-form="rowform">
                                {{cliente.confermato && "Sì"|| "No"}}
                            </div>
                        </td>
                        <td class="in-place-editable-xs">
                            <div editable-checkbox="cliente.attivo" e-name="attivo" e-form="rowform">
                                {{cliente.attivo && "Sì"|| "No"}}
                            </div>
                        </td>
                        <td>
                            <form editable-form name="rowform" class="form-buttons form-inline" 
                                  ng-show="rowform.$visible" onbeforesave="saveCliente($data, cliente.id)"
                                  shown="inserted == cliente">
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
                <center>
            <nav>
                <a type="button" class="btn btn-default" ng-disabled="currentPage == firstPage" ng-click="updatePageClienti(firstPage)">
                    <span aria-hidden="true">{{firstPage}}</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="previousPage == 0" ng-click="updatePageClienti(previousPage)">
                    <span aria-hidden="true">&laquo;</span>
                </a>

                <span ng-repeat="page in pages" class="pagination" id="pagination-ConfigurazioneAula">
                    <a type="button" class="btn btn-default" ng-disabled="currentPage == page" ng-click="updatePageClienti(page)">{{page}}</a>
                </span>
                <a type="button" class="btn btn-default" ng-disabled="nextPage == 0" ng-click="updatePageClienti(nextPage)">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="currentPage == lastPage" ng-click="updatePageClienti(lastPage)">
                    <span aria-hidden="true">{{lastPage}}</span>
                </a>
            </nav>
        </center>

    </div>
</div>

<script>

    app.controller('clientiCtrl', function ($scope, $http) {

        $scope.updatePageClienti = function (index) {
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            if (index == null) {
                index = 1;
            }

            //data to be requested
            var data = {};
            data["index"] = index;
            
            // request 
            var req = '<c:url value="<%= RisGestoreAjaxController.AX_GET_ANAGRAFICA_CLIENTI %>"/>';
            $http({
                url: req,
                method: 'POST',
                data: JSON.stringify(data),
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        // in case of success ...
                        $scope.clienti = response.data.clienti.elements;
                        $scope.firstPage = response.data.clienti.firstPage;
                        $scope.previousPage = response.data.clienti.previousPage;
                        $scope.pages = response.data.clienti.pages;   
                        $scope.nextPage = response.data.clienti.nextPage;
                        $scope.lastPage = response.data.clienti.lastPage;
                        $scope.currentPage = response.data.clienti.currentPage;
                        
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Error!');
                            });
        };

        $scope.getClientiList = function () {
            console.log("getClientiList ");
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            //data to be requested
            var data = {};

            // request 
            var req = '<c:url value="<%= RisGestoreAjaxController.AX_GET_ANAGRAFICA_CLIENTI %>"/>';
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
                        $scope.clienti = response.data.clienti;
//                        console.log($scope.clienti);
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };

        $scope.saveCliente = function (dataToBeSent, id) {

            angular.extend(dataToBeSent, {id: id});

            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            var request = '<c:url value="<%= RisGestoreAjaxController.AX_SAVE_CLIENTE %>"/>';
            console.log("save Cliente " + request);
            $http({
                url: request,
                method: 'POST',
                data: dataToBeSent,
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
//                        $scope.dows = response.data.dows;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            }
                    );
        };

        $scope.updatePageClienti(1);

    });
</script>                


