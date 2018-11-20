<%@page import="it.logicadeisistemi.bol.hbol.controller.AcquistoCreditiController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 riep-sal-neg">
    <div class="row">
        <div class="col-xs-12 col-sm-5 col-md-6 col-lg-7 text-left" >
            <h2 class="bold">Il Riepilogo del tuo Ordine</h2>
        </div>
        <div class="col-xs-12 col-sm-7 col-md-6 col-lg-5" >
            <a class="btn btn-primary btn-right" role="button" href="<c:url value='<%=AcquistoCreditiController.RQ_VIEW_CARRELLO_CREDITI%>'/>">Torna all'inserimento dell'ordine</a>                
        </div>
    </div>
    <br>
    <br>

    <c:forEach items="${carrello.lista}" var="elem">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" >
                <h3 class="bold">${elem.nome} - <fmt:formatNumber value="${elem.importoCrediti}" pattern="#,##0" /> crediti</h3>
                <h4>Pagamento in ${elem.numeroRate} rate mensili</h4>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" >
                <div class="col-xs-6 col-sm-6 col-md-9 col-lg-10" >
                    <h4 class="bold head-list-sconto text-right">Totale Scontato</h4>  
                </div>
                <div class="col-xs-6 col-sm-6 col-md-3 col-lg-2" >
                    <h4 class="bold head-list-sconto-price text-right">${elem.rata1Euro}&euro;</h4>
                </div>    
            </div>
        </div>
    </c:forEach>

    <br>
    <br>
    <br>

    <div class="row">
        <br>
        <br>
        <br>
        <div class="border-top col-xs-12 col-sm-10 col-md-8 col-lg-7 
             col-sm-offset-2 col-md-offset-4 col-lg-offset-5 text-right" >
            <span><h3 class="bold">Totale Generale</h3></span>
            <span><h3 class="bold price"> &nbsp;<fmt:formatNumber value="${carrello.ordineBol.importoEuro}" pattern="###,##0.00" /> &euro;</h3></span>
        </div>
    </div>
</div>




