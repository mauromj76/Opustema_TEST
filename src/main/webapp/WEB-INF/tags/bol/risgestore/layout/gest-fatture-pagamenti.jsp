
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.FileAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div ng-controller="fatDaCaricareCtrl" ng-cloak>
    <div class="row box-border" style="margin-right: 10px; padding-left: 20px;">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2>Gestione fatture e pagamenti</h2>
            </div>
        </div>
        <div class="row box-border">
            <h3>Filtra</h3>
            <form>
                <table class="ris-gestore-table">
                    <thead>
                        <tr>
                            <td class="ris-gestore-td">
                                Num. Ordine
                            </td>
                            <td class="ris-gestore-td">
                                Cliente
                            </td>
                            <td class="ris-gestore-td">
                                Fattura
                            </td>
                            <td class="ris-gestore-td">
                                Stato Pagamento
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="ris-gestore-td">
                                <input type="number" ng-model="filtro.numOrdine">
                            </td>
                            <td class="ris-gestore-td">
                                <input type="text" ng-model="filtro.cliente">
                            </td>
                            <td class="ris-gestore-td">
                                <input type="text" ng-model="filtro.fattura">
                            </td>
                            <td class="ris-gestore-td">
                                <input type="checkbox" ng-model="filtro.daPagare">
                                <label for="filtro-da-pagare">Da Pagare&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <input type="checkbox" ng-model="filtro.pagato">
                                <label for="filtro-pagato">Pagato</label>
                            </td>
                            <td class="ris-gestore-td">
                                <input type="button" value="Filtra" class="btn btn-primary" ng-click="updateFatDaCaricare(1)">
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
                            N. Ordine
                        </th>
                        <th>
                            Cliente
                        </th>
                        <th>
                            Tipo Ordine
                        </th>
                        <th>
                            Fattura
                        </th>
                        <th>
                            Stato pagamento
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="fat in fatDaCaricare">
                        <td>
                            {{fat.numeroOrdine}}
                        </td>
                        <td>
                            {{fat.cliente}}
                        </td>
                        <td>
                            {{fat.tipoOrdine}}
                        </td>
                        <td>
                            {{fat.fatturaNum}}
                            <a ng-show ="!fat.loaded" ng-click="fatLoadWindow(fat)">Carica</a>
                            <a ng-show="fat.loaded" ng-click="fatDelete(fat)">Elimina</a>
                        </td>
                        <td>
                            {{fat.statoPagamento}}
                            <a ng-click="openPaymentWindow(fat)" ng-show="fat.loaded">Modifica</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <center>
            <nav>
                <a type="button" class="btn btn-default" ng-disabled="currentPage == firstPage" ng-click="updateFatDaCaricare(firstPage)">
                    <span aria-hidden="true">{{firstPage}}</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="previousPage == 0" ng-click="updateFatDaCaricare(previousPage)">
                    <span aria-hidden="true">&laquo;</span>
                </a>

                <span ng-repeat="page in pages" class="pagination" id="pagination-ConfigurazioneAula">
                    <a type="button" class="btn btn-default" ng-disabled="currentPage == page" ng-click="updateFatDaCaricare(page)">{{page}}</a>
                </span>
                <a type="button" class="btn btn-default" ng-disabled="nextPage == 0" ng-click="updateFatDaCaricare(nextPage)">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="currentPage == lastPage" ng-click="updateFatDaCaricare(lastPage)">
                    <span aria-hidden="true">{{lastPage}}</span>
                </a>
            </nav>
        </center>
    </div>

    <!-- Load Window -->
    <div id="loadWindow" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Caricamento Fattura</h4>
                </div>
                <div class="modal-body">
                    <p>Caricamento fattura per ordine n. {{orderFat.numeroOrdine}}</p>
                    <div>
                        <form>
                            Numero fattura <input type="text" ng-model="uploadWindow.numeroFattura"><br>
                            <br>
                            <input type="file" name="file2" id="file2"/><br>
                        </form>
                        <button class="btn btn-primary btn-sm btn-file" ng-click="uploadFatturaAbb(orderFat)">Carica Fattura</button>  
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Chiudi</button>
                </div>
            </div>

        </div>
    </div>

    <!-- Payment Window -->
    <div id="paymentWindow" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Ordine n. {{orderFat.numeroOrdine}}</h4>
                </div>
                <div class="modal-body">
                    <table>
                        <tr>
                            <td>
                                <b>Cliente</b><br>
                            </td>
                            <td>
                                {{orderFat.cliente}}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Fattura</b><br>
                            </td>
                            <td>
                                {{orderFat.fatturaNum}}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>Stato Pagamento</b><br>
                            </td>
                            <td>
                                <input type="checkbox" ng-model="paymentSelected" id="paymentSelected"> 
                                <label for="paymentSelected">Pagato</label>
                            </td>
                        </tr>
                    </table>
                    <button class="btn btn-default btn-sm" data-dismiss="modal">Annulla</button>  
                    <button class="btn btn-primary btn-sm" ng-click="updatePayment(orderFat)">Salva</button>  


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Chiudi</button>
                </div>
            </div>

        </div>
    </div>
</div>



<script>
    app.controller('fatDaCaricareCtrl', function ($scope, $http) {

        $scope.updateFatDaCaricare = function (index) {
            console.log("fatDaCaricareCtrl " + index);
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
            var req = '<c:url value="<%= RisGestoreAjaxController.AX_GESTIONE_FATTURE_LISTA_FATTURE %>"/>';
            console.log(req);
            console.log(JSON.stringify(data));
            $http({
                url: req,
                method: 'POST',
                data: data,
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        // in case of success ...
                        $scope.fatDaCaricare = response.data.fatDaCaricare;
                        $scope.uploadWindow = {fileNames: null, numeroFattura: null};
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
            $scope.filtro = {numOrdine: null, cliente: null, fattura: null, daPagare: true, pagato: true};
        };

        $scope.fatLoadWindow = function (fat) {
            $scope.orderFat = fat;
            $("#loadWindow").modal("show");
        };

        $scope.closeFatLoadWindow = function () {
            $("#loadWindow").modal("hide");
        };

        $scope.fatDelete = function (fat) {
            console.log("fatDelete");
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            //data to be requested
            var data = fat;

            // request 
            var req = '<c:url value="<%= RisGestoreAjaxController.AX_GESTIONE_FATTURE_DELETE_FATTURA%>"/>';
            $http({
                url: req,
                method: 'POST',
                data: data,
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        // in case of success ...
                        $scope.updateFatDaCaricare($scope.currentPage);
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });

        };

        $scope.uploadFatturaAbb = function (orderFat) {
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            //data to be requested
            console.log(JSON.stringify($scope.uploadWindow));
            var oMyForm = new FormData();
            oMyForm.append("file", file2.files[0]);
            oMyForm.append("numeroFattura", $scope.uploadWindow.numeroFattura);
            oMyForm.append("didascalia", "Questa è una didascalia di test");
            oMyForm.append("idOrdineBol", orderFat.numeroOrdine);

            var req = "<c:url value='<%= FileAjaxController.RQ_UPLOAD_FATTURA_ABBON_PDF%>'/>";
            $.ajax({
                url: req,
                data: oMyForm,
                dataType: 'text',
                processData: false,
                contentType: false,
                type: 'POST',
                beforeSend: function (xhr) {
                    // CSRF prevention
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
                success: function (data) {
                    $scope.closeFatLoadWindow();
                    $scope.updateFatDaCaricare($scope.currentPage);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    $scope.closeFatLoadWindow();
                    window.alert('Errore!');
                }
            });
        };

        $scope.openPaymentWindow = function (fat) {
            $scope.orderFat = fat;
            $scope.paymentSelected = fat.pagato;
            $("#paymentWindow").modal("show");
        };

        $scope.updatePayment = function (orderFat) {

        };

        $scope.resetFiltro();
        $scope.updateFatDaCaricare(1);

    });
</script>                


