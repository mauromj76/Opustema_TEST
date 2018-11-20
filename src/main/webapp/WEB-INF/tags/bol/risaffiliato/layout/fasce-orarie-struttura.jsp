
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="it.logicadeisistemi.bol.hbol.controller.RisAffiliatoAjaxController"%>
<%@ page import="it.logicadeisistemi.bol.hbol.controller.RisAffiliatoController"%>
<div id="controller-container" ng-controller="GestioneFasceController" ng-cloak>

    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <h4>Aperture settimanali per fascia oraria</h4>
        </div>
    </div>
    <div class="row">
        <table class="table-bordered box-border col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <thead>
                <tr>
                    <th>
                        Fascia Oraria
                    </th>
                    <th>
                        Lun
                    </th>
                    <th>
                        Mar
                    </th>
                    <th>
                        Mer
                    </th>
                    <th>
                        Gio
                    </th>
                    <th>
                        Ven
                    </th>
                    <th>
                        Sab
                    </th>
                    <th>
                        Dom
                    </th>
                    <th>
                        Gestisci
                    </th>
                </tr>
            </thead>
            <c:url value="/" var="appCtx"/>
            <tr ng-repeat="fascia in listaFasce">
                <td>{{fascia.fasciaOraria.fasciaStringa}}</td>
                <td>
                    <span editable-checkbox="fascia.foads.lunedi" e-name="lunedi" e-form="fasciaForm">
                        {{fascia.foads.lunedi && "Sì"|| "--"}}
                    </span>
                </td>
                <td>
                    <span editable-checkbox="fascia.foads.martedi" e-name="martedi" e-form="fasciaForm">
                        {{fascia.foads.martedi && "Sì"|| "--"}}
                    </span>
                </td>
                <td>
                    <span editable-checkbox="fascia.foads.mercoledi" e-name="mercoledi" e-form="fasciaForm">
                        {{fascia.foads.mercoledi && "Sì"|| "--"}}
                    </span>
                </td>
                <td>
                    <span editable-checkbox="fascia.foads.giovedi" e-name="giovedi" e-form="fasciaForm">
                        {{fascia.foads.giovedi && "Sì"|| "--"}}
                    </span>
                </td>
                <td>
                    <span editable-checkbox="fascia.foads.venerdi" e-name="venerdi" e-form="fasciaForm">
                        {{fascia.foads.venerdi && "Sì"|| "--"}}
                    </span>
                </td>
                <td>
                    <span editable-checkbox="fascia.foads.sabato" e-name="sabato" e-form="fasciaForm">
                        {{fascia.foads.sabato && "Sì"|| "--"}}
                    </span>
                </td>
                <td>
                    <span editable-checkbox="fascia.foads.domenica" e-name="domenica" e-form="fasciaForm">
                        {{fascia.foads.domenica && "Sì"|| "--"}}
                    </span>
                </td>
                <td>
                    <form editable-form name="fasciaForm" class="form-buttons form-inline" 
                          ng-show="fasciaForm.$visible" onbeforesave="saveFasciaAmmessa(fascia)"
                          shown="inserted == fascia.foads.lunedi">
                        <button type="submit" ng-disabled="fasciaForm.$waiting" class="btn btn-primary" title="Salva le modifiche">
                            Salva
                        </button>
                        <button type="button" ng-disabled="fasciaForm.$waiting"
                                ng-click="fasciaForm.$cancel()" class="btn btn-default" title="Annulla le modifiche">
                            Annulla
                        </button>
                    </form>
                    <div class="buttons" ng-show="!fasciaForm.$visible">
                        <button class="btn btn-primary" ng-click="fasciaForm.$show()" title="Modifica">
                            <span class="glyphicon glyphicon-edit"></span>
                        </button>
                    </div> 
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script>
    app.controller('GestioneFasceController', function ($scope, $http) {
        $scope.saveFasciaAmmessa = function (fascia) {
            // CSRF prevention
            var csrfToken = $("meta[name='_csrf']").attr("content");
            var csrfHeader = $("meta[name='_csrf_header']").attr("content");

//data to be requested
            var data = fascia;
            // request 
            var req = '<c:url value="<%= RisAffiliatoAjaxController.AX_UPDATE_FASCIA_AMMESSA%>"/>';
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
                        console.log(JSON.stringify(response.data));
                        fascia = response.data;
                    },
                            function (response) {
                                // optional in case of failure
                                window.alert('Errore!');
                            });
        };
        
    });
</script>