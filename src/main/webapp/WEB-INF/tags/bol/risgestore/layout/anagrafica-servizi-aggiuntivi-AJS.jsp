
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="it.logicadeisistemi.bol.hbol.controller.AnagraficheDiSistemaAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div ng-controller="serviziCtrl" ng-cloak>  
    <!--  Rename caratCtrl me ServiziCtrl-->
    <div class="row box-border">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2>Anagrafica Servizi Aggiuntivi</h2>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                <h2>
                    <a class="btn btn-default" href="<c:url value='<%=RisGestoreController.RQ_CHANGE_SERVIZIO%>'/>">Crea Nuovo</a>
                </h2>
            </div>
        </div>
        <div class="row table-min-height-258" >
            <table class="table gestione">
                <thead>
                    <tr>
                        <th>
                            Nome servizio
                        </th>
                        <th>
                            Gestisci
                        </th>
                    </tr>
                </thead>
                <tbody id="servizioResult">
                    <tr ng-repeat="servizio in servizioAulas">
                        <td class="hidden">{{ servizio.id}}</td>                        
                        <td>{{ servizio.breve}}</td> 
                        <td>
                            <a class="underlined col-xs-6 col-sm-6 col-md-6 col-lg-6" href="<c:url value='<%= RisGestoreController.RQ_CHANGE_SERVIZIO%>'/>/{{ servizio.id}}">Modifica</a> 
                            <a class="underlined col-xs-6 col-sm-6 col-md-6 col-lg-6" href="<c:url value='<%= RisGestoreController.RQ_DELETE_SERVIZI_AGGIUNTIVI%>'/>/{{ servizio.id}}">Elimina</a>
                        </td>


                    </tr>
                </tbody>
            </table>
        </div>
        <center>
            <nav>
                <a type="button" class="btn btn-default" ng-disabled="currentPage == firstPage" ng-click="updateServizio(firstPage)">
                    <span aria-hidden="true">{{firstPage}}</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="previousPage == 0" ng-click="updateServizio(previousPage)">
                    <span aria-hidden="true">&laquo;</span>
                </a>

                <span ng-repeat="page in pages" class="pagination" id="pagination-CaratteristicheAula">
                    <a type="button" class="btn btn-default" ng-disabled="currentPage == page" ng-click="updateServizio(page)">{{page}}</a>
                </span>
                <a type="button" class="btn btn-default" ng-disabled="nextPage == 0" ng-click="updateServizio(nextPage)">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="currentPage == lastPage" ng-click="updateServizio(lastPage)">
                    <span aria-hidden="true">{{lastPage}}</span>
                </a>
            </nav>
        </center>      
    </div>
</div>

<script>
    app.controller('serviziCtrl', function ($scope, $http) {

        $scope.updateServizio = function (index) {
            console.log("updateServizio " + index);
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
            var req = '<c:url value="<%= AnagraficheDiSistemaAjaxController.AX_GET_SERVIZIO_AULA_BY_INDEX%>"/>';
            console.log(req);
            console.log(JSON.stringify(data));
//        $http.defaults.headers.common['X-Csrf-Token'] = csrfToken;
            $http({
                url: req,
                method: 'POST',
                data: JSON.stringify(data),
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (responseServizio) {
// in case of success ...
                        $scope.servizioAulas = responseServizio.data.servizioAulas;
//                        kujdes ! gjej listen per serviset
                        $scope.pages = responseServizio.data.pages;
                        $scope.previousPage = responseServizio.data.previousPage;
                        $scope.nextPage = responseServizio.data.nextPage;
                        $scope.firstPage = responseServizio.data.firstPage;
                        $scope.lastPage = responseServizio.data.lastPage;
                        $scope.lastPage = responseServizio.data.lastPage;
                        $scope.currentPage = responseServizio.data.currentPage;
                    },
                            function (responseServizio) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };

        $scope.updateServizio(1);

    });
</script> 

