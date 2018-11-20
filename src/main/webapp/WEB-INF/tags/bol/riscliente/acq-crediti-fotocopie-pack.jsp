<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.FotocopieAjaxController"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="it">
    <head>
        <%@ include file="../layout/html-head.jsp" %>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/customer.css"/>'>

        <script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>

        <title>Booking Online - Acquisto Crediti Fotocopie</title>
    </head>
    <body>
        <%@ include file="../layout/bol-header.jsp"%>
        <div ng-app="AcqFotocopie"> 
            <script>
                var app = angular.module('AcqFotocopie', []);
            </script>
            <div class="container-fluid" id="customer-home-container">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <%@ include file="layout/left-side.jsp"%>
                </div>
                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 ">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                            <%@ include file="layout/fotocopie-pack.jsp" %>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="../layout/bol-footer.jsp"%>
        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>