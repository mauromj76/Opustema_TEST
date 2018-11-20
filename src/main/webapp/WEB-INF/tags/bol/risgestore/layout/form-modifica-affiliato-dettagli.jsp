<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreAjaxController"%>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
        <label for="ragsoc">Ragione Sociale</label>
        <input type="text" class="form-control" id="ragsoc" ng-model="aff.ragSoc" maxlength="200">
    </div>
</div>
<div class="row">
    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="piva">Partita IVA</label>
        <input type="text" class="form-control" id="piva" ng-model="aff.pIva"  maxlength="11">
    </div>

    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="cfisc">Codice Fiscale</label>
        <input type="text" class="form-control" id="cfisc" ng-model="aff.cFisc" maxlength="14">
    </div>
</div>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <label for="indirizzo">Indirizzo</label>
        <input type="text" class="form-control" id="indirizzo" ng-model="aff.indirizzo" maxlength="200">
    </div>
</div>
<div class="row">
    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
        <label for="localita">Localit&agrave;</label>
        <input type="text" class="form-control" id="localita" ng-model="aff.localita" maxlength="80">
    </div>
    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
        <label for="provincia">Provincia</label>
        <input type="text" class="form-control" id="provincia" ng-model="aff.provincia" maxlength="2">
    </div>
    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
        <label for="cap">CAP</label>
        <input type="text" class="form-control" id="cap" ng-model="aff.cap" maxlength="5">
    </div>
</div>
<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">           
        <label for="geolocation">Indirizzo mappa</label>
        <textarea class="form-control" id="geolocation" rows="4" ng-model="aff.geolocation"  maxlength="1000">
        </textarea>
    </div>
</div>
<div class="row">
    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="nomeReferente">Nome Referente</label>
        <input type="text" class="form-control" id="nomeReferente" ng-model="aff.referenteNome"  maxlength="100">
    </div>

    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="telReferente">Telefono Referente</label>
        <input type="text" class="form-control" id="telReferente" ng-model="aff.referenteTel"  maxlength="80">
    </div>
</div>
<div class="row">
    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="sitoWeb">Sito Web</label>
        <input type="text" class="form-control" id="sitoWeb" ng-model="aff.sitoWeb" maxlength="100">
    </div>

    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="mailContatto">Mail</label>
        <input type="email" class="form-control" id="mailContatto" ng-model="aff.mailContatto" maxlength="100">
    </div>
</div>
<div class="row">
    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="emailUserName">Username (e-mail)</label>
        <input type="email" class="form-control" id="emailUserName" ng-model="aff.mailUserName" maxlength="100">
    </div>

    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label for="password">Password</label>
        <input type="text" class="form-control" id="password" ng-model="aff.password" maxlength="40">
    </div>
</div>
<div class="row">
    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <h4>Scegli la categoria dell'affiliato</h4>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
            <div class="frm-scelta caption">
                <label>
                    <input type="radio" name="categoria" ng-model="aff.affiliatoCategoria" value="BRONZE" />
                    Bronze
                </label>
            </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
            <div class="frm-scelta caption">
                <label>
                    <input type="radio" name="categoria" ng-model="aff.affiliatoCategoria" value="SILVER" />
                    Silver
                </label>
            </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
            <div class="frm-scelta caption">
                <label>
                    <input type="radio" name="categoria" ng-model="aff.affiliatoCategoria" value="GOLD" />
                    Gold
                </label>
            </div>
        </div>
    </div>    
</div>
<div class="row">
    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <label> Affiliato verificato
            <input type="checkbox" ng-model="aff.affiliatoVerificato">
        </label>
    </div>
</div>


