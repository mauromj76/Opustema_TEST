<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisAffiliatoController"%>
<div id="controller-container" ng-controller="GestioneAulaController" ng-cloak>
    <%@include file="form-modificaAula-dettagli.jsp" %>
    <%@include file="form-modificaAula-config-car.jsp" %>
    <div class="row">
        <button type="button" class="btn btn-primary pull-right" ng-click="salva()">Salva Modifiche</button>
    </div>
    <div class="row">
        <br>
        <button type="button" class="btn btn-secondary pull-right" ng-click="annulla()">Annulla</button>
    </div>
    <%@include file="form-modificaAula-immagini.jsp" %>
</div>

<script>
    app.controller('GestioneAulaController', function ($scope, $window, $http) {
        $scope.loadAula = function (id) {
//                console.log("entering loadWeek " + date);
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            //data to be requested
            var data = {idAula: id};
            // request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_GET_ONE_AULA%>"/>';
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
                        $scope.aula = response.data.aula;
                        $scope.configurazioni = response.data.configurazioni;
                        $scope.carPrincipali = response.data.carPrincipali;
                        $scope.carSecondarie = response.data.carSecondarie;
                        $scope.valCrediti = response.data.valCrediti;
                        $scope.scontoCrediti = response.data.scontoCrediti;
                        $scope.listaLinkImmagini = response.data.listaLinkImmagini;
                        $scope.updateCredits($scope.aula);
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };
        $scope.updateCredits = function (aula) {
            $scope.aula.prezzoCrediti = (aula.prezzo / $scope.valCrediti) * (1 - ($scope.scontoCrediti / 100));
            $scope.aula.prezzoCrediti = Math.round( $scope.aula.prezzoCrediti * 100 ) / 100;
            console.log($scope.aula.prezzoCrediti);
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
            data["idAula"] = $scope.aula.id;
            data["aula"] = $scope.aula;
            data["configurazioni"] = $scope.configurazioni;
            data["carPrincipali"] = $scope.carPrincipali;
            data["carSecondarie"] = $scope.carSecondarie;
            // request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_UPDATE_ONE_AULA%>"/>';
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
                        $window.location.href = "<c:url value='<%= RisAffiliatoController.RQ_MI_GESTIONE_STRUTTURA%>'/>";
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };
        $scope.uploadImmagine = function (idAula) {
// CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            var oMyForm = new FormData();
            oMyForm.append("file", file2.files[0]);
            oMyForm.append("didascalia", "Questa è una didascalia di test");
            oMyForm.append("idAula", idAula);
            var req = "<c:url value='<%= ImageAjaxController.RQ_UPLOAD_AULA_IMG%>'/>";
            $.ajax({
                url: req,
                data: oMyForm,
                dataType: 'text',
                processData: false,
                contentType: false,
                type: 'POST',
                beforeSend: function (xhr) {
                    // CSRF prevention
                    xhr.setRequestHeader(csrfHeader, csrfToken);
                },
                success: function (data) {
                    $scope.refreshImagesList(idAula);
                }
            });
        }
        $scope.refreshImagesList = function (idAula) {
//                console.log("entering loadWeek " + date);
// CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
//data to be requested
            var data = {idAula: idAula};
// request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_GET_IMMAGINI_AULA%>"/>';
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
                        $scope.listaLinkImmagini = response.data.listaLinkImmagini;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };
        $scope.eliminaFotoSelezionate = function (idAula) {
//                console.log("entering loadWeek " + date);
// CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
//data to be requested
            var data = {idAula: idAula};
            data["listaLinkImmagini"] = $scope.listaLinkImmagini;
// request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_REMOVE_IMMAGINI_AULA%>"/>';
//                console.log(req);
            console.log(JSON.stringify(data));
            $http({
                url: req,
                method: 'POST',
                data: data,
                headers: {'X-Csrf-Token': csrfToken}
            })
                    .then(function (response) {
                        // in case of success ...
                        $scope.listaLinkImmagini = response.data.listaLinkImmagini;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };
        $scope.loadAula(${idAula});
    });
</script>
<script>
    function weekChanged(ev) {
        var data = ev.date;
        var scope = angular.element(document.getElementById('controller-container')).scope();
        scope.loadWeek(data);
    }
</script>    



