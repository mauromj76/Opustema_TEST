
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisAffiliatoController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisAffiliatoAjaxController"%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
    <div class="box-yellow">
        <h4>${advMessage.advMessage.message}</h4>
    </div>
    <div id="controller-container" ng-controller="GestioneStrutturaController" ng-cloak>
        <div class="row">
            <h4>{{struttura.nomeAffiliato}}</h4>
        </div>

        <div class="box-border">
            <div class="row">
                <div>
                    <h4> Gestione Struttura</h4>
                    <h5>{{messaggio}}</h5>
                    <form class ="form" role="form"> 
                        <div> 
                            <label for="nomeSede">Nome Sede</label>
                            <input type="text" class="form-control" rows="3" 
                                   id="nomeSede" ng-model="struttura.nomeSede"
                                   maxlength="200">
                        </div>
                        <div class="form-group">
                            <label for="descrizione">Descrizione</label>
                            <textarea type="text" class="form-control" 
                                      id="descrizione" rows="4" ng-model="struttura.descrizione"
                                      maxlength="200"></textarea>
                        </div>
                    </form>
                </div>
            </div>

            <div class="row">
                <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-6"> 
                    <form class ="form" role="form" id="frm-contact"> 
                        <div> 
                            <label for="indirizzo">Indirizzo</label>
                            <textarea class="form-control" rows="3" id="indirizzo" 
                                      ng-model="struttura.indirizzo"
                                      maxlength="100"></textarea>
                        </div>
                        <div> 
                            <label for="cap">CAP</label>
                            <input type="text" class="form-control" id="cap" 
                                   ng-model="struttura.cap" maxlength="5"/>
                        </div>
                        <div> 
                            <label for="citta">Citt&agrave;</label>
                            <input type="text" class="form-control" id="citta" 
                                   ng-model="struttura.citta" maxlength="80"/>
                        </div>
                        <div> 
                            <label for="provincia">Provincia</label>
                            <input type="text" class="form-control" id="provincia" 
                                   ng-model="struttura.provincia" maxlength="2"/>
                        </div>


                        <div> 
                            <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                                <label for="telefono">Telefono</label>
                                <input type="text" ng-model="struttura.telefono" 
                                       class="form-control" id="telefono" maxlength="32">
                            </div>
                            <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <label for="fax">Fax</label>
                                <input type="text" ng-model="struttura.fax" 
                                       class="form-control" id="fax" maxlength="32"/>
                            </div>
                        </div>

                        <div>
                            <label for="mail">Mail</label>
                            <input type="email" ng-model="struttura.email" 
                                   class="form-control" id="mail" maxlength="80"/>
                        </div>

                    </form>
                </div>
                <div class="form-group servizi col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <form class ="form" role="form"  id="frm-services">
                        <!-- Form group of Checkboxes and price unit -->            

                        <h5>Servizi aggiuntivi erogati</h5>
                        <div id="servizi">
                            <div ng-repeat="servizio in listaServizi">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">    
                                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" ng-model="servizio.disponibile"> 
                                            {{servizio.servizioAula.breve}}
                                        </label>
                                    </div>
                                    <div class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-6"> 
                                        <label for="prezzo" >Prezzo Unitario</label>
                                        <input type="text" ng-model="servizio.prezzoEuro">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div> 
            <div class="row">
                <div class=" col-xs-6  col-sm-6  col-md-6  col-lg-6">
                    <button class="btn btn-primary btn-sm pull-right" ng-click="updateStructureData()">Salva Modifiche</button>  
                </div> 
                <c:url value="<%= RisAffiliatoController.RQ_MI_RIEPILOGO_AFFILIATO%>" var="cancelUrl"/>
                <div class="col-xs-6  col-sm-6  col-md-6  col-lg-6">
                    <button class="btn btn-secondary btn-sm pull-right">
                        <a href="${cancelUrl}"  >Esci senza salvare</a>  
                    </button>
                </div> 
            </div>

            <div class="row">
                <%@include file="fasce-orarie-struttura.jsp" %>
            </div>            

            <div class="row">
                <%@ include file="foto-struttura.jsp"%>
            </div>

        </div> 
    </div>

    <%@ include file="gestioneAule.jsp"%>

</div>

<script>
    app.controller('GestioneStrutturaController', function ($scope, $http) {
        $scope.listaPrenotazioni = new Array();
        $scope.messaggio = "";
        $scope.getStructureData = function () {
//                console.log("entering loadWeek " + date);
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            $scope.messaggio = "";

            //data to be requested
            var data = {};
            // request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_GET_STRUCTURE_DATA%>"/>';
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
                        $scope.struttura = response.data.struttura;
                        $scope.listaServizi = response.data.listaServizi;
                        $scope.listaLinkImmagini = response.data.listaLinkImmagini;
                        $scope.listaFasce = response.data.listaFasce;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };
        $scope.updateStructureData = function () {
            console.log("entering updateStructureData");
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            $scope.messaggio = "";

            //data to be requested
            var data = {struttura: $scope.struttura, listaServizi: $scope.listaServizi};
            // request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_UPDATE_STRUCTURE_DATA%>"/>';
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
                        $scope.messaggio = "Dati struttura aggiornati."
                        $scope.struttura = response.data.struttura;
                        $scope.listaServizi = response.data.listaServizi;
                        $scope.listaFasce = response.data.listaFasce;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };

        $scope.uploadImmagine = function (idSede) {
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            var oMyForm = new FormData();
            oMyForm.append("file", file2.files[0]);
            oMyForm.append("didascalia", "Questa è una didascalia di test");
            oMyForm.append("idSede", idSede);

            var req = "<c:url value='<%= ImageAjaxController.RQ_UPLOAD_SEDE_IMG%>'/>";
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
                    $scope.refreshImagesList();
                }
            });

        };

        $scope.refreshImagesList = function () {
//                console.log("entering loadWeek " + date);
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            //data to be requested
            var data = {};
            // request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_GET_IMMAGINI_STRUTTURA%>"/>';
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

        $scope.eliminaFotoSelezionate = function () {
//                console.log("entering loadWeek " + date);
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            //data to be requested
            var data = {};
            data["listaLinkImmagini"] = $scope.listaLinkImmagini;

            // request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_REMOVE_IMMAGINI_STRUTTURA%>"/>';
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

        $scope.getStructureData();
    });
</script>