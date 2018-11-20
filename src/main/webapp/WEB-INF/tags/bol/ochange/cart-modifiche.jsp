

<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<div class="modal fade" id="cart-modifiche" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="dialog">
            
    <div class="modal-content" id="cart-modifiche">             
        <div class="modal-body">
            <div class="row">
                <h3> Il tuo carrello</h3>
                
                <h3>Modifica ordine numero 6789 del 1/3/2016</h3>                    
                    <h4>Prenotazioni annullate</h4>
                    <table class="table-bordered" id="tb-prenot-anulate">
                        <thead>
                        <th class="col-xs-3 col-sm-3 col-md-3 col-lg-3">Data e luogo</th>
                        <th class="col-xs-1 col-sm-1 col-md-1 col-lg-1">Partecipanti</th>
                        <th class="col-xs-3 col-sm-3 col-md-3 col-lg-3">Configurazione</th>
                        <th class="col-xs-3 col-sm-3 col-md-3 col-lg-3">Servizi aggiuntivi</th>
                        <th class="col-xs-1 col-sm-1 col-md-1 col-lg-1">Prezzo</th>                        
                        <th class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></th>
                        
                        </thead>
                        <tbody>
                            <tr>
                                <td class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <h4>Giovedì 31.3.2016 - 14:00 - 18:00</h4>
                                    <h5>Aula n.2 - Roma - Viale Egeo - EUR</h5>
                                </td>
                                <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                    <h4>max 10</h4>
                                   
                                </td>
                                <td class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <h4>Aula Informatica</h4> 
                                </td>
                                <td class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <h4>Nessun servizio aggiuntivo</h4> 
                                </td>
                                <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1 prezzo">
                                    <h4>-200 €</h4>
                                </td>
                                <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                    <button class="btn btn-default btn-sm glyphicon glyphicon-remove-sign"></button>
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table>
            </div>
            <div class="row">
                <h4>Prenotazioni modificate</h4>
                    <table class="table-bordered" id="tb-prenot-modifica2">
                        <thead>
                        <th class="col-xs-3 col-sm-3 col-md-3 col-lg-3">Data e luogo</th>
                        <th class="col-xs-1 col-sm-1 col-md-1 col-lg-1">Partecipanti</th>
                        <th class="col-xs-3 col-sm-3 col-md-3 col-lg-3">Configurazione</th>
                        <th class="col-xs-3 col-sm-3 col-md-3 col-lg-3">Servizi aggiuntivi</th>
                        <th class="col-xs-1 col-sm-1 col-md-1 col-lg-1">Prezzo</th>                        
                        <th class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></th>
                        
                        </thead>
                        <tbody>
                            <tr>
                                <td class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <h4>Giovedì 28.3.2016 - 14:00 - 18:00</h4>
                                    <h5>Aula n.2 - Roma - Viale Egeo - EUR</h5>
                                </td>
                                <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                    <h4>max 10</h4>
                                   
                                </td>
                                <td class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    
                                    <select class="selectpicker col-xs-9 col-sm-9 col-md-9 col-lg-9">
                                        <option value="">Aula Informatica</option>
                                        <option value="">Aula Informatica</option>
                                        <option value="">Aula Informatica</option>
                                    </select>
                                                                      
                                    <button class="btn btn-default btn-sm glyphicon glyphicon-question-sign col-xs-3 col-sm-3 col-md-3 col-lg-3"></button>
                                </td>
                                <td class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <select class="selectpicker">
                                      <option value="">Caffè break - Virtual Mach</option>
                                      <option value="">Caffè break - Virtual Mach</option>
                                      <option value="">Caffè break - Virtual Mach</option>
                                    </select>
                                    <button class="btn btn-default btn-sm glyphicon glyphicon-question-sign col-xs-3 col-sm-3 col-md-3 col-lg-3"></button>
                                </td>
                                <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1 prezzo">
                                    <h4>20 €</h4>
                                </td>
                                <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                                    <button class="btn btn-default btn-sm glyphicon glyphicon-remove-sign"></button>
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table>
            </div>
            
                        <div class="row">
                 <span class="col-xs-6 col-sm-6 col-md-6 col-lg-6 box-border">
                    <h4>                  
                     spazio per testo informativo
                    </h4>
                 </span>
                <span class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
                        <h4>Totale:</h4>
                        <h4>Sconto:</h4>
                        <h3>Totale Scontato:</h3>
                    </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <h4>-180 €</h4>
                        <h4>0 €</h4>
                        <h3>-180 €</h3>                       
                        
                    </div>
                </span>
                <div>
                    <button class="btn btn-default btn-md">Vai alla Cassa</button>
                </div>
            </div>
           
        </div>
                
                
                

                                 
            </div>     
        </div>
    </div>
</div>
</div>