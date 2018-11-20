<%-- 
    Cart for subscriptions
--%>

<%@page import="it.logicadeisistemi.bol.hbol.controller.AcquistoCreditiController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="../layout/html-head.jsp" %>

        <title>Booking Online - Carrello Abbonamenti</title>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/carrello.css"/>'>
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
                        <div>
                            <h2 class="bold">Il tuo Carrello</h2>  
                        </div>                
                    </div>
                    <br>
                    <table class="table">
                        <thead>
                            <tr >
                                <td class="row ">
                                    <span><h5 class="bold">Tipo Abbonamento</h5></span>
                                    <span class="badge" data-toggle="tooltip" data-placement="right"  
                                          title="Il tipo dell'abbonamento selezionato"> ?</span>
                                </td>
                                <td class="row ">
                                    <span><h5 class="bold">Crediti totali</h5></span>
                                    <span class="badge" data-toggle="tooltip" data-placement="right"  
                                          title="Valore complessivo in crediti dell'intero abbonamento"> ?</span>
                                </td>
                                <td class="row ">
                                    <span><h5 class="bold">Frequenza di pagamento</h5></span>
                                    <span class="badge" data-toggle="tooltip" data-placement="right"  
                                          title="Numero e periodicità della modalità di pagamento. Può essere cambiata in questa fase.">?</span>
                                </td>
                                <td class="row ">
                                    <span><h5 class="bold">Prezzo</h5></span>
                                    <span class="badge" data-toggle="tooltip" data-placement="right"  
                                          title="Prezzo della prima rata"> ?</span>
                                </td>
                            </tr>
                        </thead>
                        <tbody> 
                            <tr ng-repeat="elem in lista">
                                <td class="row table-bordered">
                                    <h4>{{elem.nome}}</h4> 
                                </td>
                                <td class="row table-bordered">
                                    <h4 class="bold text-center">{{elem.importoCrediti}}</h4>
                                </td>
                                <td class="row table-bordered">
                                    <div class="col-xs-10">
                                        <c:url value="<%=AcquistoCreditiController.RQ_RIEPILOGO_ORDINE_CREDITI%>" var="formActionUrl"/>
                                        <select class="form-control" ng-model="$parent.rateSelected" 
                                                ng-change="changedRate()"
                                                ng-options="rate as rate.name for rate in listaRate track by rate.code" >
                                        </select>
                                    </div>
                                    <div class="col-xs-2">
                                        <span class="badge" data-toggle="tooltip" data-placement="right"  
                                              title="help">?</span>
                                    </div>
                                </td>
                                <td class="row table-bordered">
                                    <h3 class="bold text-center" id="totale-riga">
                                        {{rata1Euro}}  &euro;
                                    </h3>
                                </td>
                                <td class="row" style="border:0px none">

                                    <span class="badge remove" data-toggle="tooltip" data-placement="right" title="Rimuovi dal carrello">
                                        <a href="<c:url value='<%= AcquistoCreditiController.RQ_RIMUOVI_DA_CARRELLO%>'/>/{{elem.id}}"> X </a>
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="row middle">
                        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 message">
                            <div class="box-yellow box-border">
                                <div class="row">
                                    <div>
                                        <img class="img-responsive" src='<c:url value="/web-resources/images/icone/Sconto.png"/>'/>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <h1 class="text-center">${advert.advMessage.message}</h1>
                                </div>
                                <div class="row">                        
                                    <img class="img-responsive right" src='<c:url value="/web-resources/images/icone/Sconto.png"/>'/>

                                </div>
                            </div>
                        </div>
                        <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                            <div class="row">
                                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                    <h2 class="text-right">Totale:</h2>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <h2 style="margin-bottom: 0px;  text-align: right;" id="totale-carrello">
                                        {{totaleEuro}} &euro;
                                    </h2>
                                </div>
                            </div>
                            <br><br>
                            <div class="row">
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <c:url value="<%= AcquistoCreditiController.RQ_SCELTA_RATEIZZAZIONE %>" var="cancelUrl" />
                                    <button type="button" class="btn btn-secondary btn-lg btn-right">
                                        <a href="${cancelUrl}/{{lista[0].idAbbonamentoAule}}">Torna indietro</a>
                                    </button>
                                </div>           
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                </div>
                                <div class="col-sm-4 col-xs-4 col-md-4 col-lg-4">
                                    <button type="button" class="btn btn-primary btn-lg vaiCasa" ng-click="nextPage()">Vai alla Cassa</button>
                                </div>
                            </div>

                        </div>
                    </div> 
                </div>
                <%@ include file="../layout/bol-footer.jsp"%>
            </div>
        </div>
        <script>
            app.controller('CarrelloController', function ($scope, $window, $http) {

                $scope.changedRate = function () {
                    $scope.calcTotals();
                };


                $scope.calcTotals = function () {
                    $scope.rata1Euro = $scope.rateSelected.value;
                    $scope.totaleEuro = $scope.rata1Euro;
                };

                $scope.nextPage = function () {
                    var form = document.createElement("form");

                    form.action = '<c:url value='<%= AcquistoCreditiController.RQ_RIEPILOGO_ORDINE_CREDITI%>'/>';
                    form.method = "POST";

                    input = document.createElement("input");
                    input.type = "text";
                    input.name = "numRate";
                    input.value = $scope.rateSelected.code;
                    form.appendChild(input);

                    input = document.createElement("input");
                    input.type = "hidden";
                    input.name = "idAbbonamento";
                    input.value = $scope.lista[0].idAbbonamentoAule;
                    form.appendChild(input);

                    input = document.createElement("input");
                    input.type = "hidden";
                    input.name = "${_csrf.parameterName}";
                    input.value = "${_csrf.token}";
                    form.appendChild(input);

                    document.body.appendChild(form);
                    form.submit();
                    console.log(JSON.stringify($scope.lista[0]));
                };

                $scope.initPage = function () {
                    var jsonData = JSON.parse('${jsonData}');
                    $scope.lista = jsonData.lista;
                    $scope.listaRate = jsonData.tipiPagamento;
                    $scope.rateSelected = jsonData.rateSelected;
                    $scope.ordineBol = jsonData.ordineBol;

                    $scope.calcTotals();
                };

                $scope.initPage();
            });
        </script>
        <%@ include file="../layout/html-end-of-body.jsp" %>

    </body>
</html>
