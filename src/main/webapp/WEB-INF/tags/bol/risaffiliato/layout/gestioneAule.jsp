
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="it.logicadeisistemi.bol.hbol.controller.RisAffiliatoAjaxController"%>
<%@ page import="it.logicadeisistemi.bol.hbol.controller.RisAffiliatoController"%>
<div id="controller-container" ng-controller="GestioneAuleController" ng-cloak>

    <div class="row" id="gest-aule">
        <div class="box-border">
            <div class="row">
                <div class="col-xs-6  col-sm-6  col-md-6  col-lg-6">
                    <h4>Gestione Aule</h4>
                </div>
                <div class=" col-xs-6  col-sm-6  col-md-6  col-lg-6">
                    <c:url value='<%= RisAffiliatoController.RQ_CREA_AULA%>' var="addUrl" />
                    <a href="${addUrl}" class="btn btn-primary pull-right">Crea nuova aula</a>
                </div>
            </div>
            <div class="row">
                <table class="table-bordered">
                    <c:url value="/" var="appCtx"/>
                    <tr ng-repeat="aula in listaAule">
                        <td class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <img class ="img-responsive" src="${appCtx}/{{aula.imageToShow.imgUrl}}"/>
                        </td>
                        <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                            <h4>{{aula.aula.nome}}</h4> 
                        </td>
                        <td class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                            <span>prezzo base</span> <span><h4> {{aula.aula.prezzo}}&euro;</h4></span>
                        </td>
                        <td>
                            <c:url value='<%= RisAffiliatoController.RQ_EDIT_AULA%>' var="changeUrl" />
                            <a href="${changeUrl}/{{aula.aula.id}}" >Modifica</a>
                        </td>
                        <td>
                            <c:url value='<%= RisAffiliatoController.RQ_ELIMINA_AULA%>' var="removeUrl" />
                            <a href="${removeUrl}/{{aula.aula.id}}" >Elimina</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    app.controller('GestioneAuleController', function ($scope, $http) {
        $scope.listaAule = new Array();
        $scope.messaggio = "";
        $scope.getAuleData = function () {
//                console.log("entering loadWeek " + date);
// CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            $scope.messaggio = "";

//data to be requested
            var data = {};
            // request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_GET_AULE_DATA%>"/>';
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
                        console.log(JSON.stringify(response.data));
                        $scope.listaAule = response.data.listaAule;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };
        $scope.getAuleData();
    });
</script>