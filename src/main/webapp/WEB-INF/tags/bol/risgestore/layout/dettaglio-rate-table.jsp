<h1>Contratto numero {{contratto.numero}}</h1>
<table class="table">
    <thead>
    <td><b>Num. Rata</b></td>
    <td><b>Scadenza</b></td>
    <td><b>Fattura</b></td>
    <td><b>Stato Pagamento</b></td>
</thead>
<tbody>
    <tr ng-repeat="rata in rate">
        <td class="modal-table-data">
            <small>{{rata.scadenza| date : "dd/MM/yyyy"}}</small>
        </td>
        <td class="modal-table-data">
            <small>{{rata.numeroRata}}/{{rata.numeroComplessivoRate}}</small>
        </td>
        <td class="modal-table-data">
            <b>{{rata.importoEuro}} &euro;</b>
        </td>
        <td class="modal-table-data">
            <b>{{rata.creditiRata}}</b>
        </td>
        <td class="modal-table-data">
            <a href="#">Paga rata</a>
        </td>
    </tr>
</tbody>
</table>
<br>
<h2>Ordini in attesa di bonifico</h2>
<table class="table">
    <thead>
    <td><b>Data Ordine</b></td>
    <td><b>N. Ordine</b></td>
    <td><b>Importo</b></td>
    <td><b>Crediti</b></td>
</thead>
<tbody>
    <tr ng-repeat="ordine in ordini">
        <td class="modal-table-data">
            <small>{{ordine.data| date : "dd/MM/yyyy"}}</small>
        </td>
        <td class="modal-table-data">
            <small>{{ordine.id}}</small>
        </td>
        <td class="modal-table-data">
            <small>{{ordine.importoEuro}} &euro;</small>
        </td>
        <td class="modal-table-data">
            <b>{{ordine.importoCrediti}}</b>
        </td>
    </tr>
</tbody>
</table>

<script>
    app.controller('CreditiMaturandiController', function ($scope, $window, $http) {

        $scope.initPage = function () {
            var jsonData = JSON.parse('${jsonData}');
            $scope.rate = jsonData.rate;
            $scope.ordini = jsonData.ordiniDaPagare;
            $scope.contratto = jsonData.contratto;
        };

        $scope.initPage();
    });
</script>
