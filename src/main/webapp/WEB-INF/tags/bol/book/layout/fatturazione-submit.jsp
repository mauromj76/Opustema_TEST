<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.PaymentController"%>

<div class="border-div">
    <div class="nav navbar-default left-navbar" style="margin-left: 0px;">
        <div class ="left-navbar-header">
            Conferma Pagamento
        </div>
        <br>
        <center>
            <div class="row">
                <c:url value="<%= PaymentController.RQ_PAYPAL_CHECKOUT %>" var="actionUrl"/>
                <a href="${actionUrl}" data-paypal-button="true">
                    <img src="//www.paypalobjects.com/en_US/i/btn/btn_xpressCheckout.gif" alt="Paga con PayPal" />
                </a>
            </div>
        </center>
        <br>
    </div>
</form>
</div>
