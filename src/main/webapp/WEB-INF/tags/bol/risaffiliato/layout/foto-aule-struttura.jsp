<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="it.logicadeisistemi.bol.hbol.controller.ImageAjaxController"%>
<%@ page import="it.logicadeisistemi.bol.hbol.controller.RisAffiliatoAjaxController"%>

<div id="img-group" ng-cloack>
    <div class="row" id="butt-gr">
        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
            <h4> Immagini dell'Aula</h4>
        </div>
        <div class=" col-xs-4  col-sm-4  col-md-4  col-lg-4">
            <c:url value='<%= ImageAjaxController.RQ_UPLOAD_SEDE_IMG%>' var="formUrl"/>
            <form id="form2" method="POST" action="${formUrl}" enctype="multipart/form-data">
                <input name="file2" id="file2" type="file" /><br/>
            </form>
            <button class="btn btn-primary btn-sm btn-file" ng-click="uploadImmagine(aula.id)">Carica foto</button>  
        </div>
        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
            <button class="btn btn-danger btn-sm" ng-click="eliminaFotoSelezionate(aula.id)">Elimina foto selezionate</button>   
        </div>
    </div>

    <div class="row">
        <div id="img-div-holder">

            <c:url value="/" var="appCtx"/>
            <div class="checkbox col-xs-6 col-sm-6 col-md-3 col-lg-3" ng-repeat="img in listaLinkImmagini">
                <input type="checkbox" ng-model="img.selected" class="img-checkbox"> <img class ="img-responsive" src="${appCtx}/{{img.imgUrl}}"/>
            </div>
        </div>
    </div>

</div>






