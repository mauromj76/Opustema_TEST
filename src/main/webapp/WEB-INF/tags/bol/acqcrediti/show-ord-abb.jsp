<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.AcquistoCreditiController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="../layout/html-head.jsp" %>

        <title>Booking Online - Riepilogo Ordine Crediti</title>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/risaffiliato.css"/>'>
    </head>
    <body>

        <%@ include file="../layout/bol-header.jsp"%>
        <div class="container-fluid risaffiliato-container">
            <div class="row box-yellow">            
                <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                    <img src='<c:url value="/web-resources/images/icone/Sconto.png"/>'/>
                </div>
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                    <h3>${advert.advMessage.message}</h3>
                </div>
                <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                    <img src='<c:url value="/web-resources/images/icone/Sconto.png"/>'/>
                </div>

            </div>

            <div class="row" style="color:green;">
                <h2>Ordine inserito</h2>
            </div>
            <div class="row">
                <h4>L'ordine ${carrello.ordineBol.id} è stato correttamente inserito. Riceverai una mail di conferma all'indirizzo ${utente.mail}</h4>
            </div>

            <div class="row border-red">
                <h2 class="red">Stampa e firma il contratto</h2>
                <br>
                <h4>Per iniziare ad utilizzare i tuoi crediti è necessario scaricare il contratto di fornitura e restituirlo firmato in tutte le sue parti. Segui questi semplici passi:</h4>
                <div class="row" style="margin-left:50px;">

                    <h4>
                        <span class="label label-success">1</span>
                        <strong>Scarica il contratto di fornitura in formato pdf cliccando <a href="#">qui</a>.</strong>
                    </h4>
                    <br/>
                    <h4>
                        <span class="label label-success">2</span>
                        <strong>Stampa il contratto e firmalo in tutte le sue parti.</strong>
                    </h4>
                    <br/>
                    <h4>
                        <span class="label label-success">3</span>
                        <strong>Inviaci il contratto firmato in una di queste modalità.</strong>
                    </h4>
                    <div class="row" style="margin-left:20px;">
                        <span class="glyphicon glyphicon-envelope"></span>Via mail all'indirizzo contratti@prenotazioneaule.it
                        <br/>
                        <span class="glyphicon glyphicon-print"></span>Via fax al numero 06.12345678
                        <br/>
                        <span class="glyphicon glyphicon-send"></span>Via raccomandata all'indirizzo - Prenotazione Aule .IT Viale Egeo 100, 00144 Roma
                    </div>
                </div>
                <br/>
            </div>
        </div>
        <%@ include file="../layout/bol-footer.jsp"%>
        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
