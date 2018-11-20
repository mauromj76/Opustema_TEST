<div class="border-div">
    <div class="row">
        <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
            <h2>Dati di fatturazione</h2>
        </div>
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" style="text-align: right;">
            <h2><a class="btn btn-default"href="<c:url value='<%= RisClienteController.RQ_MODIFICA_DATI_DI_FATTURAZIONE%>'/>">Modifica</a></h2>
        </div>
    </div>

    <br>
    <form class="form-horizontal table">
        <div class="form-group">
            <label for="RagioneSociale" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">Ragione Sociale *</label>
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                <input type="text" id="RagioneSociale" class="form-control" value="${CurrentUser.fatRagSoc}" style="width: 100% !important;" disabled>
            </div>
        </div>
        <div class="form-group">
            <label for="PartitaIVA" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">Partita IVA *</label>
            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                <input type="text" class="form-control" id="PartitaIVA" 
                       <c:if test="${CurrentUser.fatNonPIva==false}">
                           value=" ${CurrentUser.fatPIva}"
                       </c:if>
                       style="width: 100% !important;" disabled>
            </div>
            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                <label class="checkbox-inline">
                    <input type="checkbox" 
                           <c:if test="${CurrentUser.fatNonPIva==true}">
                               checked="true"
                           </c:if>
                           disabled> 
                    Società senza partita iva
                </label>
            </div>
        </div>
        <div class="form-group">
            <label for="CodiceFiscale" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">Codice Fiscale *</label>
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                <input type="text" id="CodiceFiscale" class="form-control" value=" ${CurrentUser.fatCodFis}"style="width: 100% !important;" disabled>
            </div>
        </div>
        <div class="form-group">
            <label for="Indirizzo" class="col-xs-2 col-sm-2 col-md-2 col-lg-2 control-label">Indirizzo *</label>
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                <input type="text" id="Indirizzo" class="form-control" value="${CurrentUser.fatIndirizzo}"style="width: 100% !important;" disabled>
            </div>
        </div>
        <div class="form-group">
            <label for="Localita" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                Localita *
            </label>
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-left: 0px;">
                    <input type="text" class="form-control" id="Localita" value="${CurrentUser.fatLocalita}" style="width: 100% !important;" disabled>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding:0px;">
                    <label for="CAP" class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="padding-left: 0px;">
                        CAP *
                    </label>
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" style="padding:0px;">
                        <input type="text" class="form-control" id="CAP" value="${CurrentUser.fatCAP}" style="width: 100% !important;" disabled>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="Referente" class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                Nome Referente
            </label>
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-left: 0px;">
                    <input type="text" class="form-control" id="Referente" value="${CurrentUser.fatReferente}" style="width: 100% !important;" disabled>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding:0px;">
                    <label for="Tel" class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="padding-left: 0px;">
                        Tel. *
                    </label>
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10" style="padding:0px;">
                        <input type="text" class="form-control" id="Tel" value="${CurrentUser.fatTelefono}" style="width: 100% !important;" disabled>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>