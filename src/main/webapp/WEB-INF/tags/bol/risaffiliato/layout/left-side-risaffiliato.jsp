<%@page import="it.logicadeisistemi.bol.hbol.controller.RisAffiliatoController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>

<div class="left-navbar-header">
    <p> Men&#249; area riservata</p>
</div>

<ul class="nav navbar-default left-navbar">
    <li class="menu-item-left-navbar"><a href="<c:url value='<%= RisAffiliatoController.RQ_MI_RIEPILOGO_AFFILIATO%>'/>">Riepilogo</a></li>
    <li class="divider"></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%= RisAffiliatoController.RQ_MI_GESTIONE_STRUTTURA%>'/>">Gestione Struttura</a></li>
    <li class="divider"></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%= RisAffiliatoController.RQ_MI_GESTIONE_FOTOCOPIE%>'/>">Gestione Fotocopie</a></li>
    <li class="divider"></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%= RisAffiliatoController.RQ_MI_CAMBIO_PASSWORD_AFFILIATO%>'/>">Cambio Password</a></li>
    <li class="divider"></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%= RisAffiliatoController.RQ_MI_ESCI_AFFILIATO%>'/>">Esci</a></li>
</ul>
