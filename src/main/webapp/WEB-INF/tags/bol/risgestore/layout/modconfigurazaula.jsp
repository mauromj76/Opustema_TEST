<%-- 
    Document   : modconfigurazaula
    Created on : Jun 30, 2016, 1:36:29 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../../layout/html-head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/modificaGestione.css"/>'>
        <title>Modifica Configurazione</title>
    </head>
    <body>
        <div class="container-fluid">
            <%@ include file="../../layout/bol-header.jsp"%>

            <br><br><br> <br><br><br><br><br><br>
            <div class="box-border modifica-gestione container">

                <div class="row">
                    <div><h3 class="bold">${editOrCreate} configurazione aula</h3></div>
                    <br><br><br><br>
                </div>
                <div class="row">
                    <div>
                        <c:url var="saveOrUpdateConfigurazione" value="<%=RisGestoreController.RQ_CHANGE_CONFIG%>"></c:url>
                        <form:form cssClass="form-inline" action="${saveOrUpdateConfigurazione}" commandName="configurazioneAula">
                            <label>Nome Configurazione</label>
                            <form:hidden path="idConfigurazione"/>
                            <form:input path="nomeConfigurazione"/>
                            <br><br><br><br>
                            <div class="col-xs-6 col-sm-4 col-md-2 col-lg-2 col-sm-offset-4 col-md-offset-8 col-offset-lg-offset-8">
                                <a class="btn btn-secondary btn-lg" href="<c:url value='<%= RisGestoreController.RQ_MI_ANAGRAFICHE_SISTEMA%>'/>"> Annulla</a>    
                            </div>
                            <div class="col-xs-6 col-sm-4 col-md-2 col-lg-2"> 
                                <input class="btn btn-secondary btn-lg" type="submit" value="Salva"></input>
                            </div>
                            <br><br><br>
                        </form:form>

                    </div>
                </div>
            </div>
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

            <%@ include file="../../layout/bol-footer.jsp"%>  
        </div>
        <%@ include file="../../layout/html-end-of-body.jsp" %>
    </body>
</html>