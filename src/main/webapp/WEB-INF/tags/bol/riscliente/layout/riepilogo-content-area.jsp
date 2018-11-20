<%-- 
    Contiene i risultati della ricerca 
    (parte destra della schermata 3.1
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisClienteController" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container-fluid">
    <div class="box-yellow">
        <h4>
            <center>
                ${advert.message}
            </center>
        </h4>
    </div>


    <h1>${currentUser.userName}</h1>
    <%@include file="riepilogo-crediti.jsp" %>
    <br>
    <%@include file="riepilogo-ultimi-ordini.jsp" %>
    <br>
    <%@include file="riepilogo-fatturazione.jsp" %>
</div>
<script>
    app.controller('RiepilogoController', function ($scope, $window, $http) {

        $scope.initPage = function () {
            var jsonData = JSON.parse('${jsonData}');
            $scope.riepilogoCreditiAule = jsonData.riepilogoCreditiAule;
            $scope.riepilogoCreditiFotocopie = jsonData.riepilogoCreditiFotocopie;
            $scope.riepilogoCreditiSale = jsonData.riepilogoCreditiSale;
        };

        $scope.initPage();
    });
</script>
