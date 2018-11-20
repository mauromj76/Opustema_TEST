

<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="../layout/html-head.jsp" %>

        <title>Booking Online - Riepilogo Saldo Negativo</title>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/risaffiliato.css"/>'>
    </head>
    <body>
        
    <%@ include file="../layout/bol-header.jsp"%>
    <div class="container-fluid risaffiliato-container">
        <div class="row">            
            <h3 class="sconto">
                <span><img class ="img-responsive" src='<c:url value="/web-resources/images/icone/Sconto.png"/>'/></span>
                <span>Aggiungi altre 3 giornate al tuo ordine per usufruire di uno sconto del 3%</span>
                <span><img class ="img-responsive" src='<c:url value="/web-resources/images/icone/Sconto.png"/>'/></span>               
            </h3>
            <%@ include file="layout/ri-sal-neg-body.jsp" %>
            <%@ include file="layout/ri-sal-neg-right-menu.jsp" %>
           
        </div>
    </div>
    <%@ include file="../layout/html-end-of-body.jsp" %>
        
    </body>
</html>
