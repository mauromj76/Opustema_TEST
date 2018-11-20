<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.AnagraficheDiSistemaAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div ng-controller="pacchetti-fotocopie-ctrl" ng-cloak>
    <div class="row box-border">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2>Anagrafica Pacchetti Fotocopie</h2>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                <h2>
                    <a class="btn btn-default" href="<c:url value='<%=RisGestoreController.RQ_CHANGE_PACCHETOFOTOCOPIE%>'/>">Crea Nuovo</a>
                </h2>
            </div>
        </div>
        <div class="row table-min-height-258">
            <table class="table gestione">
                <thead>
                    <tr>
                        <th>
                            Formato
                        </th>
                        <th>
                            Stampa
                        </th>
                        <th>
                            Quantit&agrave;
                        </th>
                        <th>
                            Importo &euro;
                        </th>
                        <th>
                            Importo crediti
                        </th>
                        <th>
                            Gestici
                        </th>
                    </tr>
                </thead>
                <tbody id="pacchettoFotocopieResult">
                    <tr ng-repeat="cfg in pacchettoFotocopies">
                        <td>{{ cfg.formato.substring(0, 2)}}</td>
                        <td>{{ cfg.formato.substring(3, cfg.formato.length)}}</td>   

                        <td>{{ cfg.quantita}}</td>
                        <td>{{ cfg.costoEuro}}</td>
                        <td>{{ cfg.costoCrediti}}</td>
                        <td>
                            <div class='row'>
                                <div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>
                                    <center>
                                        <a class='underlined' href='<c:url value='<%= RisGestoreController.RQ_CHANGE_PACCHETOFOTOCOPIE%>'/>/{{cfg.id}}'>Modifica</a>
                                    </center>
                                </div>
                                <div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>
                                    <center>
                                        <a class='underlined' href='<c:url value='<%= RisGestoreController.RQ_DELETE_PACCHETTI_FOTOCOPIE%>'/>/{{cfg.id}}'>Elimina</a>
                                    </center>
                                </div>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <center>
            <nav>
                <a type="button" class="btn btn-default" ng-disabled="currentPage == firstPage" ng-click="updatePacchettoFotocopie(firstPage)">
                    <span aria-hidden="true">{{firstPage}}</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="previousPage == 0" ng-click="updatePacchettoFotocopie(previousPage)">
                    <span aria-hidden="true">&laquo;</span>
                </a>

                <span ng-repeat="page in pages" class="pagination" id="pagination-ConfigurazioneAula">
                    <a type="button" class="btn btn-default" ng-disabled="currentPage == page" ng-click="updatePacchettoFotocopie(page)">{{page}}</a>
                </span>
                <a type="button" class="btn btn-default" ng-disabled="nextPage == 0" ng-click="updatePacchettoFotocopie(nextPage)">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="currentPage == lastPage" ng-click="updatePacchettoFotocopie(lastPage)">
                    <span aria-hidden="true">{{lastPage}}</span>
                </a>
            </nav>
        </center>
    </div>
</div>
<script type="text/javascript">
    app.controller('pacchetti-fotocopie-ctrl', function ($scope, $http) {

        $scope.updatePacchettoFotocopie = function (index) {
            console.log("updatePacchettoFotocopie " + index);
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            if (index === null) {
                index = 1;
            }

            //data to be requested
            var data = {};
            data["index"] = index;

            // request 
            var req = '<c:url value="<%= AnagraficheDiSistemaAjaxController.AX_GET_PACCHETTO_FOTOCOPIE_BY_INDEX%>"/>';
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
                        $scope.pacchettoFotocopies = response.data.pacchettoFotocopies;
                        console.log($scope.pacchettoFotocopies);
                        $scope.pages = response.data.pages;
                        $scope.previousPage = response.data.previousPage;
                        $scope.nextPage = response.data.nextPage;
                        $scope.firstPage = response.data.firstPage;
                        $scope.lastPage = response.data.lastPage;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };
        $scope.updatePacchettoFotocopie(1);

    });
</script>

