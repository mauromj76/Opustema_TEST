<!--
JSP Carrelo Page
-->
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.CarrelloAuleController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.BookingController"%>

<c:url value="/" var="root"/>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../layout/html-head.jsp" %>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/customer.css"/>'>
        <script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>



        <title>Booking Online - Carrello</title>
    </head>
    <body>
        <%@ include file="../layout/bol-header.jsp"%>
        <div  ng-app="CarrelloApp">
            <script>
                var app = angular.module('CarrelloApp', []);
            </script>
            <div ng-controller="CarrelloController" ng-cloak>
                <div class="container-fluid">
                    <div class="row">
                        <h2>Il tuo Carrello</h2>
                    </div>
                    <br>
                    <br>
                    <table class="table">
                        <thead>
                            <tr class="row">
                                <td class="col-lg-3">
                                    Data e luogo
                                </td>
                                <td class="col-lg-1">
                                    Partecipanti
                                </td>
                                <td class="col-lg-3">
                                    Configurazione
                                </td>
                                <td class="col-lg-3">
                                    Servizi aggiuntivi
                                </td>
                                <td class="col-lg-2">
                                    Prezzo
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="elem in elements" class="row">
                                <td>
                                    <h4>{{elem.date}} - {{elem.fascia}}</h4> 
                                    {{elem.aulaDescription}} - {{elem.aulaAddress}}
                                </td>
                                <td>
                                    <p>max {{elem.partecipanti}}</p>
                                </td>
                                <td>
                                    <!--<div class="col-xs-10">-->
                                    <select class="form-control" ng-model="elem.cfgSelected" 
                                            ng-change="changedConfig(elem)"
                                            ng-options="cfg as cfg.optionName for cfg in elem.configurazioni track by cfg.idConfigurazione" >
                                    </select>
                                    <!--</div>-->
                                    <!--<div class="col-xs-2">-->
                                    <span class="badge" data-toggle="tooltip" data-placement="right"  
                                          title="help">?</span>
                                    <!--</div>-->
                                </td>
                                <td>
                                    <!--<div class="col-xs-9">-->
                                    <button ng-click="elem.isCollapsed = !elem.isCollapsed">Scegli Servizi Opzionali</button>
                                    <span class="badge" data-toggle="tooltip" data-placement="right"  
                                          title="help">?</span>
                                    <!--<div >-->
                                    <table ng-show="!elem.isCollapsed">
                                        <tr ng-repeat="servizio in elem.servizi" class="row">
                                            <td class="col-lg-9 servizio-descr">
                                                <input type="checkbox" ng-model="servizio.checked" ng-click="checkedService(elem, servizio)">
                                                {{servizio.nomeServizio}} ({{servizio.prezzoEuro| currency : " &euro;" : 2}})
                                            </td>
                                            <td class="col-lg-1 servizio-descr">
                                                Q.t&agrave;
                                            </td>
                                            <td class="col-lg-2 servizio-descr">
                                                <input type="number" maxlength="4" min="1" max="9999" ng-disabled="!servizio.checked"
                                                       ng-change="qtyService(elem)" ng-model="servizio.qta">
                                            </td>
                                        </tr>
                                    </table>
                                    <!--</div>-->
                                    <!--</div>-->
                                </td>
                                <td>
                                    <h3>
                                        {{elem.totaleRigaEuro| currency : "&euro;" : 2}}
                                    </h3>
                                    <small>({{elem.totaleRigaCrediti| currency : "Crediti "}})</small>
                                </td>
                                <td style="border:0px none">

                                    <span class="badge" data-toggle="tooltip" data-placement="right" title="Rimuovi dal carrello">
                                        <c:url value="<%= CarrelloAuleController.RQ_RIMUOVI_DA_CARRELLO%>" var="remUrl"/>
                                        <a href="${remUrl}/{{elem.id}}"> X </a>
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="box-yellow">
                            <div class="row">
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                    <img src='<c:url value="/web-resources/images/icone/Sconto.png"/>'/>
                                </div>
                            </div>
                            <h1>
                                ${advert.advMessage.message} 
                            </h1>
                            <div class="row">
                                <div class="col-xs-2 col-xs-offset-10">
                                    <img src='<c:url value="/web-resources/images/icone/Sconto.png"/>'/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="row">
                            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                <h2 style="text-align: right;">Totale:</h2>
                            </div>
                            <div  id="totale" class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                <h2>{{totaleCarrelloEuro| currency : "&euro; " : 2}} </h2>
                                <small>({{totaleCarrelloCrediti| currency : "Crediti "}})</small>
                            </div>
                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">

                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-8">
                                <a class="btn btn-default" href="<c:url value='<%=BookingController.RQ_SEARCH_REPEAT%>'/>">Prosegui la ricerca</a>
                            </div>
                            <div class="col-sm-4 col-sm-offset-8">
                                <a class="btn btn-primary" role="button" ng-click="moveToRiepilogo()">Vai alla Cassa</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%@ include file="../layout/bol-footer.jsp"%>

            </div>
        </div>


        <script>
            app.controller('CarrelloController', function ($scope, $window, $http) {
                $scope.moveToRiepilogo = function () {
                    // CSRF prevention
                    var csrfToken = $("meta[name='_csrf']").attr("content");
                    var csrfHeader = $("meta[name='_csrf_header']").attr("content");

                    //data to be requested
                    var data = {elements: $scope.elements};
                    // request 
                    var req = '<c:url value="<%= CarrelloAjaxController.AX_UPDATE_BEFORE_RIEPILOGO%>"/>';
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
                                console.log(JSON.stringify(response.data));
                                $window.location.href = "<c:url value='<%= CarrelloAuleController.RQ_RIEPILOGO_ORDINE%>'/>";
                            },
                                    function (response) {
                                        // optional in case of failure
                                        window.alert('Errore!');
                                    });

                };

                $scope.checkedService = function (f, s) {
                    if ((s.qta == null) || (s.qta == 0)) {
                        s.qta = 1;
                    }
                    $scope.calcPrices(f);
                    $scope.calcTotals();
                };

                $scope.qtyService = function (f) {
                    $scope.calcPrices(f);
                    $scope.calcTotals();
                };

                $scope.changedConfig = function (f) {
                    $scope.calcPrices(f);
                    $scope.calcTotals();
                };

                $scope.calcPrices = function (f) {
                    console.log("Entrato in calcPrices per " + JSON.stringify(f));
                    // calculates config price
                    var prezzoCfg = 0;
                    if (f.cfgSelected != null) {
                        prezzoCfg = f.cfgSelected.deltaPrezzo;
                        console.log("Prezzo configurazione " + prezzoCfg);
                    }

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
                    var prezzoClasseScontato = f.prezzoAulaEuroScontato;
                    console.log("Prezzo classe scontato = " + f.prezzoAulaEuroScontato);

                    // calculates total price
                    var totaleRigaEuro = prezzoClasseScontato + prezzoCfg + prezzoSrv;
                    var totaleRigaCrediti = f.prezzoAulaCrediti + ((prezzoCfg + prezzoSrv) * $scope.creditsValue);
                    console.log("totaleRigaCrediti " + totaleRigaCrediti);
                    console.log("f.prezzoAulaCrediti " + f.prezzoAulaCrediti);
                    console.log("$scope.creditsValue " + $scope.creditsValue);
                    //        window.alert(totalEuro);
                    f.totaleRigaEuro = totaleRigaEuro;
                    f.totaleRigaCrediti = totaleRigaCrediti;
                };

                $scope.calcTotals = function () {
                    var totaleEuro = 0;
                    var totaleCrediti = 0;
                    for (i = 0; i < $scope.elements.length; i++) {
                        totaleEuro += $scope.elements[i].totaleRigaEuro;
                        totaleCrediti += $scope.elements[i].totaleRigaCrediti;
                    }
                    $scope.totaleCarrelloEuro = totaleEuro;
                    $scope.totaleCarrelloCrediti = totaleCrediti;
                }

                $scope.initPage = function () {
                    var jsonData = JSON.parse('${jsonData}');
                    $scope.elements = jsonData.elements;
                    $scope.totalEuro = jsonData.totalEuro;
                    $scope.totalCredits = jsonData.totalCredits;
                    $scope.finalDiscount = jsonData.finalDiscount;
                    $scope.discountedEuro = jsonData.discountedEuro;
                    $scope.discountedCredits = jsonData.discountedCredits;
                    $scope.creditsValue = jsonData.creditsValue;

                    for (i = 0; i < $scope.elements.length; i++) {
                        $scope.calcPrices($scope.elements[i]);
                    }
                    $scope.calcTotals();
                };

                $scope.initPage();
            });
        </script>

        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
