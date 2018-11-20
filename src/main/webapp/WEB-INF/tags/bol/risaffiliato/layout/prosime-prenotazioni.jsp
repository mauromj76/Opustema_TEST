<%@page import="it.logicadeisistemi.bol.hbol.controller.RisAffiliatoAjaxController"%>

<div id="controller-container" ng-controller="TabellaProxPrenController" ng-cloak>
    <div class="row">
        <div class="box-border">
            <h5>Prossime prenotazioni </h5>  
            <table class="table-bordered">
                <thead>
                <th class="col-xs-4 col-sm-4 col-md-4 col-lg-4"> Data </th>
                <th class="col-xs-1 col-sm-1 col-md-1 col-lg-1"> Aula </th>
                <th class="col-xs-3 col-sm-3 col-md-3 col-lg-3"> Configurazione </th>
                <th class="col-xs-4 col-sm-4 col-md-4 col-lg-4"> Cliente </th>
                </thead>
                <tbody>
                    <tr ng-repeat="pren in prenotazioni">
                        <td >
                            {{pren.data}}
                        </td>
                        <td >
                            {{pren.aula}}
                        </td>
                        <td >
                            {{pren.configurazione}} <br>
                            <div ng-repeat="ser in pren.servizi">
                                {{ser}}<br>
                            </div>
                        </td>
                        <td >
                            <div ng-repeat="cli in pren.cliente">
                                {{cli}}<br>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    app.controller('TabellaProxPrenController', function ($scope, $http) {
        $scope.loadProxPren = function() {
//                console.log("entering loadWeek " + date);
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            //data to be requested
            var data = {};
            // request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_LOAD_PROX_PRENOTAZIONI%>"/>';
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
                        $scope.prenotazioni = response.data.prenotazioni;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };
        $scope.aulaClicked = function (giorno, fascia, aula) {
            console.log("aulaClicked " + giorno + fascia + aula);
            var pren = {giorno: giorno, fascia: fascia, aula: aula};
            $scope.listaPrenotazioni.push(pren);
        };
        $scope.loadProxPren();
    });
</script>
<script>
    function weekChanged(ev) {
        var data = ev.date;
        var scope = angular.element(document.getElementById('controller-container')).scope();
        scope.loadWeek(data);
    }
</script>