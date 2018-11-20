
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div ng-controller="anagAffiliatiCtrl" ng-cloak>
    <div class="row box-border" style="margin-right: 10px; padding-left: 20px;">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2>Anagrafica affiliati</h2>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                <h2>
                    <a class="btn btn-default" href="<c:url value='<%=RisGestoreController.RQ_CREA_AFFILIATO%>'/>">Crea Nuovo</a>
                </h2>
            </div>
        </div>
        <div class="row table-min-height-258">
            <table class="table gestione">
                <thead>
                    <tr>
                        <th>
                            Ragione sociale
                        </th>
                        <th>
                            Indirizzo sede
                        </th>
                        <th>
                            Gestisci
                        </th>
                    </tr>
                </thead>
                <tbody id="configurazioneAulaResult">
                    <tr ng-repeat="aff in listaAffiliati">
                        <td>{{aff.ragSoc}}</td>
                        <td>
                            {{aff.indirizzoSede}}
                        </td>
                        <td>
                            <div class='row'>

                                <div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>
                                    <center>
                                        <c:url value="<%= RisGestoreController.RQ_EDIT_AFFILIATO%>" var="chgUrl"/>
                                        <a class='underlined' href="${chgUrl}/{{aff.id}}">Modifica</a>
                                    </center>
                                </div>
                                <div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>
                                    <center>
                                        <c:url value="<%= RisGestoreController.RQ_DELETE_AFFILIATO%>" var="delUrl"/>
                                        <a class='underlined' href="${delUrl}/{{aff.id}}">Elimina</a>
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
                <a type="button" class="btn btn-default" ng-disabled="currentPage == firstPage" ng-click="updateAffiliati(firstPage)">
                    <span aria-hidden="true">{{firstPage}}</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="previousPage == 0" ng-click="updateAffiliati(previousPage)">
                    <span aria-hidden="true">&laquo;</span>
                </a>

                <span ng-repeat="page in pages" class="pagination" id="pagination-ConfigurazioneAula">
                    <a type="button" class="btn btn-default" ng-disabled="currentPage == page" ng-click="updateAffiliati(page)">{{page}}</a>
                </span>
                <a type="button" class="btn btn-default" ng-disabled="nextPage == 0" ng-click="updateAffiliati(nextPage)">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="currentPage == lastPage" ng-click="updateAffiliati(lastPage)">
                    <span aria-hidden="true">{{lastPage}}</span>
                </a>
            </nav>
        </center>
    </div>
</div>

<script>
//    var app = angular.module('anagsys', []);
    app.controller('anagAffiliatiCtrl', function ($scope, $http) {

        $scope.updateAffiliati = function (index) {
            console.log("anagAffiliatiCtrl " + index);
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
            var req = '<c:url value="<%= RisGestoreAjaxController.AX_GES_ANAG_AFFILIATI%>"/>';
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
                        $scope.listaAffiliati = response.data.listaAffiliati;
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

        $scope.updateAffiliati(1);

    });
</script>                


