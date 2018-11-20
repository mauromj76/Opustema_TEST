
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div ng-controller="contrMancantiCtrl" ng-cloak>
    <div class="row box-border" style="margin-right: 10px; padding-left: 20px;">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2>Contratti mancanti</h2>
            </div>
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
                    <tr ng-repeat="contr in contrMancanti">
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
                        <td>
<!--                            <div class='row'>
                                <div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>
                                    <center>
                                        <a class='underlined' href='<c:url value='<%= RisGestoreController.RQ_CHANGE_CONFIG%>'/>/{{cfg.id}}'>Modifica</a>
                                    </center>
                                </div>
                                <div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>
                                    <center>
                                        <a class='underlined' href='<c:url value='<%= RisGestoreController.RQ_DELETE_CONFIG_AULA%>'/>/{{cfg.id}}'>Elimina</a>
                                    </center>
                                </div>
                            </div>-->
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

        $scope.updateFatDaCaricare = function (index) {
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

            // request 
            var req = '<c:url value="<%= RisGestoreAjaxController.AX_GES_CONTRATTI_MANCANTI%>"/>';
            console.log(req);
            console.log(JSON.stringify(data));
//        $http.defaults.headers.common['X-Csrf-Token'] = csrfToken;
            $http({
                url: req,
                method: 'POST',
                data: JSON.stringify(data),
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        // in case of success ...
                        $scope.contrMancanti = response.data.contrMancanti;
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

        $scope.updateFatDaCaricare(1);

    });
</script>                


