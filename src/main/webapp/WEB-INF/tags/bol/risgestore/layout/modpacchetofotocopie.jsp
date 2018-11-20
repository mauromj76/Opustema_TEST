
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../../layout/html-head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/modificaGestione.css"/>'>
        <title>Modifica Fotocopie</title>
    </head>
    <body>
        <div class="container-fluid">
            <%@ include file="../../layout/bol-header.jsp"%>

            <br>
            <div class="box-border modifica-gestione container">

                <div class="row">
                    <div><h3 class="bold">Modifica pacchetto fotocopie</h3></div>
                    <br>
                </div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <c:url var="saveOrUpdateFotocopie" value="<%=RisGestoreController.RQ_CHANGE_PACCHETOFOTOCOPIE%>"></c:url>
                        <form:form action="${saveOrUpdateFotocopie}" commandName="pacchettoFotocopie" class="form-inline">
                            <form:hidden path="id"/>
                            <div class="row">
                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group form-inline select">
                                        <label >Formato
                                            <form:select path="formato">
                                                <form:option value="A4" label="A4" selected="true"/>
                                                <form:option value="A3" label="A3" />
                                            </form:select>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                    <div class="form-group form-inline select">
                                        <label>Stampa
                                            <form:select path="stampa">
                                                <form:option value="Bianco e nero" label="Bianco e nero" selected="true"/>
                                                <form:option value="Colori" label="Colori" />
                                            </form:select>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group form-inline col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <label>Quantit&agrave;</label>
                                    <form:input path="quantita" type="number"/>
                                </div>
                                <div class="form-group form-inline col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <label >Importo &euro;</label> <form:input path="costoEuro" type="number"/>
                                </div>   
                                <div class="form-group form-inline col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                    <label >Importo crediti
                                        <form:input type="number" path="costoCrediti"/>
                                    </label>
                                </div>   
                            </div>
                        </div>

                        <br><br><br><br><br><br>

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
    </div>
    <br>

    <%@ include file="../../layout/bol-footer.jsp"%>  
    <%@ include file="../../layout/html-end-of-body.jsp" %>
</body>
</html>