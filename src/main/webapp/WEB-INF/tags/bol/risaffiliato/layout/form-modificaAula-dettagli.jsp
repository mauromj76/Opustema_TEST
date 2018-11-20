<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisAffiliatoAjaxController"%>
<div class="row">
    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 ">
        <label for="nomeaula">Nome Aula</label>
        <input type="text" class="form-control" id="nomeaula" ng-model="aula.nome" maxlength="48">
    </div>

    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
        <label for="maxpartecipanti">Max partecipanti</label>
        <input type="number" class="form-control" id="maxpartecipanti" ng-model="aula.maxPosti" maxlength="4">
    </div>

    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
        <label for="prezzobase">Prezzo base</label>
        <input type="number" class="form-control" id="prezzobase" ng-model="aula.prezzo" ng-change="updateCredits(aula)">
    </div>
    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
        <label for="prezzocr">Crediti</label>
        <input type="number" class="form-control" id="prezzocr" ng-model="aula.prezzoCrediti" readonly="true">
    </div>
</div>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">           
        <label for="descrizione">Descrizione</label>
        <textarea class="form-control" id="descrizione" rows="4" ng-model="aula.descrizione" maxlength="220">
        </textarea>
    </div>
</div>
