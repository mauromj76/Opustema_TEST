<%-- 
    Tabela di GESTIONE FOTOCOPIE CLIENT
    7.5
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisAffiliatoAjaxController"%>

<div id="controller-container" ng-controller="RiepilogoFotocopieController" ng-cloak>
    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
        <h3>Messaggio pubblicitario/Informativo</h3>
        <div>
            <span><h4>{{affiliato.ragSoc}}</h4></span>
        </div>

        <div class="table-bordered">
            <table class="table-bordered" id="tbgsfotclaffiliato">
                <caption>Gestione Fotocopie Clienti<button>Aggiungi nuovo addebito</button></caption>
                <thead>
                    <tr>
                        <th class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Data</th>
                        <th class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Tipo</th>
                        <th class="col-xs-1 col-sm-1 col-md-1 col-lg-1">Quantit&#225</th>
                        <th class="col-xs-4 col-sm-4 col-md-4 col-lg-4">Cliente</th>
                        <th class="col-xs-3 col-sm-3 col-md-3 col-lg-3">Gestisci</th>
                    </tr>
                </thead>
                <tbody>
                    <tr ng-repeat="elem in elements">
                        <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2">{{elem.data}}</td>
                        <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2">{{elem.formato}}</td>
                        <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">{{elem.qta}}</td>
                        <td class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                            <div>{{elem.cliente}}</div> 
                            <div>{{elem.indirizzo}}</div>
                            <div>Ref.: {{elem.referente}}</div>
                        </td>
                        <td class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <span class="col-xs-1 col-sm-1 col-md-1 col-lg-1" >
                                <a href="#">Elimina</a>
                            </span>
                            <span class="col-xs-1 col-sm-1 col-md-1 col-lg-1 col-xs-push-2 col-sm-push-2 col-md-push-2 col-lg-push-2">
                                <a href="#">Modifica</a>                  
                            </span>

                        </td> 
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
            
<script>
    app.controller('RiepilogoFotocopieController', function ($scope, $http) {
        $scope.loadRiepFotocopie = function () {
            $scope.deselectAll();
//                console.log("entering loadWeek " + date);
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            //data to be requested
            var data = {};
            // request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_LOAD_WEEK_AVAIL%>"/>';
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
//                            console.log(JSON.stringify(response.data));
                        $scope.listaDisponibili = response.data.listaDisponibili;
                        $scope.listaFasce = response.data.listaFasce;
                        $scope.prevWeekDate = response.data.prevWeekDate;
                        $scope.nextWeekDate = response.data.nextWeekDate;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };

        $scope.loadRiepFotocopie();
    });
</script>
