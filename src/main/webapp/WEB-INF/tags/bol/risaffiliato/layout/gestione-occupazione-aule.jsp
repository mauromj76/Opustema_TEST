<%@page import="it.logicadeisistemi.bol.hbol.dto.RiepDisponGiornoDto"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisAffiliatoAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
    <div class="box-yellow">
        <center>
            <h4>${advMessage.advMessage.message}</h4>
        </center>
    </div>
    <h4>
        ${sede.nomeAffiliato} 
    </h4>
    <h5>${sede.nomeSede}</h5>

    <!-- Gestione-Struttura -->
    <div id="controller-container" ng-controller="TabellaRiepilogoController" ng-cloak>
        <div class="row box-border" id="frm-gest-structura">
            <h5> Gestione occupazione aule</h5>        
            <div class="row">    
                <nav  class="col-xs-12 col-sm-11 col-sm-push-1 col-md-10 col-md-push-2 col-lg-9  col-lg-push-3">
                    <ul class="pagination pagination-sm">
                        <li class="page-item ">
                            <a class="page-link" href="#" ng-click="loadWeek(prevWeekDate)" aria-label="Previous">
                                << settimana precedente
                            </a>
                        </li>

                        <li class="page-item">
                            <a class="page-link" href="#" ng-click="loadWeek(nextWeekDate)" aria-label="Next">
                                settimana successiva >>
                            </a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#" id="risaff-selweek">seleziona settimana</a>
                            <script type="text/javascript">
                                        $(document).ready(function () {
                                            var curDate = new Date();
                                            $('#risaff-selweek').datepicker({
                                                format: "mm-yyyy",
                                                startView: "days",
                                                minViewMode: "days",
                                                autoclose: "true",
                                                language: "it",
                                                startDate: curDate
                                            });
                                            $('#risaff-selweek').datepicker().on('changeDate', function (ev) {
                                                weekChanged(ev);
                                            });
                                        });
                            </script>
                        </li>
                    </ul>
                </nav>
                <table class="table-bordered col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <tr>
                        <td class="riepilogo-affiliato-image">
                        </td>
                        <td>
                            <table class="riepilogo-affiliato-riga-dispon">
                                <tr class="riepilogo-affiliato-riga-dispon">
                                    <td class="riepilogo-affiliato-fascia-oraria">
                                    </td>
                                    <td class="riepilogo-affiliato-fascia-dispon" ng-repeat="giorno in listaDisponibili.giorni">
                                        <b>{{giorno| date:'dd.MM.yyyy'}}</b>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <c:url value="/" var="appCtx"/>
                    <tr ng-repeat="dispAula in listaDisponibili.aulaList">
                        <td class="riepilogo-affiliato-image">
                            {{dispAula.aula.nome}}
                            <img class="img-responsive" src='${appCtx}/{{dispAula.immagineLink.imgUrl}}'/>
                        </td>
                        <td>
                            <table class="riepilogo-affiliato-riga-dispon">

                                <tr class="riepilogo-affiliato-riga-dispon" ng-repeat="fascia in dispAula.fasce">
                                    <td class="riepilogo-affiliato-fascia-oraria">
                                        {{fascia.fascia.fasciaOraria.fasciaStringa}}
                                    </td>

                                    <td class="riepilogo-affiliato-fascia-dispon" ng-repeat="dispGiorno in fascia.giorni">
                                        <button type="button"
                                                id="{{dispGiorno.giorno}}-{{fascia.fascia.fasciaOraria.id}}-{{dispAula.aula.id}}"
                                                
                                                ng-class="dispGiorno.style"
                                                ng-click="aulaClicked(dispGiorno.giorno, fascia.fascia.fasciaOraria, dispAula.aula, dispGiorno)">
                                            {{dispGiorno.message}}
                                        </button>
                                    </td>

                                </tr>

                            </table>
                        </td>
                    </tr>

                </table>
            </div>

            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <div>
                        <span class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <h5>Orari selezionati</h5>
                        </span>
                        <span class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <button class="btn btn-default btn-sm" ng-click="deselectAll()">
                                deseleziona tutto
                            </button>
                        </span>
                    </div>
                    <div class="box-border">
                        <div class="row" id="orari-selezionati" ng-repeat="pren in listaPrenotazioni">
                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                <h6>{{pren.giorno| date:'dd.MM.yyyy'}} </h6> 
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                <h6>{{pren.fascia.fasciaStringa}}</h6> 
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                <h6>{{pren.aula.nome}}</h6>
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                <button class="btn btn-danger" ng-click="deletePren($index)" title="Elimina">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </button>
                            </div>
                        </div> 
                    </div>


                </div>

                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <form>
                        <div class="form-group">
                            <label for="comment">Note prenotazione</label>
                            <textarea class="form-control" rows="3" id="note-prenotaz"></textarea>
                        </div>
                    </form>
                    <button class="btn btn-default btn-sm col-xs-4 col-sm-4 col-md-3 col-lg-3" ng-click="occupaOrario()">
                        Occupa Orario
                    </button>
                    <button class="btn btn-default btn-sm col-xs-4 col-sm-4 col-md-3 col-lg-3" ng-click="liberaOrario()">
                        Libera Orario
                    </button>
                    <button class="btn btn-default btn-sm col-xs-4 col-sm-4 col-md-3 col-lg-3" ng-click="modificaNote()">
                        Modifica Note
                    </button>
                </div>

            </div>

        </div>
        <%@ include file="prosime-prenotazioni.jsp"%>
    </div>
</div>

<script>
    app.controller('TabellaRiepilogoController', function ($scope, $http) {
        $scope.loadWeek = function (date) {
            $scope.deselectAll();
//                console.log("entering loadWeek " + date);
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            //data to be requested
            var data = {};
            data["exactDate"] = date;
            data["searchType"] = "exactDate";
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

        $scope.deselectAll = function () {
            $scope.listaPrenotazioni = new Array();
            $scope.prenMap = {};
        };

        $scope.deletePren = function (inx) {
            console.log(inx);
            var a = $scope.listaPrenotazioni[inx];
            var k = $scope.calcKey(a.giorno, a.fascia, a.aula);
//            console.log(k);
            $scope.listaPrenotazioni.splice(inx, 1);
            $scope.prenMap[k] = null;
        };

        $scope.aulaClicked = function (giorno, fascia, aula, disp) {
//            console.log("aulaClicked " + giorno + fascia + aula);
            // check if it is a customer booking
            if (disp.stato == <%= RiepDisponGiornoDto.STATO_DISPONIBILE%>) {
                // FIXME
            } else if (disp.stato == <%= RiepDisponGiornoDto.STATO_IN_PRENOTAZIONE%>) {
                // FIXME
            } else if (disp.stato == <%= RiepDisponGiornoDto.STATO_PRENOTATO_CLIENTE%>) {
                window.alert("Già prenotato da un cliente.");
                return;
            } else if (disp.stato == <%= RiepDisponGiornoDto.STATO_PRENOTATO_INTERNO%>) {
                // FIXME
            } else if (disp.stato == <%= RiepDisponGiornoDto.STATO_NON_PRENOTABILE%>) {
                window.alert("Questa fascia oraria non è prenotabile in questo giorno.");
                return;
            }
            var k = $scope.calcKey(giorno, fascia, aula);
            if ($scope.prenMap[k] == null) {
                var pren = {giorno: giorno, fascia: fascia, aula: aula};
                $scope.listaPrenotazioni.push(pren);
                $scope.prenMap[k] = 1;
                disp.stato = <%= RiepDisponGiornoDto.STATO_IN_PRENOTAZIONE %>;
                disp.style = "<%= RiepDisponGiornoDto.STYLE_IN_PRENOTAZIONE %>";
            } else {
                window.alert("La prenotazione è già presente nella lista");
            }
        };

        $scope.occupaOrario = function () {
//                console.log("entering loadWeek " + date);
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            //data to be requested
            var data = {listaPrenotazioni: $scope.listaPrenotazioni};

            // request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_OCCUPA_ORARIO%>"/>';
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
                        $scope.loadWeek(null);
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };

        $scope.liberaOrario = function () {
//                console.log("entering loadWeek " + date);
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

            //data to be requested
            var data = {listaPrenotazioni: $scope.listaPrenotazioni};

            // request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_LIBERA_ORARIO%>"/>';
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
                        $scope.loadWeek(null);
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };


        $scope.calcKey = function (g, f, a) {
            return "" + g + "-" + f.id + "-" + a.id;
        };

        $scope.loadWeek(null);
    });
</script>
<script>
    function weekChanged(ev) {
        var data = ev.date;
        var scope = angular.element(document.getElementById('controller-container')).scope();
        scope.loadWeek(data);
    }
</script>