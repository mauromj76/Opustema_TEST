<%-- 
    Document   : modificaservizio
    Created on : Jun 30, 2016, 1:35:12 PM
    Author     : user
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../../layout/html-head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/modificaGestione.css"/>'>
        <title>Modifica Servizio</title>
    </head>
    <body>
        <div class="container-fluid">
            <%@ include file="../../layout/bol-header.jsp"%>
            <br><br><br> <br><br><br><br><br><br>
            <div class="box-border modifica-gestione container">

                <div class="row">
                    <div><h3 class="bold">${editOrCreate} servizzio aggiuntivo</h3></div>
                    <br><br><br><br>
                </div>
                <div class="row">
                    <div>
                        <c:url var="saveOrUpdateServizio" value="<%=RisGestoreController.RQ_CHANGE_SERVIZIO%>"></c:url>
                        <form:form action="${saveOrUpdateServizio}" commandName="sevizioAula">
                            <form:hidden path="id"/>
                            <form:input path="breve" />
                            <label>Nome Servizio</label>
                            <br><br><br><br>
                            <div class="col-xs-6 col-sm-4 col-md-2 col-lg-2 col-sm-offset-4 col-md-offset-8 col-offset-lg-offset-8">
                                <a class="btn btn-secondary btn-lg" href="<c:url value='<%= RisGestoreController.RQ_MI_ANAGRAFICHE_SISTEMA%>'/>"> Annulla</a>    
                            </div>
                            <div class="col-xs-6 col-sm-4 col-md-2 col-lg-2"> 
                                <input type="submit" value="Salva" class="btn btn-secondary btn-lg"/>
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
