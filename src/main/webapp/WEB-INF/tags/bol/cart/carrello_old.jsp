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
                <h2>Il tuo Carrello</h2>
            </div>
            <br>
            <br>
            <table class="table">
                <thead>
                    <tr>
                        <td class="row">
                            Data e luogo
                        </td>
                        <td class="row">
                            Partecipanti
                        </td>
                        <td class="row">
                            Configurazione
                        </td>
                        <td class="row">
                            Servizi aggiuntivi
                        </td>
                        <td class="row">
                            Prezzo
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${ordineFull.elements}" var="elem">
                        <tr>
                            <td class="row">
                                <h4>${elem.date} - ${elem.fascia}</h4> 
                                ${elem.aulaDescription} - ${elem.aulaAddress}
                            </td>
                            <td class="row">
                                <p>max ${elem.partecipanti}</p>
                            </td>
                            <td class="row">
                                <div class="col-xs-10">
                                    <select class="form-control">
                                        <option>Aula Informatica</option>
                                    </select>
                                </div>
                                <div class="col-xs-2">
                                    <span class="badge" data-toggle="tooltip" data-placement="right"  
                                          title="help">?</span>
                                </div>
                            </td>
                            <td class="row">
                                <div class="col-xs-9">
                                    <select class="form-control">
                                        <option>Caffè break - Virtual Mach</option>
                                    </select>
                                </div>
                                <div class="col-xs-3">
                                    <span class="badge" data-toggle="tooltip" data-placement="right"  
                                          title="help">?</span>
                                </div>
                            </td>
                            <td class="row">
                                <h3>
                                    <fmt:formatNumber value="${elem.prezzoEuro}" pattern="###,##0.00" />  &euro;
                                </h3>
                                <small>(<fmt:formatNumber value="${elem.prezzoCrediti}" pattern="###,##0.00" /> crediti)</small>
                            </td>
                            <td class="row" style="border:0px none">

                                <span class="badge" data-toggle="tooltip" data-placement="right" title="Rimuovi dal carrello">
                                    <a href="<c:url value='<%= CarrelloAuleController.RQ_RIMUOVI_DA_CARRELLO%>'/>/<c:out value='${elem.id}'/>"> X </a>
                                </span>
                            </td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <div class="box-yellow">
                    <div class="row">
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                            <img src='<c:url value="/web-resources/images/icone/Sconto.png"/>'/>
                        </div>
                    </div>
                    <h1>
                        ${advert.advMessage.message} 
                    </h1>
                    <div class="row">
                        <div class="col-xs-2 col-xs-offset-10">
                            <img src='<c:url value="/web-resources/images/icone/Sconto.png"/>'/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <div class="row">
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <h2 style="text-align: right;">Totale:</h2>
                    </div>
                    <div  id="totale" class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <h2><fmt:formatNumber value="${ordineFull.totalEuro}" pattern="###,##0.00" /> &euro;</h2>
                        <small>(<fmt:formatNumber value="${ordineFull.totalCredits}" pattern="###,##0.00" /> crediti)</small>
                    </div>
                    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">

                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-8">
                        <a class="btn btn-default" href="<c:url value='<%=HomeController.RQ_HOME_SLASH%>'/>">Prosegui la ricerca</a>
                    </div>
                    <div class="col-sm-4 col-sm-offset-8">
                        <a class="btn btn-primary" role="button" href="<c:url value='<%=CarrelloAuleController.RQ_RIEPILOGO_ORDINE%>'/>">Vai alla Cassa</a>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="../layout/bol-footer.jsp"%>

        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
