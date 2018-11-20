<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@page import="it.logicadeisistemi.opustema.controller.HomeController"%>
<div class="container-fluid">
    <div class="row bol-header-row">
        <nav class="navbar navbar-default bol-header-bar" >
            <!--Menu principale (menu lato sx)-->
            <div class="dropdown bol-menu-button col-xs-12 col-sm-1 col-md-1 col-lg-1">
                <button class="btn btn-primary dropdown-toggle bol-menu-icon" type="button" data-toggle="dropdown"> 
                    <img src='<c:url value="/web-resources/images/menu-icon-30x25.png"/>'/>
                </button>

                <ul class="dropdown-menu">
                    <li><a href="<c:url value='<%= HomeController.RQ_HOME_SLASH%>'/>">CHI SIAMO</a></li>
                    <li><a href="<c:url value='<%= HomeController.RQ_HOME_SLASH%>'/>">ABBONAMENTI</a></li>
                    <li><a href="<c:url value='<%= HomeController.RQ_HOME_SLASH%>'/>">LE STRUTTURE PARTNER</a></li>
                    <li><a href="<c:url value='<%= HomeController.RQ_HOME_SLASH%>'/>">CONTATTI</a></li>
                    <c:if test="<%= HomeController.IS_DEBUG_VERSION%>">
                        <li class="divider"></li>
                        <li><a href="<c:url value='<%= HomeController.RQ_HOME_SLASH%>'/>">Generazione dati</a></li>
                        <li><a href="<c:url value='<%= HomeController.RQ_HOME_SLASH%>'/>">Restful Test</a></li>
                        <li><a href="<c:url value='<%= HomeController.RQ_HOME_SLASH%>'/>">Drop Cache</a></li>
                        <li><a href="<c:url value='<%= HomeController.RQ_HOME_SLASH%>'/>">Zap Database</a></li>
                        <li><a href="<c:url value='<%= HomeController.RQ_HOME_SLASH%>'/>">Inizializzazione DB</a></li>
                        </c:if>

                </ul>
            </div>

            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" >
                <a href="<c:url value='/'/>" class="btn btn-info bol-header-title col-xs-12 col-sm-2 col-md-2 col-lg-2" role="button">
                    <img class="logo-header" src='<c:url value="/web-resources/images/official/PAinclinatoBianco.png"/>'/>
                    opus
                </a>
            </div>

        </nav>
    </div> 
</div>
