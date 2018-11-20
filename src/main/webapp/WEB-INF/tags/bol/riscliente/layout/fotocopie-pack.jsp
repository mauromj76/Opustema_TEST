
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.FotocopieController"%>
<%@page import="it.logicadeisistemi.bol.hbol.model.PacchettoFotocopie"%>

<h2 class="modal-title">Acquisto Fotocopie</h2>
<br>
<br>
<div ng-controller="AcqFotocopieCtrl" ng-cloak>
    <div class="row" >
        <h4>Seleziona il pacchetto di fotocopie <b>{{listaPacchetti.tipo.formato}} {{listaPacchetti.tipo.stampa}}</b></h4>
    </div>

    <div class="row">
        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" ng-repeat="pack in listaPacchetti.lista">
            <div class="row border-div" style="background-color:#30437b; color:white;">
                <div class="col-xs-4">
                    <input type="radio"> 
                </div>
                <div class="col-xs-8" style="padding-left: 0px;">

                    200 fotocopie
                </div>
            </div>
            <div class="row border-div" style="text-align: center;">
                <h3>10 &euro;</h3>
                <small>(6 crediti)</small>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
        </div>
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
            <button type="button" class="btn btn-secondary btn-lg" ng-click="indietro()">Indietro</button>
        </div>
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
            <button type="button" class="btn btn-primary btn-lg" ng-click="avanti()">Avanti</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    app.controller('AcqFotocopieCtrl', function ($scope, $http) {
        $scope.init = function () {
            var jsonData = JSON.parse('${jsonData}');
            $scope.listaPacchetti = jsonData;
        };

        $scope.avanti = function () {
            //data to be requested
            var data = $scope.tipoSelected;

            var form = document.createElement("form");

            form.action = '<c:url value="<%= FotocopieController.RQ_SELECT_PACCHETTI_FOTOCOPIE%>"/>';
            form.method = "POST"

            input = document.createElement("input");
            input.type = "text";
            input.name = "formato";
            input.value = data.formato;
            form.appendChild(input);

            input = document.createElement("input");
            input.type = "text";
            input.name = "stampa";
            input.value = data.stampa;
            form.appendChild(input);

            input = document.createElement("input");
            input.type = "hidden";
            input.name = "${_csrf.parameterName}";
            input.value = "${_csrf.token}";
            form.appendChild(input);

            document.body.appendChild(form);
            form.submit();
        };
        $scope.init();
    });
</script>
