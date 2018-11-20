<%-- 

--%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
        <div class="container-fluid">
            <div class="row box-yellow">
                <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                    <img src='<c:url value="/web-resources/images/icone/Sconto.png"/>'/>
                </div>
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                    <center><h4>${advert.advMessage.message}</h4></center>
                </div>
                <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                    <img src='<c:url value="/web-resources/images/icone/Sconto.png"/>'/>
                </div>
            </div>
            <div class="row" style="color:green;">
                <h2>Ordine inserito</h2>
            </div>
            <br>
            <br>
            <div class="row">
                <h4>L'ordine ${ordineFull.orderNumber} è stato correttamente inserito. Riceverai una mail di conferma all'indirizzo <a href="mailto:${currentUser.mail}">${currentUser.mail}</a></h4>
            </div>
            <br>
            <br>
            <br>
            <div class="row">
                <h3>Dettaglio ordine numero ${ordineFull.orderNumber} del <fmt:formatDate pattern="dd.MM.yyyy" type="date" value="${ordineFull.orderDate}"/></h3>
            </div>
            <div class="row">
                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                    <table class="table">
                        <thead>
                            <tr>
                                <td>
                                    Data e luogo
                                </td>
                                <td>
                                    Partecipanti
                                </td>
                                <td>
                                    Configurazione
                                </td>
                                <td>
                                    Prezzo
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${ordineFull.elements}" var="elem">
                                <tr>
                                    <td>
                                        <h4>${elem.date} - ${elem.fascia}</h4>
                                        ${elem.aulaDescription} - ${elem.aulaAddress}
                                    </td>
                                    <td>
                                        <small>max ${elem.partecipanti}</small>
                                    </td>
                                    <td>
                                        <p>Aula Informatica</p>
                                        <p>Nessun servizio aggiuntivo</p>
                                    </td>
                                    <td>
                                        <h3><fmt:formatNumber value="${elem.prezzoEuro}" pattern="###,##0.00" /> &euro;</h3>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%@ include file="../layout/bol-footer.jsp"%>
        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
