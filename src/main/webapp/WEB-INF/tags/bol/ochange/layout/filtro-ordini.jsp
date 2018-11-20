
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
    <div class="box-border filt-ordini">
        <div class="row">
        <h4>Filtro Ordini</h4>
        <h5>Filtra per Periodo</h5>
            <span class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <label for="from-date">da</label>
                <input type="text" class="form-control filter-start-period glyphicon glyphicon-chevron-down" id="ochange-filter-period-from" name="pick-date-from" placeholder="01/01/2016">
                <script type="text/javascript">

                    $('#ochange-filter-period-from').datepicker({
                        dateFormat: 'dd-mm-yy',
                        startView:"days",
                        minViewMode: "days",
                        autoclose: "true",
                        language: "it"
                    });
                </script>
            </span>
            <span class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <label for="from-date">a</label>
                <input type="text" class="form-control filter-end-period" id="ochange-filter-period-end" name="pick-date-end" placeholder="31/12/2016">
                <script type="text/javascript">

                    $('#ochange-filter-period-end').datepicker({
                        dateFormat: 'dd-mm-yy',
                        startView:"days",
                        minViewMode: "days",
                        autoclose: "true",
                        language: "it"
                    });
                </script>
            </span>
        </div>
         
        <div class="row">
            <h5>Filtra per tipo</h5>
            <form role="form">
                <label class="checkbox-inline">
                  <input type="checkbox" value="">Prenotazione Aule
                </label>
                <br>
                <label class="checkbox-inline">
                    <input type="checkbox" value="">Acquisto Crediti
                </label>
                <br>
                <label class="checkbox-inline">
                  <input type="checkbox" value="">Acquisto pacchetto copie
                </label>
            </form>
            <button class="btn btn-default btn-sm">Cancella filtri</button>
        </div>
    </div>
 </div>
