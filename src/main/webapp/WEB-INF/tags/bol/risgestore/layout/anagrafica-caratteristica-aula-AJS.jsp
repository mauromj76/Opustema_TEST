

<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="it.logicadeisistemi.bol.hbol.controller.AnagraficheDiSistemaAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div ng-controller="caratCtrl" ng-cloak>
    <div class="row box-border">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2>Anagrafica Caratteristiche Aule</h2>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                <h2>
                    <a class="btn btn-default" href="<c:url value='<%=RisGestoreController.RQ_CHANGE_CARATERIST%>'/>">Crea Nuova</a>
                </h2>
            </div>
        </div>
        <div class="row table-min-height-258">
            <table class="table gestione">
                <thead>
                    <tr>
                        <th>
                            Nome Caratteristica
                        </th>
                        <th>
                            Principale
                        </th>
                        <th class="elem-centered">
                            Icona
                        </th>
                        <th>
                            Gestisci
                        </th>
                    </tr>
                </thead>
                <tbody id="caratteristicheAulaResult">
                    <tr ng-repeat="caratteristica in caratteristicaAulas">
                        <td class="hidden">{{ caratteristica.id}}</td>                        
                        <td>{{ caratteristica.nome}}</td>
                        <td class="in-place-editable-xs elem-centered">{{caratteristica.tipo == 1 && "Sì"|| "No"}}</td>
                        <td>
                            <c:url value="/" var="appCtx"/>
                            <img class="img-responsive logo img-icon elem-centered" src="${appCtx}/{{caratteristica.imgUrl}}"/>
                        </td>
                        <td>
                            <a class="underlined col-xs-6 col-sm-6 col-md-6 col-lg-6" href="<c:url value='<%= RisGestoreController.RQ_CHANGE_CARATERIST%>'/>/{{ caratteristica.id}}">Modifica</a> 
                            <a class="underlined col-xs-6 col-sm-6 col-md-6 col-lg-6" href="<c:url value='<%= RisGestoreController.RQ_DELETE_CARATTERISTICHE_AULA%>'/>/{{ caratteristica.id}}">Elimina</a>
                        </td>


                    </tr>

                </tbody>
            </table>
        </div>
        <center>
            <nav>
                <a type="button" class="btn btn-default" ng-disabled="currentPage == firstPage" ng-click="updateCarateristiche(firstPage)">
                    <span aria-hidden="true">{{firstPage}}</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="previousPage == 0" ng-click="updateCarateristiche(previousPage)">
                    <span aria-hidden="true">&laquo;</span>
                </a>

                <span ng-repeat="page in pages" class="pagination" id="pagination-CaratteristicheAula">
                    <a type="button" class="btn btn-default" ng-disabled="currentPage == page" ng-click="updateCarateristiche(page)">{{page}}</a>
                </span>
                <a type="button" class="btn btn-default" ng-disabled="nextPage == 0" ng-click="updateCarateristiche(nextPage)">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="currentPage == lastPage" ng-click="updateCarateristiche(lastPage)">
                    <span aria-hidden="true">{{lastPage}}</span>
                </a>
            </nav>
        </center>
    </div>
</div>

<script>
//    var app = angular.module('anagsys', []);
    app.controller('caratCtrl', function ($scope, $http) {

        $scope.updateCarateristiche = function (index) {
            console.log("updateCarateristiche " + index);
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
            var req = '<c:url value="<%= AnagraficheDiSistemaAjaxController.AX_GET_CARATTERISTICA_AULA_BY_INDEX%>"/>';
            console.log(req);
            console.log(JSON.stringify(data));
//        $http.defaults.headers.common['X-Csrf-Token'] = csrfToken;
            $http({
                url: req,
                method: 'POST',
                data: JSON.stringify(data),
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (responseCarateristiche) {
                        // in case of success ...
                        $scope.caratteristicaAulas = responseCarateristiche.data.caratteristicaAulas;
                        $scope.pages = responseCarateristiche.data.pages;
                        $scope.previousPage = responseCarateristiche.data.previousPage;
                        $scope.nextPage = responseCarateristiche.data.nextPage;
                        $scope.firstPage = responseCarateristiche.data.firstPage;
                        $scope.lastPage = responseCarateristiche.data.lastPage;
                        $scope.lastPage = responseCarateristiche.data.lastPage;
                        $scope.currentPage = responseCarateristiche.data.currentPage;
                    },
                            function (responseCarateristiche) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };

        $scope.updateCarateristiche(1);

    });
</script> 

