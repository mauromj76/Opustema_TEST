<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../layout/html-head.jsp" %>
        <title>PrenotazioneAule.it - Modifica Affiliato</title>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/customer.css"/>'>

        <script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>
    </head>
    <body>
        <%@ include file="../layout/bol-header.jsp"%>
        <div ng-app="editAffiliato" ng-controller="GestioneAffiliatoController" ng-cloak>
            <script>
                        var app = angular.module('editAffiliato', []);
            </script>

            <div class="container-fluid risgestore-container">
                <div class="row">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <%@include file="layout/left-area.jsp" %>
                    </div>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                        <h1>Modifica Scheda Affiliato</h1>
                        <%@include file="layout/form-modifica-affiliato-dettagli.jsp" %>
                        <div>
                            <button type="button" class="btn btn-secondary" ng-click="annulla()">Annulla</button>
                            <button type="button" class="btn btn-primary" ng-click="salva()">Salva Modifiche</button>
                        </div>

                    </div>
                </div>

                <%@ include file="../layout/bol-footer.jsp"%>  
            </div>
        </div>
        <script>
            app.controller('GestioneAffiliatoController', function ($scope, $window, $http) {
                $scope.listaPrenotazioni = new Array();
                $scope.loadAffiliato = function (id) {
                    if (id == null){
                        $scope.aff = {affiliatoCategoria: "BRONZE"};
                        return;
                    }
//                console.log("entering loadWeek " + date);
                    // CSRF prevention
                    var csrfToken = $("meta[name='_csrf']").attr("content");
                    var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                    //data to be requested
                    var data = {id: id};
                    // request 
                    var req = '<c:url value="<%= RisGestoreAjaxController.AX_GET_ONE_AFFILIATO%>"/>';
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
                                $scope.aff = response.data;
                                console.log("Categoria " + $scope.aff.affiliatoCategoria);
                                if (!$scope.aff.affiliatoCategoria){
                                    $scope.aff.affiliatoCategoria = "BRONZE";
                                    console.log("Init bronze");
                                }
                            },
                                    function (response) {
                                        // optional in case of failure
                                        window.alert('Errore!');
                                    });
                };
                $scope.annulla = function () {
                    console.log("Annullato");
                    $window.location.href = "<c:url value='<%= RisGestoreController.RQ_MI_ANAGRAFICA_AFFILIATI%>'/>";
                };
                $scope.salva = function () {
                    console.log("Salvataggio in corso");
//                console.log("entering loadWeek " + date);
                    // CSRF prevention
                    var csrfToken = $("meta[name='_csrf']").attr("content");
                    var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                    //data to be requested
                    var data = $scope.aff;
                    console.log(JSON.stringify($scope.aff));

                    // request 
                    var req = '<c:url value="<%= RisGestoreAjaxController.AX_UPDATE_ONE_AFFILIATO%>"/>';
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
                                $window.location.href = "<c:url value='<%= RisGestoreController.RQ_MI_ANAGRAFICA_AFFILIATI%>'/>";
                            },
                                    function (response) {
                                        // optional in case of failure
                                        window.alert('Errore!');
                                    });
                };
                $scope.loadAffiliato(${idAffiliato});
            });
        </script>
        <script>
            function weekChanged(ev) {
                var data = ev.date;
                var scope = angular.element(document.getElementById('controller-container')).scope();
                scope.loadWeek(data);
            }
        </script>    


        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
