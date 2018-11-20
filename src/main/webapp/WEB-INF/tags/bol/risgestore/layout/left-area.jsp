
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController" %>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul class="nav navbar-default left-navbar">
    <div class ="left-navbar-header">
    <p> Men&#249; area riservata</p>
    </div>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisGestoreController.RQ_MI_RIEPILOGO%>'/>">Riepilogo</a></li>
    <li class="divider"></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisGestoreController.RQ_MI_ANAGRAFICA_AFFILIATI%>'/>">Anagrafica Affiliati</a></li>
    <li class="divider"></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisGestoreController.RQ_MI_GESTIONE_FATTURE%>'/>">Gestione fatture - pagamenti</a></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisGestoreController.RQ_MI_GESTIONE_CONTRATTI%>'/>">Gestione Contratti</a></li>
    <li class="divider"></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisGestoreController.RQ_MI_ANAGRAFICHE_SISTEMA%>'/>">Anagrafiche di sistema</a></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisGestoreController.RQ_MI_PARAMETRI_SISTEMA%>'/>">Parametri di sistema</a></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisGestoreController.RQ_MI_GESTIONE_ABBONAMENTI %>'/>">Gestione abbonamenti</a></li>
    <li class="divider"></li>
    <li class="menu-item-left-navbar"><a href="<c:url value='<%=RisGestoreController.RQ_MI_ESCI_GESTORE%>'/>">Esci</a></li>
    
</ul>