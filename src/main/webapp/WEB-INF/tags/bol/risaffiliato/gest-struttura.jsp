<!--
JSP for customer reserved area home for bbooking online
-->
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>

<!DOCTYPE html>
<html lang="it">
    <head>
        <%@ include file="../layout/html-head.jsp" %>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/risaffiliato.css"/>'>
        <script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>
        <script type="text/javascript" src="<c:url value='/web-resources/js/xeditable.min.js'/>"></script>
        <link rel="stylesheet" href="<c:url value='/web-resources/css/xeditable.css'/>">

        <title>Booking Online - Gestione Struttura Affiliato</title>
    </head>
    <body>

        <%@ include file="../layout/bol-header.jsp"%>

        <div ng-app="gestStruttura">
            <script>
                var app = angular.module('gestStruttura', ["xeditable"]);
            </script>
            <div class="container-fluid risaffiliato-container">
                <div class="row">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <%@ include file="layout/left-side-risaffiliato.jsp"%>
                    </div>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                        <%@ include file="layout/gestione-struttura-content.jsp"%>
                    </div>
                </div>
            </div>   
        </div>
        <%@ include file="../layout/bol-footer.jsp"%>
        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
