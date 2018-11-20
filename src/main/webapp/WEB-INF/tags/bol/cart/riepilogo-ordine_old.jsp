
<!--
JSP Riepilogo ordine Page
-->
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.CarrelloAuleController"%>
<%@page import="it.logicadeisistemi.bol.hbol.service.PaymentService"%>

<!DOCTYPE html>
<html lang="it">
    <head>
        <%@ include file="../layout/html-head.jsp" %>

        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/customer.css"/>'>

        <script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>

        <title>Booking Online - Riepilogo Ordine</title>
    </head>
    <body>
        <%@ include file="../layout/bol-header.jsp"%>
        <div  ng-app="RiepilogoApp">
            <script>
                var app = angular.module('RiepilogoApp', []);
            </script>
            <div ng-controller="RiepilogoController" ng-cloak>
                <div class="container-fluid">
                    <div class="box-yellow">
                        <div class="row">
                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                <img src='<c:url value="/web-resources/images/icone/Sconto.png"/>'/>
                            </div>
                            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                <center><h4>${advert.advMessage.message}</h4></center>
                            </div>
                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                <img src='<c:url value="/web-resources/images/icone/Sconto.png"/>'/>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                            <div class="row">
                                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                                    <h3 style="margin-top: 0px;">Il Riepilogo del tuo Ordine</h3>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" style="text-align: right;padding-right: 0px;">
                                    <c:url value="<%= CarrelloAuleController.RQ_CARRELLO_AUL %>" var="backUrl"/>
                                    <a class="btn btn-primary btn-md" href="${backUrl}">Torna all'inserimento dell'ordine</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 form-inline">
                            <label for="sel">Visualizza Prezzi:</label>
                            <select class="form-control" id="sel">
                                <option>in Euro</option>
                                <option>in Crediti</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                            <div class="border-div">
                                <div class="row" ng-repeat="item in elements">
                                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                        <h4>{{item.date}} - {{item.fascia}}</h4> 
                                        {{item.aulaDescription}} - {{item.aulaAddress}}
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="text-align: right;" id="1">
                                        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11" style=" padding-right: 0px;">
                                            <c:set value="prezzo-di-listino-${itemCounter.count}" var="divName"></c:set> 
                                                <h4 id="text">
                                                    <a data-toggle="collapse" href="{{'#acc' + $index}}">
                                                        Prezzo di listino &nbsp; &nbsp; {{item.prezzoAulaEuroListino| number :2}} &euro;
                                                    </a>
                                                </h4>
                                                <div id="{{'acc' + $index}}" class="panel-collapse collapse">
                                                    <div class="row">
                                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">

                                                            <p>Sconto Fascia {{item.fascia}} ({{item.percFasciaDiscount| number :2}}%)</p>
                                                            <p>Sconto mese ({{item.percMoYDiscount| number :2}}%)</p>
                                                            <p>Sconto giorno della settimana ({{item.percDoWDiscount| number :2}}%)</p>
                                                            <p>Sconto Prenotazione anticipata ({{item.percAdvDiscount| number :2}}%)</p>
                                                            <p>Differenza per configurazione scelta</p>
                                                            <p>Costo servizi scelti</p>
                                                        </div>
                                                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                                            <p><b>{{-item.euroFasciaDiscount| number :2}} &euro;</b></p>
                                                            <p><b>{{-item.euroMoYDiscount| number :2}} &euro;</b></p>
                                                            <p><b>{{-item.euroDoWDiscount| number :2}} &euro;</b></p>
                                                            <p><b>{{-item.euroAdvDiscount| number :2}} &euro;</b></p>
                                                            <p><b>{{item.prezzoEuroCfg| number :2}} &euro;</b></p>
                                                            <p><b>{{item.prezzoEuroServizi| number :2}} &euro;</b></p>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="divider-thick"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
                                                    <h4>Totale Scontato<b>&nbsp;{{item.prezzoEuro| number :2}} &euro;</b></h4>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11 riepilogo-right-aligned" >
                                            <h5>Totale da scontare &euro; {{totalEuro|number:2}}</h5>
                                            <h5>Totale da scontare Crediti {{totalCredits|number:2}}</h5>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 riepilogo-right-aligned" >
                                                <div class="divider-thick"></div>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11 riepilogo-right-aligned" >
                                                <h4>Sconto quantità. Prenotazione di {{fromDays}} o pi&ugrave; giornate ({{finalDiscountPerc|number:2}}%) {{-finalDiscountEuro|number:2}} &euro;</h4>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 riepilogo-right-aligned" >
                                                <div class="divider-thick"></div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11 riepilogo-right-aligned">
                                                    <h3>Totale Generale &nbsp; {{discountedEuro|number:2}} &euro;</h3>
                                                    <small>({{discountedCredits|number:2}} crediti)</small>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">

                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 form-inline">
                                <div class="box-border">
                                    <div class="nav navbar-default left-navbar" style="margin-left: 0px;">
                                        <div class ="left-navbar-header">
                                            Modalità Pagamento
                                        </div>
                                        <br>
                                    <c:url value='<%=CarrelloAuleController.RQ_DATI_FATTURAZIONE%>' var="actionUrl"/>
                                    <form:form modelAttribute="criteriPagamento" action="${actionUrl}" >
                                        <div style="margin-left: 5px;">
                                            <div class="row">
                                                <div class="col-xs-6">
                                                    <b>Il totale per il tuo ordine</b>
                                                </div>
                                                <div class="col-xs-6">
                                                    <h3 style="margin: 0px;"> {{discountedEuro|number:2}} &euro;</h3>
                                                    <small>({{discountedCredits|number:2}} crediti)</small>
                                                </div>    
                                            </div>
                                            <br>
                                            <div class="row">
                                                <div class="col-xs-12">
                                                    <small><b>Scegli la modalità di pagamento</b></small>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-10">
                                                    <c:set value="<%=PaymentService.TIPO_PAG_CREDIT_CARD%>" var="cc"/>
                                                    <form:radiobutton path="tipoPagamento" 
                                                                      value="${cc}" 
                                                                      required="required" />
                                                    <img src="<c:url value="/web-resources/images/icone/cc.png"/>">
                                                    Carta di Credito
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-10">
                                                    <c:set value="<%=PaymentService.TIPO_PAG_PAYPAL%>" var="pp"/>
                                                    <form:radiobutton path="tipoPagamento" 
                                                                      value="${pp}" 
                                                                      required="required" 
                                                                      checked="checked" />
                                                    <img src="<c:url value="/web-resources/images/icone/paypal.png"/>">
                                                    PayPal
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-10">
                                                    <c:set value="<%=PaymentService.TIPO_PAG_CREDITS%>" var="cr"/>
                                                    <form:radiobutton path="tipoPagamento" 
                                                                      value="${cr}" 
                                                                      required="required" />
                                                    <img src="<c:url value="/web-resources/images/icone/Crediti.png"/>">
                                                    Crediti &nbsp;
                                                    <span class="badge">i</span>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row">
                                                <div class="col-xs-1">
                                                    <form:checkbox path="agreement" required="required" />
                                                </div>
                                                <div class="col-xs-10">
                                                    <a class="underlined" href="#">
                                                        <small>Accetto le condizioni di vendita e generali di contratto</small>
                                                    </a>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row">
                                                <center>
                                                    <input type="submit" class="btn btn-primary" value="Avanti">
                                                </center>
                                            </div>
                                            <br>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Condizioni di vendita modal -->

                <!-- Modal -->
                <div id="condizioni" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="underlined btn-link" data-toggle="modal" data-target="#condizioni">
                                    <small class="underlined">Accetto le condizioni di vendita <br>e generali di contratto</small>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Inserire qui le condizioni di vendita e di contratto.</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Chiudi</button>
                            </div>
                        </div>

                    </div>
                </div>
                <%@ include file="../layout/bol-footer.jsp"%>

                <script>
                            app.controller('RiepilogoController', function ($scope, $window, $http) {
                                $scope.initPage = function () {
                                    var jsonData = JSON.parse('${jsonData}');
                                    $scope.elements = jsonData.elements;
                                    $scope.totalEuro = jsonData.totalEuro;
                                    $scope.totalCredits = jsonData.totalCredits;
                                    $scope.fromDays = jsonData.fromDay
                                    $scope.finalDiscountPerc = jsonData.finalDiscountPerc;
                                    $scope.finalDiscountEuro = jsonData.finalDiscountEuro;
                                    $scope.discountedEuro = jsonData.discountedEuro;
                                    $scope.discountedCredits = jsonData.discountedCredits;
                                    $scope.riepilogoCreditiFotocopie = jsonData.riepilogoCreditiFotocopie;
                                    $scope.riepilogoCreditiSale = jsonData.riepilogoCreditiSale;
                                };

                                $scope.initPage();
                            });
                </script>
            </div> 
        </div>

        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
