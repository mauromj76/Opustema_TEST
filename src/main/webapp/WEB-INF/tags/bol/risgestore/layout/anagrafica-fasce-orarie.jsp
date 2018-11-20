
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.AnagraficheDiSistemaAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
    <h1>Gestione anagrafiche di sistema</h1>
</div>
<div ng-controller="fasceorarie-ctrl" ng-cloak>
    <div class="row box-border">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2>Anagrafica Fasce Orarie</h2>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                <h2>
                    <a class="btn btn-default" href="<c:url value='<%=RisGestoreController.RQ_CHANGE_FASCIAORARIA%>'/>">Crea Nuova</a>
                </h2>
            </div>
        </div>
        <div class="row table-min-height-258">
            <table class="table gestione">
                <thead>
                    <tr>
                        <th>
                            Fascia oraria
                        </th>
                        <th>
                            Sconto (%)
                        </th>
                        <th>
                            Gestisci
                        </th>
                    </tr>
                </thead>
                <tbody id="fascaOrariaResult">
                    <tr ng-repeat="fo in fasciaOrarias">
                        <td>{{fo.fasciaStringa}}</td>
                        <td>{{fo.sconto|number:1}}</td>
                        <td>
                            <div class='row'>
                                <div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>
                                    <center>
                                        <a class='underlined' href='<c:url value='<%= RisGestoreController.RQ_CHANGE_FASCIAORARIA%>'/>/{{fo.id}}'>Modifica</a>
                                    </center>
                                </div>
                                <div class='col-xs-6 col-sm-6 col-md-6 col-lg-6'>
                                    <center>
                                        <a class='underlined' href='<c:url value='<%= RisGestoreController.RQ_DELETE_FASCIA_ORARIA%>'/>/{{fo.id}}'>Elimina</a>
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
                <a type="button" class="btn btn-default" ng-disabled="currentPage == firstPage" ng-click="updateFasciaorarias(firstPage)">
                    <span aria-hidden="true">{{firstPage}}</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="previousPage == 0" ng-click="updateFasciaorarias(previousPage)">
                    <span aria-hidden="true">&laquo;</span>
                </a>

                <span ng-repeat="page in pages" class="pagination" id="pagination-ConfigurazioneAula">
                    <a type="button" class="btn btn-default" ng-disabled="currentPage == page" ng-click="updateFasciaorarias(page)">{{page}}</a>
                </span>
                <a type="button" class="btn btn-default" ng-disabled="nextPage == 0" ng-click="updateFasciaorarias(nextPage)">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                <a type="button" class="btn btn-default" ng-disabled="currentPage == lastPage" ng-click="updateFasciaorarias(lastPage)">
                    <span aria-hidden="true">{{lastPage}}</span>
                </a>
            </nav>
        </center>
    </div>
</div>
<script type="text/javascript">
    app.controller('fasceorarie-ctrl', function ($scope, $http) {

        $scope.updateFasciaorarias = function (index) {
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            if (index == null) {
                index = 1;
            }

            //data to be requested
            var data = {};
            data["index"] = index;
            
            console.log('fascia'+JSON.stringify(data));
            // request 
            var req = '<c:url value="<%= AnagraficheDiSistemaAjaxController.AX_GET_ANAGRAFICA_FASCE_ORARIE_BY_INDEX%>"/>';
            console.log('fascia'+req);
            $http({
                url: req,
                method: 'POST',
                data: JSON.stringify(data),
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        // in case of success ...
                        $scope.fasciaOrarias = response.data.fasciaOrarias;
                        $scope.firstPage = response.data.firstPage;
                        $scope.previousPage = response.data.previousPage;
                        $scope.pages = response.data.pages;   
                        $scope.nextPage = response.data.nextPage;
                        $scope.lastPage = response.data.lastPage;
                        $scope.currentPage = response.data.currentPage;
                        
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Error!');
                            });
        };
        $scope.updateFasciaorarias(1);

    });
</script>
