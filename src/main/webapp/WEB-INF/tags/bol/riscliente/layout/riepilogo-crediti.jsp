<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisClienteController" %>
<div class="border-div">
    <h2> Riepilogo Crediti</h2>

    <table class="table">
        <thead>
            <tr>
                <td>
                    <b>Tipo credito</b>
                </td>
                <td>
                    <b>Saldo disponibile</b>
                </td>
                <td>
                    <b>Da maturare</b>
                </td>
                <td>
                    <b>Scadenza</b>
                </td>
                <td>
                    <b>Gestisci</b>
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="row">
                    <h4>Prenotazione aule</h4>
                </td>
                <td class="row" align="right">
                    <h4>{{riepilogoCreditiAule.disponibili}} <small>crediti</small></h4>
                </td>
                <td class="row" align="right">
                    <h4>{{riepilogoCreditiAule.daMaturare}} <small>crediti</small></h4>
                </td>
                <td class="row" align="right">
                    <h4><small>{{riepilogoCreditiAule.scadenza}}</small></h4>
                </td>
                <td>
                    <a href="<c:url value='<%= HomeController.RQ_ABBONAMENTI%>'/>">Acquista</a>
                    <div class="divider-buttons"></div>
                    <a href="<c:url value='<%= RisClienteController.RQ_CREDITI_MATURANDI %>'/>">Dettaglio Maturandi</a>
                </td>
            </tr>
            <tr>
                <td class="row" style="vertical-align: middle !important;">
                    <h4 class="col-xs-7 col-sm-7 col-md-7 col-lg-7" style="padding-left: 0px;">Fotocopie</h4>
                </td>
            <tr>
                <td>    
                    <h4>A4 B/N</h4>
                </td>
                <td>
                    <h4>{{riepilogoCreditiFotocopie.fcA4bn}} <small>fotocopie</small></h4>
                </td>
                <td>
        <center><h4>-</h4></center>
        </td>

        <td>
            <h4><small>31/12/2016</small></h4>
        </td>
        <td>
            <a href="<c:url value='<%= RisClienteController.RQ_MI_ACQUISTA_FOTOCOPIE%>'/>">Acquista</a>
        </td>
        </tr>
        <tr>
            <td>    
                <h4>A4 Colore</h4>
            </td>
            <td>
                <h4>{{riepilogoCreditiFotocopie.fcA4colore}} <small>fotocopie</small></h4>
            </td>
            <td>
        <center><h4>-</h4></center>
        </td>

        <td>
            <h4><small>31/12/2016</small></h4>
        </td>
        <td>
            <a href="<c:url value='<%= RisClienteController.RQ_MI_ACQUISTA_FOTOCOPIE%>'/>">Acquista</a>
        </td>
        </tr>
        <tr>
            <td>    
                <h4>A3 B/N</h4> 
            </td>
            <td>
                <h4>{{riepilogoCreditiFotocopie.fcA3bn}} <small>fotocopie</small></h4>
            </td>
            <td>
        <center><h4>-</h4></center>
        </td>

        <td>
            <h4><small>31/12/2016</small></h4>
        </td>
        <td>
            <a href="<c:url value='<%= RisClienteController.RQ_MI_ACQUISTA_FOTOCOPIE%>'/>">Acquista</a>
        </td>
        </tr>
        <tr>
            <td>    
                <h4>A3 Colore</h4>  
            </td>
            <td>
                <h4>{{riepilogoCreditiFotocopie.fcA3colore}} <small>fotocopie</small></h4>
            </td>
            <td>
        <center><h4>-</h4></center>
        </td>

        <td>
            <h4><small>31/12/2016</small></h4>
        </td>
        <td>
            <a href="<c:url value='<%= RisClienteController.RQ_MI_ACQUISTA_FOTOCOPIE%>'/>">Acquista</a>
        </td>
        </tr>
        </td>
        </tr>
        <tr>
            <td>
                <h4>Prenotazione sale riunione</h4>
            </td>
            <td align="right">
                <h4>{{riepilogoCreditiSale.disponibili}} <small>ore</small></h4>
            </td>
            <td>
        <center><h4>-</h4></center>
        </td>
        <td>
            <h4><small>31/12/2016</small></h4>
        </td>
        <td>
            <a href="#">Prenota sala</a>
        </td>

        </tr>
        </tbody>
    </table>
</div>
