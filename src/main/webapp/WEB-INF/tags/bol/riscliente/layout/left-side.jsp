<%-- 
    Contiene i filtri di ricerca
    (parte sinistra della schermata 3.1)
--%>

<%@page import="it.logicadeisistemi.bol.hbol.controller.RisClienteController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>

<div class ="left-navbar-header">
    <p> Men&#249; area riservata</p>
</div>

<ul class="nav navbar-default left-navbar">
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisClienteController.RQ_MI_RIEPILOGO_CLIENTE%>'/>">Riepilogo</a></li>
    <li class="divider"></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%= RisClienteController.RQ_MI_VISUALIZZA_ORDINI%>'/>">Visualizza Ordini</a></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisClienteController.RQ_MI_VISUALIZZA_PRENOTAZIONI_SALE%>'/>">Visualizza prenotazioni sale</a></li>
    <li class="divider"></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=HomeController.RQ_ABBONAMENTI%>'/>">Acquista crediti</a></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisClienteController.RQ_MI_ACQUISTA_FOTOCOPIE%>'/>">Acquista crediti fotocopie</a></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisClienteController.RQ_MI_PRENOTA_SALA_RIUNIONE%>'/>">Prenota sala riunione</a></li>
    <li class="divider"></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisClienteController.RQ_MODIFICA_DATI_DI_FATTURAZIONE%>'/>">Modifica dati fatturazione</a></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisClienteController.RQ_MI_CAMBIO_PASSWORD_CLIENTE%>'/>">Cambio password</a></li>
    <li class="divider"></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisClienteController.RQ_MI_ESCI_CLIENTE%>'/>"> Esci </a></li>
</ul>