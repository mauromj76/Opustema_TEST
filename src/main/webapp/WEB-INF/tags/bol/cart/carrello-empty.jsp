<!--
JSP Carrelo Page
-->
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.CarrelloAuleController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>

<c:url value="/" var="root"/>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../layout/html-head.jsp" %>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/customer.css"/>'>
        <script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>



        <title>Booking Online - Carrello</title>
    </head>
    <body>
        <%@ include file="../layout/bol-header.jsp"%>

        <div class="container-fluid">
            <div class="row">
                <h2>Il tuo Carrello è vuoto.</h2>
            </div>
        </div>
        <%@ include file="../layout/bol-footer.jsp"%>

        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
