<%-- 
    Allows the selection of FasciaOraria and other options in booking
    See page 3.2 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="it.logicadeisistemi.bol.app.dto.GiornoRicercaClassiDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.SecurityAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.CarrelloAuleController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.CarrelloAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.BookingAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.BookingController"%>
<div id="controller-container" ng-controller="SelezioneAulaController" ng-cloak>
    <div class="" id="risultati-di-ricerca">
        <div class="row">
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                <h2 id="scegli-nome-aula-data" class="modal-title">{{nomeAula}} - {{data}}</h2>
                <h3 id="scegli-indirizzo-aula" class="modal-title" style="color:gray">{{cittaAula}} - {{indirizzoAula}}</h3>
            </div>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                <a class="btn btn-primary anchor-float-right" role="button" href="<c:url value='<%=BookingController.RQ_SEARCH_REPEAT%>'/>">Indietro</a>
            </div>
        </div>
        <c:if test="${chooseDto.fasciaScelta != null}">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <table id="table-fascia-scelta" class="table">
                        <thead>
                            <tr>
                                <td>
                                    Fascia oraria
                                </td>
                                <td>
                                    Configurazione
                                </td>
                                <td>
                                    Servizi aggiuntivi
                                </td>
                                <td>
                                    Prezzo
                                </td>
                                <td>

                                </td>
                            </tr>
                        </thead>
                        <tr>
                            <td style="text-align: center;">
                                <p id="fascia-scelta" style="color:gray;">
                                    ${fasciaScelta.fasciaStringa}
                                </p>
                            </td>
                            <td class="form-inline">
                                <select id="select-configurazioni" class="form-control">
                                    <option ng-repeat="cfg in configurazioni">{{cfg.nomeConfigurazione}}</option>
                                </select>
                                <span class="badge" data-toggle="tooltip" data-placement="right"  
                                      title="help">?</span>
                            </td>
                            <td class="form-inline">
                                <select id="select-servizi" class="form-control">
                                    <option>Coffe break - Virtual Machine</option>
                                </select>
                                <span class="badge" data-toggle="tooltip" data-placement="right"  
                                      title="help">?</span>
                            </td>
                            <td class="center">
                                <h4>200 &euro;</h4>
                                <p id="prezzo-riga">
                                    <small>(110 crediti)</small>
                                </p>
                            </td>
                            <td style="border:0px none">
                                <a href="#">
                                    <span class="glyphicon glyphicon-shopping-cart"></span>
                                </a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </c:if>
        <br>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h4 id="potrebbero-interessarti">Potrebbero interessarti anche:</h4>
                <table id="fascia-altre" class="table">
                    <thead>
                        <tr>
                            <td>
                                Fascia oraria
                            </td>
                            <td>
                                Configurazione
                            </td>
                            <td>
                                Servizi aggiuntivi
                            </td>
                            <td>
                                Prezzo
                            </td>
                            <td>
                            </td>
                        </tr>
                    </thead>
                    <tbody id="altre-fasce-tbody">
                        <tr ng-repeat="fascia in fasceAltre">

                            <td style="text-align: center;">
                                <h4 style="color:gray;">
                                    {{fascia.fascia.fasciaStringa}}
                                </h4>
                            </td>
                            <td class="form-inline">
                                <select class="form-control" ng-model="fascia.cfgSelected" 
                                        ng-change="changedConfig(fascia)"
                                        ng-options="cfg as cfg.optionName for cfg in configurazioni track by cfg.idConfigurazione" >
                                </select>
                                <span class="badge" data-toggle="tooltip" data-placement="right"  
                                      title="help">?</span>
                            </td>
                            <td class="form-inline">
                                <button ng-click="fascia.isCollapsed = !fascia.isCollapsed">Scegli Servizi Opzionali</button>
                                <span class="badge" data-toggle="tooltip" data-placement="right"  
                                      title="help">?</span>
                                <div ng-show="!fascia.isCollapsed">
                                    <table>
                                        <tr ng-repeat="servizio in fascia.servizi">
                                            <td>
                                                <input type="checkbox" ng-model="servizio.checked" ng-click="checkedService(fascia, servizio)">
                                            </td>
                                            <td>
                                                {{servizio.nomeServizio}} ({{servizio.prezzoEuro| currency : "&euro;" : 2}} )
                                            </td>
                                            <td>
                                                &nbsp;&nbsp;Q.t&agrave;&nbsp;
                                            </td>
                                            <td>
                                                <input type="number" maxlength="4" min="1" max="9999" ng-disabled="!servizio.checked"
                                                       ng-change="qtyService(fascia)" ng-model="servizio.qta">
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                            </td>
                            <td class="center">
                                <h4>
                                    {{fascia.totaleFasciaEuro| currency : "&euro;" : 2 }} 
                                </h4>
                                <p>
                                    ({{fascia.totaleFasciaCrediti| currency : "Crediti " : 2 }}) 
                                </p>
                            </td>
                            <td style="border:0px none">
                                <a href="#">
                                    <span class="glyphicon glyphicon-shopping-cart btn btn-primary btn-lg" 
                                          ng-click="add2cart(fascia)"></span>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
        </div>
        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
            <a class="btn btn-primary anchor-float-right" role="button" href="<c:url value='<%=BookingController.RQ_SEARCH_REPEAT%>'/>">Indietro</a>
        </div>

    </div>
</div>

<script>
    app.controller('SelezioneAulaController', function ($scope, $window, $http) {

        $scope.checkedService = function (f, s) {
            if ((s.qta == null) || (s.qta == 0)) {
                s.qta = 1;
            }
            $scope.calcPrices(f);
        };

        $scope.qtyService = function (f) {
            $scope.calcPrices(f);
        };

        $scope.changedConfig = function (f) {
            $scope.calcPrices(f);
        };

        $scope.calcPrices = function (f) {
            console.log("Entrato in calcPrices per " + JSON.stringify(f));
            // calculates config price
            var prezzoCfg = 0;
            if (f.cfgSelected != null) {
                prezzoCfg = f.cfgSelected.deltaPrezzo;
            }
            console.log("Prezzo configurazione " + prezzoCfg);

            // calculates services prices
            var prezzoSrv = 0;
            for (var i = 0; i < f.servizi.length; i++)
            {
                var ser = f.servizi[i];
//                console.log(ser);
                if (ser.checked)
                {
                    var qta = ser.qta;
                    var pr = ser.prezzoEuro;
                    prezzoSrv += qta * pr;
                    console.log("costo servizi " + qta + " x " + pr);
                }
            }
            console.log("Totale servizi " + prezzoSrv);

            // gets classrom price
            var prezzoClasse = $scope.aula.prezzo;
            console.log("Prezzo listino aula " + prezzoClasse);
            var prezzoClasseScontato = prezzoClasse * f.scontoShort;
            console.log("Sconto short = " + f.scontoShort);

            // calculates total price
            var totalEuro = prezzoClasseScontato + prezzoCfg + prezzoSrv;
            var totalCrediti = $scope.aula.prezzoCrediti + ((prezzoCfg + prezzoSrv) * $scope.creditsValue);
            console.log("Prezzo aula crediti = " + $scope.aula.prezzoCrediti);
            console.log("Total crediti = " + totalCrediti);
            console.log("creditsValue = " + $scope.creditsValue);

            f.totaleFasciaEuro = totalEuro;
            f.totaleFasciaCrediti = totalCrediti;
        };

        $scope.add2cart = function (f) {
            console.log("entering add2cart " + JSON.stringify(f));
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");
            //data to be requested
            var data = f;
            console.log("Fascia to add = " + JSON.stringify(f));
            // request 
            var req = '<c:url value="<%= CarrelloAjaxController.AX_ADD_TO_CART_CLASS%>"/>';
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
                        $window.location.href = "<c:url value='<%= BookingController.RQ_SEARCH_REPEAT%>'/>";
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });

        };

        $scope.initSelectWindow = function () {
            var jsonData = JSON.parse('${jsonData}');
            $scope.fasciaScelta = jsonData.fasciaScelta;
            $scope.fasceAltre = jsonData.fasceAltre;
            $scope.nomeAula = jsonData.nomeAula;
            $scope.data = jsonData.data;
            $scope.aula = jsonData.aula;
            $scope.cittaAula = jsonData.cittaAula;
            $scope.indirizzoAula = jsonData.indirizzoAula;
            $scope.configurazioni = jsonData.configurazioni;
            $scope.servizi = jsonData.servizi;
            $scope.creditsValue = jsonData.creditsValue;

            if ($scope.fasciaScelta != null) {
                $scope.calcPrices($scope.fasciaScelta);
            }

            if ($scope.fasceAltre != null) {
                for (var i = 0; i < $scope.fasceAltre.length; i++) {
                    $scope.calcPrices($scope.fasceAltre[i]);
                }
            }
        };

        $scope.initSelectWindow();
    });
</script>

