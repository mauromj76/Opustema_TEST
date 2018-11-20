

<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="../layout/html-head.jsp" %>

        <title>Booking Online - Elenco Ordini</title>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/risaffiliato.css"/>'>
    </head>
    <body>
        
    <%@ include file="../layout/bol-header.jsp"%>
    <div class="container-fluid riepilogo-risafiliato">
        <div class="row">
            <%@ include file="layout/filtro-ordini.jsp" %>
            
             <%@ include file="layout/mes-spiega-modifica.jsp" %>
            <%@ include file="layout/ordini.jsp" %>   
            
        </div>
           
    </div>
   
    <%@ include file="../layout/html-end-of-body.jsp" %>
     <script src="/web-resources/js/home/home.js" type="text/javascript"></script>       

        
    </body>
</html>
