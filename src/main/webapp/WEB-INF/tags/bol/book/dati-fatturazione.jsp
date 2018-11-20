<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.CarrelloAuleController"%>

<!DOCTYPE html>
<html lang="it">
    <head>
        <%@ include file="../layout/html-head.jsp" %>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/customer.css"/>'>

        <script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>

        <title>Booking Online - Dati Fatturazione</title>
    </head>
    <body>
        <%@ include file="../layout/bol-header.jsp"%>

        <div class="container-fluid">
            <h2>Ordine numero ${invoiceData.orderNumber}</h2>
            <h2>Importo <fmt:formatNumber value="${invoiceData.orderTotalEuro}" pattern="###,##0.00" /> &euro; (<fmt:formatNumber value="${invoiceData.orderTotalCredits}" pattern="###,##0.00" /> crediti)</h2>
            <br>
            <div class="row">
                <%@ include file="layout/fatturazione-table.jsp"%>
            </div>

        </div>

        <%@ include file="../layout/bol-footer.jsp"%>
        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
