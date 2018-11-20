
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.FotocopieController"%>
<%@page import="it.logicadeisistemi.bol.hbol.model.PacchettoFotocopie"%>

<h2 class="modal-title">Acquisto Fotocopie</h2>
<br>
<br>
<div class="row" >
    <h4>Seleziona il tipo di fotocopia</h4>
</div>
<br>
<div ng-controller="AcqFotocopieCtrl" ng-cloak>
    <div class="row">
        <div ng-repeat="tipo in tipologie">
            <label class="col-xs-2 col-sm-2 col-md-2 col-lg-2" >
                <div class="row border-div" style="text-align: center;background-color:#30437b">
                    <input type="radio" name="formato" ng-model="$parent.tipoSelected" ng-value="tipo">
                </div>
                <div class="row border-div" style="text-align: center;">
                    <h4>{{tipo.formato}}</h4>
                    <small>{{tipo.stampa}}</small>
                </div>
            </label>
            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
        </div>
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
            <button type="button" class="btn btn-primary btn-lg" ng-click="avanti()">Avanti</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    app.controller('AcqFotocopieCtrl', function ($scope, $http) {
        $scope.init = function () {
            $scope.tipologie = [
                {formato: "<%=PacchettoFotocopie.FORMATO_A4%>", stampa: "<%=PacchettoFotocopie.STAMPA_COL%>"},
                {formato: "<%=PacchettoFotocopie.FORMATO_A4%>", stampa: "<%=PacchettoFotocopie.STAMPA_BN%>"},
                {formato: "<%=PacchettoFotocopie.FORMATO_A3%>", stampa: "<%=PacchettoFotocopie.STAMPA_COL%>"},
                {formato: "<%=PacchettoFotocopie.FORMATO_A3%>", stampa: "<%=PacchettoFotocopie.STAMPA_BN%>"}
            ];
            $scope.tipoSelected = $scope.tipologie[0];
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




