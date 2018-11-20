<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.ImageAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="../../layout/html-head.jsp" %>
        <link rel="stylesheet" href='<c:url value="/web-resources/css/layout/modificaGestione.css"/>'>
        <title>Modifica Caratteristiche Aula</title>
    </head>
    <body>
        <%@ include file="../../layout/bol-header.jsp" %>

        <div ng-app="gestCaratteristica">
            <script>
                var app = angular.module('gestCaratteristica', []);
            </script>
            <div id="controller-container" ng-controller="GestioneCaratteristicaController" ng-cloak>
                <div class="container-fluid">
                    <div class="box-border modifica-gestione container">

                        <div class="row">
                            <div><h3 class="bold">Modifica caratteristica aula</h3></div>
                            <br><br><br>
                        </div>
                        <div class="row">
                            <div>
                                <c:url var="saveOrUpdateCarattersticheAula" value="<%=RisGestoreController.RQ_CHANGE_CARATERIST%>"></c:url>
                                <form:form cssClass="form-inline" action="${saveOrUpdateCarattersticheAula}" modelAttribute="caratteristicaAula">
                                    <div class="row">
                                        <form:hidden path="id"/>
                                        <div class="form-group form-horizontal checkbox-inline">
                                            <form:checkbox path="tipo" cssClass="input-group checkbox-inline"/>
                                            <h4 class="cracterAula-chackbox">Imposta come caratteristica principale</h4>
                                        </div>
                                        <br>
                                    </div>
                                    <div class="row">
                                        <div class="form-group form-horizontal input">
                                            <label class="caracteristAula-label">Nome Caratteristica</label>
                                            <form:input path="nome"/>
                                        </div>
                                    </div>
                                    <br><br><br>
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-4 col-md-2 col-lg-2 col-sm-offset-4 col-md-offset-8 col-offset-lg-offset-8">
                                            <a class="btn btn-secondary btn-lg" href="<c:url value='<%= RisGestoreController.RQ_MI_ANAGRAFICHE_SISTEMA%>'/>">Annulla</a>    
                                        </div>
                                        <div class="col-xs-6 col-sm-4 col-md-2 col-lg-2"> 
                                            <input class="btn btn-secondary btn-lg" type="submit" value="Salva">
                                        </div>
                                    </div>
                                    <br><br>
                                </form:form>
                                <div class="row">
                                    <c:url value="/" var="appCtx"/>
                                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"  ng-show="showImage">
                                        <span>
                                            <img class="img-responsive logo" src="${appCtx}/{{img.imgUrl}}"/>
                                        </span>
                                    </div>
                                    <div class="col-xs-4  col-sm-4  col-md-4  col-lg-4"  ng-show="showImageControls">
                                        <c:url value='<%= ImageAjaxController.RQ_UPLOAD_SEDE_IMG%>' var="formUrl"/>
                                        <form id="form2" method="POST" action="${formUrl}" enctype="multipart/form-data">
                                            <input name="file2" id="file2" type="file" /><br/>
                                        </form>
                                        <button class="btn btn-primary btn-sm btn-file" ng-click="uploadImmagine()">Carica foto</button>  
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@ include file="../../layout/bol-footer.jsp"%>  
        </div>
        <script>
            app.controller('GestioneCaratteristicaController', function ($scope, $http) {

                $scope.uploadImmagine = function () {
                    console.log("Entrato in uploadImmagine")
                    // CSRF prevention
                    var csrfToken = $("meta[name='_csrf']").attr("content");
                    var csrfHeader = $("meta[name='_csrf_header']").attr("content");

                    var idCaratteristica = ${caratteristicaAula.id};
                    var oMyForm = new FormData();
                    oMyForm.append("file", file2.files[0]);
                    oMyForm.append("didascalia", "Questa è una didascalia di test");
                    oMyForm.append("idCaratteristica", idCaratteristica);
                    var req = "<c:url value='<%= ImageAjaxController.RQ_UPLOAD_CARATTERISTICA_ICON%>'/>";
                    $.ajax({
                        url: req,
                        data: oMyForm,
                        dataType: 'text',
                        processData: false,
                        contentType: false,
                        type: 'POST',
                        beforeSend: function (xhr) {
                            // CSRF prevention
                            xhr.setRequestHeader(csrfHeader, csrfToken);
                        },
                        success: function (data) {
                            $scope.refreshImage();
                        }
                    });
                };
                $scope.refreshImage = function () {
                    console.log("Entrato in refreshImage")
                    // CSRF prevention
                    var csrfToken = $("meta[name='_csrf']").attr("content");
                    var csrfHeader = $("meta[name='_csrf_header']").attr("content");
                    //data to be requested
                    var data = {};
                    data["id"] = ${caratteristicaAula.id};
                    // request 
                    var req = '<c:url value="<%= HomeAjaxController.AX_GET_CARATTERISTICA_ICON_LINK%>"/>';
                    //                console.log(req);
                    //                console.log(JSON.stringify(data));
                    $http({
                        url: req,
                        method: 'POST',
                        data: data,
                        headers: {'X-Csrf-Token': csrfToken}
                    })
                            .then(function (response) {
                                // in case of success ...
                                $scope.img = response.data;
                                console.log(JSON.stringify($scope.img));
                                if (${caratteristicaAula.id}) {
                                    if ($scope.img.idImg > 0) {
                                        $scope.showImage = true;
                                    } else {
                                        $scope.showImage = false;
                                    }
                                    $scope.showImageControls = true;
                                } else {
                                    $scope.showImage = false;
                                    $scope.showImageControls = false;
                                }
                            },
                                    function (response) {
                                        // optional in case of failure
                                        window.alert('Errore!');
                                    });
                };
                $scope.refreshImage();
            });
        </script>

        <%@ include file="../../layout/html-end-of-body.jsp" %>
    </body>
</html>