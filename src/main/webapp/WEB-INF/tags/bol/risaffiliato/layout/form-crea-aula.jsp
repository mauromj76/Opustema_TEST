<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisAffiliatoController"%>
<div id="controller-container" ng-controller="GestioneAulaController" ng-cloak>
    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
        <%@include file="form-modificaAula-dettagli.jsp" %>
        <div>
            <button type="button" class="btn btn-secondary" ng-click="annulla()">Annulla</button>
            <button type="button" class="btn btn-primary" ng-click="salva()">Salva Modifiche</button>
        </div>
    </div>
</div>

<script>
    app.controller('GestioneAulaController', function ($scope, $window, $http) {
        $scope.updateCredits = function (aula) {
            $scope.aula.prezzoCrediti = ($scope.aula.prezzo / $scope.valCrediti) * (1 - $scope.scontoCrediti / 100);
            $scope.aula.prezzoCrediti = Math.round($scope.aula.prezzoCrediti * 100) / 100;
        };
        $scope.annulla = function () {
            console.log("Annullato");
            $window.location.href = "<c:url value='<%= RisAffiliatoController.RQ_MI_GESTIONE_STRUTTURA%>'/>";
        };
        $scope.salva = function () {
            console.log("Salvataggio in corso");
//                console.log("entering loadWeek " + date);
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            //data to be requested
            var data = {};
            data["aula"] = $scope.aula;
            // request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_SAVE_ONE_AULA%>"/>';
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
                        var redUrl = "<c:url value='<%= RisAffiliatoController.RQ_EDIT_AULA%>'/>";
                        redUrl += "/" + response.data.aula.id;
                        console.log(redUrl);
                        $window.location.href = redUrl;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };

        $scope.initPage = function () {
            $scope.aula = {nome: "", maxPosti: 1, prezzo: 0, prezzoCrediti: 0, descrizione: ""};
            var jsonData = JSON.parse('${jsonData}');
            $scope.valCrediti = jsonData.creditsConversionFactor;
            $scope.scontoCrediti = jsonData.creditsDiscount;
        };

        $scope.initPage();

    });
</script>


