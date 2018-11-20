

<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="../layout/html-head.jsp" %>

        <title>Booking Online - Riepilogo Affiliato</title>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/customer.css"/>'>

        <script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>
    </head>
    <body>

        <%@ include file="../layout/bol-header.jsp"%>
        <div class="container-fluid" id="customer-home-container">
            <div class="row">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"><!-- left Area Div-->
                    <%@ include file="layout/left-side.jsp"%>
                </div><!-- end of left-area Div -->

                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 ">
                    <div class="box-yellow">
                        <h4><center>Inserire messaggio che spiega le possibilità di modiﬁca delle prenotazioni</center></h4>
                    </div>
                    <br>
                    <h3><b>Le tue prenotazioni</b></h3>
                    <br>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 ">
                        <table class="table">
                            <thead>
                                <tr>
                                    <td>
                                        <b>Numero</b>
                                    </td>
                                    <td>
                                        <b>Data</b>
                                    </td>
                                    <td>
                                        <b>Orario</b>
                                    </td>
                                    <td>
                                        <b>Struttura</b>
                                    </td>
                                    <td>
                                        <b>Gestisci</b>
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <b>6789</b>
                                    </td>
                                    <td>
                                        01.05.2016
                                    </td>
                                    <td>
                                        09.00 - 11.00
                                    </td>
                                    <td>
                                        <p>
                                            Accademia Informatica s.r.l.
                                        </p>
                                        <p>
                                            Roma - Viale Egeo - EUR
                                        </p>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                <a href="#" class="underlined">Modifica</a>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                <a href="" class="underlined">Annulla</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>6789</b>
                                    </td>
                                    <td>
                                        01.05.2016
                                    </td>
                                    <td>
                                        09.00 - 11.00
                                    </td>
                                    <td>
                                        <p>
                                            Accademia Informatica s.r.l.
                                        </p>
                                        <p>
                                            Roma - Viale Egeo - EUR
                                        </p>
                                    </td>
                                    <td>
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                <a href="#" class="underlined">Modifica</a>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                                <a href="" class="underlined">Annulla</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>1234</b>
                                    </td>
                                    <td>
                                        01.03.2016
                                    </td>
                                    <td>
                                        09.00 - 11.00
                                    </td>
                                    <td>
                                        <p>
                                            Accademia Informatica s.r.l.
                                        </p>
                                        <p>
                                            Roma - Viale Egeo - EUR
                                        </p>
                                    </td>
                                    <td>
                                        <div class="col-xs-4 col-xs-offset-8">
                                            <span class="badge" data-toggle="tooltip" data-placement="right"  
                                                  title="help">?</span> 
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">

                    </div>
                </div><!-- end of content-area div -->

            </div> <!-- end of row div -->

        </div> <!-- end of main Container -->

        <%@ include file="../layout/html-end-of-body.jsp" %>



    </body>
</html>
