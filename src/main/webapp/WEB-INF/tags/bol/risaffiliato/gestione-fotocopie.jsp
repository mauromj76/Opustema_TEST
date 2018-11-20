<!--<%--
pagina per 7.5 Gestione Fotocopie
--%>-->

<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="../layout/html-head.jsp" %>

        <title>Booking Online - Gestione Fotocopie</title>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/risaffiliato.css"/>'>
    </head>
    <body>
        <%@ include file="../layout/bol-header.jsp"%>
        <div ng-app="riepilogoFotocopie">
            <script>
                var app = angular.module('riepilogoFotocopie', []);
            </script>

            <div class="container-fluid risaffiliato-container">
                <div class="row">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <%@ include file="layout/left-side-risaffiliato.jsp"%> 
                    </div>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                        <%@ include file="layout/tbgsfotclient-risaffiliato.jsp"%>
                    </div>
                </div>
                <%@ include file="../layout/bol-footer.jsp"%>
            </div>
        </div>
        <%@ include file="../layout/html-end-of-body.jsp" %>

    </body>
</html>
