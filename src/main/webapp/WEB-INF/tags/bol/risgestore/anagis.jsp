

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../layout/html-head.jsp" %>
        <title>PrenotazioneAule.it - Anagrafiche di sistema</title>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/customer.css"/>'>
        <script type="text/javascript" src="<c:url value='/web-resources/js/xeditable.min.js'/>"></script>
        <script type="text/javascript" src='<c:url value="/web-resources/js/home/home.js"/>'></script>
        <link rel="stylesheet" href="<c:url value='/web-resources/css/xeditable.css'/>">
    </head>
    <body>
        <%@ include file="../layout/bol-header.jsp"%>
        <div ng-app="anagsys" > 
            <script>
                var app = angular.module('anagsys', ["xeditable"]);
            </script>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <%@include file="layout/left-area.jsp" %>
                    </div>
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                        <%@include file="layout/anagrafica-fasce-orarie.jsp" %>
                        <br>
                        <br>
                       <%@include file="layout/anagrafica-servizi-aggiuntivi-AJS.jsp" %>
                        <br>
                        <br>
                        <%@include file="layout/anagrafica-configurazione-aula-AJS.jsp" %>
                        <br>
                        <br>
                        <%@include file="layout/anagrafica-caratteristica-aula-AJS.jsp" %>
                        <br>
                        <br>
                        <%@include file="layout/anagrafica-pacchetti-fotocopie.jsp" %>
                        <br>
                        <br>
                        <%@include file="layout/sconti-dow.jsp" %>
                        <br>
                        <br>
                        <%@include file="layout/sconti-moy.jsp" %>
                        <br>
                        <br>
                        <%@include file="layout/sconti-giorni.jsp" %>
                        <br>
                        <br>
                        <%@include file="layout/sconti-anticipo.jsp" %>
                    </div>
                </div>

                <%@ include file="../layout/bol-footer.jsp"%>  


            </div>
        </div>
        <%@ include file="../layout/html-end-of-body.jsp" %>
    </body>
</html>
