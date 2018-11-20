<%-- 
  
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.CarrelloAuleController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.PaymentController"%>

<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">

    <div class="border-div">

        <c:url value='<%= CarrelloAuleController.RQ_CONFERMA_PAGAMENTO%>' var="filterFormActionUrl"/>
        <div class="row">
            <h2>Dati di fatturazione</h2>
        </div>
        <form:form method="POST" modelAttribute="invoiceData" id="bol-hbol-lista-strutture-filtro-form" action="${filterFormActionUrl}" class="form-horizontal table">
            <div class="form-group">
                <label for="RagioneSociale" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Ragione Sociale *</label>
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                    <form:input path="fatRagSoc" type="text" id="RagioneSociale" 
                                class="form-control" required="required" maxlength="200"/>
                </div>
            </div>

            <div class="form-group">
                <label for="PartitaIVA" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">Partita IVA *</label>

                <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                    <c:if test="${currentUser.fatNonPIva==false}">
                        <form:input path="fatPIva" type="text" class="form-control" 
                                    id="partita-iva" required="required"  maxlength="11"/>    
                    </c:if>
                    <c:if test="${currentUser.fatNonPIva==true}">
                        <form:input path="fatPIva" type="text" class="form-control" id="partita-iva" disabled="true"  maxlength="16"/>
                    </c:if>

                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <label class="checkbox-inline">
                        <form:checkbox path="fatNonPIva" onclick="document.getElementById('partita-iva').disabled = this.checked;"/>
                        Società senza partita iva
                    </label>
                </div>
            </div>         
            <div class="form-group">
                <label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label" for="CodiceFiscale">
                    Codice Fiscale *
                </label>
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                    <form:input path="fatCodFis" type="text" id="CodiceFiscale" 
                                class="form-control" required="required" maxlength="16"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label" for="Indirizzo">
                    Indirizzo *
                </label>
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                    <form:input path="fatIndirizzo" type="text" class="form-control" 
                                id="Indirizzo" required="required" maxlength="200"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label" for="Localita">
                    Localita *
                </label>
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="padding-left: 0px;">
                        <form:input path="fatLocalita" type="text" class="form-control" 
                                    id="Localita" required="required" maxlength="100"/>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="padding-left: 0px;">
                        <label class="col-xs-6 col-sm-6 col-md-6 col-lg-6 control-label right-label" for="Provincia">
                            Provincia *
                        </label>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding:0px;">
                            <form:input path="fatProvincia" type="text" class="form-control" 
                                        id="Provincia" required="required" maxlength="2"/>
                        </div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="padding:0px;">
                        <label class="col-xs-4 col-sm-4 col-md-4 col-lg-4 control-label right-label" for="CAP">
                            CAP *
                        </label>
                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="padding:0px;">
                            <form:input path="fatCAP" type="text" class="form-control" 
                                        id="CAP" required="required" maxlength="5"/>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="form-group">
                <label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label" for="NomeReferente">
                    Nome Referente
                </label>
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-left:0px;">
                        <form:input path="fatReferente" type="text" class="form-control" 
                                    id="NomeReferente" maxlength="80"/>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding:0px;">
                        <label class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label right-label" for="tel">
                            Tel *
                        </label>
                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" style="padding:0px;">
                            <form:input path="fatTelefono" type="text" class="form-control" 
                                        id="tel" required="required" maxlength="100"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 ">
        <div class="border-div">
            <div class="nav navbar-default left-navbar" style="margin-left: 0px;">
                <div class ="left-navbar-header">
                    Conferma Pagamento
                </div>
                <br>
                <c:if test='${criteriPagamento.tipoPagamento == "PAYPAL"}'>
                    <center>
                        <input type="image" name="submit" data-paypal-button="true" 
                               src="//www.paypalobjects.com/en_US/i/btn/btn_xpressCheckout.gif" alt="Paga con PayPal" />
                    </center>
                </c:if>
                <c:if test='${criteriPagamento.tipoPagamento == "CARD"}'>
                    <center>
                        <input type="submit" name="submit" value="Paga Con Carta"/>
                    </center>
                </c:if>
                <c:if test='${criteriPagamento.tipoPagamento == "CREDITS"}'>
                    <center>
                        <input type="submit" name="submit" value="Paga Con Crediti" />
                    </center>
                </c:if>
                <br>
            </div>
        </div>

    </div>
</form:form>