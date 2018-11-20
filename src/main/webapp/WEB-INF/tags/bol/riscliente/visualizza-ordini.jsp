<!--
JSP for customer reserved area home for booking online
-->
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<html lang="it">
    <head>
        <%@ include file="../layout/html-head.jsp" %>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/customer.css"/>'>

        <script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>

        <title>Booking Online - Area Riservata Cliente Home</title>
    </head>
    <body>
        <%@ include file="../layout/bol-header.jsp"%>
        <div class="container-fluid" id="customer-home-container">
            <div class="row">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"><!-- left Area Div-->
                    <%@ include file="layout/left-side.jsp"%>
                </div><!-- end of left-area Div -->

                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 ">
                    <%@ include file="layout/order-table.jsp" %>
                </div><!-- end of content-area div -->

            </div> <!-- end of row div -->

        </div> <!-- end of main Container -->
        <%@ include file="../layout/bol-footer.jsp"%>
        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
