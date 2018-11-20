<%-- 
    Number of payments selection for subscriptions 
--%>

<%@page import="it.logicadeisistemi.bol.hbol.controller.AcquistoCreditiController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../layout/html-head.jsp" %>
        <!--<script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>-->
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/scelta-rateizzazione.css"/>'>
        <title>Scelta Rateizzazione</title>
    </head>
    <body>
        <%@ include file="../layout/bol-header.jsp"%>

        <div  ng-app="CarrelloApp">
            <script>
                var app = angular.module('CarrelloApp', []);
            </script>
            <div ng-controller="CarrelloController" ng-cloak>
                <div class="container scelta-rat">
                    <div class="row"> <!-- head of -->
                        <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                            <h3>
                                Abbonamento {{subscription.nome}} - Crediti {{subscription.crediti}}
                            </h3> 
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1"> 
                            <h3>
                                Costo {{subscription.costoEuro}} &euro;
                            </h3>
                        </div>
                    </div>
                    <div class="row">
                        <h4>Scegli la frequenza di pagamento</h4>

                        <div ng-show="subscription.unicaSoluzionePagamento">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <div class="frm-scelta caption">
                                    <label>
                                        <input type="radio" name="formato" ng-model="numRate" ng-value="1">
                                        Unica Soluzione
                                    </label>
                                </div>

                                <div class="box-border">
                                    <div class="frm-scelta">
                                        <div class="row first">
                                            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 text-right">
                                                <h6> Paghi: </h6>  
                                            </div>
                                            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                                <h4>
                                                    {{subscription.costoEuro}} &euro;
                                                </h4> 
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 text-right">
                                                <h6>Crediti Maturati:</h6> 
                                            </div>
                                            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                                <h6>
                                                    {{subscription.crediti}}
                                                </h6>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div ng-show="subscription.rate12">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <div class="frm-scelta caption">
                                    <label>
                                        <input type="radio" name="formato" ng-model="numRate" ng-value="12">
                                        12 rate mensili
                                    </label>
                                </div>
                                <div class="box-border">
                                    <div class="frm-scelta">
                                        <div class="row first">
                                            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 text-right">
                                                <h6>Prima Rata: </h6>
                                            </div>
                                            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                                <h4>
                                                    {{subscription.rata1Di12Euro}} &euro;
                                                </h4>
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 text-right">
                                                <h6>Crediti Maturati: </h6>
                                            </div>
                                            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                                <h6>
                                                    {{subscription.rata1Di12Crediti}}
                                                </h6>
                                            </div>
                                        </div>
                                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-1 col-sm-offset-1
                                             col-md-offset-1 col-lg-offset-1"><hr>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 text-right">
                                                <h6>11 Rate successive: </h6> 
                                            </div>
                                            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                                <span><p class="sup">11x</p></span>
                                                <span><h4>
                                                        {{subscription.rataNDi12Euro}} &euro;
                                                    </h4></span>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 text-right">
                                                <h6>Crediti Maturati: </h6> 
                                            </div>
                                            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                                <span><p class="sup">11x</p></span> 
                                                <span><h5>
                                                        {{subscription.rataNDi12Crediti}}
                                                    </h5></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                                   
                        </div>

                        <div ng-show="subscription.rate4">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <div class="frm-scelta caption">
                                    <label>
                                        <input type="radio" name="formato" ng-model="numRate" ng-value="4">
                                        4 rate trimestrali
                                    </label>   
                                </div>
                                <div class="box-border">

                                    <div class="frm-scelta">
                                        <div class="row first">
                                            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 text-right">
                                                <h6>Prima Rata: </h6>
                                            </div>
                                            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                                <h4>
                                                    {{subscription.rata1Di4Euro}} &euro;
                                                </h4>
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 text-right">
                                                <h6>Crediti Maturati: </h6>
                                            </div>
                                            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                                <h6>
                                                    {{subscription.rata1Di4Crediti}}
                                                </h6>
                                            </div>
                                        </div>
                                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-xs-offset-1 col-sm-offset-1
                                             col-md-offset-1 col-lg-offset-1"><hr>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 text-right">
                                                <h6>11 Rate successive: </h6> 
                                            </div>
                                            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                                <span><p class="sup">11x</p></span>
                                                <span><h4>
                                                        {{subscription.rataNDi4Euro}} &euro;
                                                    </h4></span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 text-right">
                                                <h6>Crediti Maturati: </h6> 
                                            </div>
                                            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                                <span><p class="sup">11x</p></span>
                                                <span><h5>{{subscription.rataNDi4Crediti}}
                                                    </h5></span>
                                            </div>
                                        </div>
                                    </div>                    
                                </div>   
                            </div>
                        </div>
                    </div>
                    <div class="row message"> <!--message and button-->
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 box-border message">
                            <h5>In caso di pagamento rateale i crediti matureranno contestualmente al
                                pagamento delle rate. </h5>
                        </div>
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <c:url value="<%= HomeController.RQ_ABBONAMENTI%>" var="cancelUrl" />
                            <button type="button" class="btn btn-secondary btn-right">
                                <a href="${cancelUrl}">Torna indietro</a>
                            </button>
                        </div>            
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <button type="button" class="btn btn-primary btn-right" ng-show="!(numRate == '' || numRate == null)" ng-click="nextPage()">
                                Aggiungi al carrello
                            </button>
                        </div>            
                    </div> 

                </div>
            </div>
        </div>

        <%@ include file="../layout/bol-footer.jsp"%>
        <script>
            app.controller('CarrelloController', function ($scope, $window, $http) {

                $scope.nextPage = function () {
                    if (!$scope.numRate) {
                        return;
                    }
                    //data to be requested
                    var data = {};
                    data["abbonamentoAule"] = $scope.subscription;
                    data["numRate"] = $scope.numRate;
                    console.log("Salvataggio in corso " + JSON.stringify(data));
                    console.log("NumRate = " + $scope.numRate);

                    var form = document.createElement("form");

                    form.action = '<c:url value='<%= AcquistoCreditiController.RQ_ADD_CARRELLO_CREDITI%>'/>';
                    form.method = "POST"

                    input = document.createElement("input");
                    input.type = "text";
                    input.name = "numRate";
                    input.value = $scope.numRate;
                    form.appendChild(input);

                    input = document.createElement("input");
                    input.type = "hidden";
                    input.name = "idAbbonamento";
                    input.value = $scope.subscription.id;
                    form.appendChild(input);

                    input = document.createElement("input");
                    input.type = "hidden";
                    input.name = "${_csrf.parameterName}";
                    input.value = "${_csrf.token}";
                    form.appendChild(input);

                    document.body.appendChild(form);
                    form.submit();
                };

                $scope.initPage = function () {
                    var jsonData = JSON.parse('${jsonData}');
                    $scope.subscription = jsonData.abbonamentoAule;
                    $scope.numRate = jsonData.numRate;
                };

                $scope.initPage();
            });
        </script>
        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body> 
</html> 