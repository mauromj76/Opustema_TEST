

<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.AcquistoCreditiController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="../layout/html-head.jsp" %>

        <title>Booking Online - Riepilogo Ordine Crediti</title>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/risaffiliato.css"/>'>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/riepilogoOrdine.css"/>'>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/carrello.css"/>'>
    </head>
    <body>

        <%@ include file="../layout/bol-header.jsp"%>
        <div class="container-fluid risaffiliato-container">
            <div class="row">            
                <div class="message-info bg-warning text-center">
                    <h3>${advert.advMessage.message}</h3>
                </div>

                <%@ include file="layout/ri-ord-cred-body.jsp" %>
                <%@ include file="layout/ri-ord-cred-right-menu.jsp" %> 
            </div>
        </div>
        <%@ include file="../layout/bol-footer.jsp"%>
        <%@ include file="../layout/html-end-of-body.jsp" %>   
    </body>
</html>
