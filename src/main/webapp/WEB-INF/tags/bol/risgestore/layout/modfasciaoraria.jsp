
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../../layout/html-head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/modificaGestione.css"/>'>
        <title>Modifica Orari</title>
    </head>
    <body>
        <div class="container-fluid">
            <%@ include file="../../layout/bol-header.jsp"%>

            <br><br><br> <br><br><br><br><br><br>
            <div class="box-border modifica-gestione container fasciaorari">

                <div class="row">
                    <div><h3 class="bold">${editOrCreate} fascia oraria</h3></div>
                    <br><br><br>
                </div>
                <div class="row">
                    <div class="form">
                        <c:url var="saveOrUpdateFascia" value="<%=RisGestoreController.RQ_CHANGE_FASCIAORARIA%>"></c:url>
                        <form:form cssClass="form-inline" action="${saveOrUpdateFascia}" commandName="fasciaOraria">
                            <div class="row">
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <div class="form-group form-inline select fasciaorari">
                                        <form:hidden path="id"/>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 ">
                                            <h4>Dalle</h4>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 border-top border-left">
                                            <fmt:formatNumber value="${fasciaOraria.inizioH}" pattern="00" var="startTime"/>
                                            <form:input path="inizioH" cssClass="noborder" 
                                                        value="${startTime}" pattern="([0-1]?[0-9])|([2][0-3])" 
                                                        size="2" maxlength="2"/>
                                            </div>
                                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 border-top">
                                                .
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 border-top border-right">
                                            <fmt:formatNumber value="${fasciaOraria.inizioM}" pattern="00" var="startMin"/>
                                            <form:input path="inizioM" class="noborder" 
                                                        value="${startMin}" pattern="[0-5]?[0-9]" 
                                                        size="2" maxlength="2"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                        <div class="form-group form-inline select fasciaorari">
                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 ">
                                                <h4 class="text-right">Alle</h4>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 border-top border-left">
                                            <fmt:formatNumber value="${fasciaOraria.fineH}" pattern="00" var="endTime"/>
                                            <form:input path="FineH" cssClass="noborder" 
                                                        value="${endTime}" pattern="([0-1]?[0-9])|([2][0-3])" 
                                                        size="2" maxlength="2"/>
                                            </div>
                                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 border-top">
                                                .
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 border-top border-right">
                                            <fmt:formatNumber value="${fasciaOraria.fineM}" pattern="00" var="endMin"/>
                                            <form:input path="FineM" cssClass="noborder" 
                                                        value="${endMin}" pattern="[0-5]?[0-9]" 
                                                        size="2" maxlength="2"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="form-group form-inline select fasciaorari">
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 ">
                                            <h4 class="text-right">Sconto</h4>
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 border-top border-right border-left">
                                        <form:input path="sconto" cssClass="noborder" 
                                                    pattern="[0-9]{1,2}(\.[0-9]{1,2})?" value="${fasciaOraria.sconto}" 
                                                    size="4" maxlength="4"/>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <br><br><br><br><br><br>

                            <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4 col-md-offset-4 col-offset-lg-offset-4">
                                <a class="btn btn-secondary btn-lg" href="<c:url value='<%= RisGestoreController.RQ_MI_ANAGRAFICHE_SISTEMA%>'/>"> Annulla</a>    
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-4 col-lg-4"> 
                            <input type="submit" value="Salva" class="btn btn-secondary btn-lg"/>
                        </div>

                        <br><br><br>
                    </form:form>
                </div>
            </div>
        </div>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

        <%@ include file="../../layout/bol-footer.jsp"%>  
        <%@ include file="../../layout/html-end-of-body.jsp" %>
    </body>
</html>