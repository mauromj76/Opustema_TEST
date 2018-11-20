
<!--
6.7 
-->
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../layout/html-head.jsp" %>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/customer.css"/>'>

        <script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>

        <title>Booking Online</title>
    </head>
    <body>

        <%@ include file="../layout/bol-header.jsp"%>
        <div class ="container-fluid">
            <div class="row">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"><!-- left Area Div-->
                    <ul class="nav navbar-default left-navbar">
                        <div class ="left-navbar-header">
                            <p>Parametri di ricerca</p>
                        </div>
                        <div style="margin-left: 10px; margin-right: 10px; margin-bottom: 50px;">
                            <p>
                                Città <span class="badge">i</span>
                            <p>
                            <p>
                                <select class="form-control">
                                    <option>Roma</option>
                                    <option>Milano</option>
                                </select>
                            </p>
                            <p>
                                Sedde <span class="badge">i</span>
                            </p>
                            <p>
                                <select class="form-control">
                                    <option>Viale Egeo - EUR</option>
                                </select>
                            </p>
                            <p>
                                Data <span class="badge">i</span>
                            </p>
                            <p>
                                <select class="form-control">
                                    <option>01.01.2016</option>
                                </select>
                            </p>
                            <div>
                                <b>Orario</b>&nbsp;&nbsp;&nbsp;
                                <span class="badge" data-toggle="tooltip" data-placement="right"  
                                      title="Orario">i</span> 
                            </div>
                            <div>
                                <div class="col-xs-6" style="padding-left: 0px;">
                                    dalle &nbsp;
                                    <select class="form-control dalle-alle">
                                        <option>09.00</option>
                                        <option>10.00</option>
                                        <option>11.00</option>
                                    </select>
                                </div>

                                <div class="col-xs-6" style="padding-left:0px;text-align: right;">
                                    alle &nbsp;
                                    <select class="form-control dalle-alle">
                                        <option>11.00</option>
                                        <option>12.00</option>
                                        <option>13.00</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </ul>
                </div><!-- end of left-area Div -->

                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 ">
                    <%@include file="layout/prenota-sala-content-area.jsp" %>
                </div><!-- end of content-area div -->

            </div>
            <%@ include file="../layout/bol-footer.jsp"%>
            <%@ include file="../layout/html-end-of-body.jsp" %>

    </body>
</html>
