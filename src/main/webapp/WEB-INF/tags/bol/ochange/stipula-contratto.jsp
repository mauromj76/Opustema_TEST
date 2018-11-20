

<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<div class="modal fade" id="stipulaContratto" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="dialog">
            
    <div class="modal-content" id="stipulaContratto">             
        <div class="modal-body">
            <div class="row"> 
                                 
                <button class="btn btn-default btn-sm glyphicon glyphicon-remove-sign close" data-dismiss="modal"></button>
                <div class="box-border">
                    <h3>Stampa e firma il contratto</h3>
                    <br>
                    <h5>
                     Per iniziare ad utilizzare i tuoi crediti è necessario 
                     scaricare il contratto di fornitura e restituirlo
                     firmato in tutte le sue parti. Segui questi semplici passi:
                    </h5>
                    <br>
                    <ol>
                        <li>Scarica il contratto di fornitura in formato pdf cliccando <a href="#">qui</a> .</li>
                        <li>Stampa il contratto e firmalo in tutte le sue parti.</li>
                        <li>Inviaci il contratto firmato in una di queste modalità.
                            <ul>
                                <li><span><img class ="img-responsive" src='<c:url value="/web-resources/images/icone/email.png"/>'/></span></span>Via mail all'indirizzo contratti@prenotazioneaule.it</li>
                                <li><span class="glyphicon glyphicon-print"></span>Via fax al numero 06.12345678</li>
                                <li><span class="glyphicon glyphicon-envelope"></span>Via raccomandata all'indirizzo - Prenotazione Aule .IT Viale Egeo 100, 00144 Roma</li>
                            </ul>
                        </li>
                        
                    </ol>
                    
                </div>          
            </div>
        </div>
    </div>
    </div>
</div>