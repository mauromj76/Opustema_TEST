<!--
JSP risultati di ricerca prenotazioni del booking online
-->
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>

<!DOCTYPE html>
<html lang="it">
    <head>
        <%@ include file="../layout/html-head.jsp" %>

        <script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/risultRicerca.css"/>'>
        <title>Booking Online - Risultati di ricerca</title>
    </head>
    <body>
        <div class="container-fluid">
            <%@ include file="../layout/bol-header.jsp"%>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <%@ include file="layout/filter-criteria.jsp"%>
                    </div>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                        <%@ include file="layout/found-values.jsp" %>
                    </div>
                </div>
            </div>   
            <%@ include file="../layout/bol-footer.jsp"%>
        </div>
        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
