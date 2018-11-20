

<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<div class="modal fade" id="sel-prenot-modifica" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="dialog">
            
    <div class="modal-content" id="sel-prenot-modifica">             
        <div class="modal-body">
            <div class="row"> 
                
                    <h3>Modifica ordine numero 6789 del 1/3/2016</h3>                    
                    <h4>Seleziona la prenotazione da modificare</h4>
                    <table class="table-bordered" id="tb-prenot-modifica">
                        <thead>
                        <th class="col-xs-5 col-sm-5 col-md-5 col-lg-5">Data e luogo</th>
                        <th class="col-xs-1 col-sm-1 col-md-1 col-lg-1">Partecipanti</th>
                        <th class="col-xs-3 col-sm-3 col-md-3 col-lg-3">Configurazione</th>
                        <th class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Prezzo</th>
                        <th class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></th>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                    <h4>Lunedì 28.3.2016 - 14:00 - 18:00</h4>
                                    <h5>Aula n.2 - Roma - Viale Egeo - EUR</h5>
                                </td>
                                <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                    <h4>max 10</h4>
                                   
                                </td>
                                <td class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <h4>Aula Informatica</h4>
                                    <h4>Nessun servizio aggiuntivo</h4>
 
                                </td>
                                <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2 prezzo">
                                    <h4>180 €</h4>
                                    <h5>(90 crediti)</h5>
                                </td>
                                <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                    <a href="#" class="glyphicon glyphicon-pencil"></a>
                                    
                                </td>
                            </tr>
                            <!-- row added for each element -->
                            <tr>
                                <td class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                    <h4>Lunedì 28.3.2016 - 14:00 - 18:00</h4>
                                    <h5>Aula n.2 - Roma - Viale Egeo - EUR</h5>
                                </td>
                                <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                    <h4>max 10</h4>
                                   
                                </td>
                                <td class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <h4>Aula Informatica</h4>
                                    <h4>Nessun servizio aggiuntivo</h4>
 
                                </td>
                                <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2 prezzo">
                                    <h4>180 €</h4>
                                    <h5>(90 crediti)</h5>
                                </td>
                                <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                    <a href="#" class="glyphicon glyphicon-pencil"></a>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                    <h4>Lunedì 28.3.2016 - 14:00 - 18:00</h4>
                                    <h5>Aula n.2 - Roma - Viale Egeo - EUR</h5>
                                </td>
                                <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                    <h4>max 10</h4>
                                   
                                </td>
                                <td class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <h4>Aula Informatica</h4>
                                    <h4>Nessun servizio aggiuntivo</h4>
 
                                </td>
                                <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2 prezzo">
                                    <h4>180 €</h4>
                                    <h5>(90 crediti)</h5>
                                </td>
                                <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                    <h5>non<br>modicabile</h5>
                                </td>
                            </tr>
                            <tr>
                                <td class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                                    <h4>Lunedì 28.3.2016 - 14:00 - 18:00</h4>
                                    <h5>Aula n.2 - Roma - Viale Egeo - EUR</h5>
                                </td>
                                <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                    <h4>max 10</h4>
                                   
                                </td>
                                <td class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <h4>Aula Informatica</h4>
                                    <h4>Nessun servizio aggiuntivo</h4>
 
                                </td>
                                <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2 prezzo">
                                    <h4>180 €</h4>
                                    <h5>(90 crediti)</h5>
                                </td>
                                <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                    <a href="#" class="glyphicon glyphicon-pencil"></a>
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table> 
                    
                    <button class="btn btn-default btn-md" data-dismiss="modal">Annulla</button>
                   
            </div>
        </div>
    </div>
    </div>
</div>