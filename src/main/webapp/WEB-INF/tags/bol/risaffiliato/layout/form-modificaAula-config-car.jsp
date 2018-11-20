<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row">
    <div class ="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        <h5><b>Configurazioni disponibili</b></h5>
        <div class="box-border row">
            <div class="one-servis col-xs-12 col-sm-12 col-md-12 col-lg-12" ng-repeat="cfg in configurazioni" >
                <div class="checkbox col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <label class="checkbox-inline">
                        <input type="checkbox" ng-model="cfg.selected"> {{cfg.nomeConfigurazione}}
                    </label>
                </div>

                <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-4 col-md-push-1 col-lg-push-2"> 
                    <label for="prezzo" >Diff. Prezzo</label>
                    <input type="text" ng-model="cfg.deltaPrezzo">
                </div>
            </div> 
        </div> 
    </div>
    <div class ="form col-xs-3 col-sm-3 col-md-3 col-lg-3" role="form" id="modal-frm-caratt-principali">
        <h5><b>Caratteristiche principali</b></h5>
        <div class="box-border row">
            <div ng-repeat="pri in carPrincipali">
                <label class="checkbox-inline">
                    <input type="checkbox" ng-model="pri.selected"> {{pri.caratteristicaAula.nome}}
                </label>
            </div> 
        </div>
    </div>
    <div class ="form col-xs-3 col-sm-3 col-md-3 col-lg-3" role="form" id="modal-frm-caratt-sec">
        <h5><b>Caratteristiche secondarie</b></h5>
        <div class="box-border row">
            <div ng-repeat="sec in carSecondarie">
                <label class="checkbox-inline">
                    <input type="checkbox" ng-model="sec.selected"> {{sec.caratteristicaAula.nome}}
                </label>
            </div>
        </div>
    </div>
</div>  

