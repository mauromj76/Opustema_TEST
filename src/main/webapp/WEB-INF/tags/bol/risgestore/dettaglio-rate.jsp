<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<html lang="it">
    <head>
        <%@ include file="../layout/html-head.jsp" %>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/customer.css"/>'>

        <script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>

        <title>Booking Online - Dettaglio Rate</title>
    </head>
    <body>
        <%@ include file="../layout/bol-header.jsp"%>
        <div  ng-app="DettaglioRateApp">
            <script>
                var app = angular.module('DettaglioRateApp', []);
            </script>
            <div ng-controller="CreditiMaturandiController" ng-cloak>
                <div class="container-fluid" id="customer-home-container">
                    <div class="row">
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"><!-- left Area Div-->
                            <%@ include file="layout/left-side.jsp"%>
                        </div><!-- end of left-area Div -->

                        <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 ">
                            <%@ include file="layout/dettaglio-rate-table.jsp" %>
                        </div>

                    </div> 

                </div> 
                <%@ include file="../layout/bol-footer.jsp"%>
            </div>
        </div>
        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
