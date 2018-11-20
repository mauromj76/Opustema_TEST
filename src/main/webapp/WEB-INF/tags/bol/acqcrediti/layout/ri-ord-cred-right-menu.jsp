
<%@page import="it.logicadeisistemi.bol.hbol.controller.AcquistoCreditiController"%>
<%@page import="it.logicadeisistemi.bol.hbol.service.PaymentService"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
    <div class="row">
        <div class="box-border choose-payment">
            <div class="row head">
                <h4 class="bg-primary text-center">Modalità Pagamento</h4> 
            </div>
            <c:url value='<%= AcquistoCreditiController.RQ_DATI_FATTURAZIONE%>' var="formActionUrl"/>
            <form:form role="form" modelAttribute="criteriPagamento" action="${formActionUrl}">
                <div style="margin-left: 5px;">
                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <h5> Il totale del tuo ordine</h5>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <h3 class="bold"><fmt:formatNumber value="${carrello.ordineBol.importoEuro}" pattern="###,##0.00" /> €</h3>
                        </div> 
                    </div>
                    <div class="row">
                        <div class="row">
                            <div class="col-xs-10">
                                <c:set value="<%=PaymentService.TIPO_PAG_CREDIT_CARD%>" var="cc"/>
                                <form:radiobutton path="tipoPagamento" 
                                                  value="${cc}" 
                                                  required="required" />
                                <img src='<c:url value="/web-resources/images/icone/cc.png"/>'/>
                                Carta di Credito
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-10">

                                <c:set value="<%=PaymentService.TIPO_PAG_PAYPAL%>" var="pp"/>
                                <form:radiobutton path="tipoPagamento" 
                                                  value="${pp}" 
                                                  required="required" 
                                                  checked="checked" />
                                <img src='<c:url value="/web-resources/images/icone/paypal.png"/>'/>
                                PayPal
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-10">
                                <c:set value="<%=PaymentService.TIPO_PAG_BONIFICO%>" var="bb"/>
                                <form:radiobutton path="tipoPagamento" 
                                                  value="${bb}" 
                                                  required="required" />
                                <img src='<c:url value="/web-resources/images/icone/bonifico.png"/>'/>
                                Bonifico Bancario
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-xs-1">
                            <form:checkbox path="agreement" required="required"/> 
                        </div>
                        <div class="col-xs-10">
                            <button type="button" class="underlined btn-link" data-toggle="modal" data-target="#condizioni">
                                <small class="underlined">Accetto le condizioni di vendita <br>e generali di contratto</small>
                            </button>
                        </div>
                    </div>
                    <br>
                    <div class="form-group col-xs-7 col-sm-7 col-md-7 col-lg-7 col-xs-offset-5 col-sm-offset-5 col-md-offset-5 col-lg-offset-5">
                        <button type="submit" class="btn btn-primary btn-block btn-md btn-right">Avanti</button>
                    </div>
                </div>
            </form:form>
        </div>

    </div>
</div>
<!-- Condizioni di vendita modal -->

<!-- Modal -->
<div id="condizioni" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Condizioni di vendita e di contratto</h4>
            </div>
            <div class="modal-body">
                <p>Inserire qui le condizioni di vendita e di contratto.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Chiudi</button>
            </div>
        </div>

    </div>
</div>