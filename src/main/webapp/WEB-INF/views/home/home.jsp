<%@page contentType="text/html" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="it">
    <head>
        <%@ include file="../layout/html-head.jsp" %>
        <script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/home-carosel.css"/>'>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/offerteCaroselHome.css"/>'>         
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/imageStruttura.css"/>'>


        <title>Booking Online</title>
    </head>
    <body>
        <%@ include file="../layout/bol-header.jsp" %>
        <%@ include file="layout/home-slideshow.jsp" %>
        ${saluto}
        <a href="<c:url value='/form-somma'/>">Vai alla somma</a>
        <a href="<c:url value='/form-0714'/>">Vai all' HomeController0714</a>
        <%@ include file="../layout/bol-footer.jsp" %>
        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
