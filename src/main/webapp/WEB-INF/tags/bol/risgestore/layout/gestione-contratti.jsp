
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div ng-controller="contrMancantiCtrl" ng-cloak>
    <div class="row box-border" style="margin-right: 10px; padding-left: 20px;">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2>Gestione contratti</h2>
            </div>
        </div>
        <div class="row box-border">
            <h3>Filtra</h3>
            <form>
                <table class="ris-gestore-table">
                    <thead>
                        <tr>
                            <td class="ris-gestore-td">
                                Num. Contratto
                            </td>
                            <td class="ris-gestore-td">
                                Cliente
                            </td>
                            <td class="ris-gestore-td">
                                Tipo
                            </td>
                            <td class="ris-gestore-td">
                                Stato Pagamento
                            </td>
                            <td class="ris-gestore-td">
                                Stato Documentazione
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="ris-gestore-td">
                                <input type="number" ng-model="filtro.numContratto">
                            </td>
                            <td class="ris-gestore-td">
                                <input type="text" ng-model="filtro.cliente">
                            </td>
                            <td class="ris-gestore-td">
                                <input type="text" ng-model="filtro.tipo">
                            </td>
                            <td class="ris-gestore-td">
                                <input type="checkbox" id="filtro-pagato" ng-model="filtro.pagato">
                                <label for="filtro-pagato">Pagato</label><br>
                                <input type="checkbox" id="filtro-regolare" ng-model="filtro.regolare">
                                <label for="filtro-regolare">Regolare</label><br>
                                <input type="checkbox" id="filtro-in-ritardo" ng-model="filtro.inRitardo">
                                <label for="filtro-in-ritardo">In ritardo</label>
                            </td>
                            <td class="ris-gestore-td">
                                <input type="checkbox" id="filtro-ricevuta" ng-model="filtro.ricevuta">
                                <label for="filtro-ricevuta">Ricevuta</label><br>
                                <input type="checkbox" id="filtro-non-ricevuta" ng-model="filtro.nonRicevuta">
                                <label for="filtro-non-ricevuta">Non Ricevuta</label><br>
                            </td>
                            <td class="ris-gestore-td">
                                <input type="button" value="Filtra" class="btn btn-primary" ng-click="updateContrDaCaricare(1)">
                                &nbsp;
                                <input type="button" value="Reset" class="btn btn-secondary" ng-click="resetFiltro()">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <div class="row table-min-height-258">
            <table class="table gestione">
                <thead>
                    <tr>
                        <th>
                            N. Contratto
                        </th>
                        <th>
                            Cliente
                        </th>
                        <th>
                            Tipo
                        </th>
                        <th>
                            Stato pagamenti
                        </th>
                        <th>
                            Stato documentazione
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="contr in listaContratti">
                        <td>
                            {{contr.numeroContratto}}
                        </td>
                        <td>
                            {{contr.cliente}}
                        </td>
                        <td>
                            {{contr.tipoContratto}}
                        </td>
                        <td>
                            {{contr.statoPagamento}}
                        </td>
                        <td>
                            {{contr.statoDocumentazione}}
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <center>
            <nav>
                <a type="button" class="btn btn-default" ng-disabled="currentPage == firstPage" ng-click="updateContrMancanti(firstPage)">
                    <span aria-hidden="true">{{firstPage}}</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="previousPage == 0" ng-click="updateContrMancanti(previousPage)">
                    <span aria-hidden="true">&laquo;</span>
                </a>

                <span ng-repeat="page in pages" class="pagination" id="pagination-ConfigurazioneAula">
                    <a type="button" class="btn btn-default" ng-disabled="currentPage == page" ng-click="updateContrMancanti(page)">{{page}}</a>
                </span>
                <a type="button" class="btn btn-default" ng-disabled="nextPage == 0" ng-click="updateContrMancanti(nextPage)">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="currentPage == lastPage" ng-click="updateContrMancanti(lastPage)">
                    <span aria-hidden="true">{{lastPage}}</span>
                </a>
            </nav>
        </center>
    </div>
</div>

<script>
    app.controller('contrMancantiCtrl', function ($scope, $http) {

        $scope.updateContrDaCaricare = function (index) {
            console.log("contrMancantiCtrl " + index);
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            if (index == null) {
                index = 1;
            }

            //data to be requested
            var data = {};
            data["index"] = index;
            data["filtro"] = $scope.filtro;
            
            // request 
            var req = '<c:url value="<%= RisGestoreAjaxController.AX_GES_CONTRATTI_LISTA%>"/>';
            $http({
                url: req,
                method: 'POST',
                data: JSON.stringify(data),
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        // in case of success ...
                        console.log(JSON.stringify(response.data.listaContratti));

                        $scope.listaContratti = response.data.listaContratti;
                        $scope.pages = response.data.pages;
                        $scope.previousPage = response.data.previousPage;
                        $scope.nextPage = response.data.nextPage;
                        $scope.firstPage = response.data.firstPage;
                        $scope.lastPage = response.data.lastPage;
                        $scope.lastPage = response.data.lastPage;
                        $scope.currentPage = response.data.currentPage;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };

        $scope.resetFiltro = function () {
            $scope.filtro = {numContratto: null, cliente: null, tipo: null,
                pagato: true, regolare: true, inRitardo: true,
                ricevuta: true, nonRicevuta: true
            };
        };


        $scope.resetFiltro();
        $scope.updateContrDaCaricare(1);
    });
</script>                


