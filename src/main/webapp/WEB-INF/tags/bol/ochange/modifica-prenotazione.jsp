
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url value="/" var="root"/>
<!DOCTYPE html>
<div class="modal fade" id="modifica-prenotazione" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="dialog">
            
    <div class="modal-content" id="modifica-prenotazione">             
        <div class="modal-body">
            <div class="row">
                <div class="row">
                    <h3>Modifica ordine numero 6789 del 1/3/2016</h3>
                   <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <h3>Martedì 29.3.2016 - 14:00 - 18:00</h3>
                        <h4>Aula n.2 - Roma - Viale Egeo - EUR</h4>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                       <h4>Prezzo Attuale: 200€</h4>
                       <h4>Nuovo Prezzo: 250€</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <h4>Modifica Configurazione / Servizi</h4>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <select class="selectpicker">
                          <option value="">Aula Informatica</option>
                          <option value="">Aula Informatica</option>
                          <option value="">Aula Informatica</option>
                        </select>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <select class="selectpicker">
                          <option value="">Servizi Aggiuntivi</option>
                          <option value="">Servizi Aggiuntivi</option>
                          <option value="">Servizi Aggiuntivi</option>
                        </select>
                    </div>
                </div>
                
                <div class="row">
                <table class="table-bordered">
                <caption><h4>Modifica data / fascia oraria</h4></caption>
                <thead>
                    <th></th>
                    <th>lun 28/3</th>
                    <th>mar 29/3</th>
                    <th>mer 30/3</th>
                    <th>giov 31/3</th>
                    <th>ven 1/4</th>
                    <th>sab 2/4</th>
                    <th>dom 3/4</th>                
                </thead>
                <tbody>
                    <tr>
                        <td>9:00 - 13:00</td>
                        <td class="delta-prezzi"><h5>+50 €</h5></td>
                        <td class="delta-prezzi"><h5>+50 €</h5></td>
                        <td class="delta-prezzi"><h5>-50 €</h5></td>
                        <td class="no-prezzo"><h5>-</h5></td>
                        <td class="no-prezzo"><h5>-</h5></td>
                        <td class="no-prezzo"><h5>-</h5></td>
                        <td class="no-prezzo"><h5>-</h5></td>
                    </tr>
                    <tr>
                        <td>9:00 - 13:00</td>
                        <td class="no-prezzo"><h5>-</h5></td>
                        <td class="tuo-prenot"><span class="glyphicon glyphicon-flag"></span><h5>la tua<br>prenotazione</h5></td>
                        <td class="nuova-sel"><div class="glyphicon glyphicon-flag"></div><h5>+50 €</h5></td>
                        <td class="no-prezzo"><h5>-</h5></td>
                        <td class="no-prezzo"><h5>-</h5></td>
                        <td class="no-prezzo"><h5>-</h5></td>
                        <td class="no-prezzo"><h5>-</h5></td>
                    </tr>

                </tbody>
                </table>
                 <nav>
                  <ul class="pagination pagination-sm">
                    <li class="page-item ">
                      <a class="page-link" href="#" aria-label="Previous">
                        << settimana precedente
                      </a>
                    </li>

                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">settimana successiva >></a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="#">seleziona settimana</a>
                    </li>
                  </ul>
                </nav>
            </div>
                
            <div class="row">
                <div class="col-xs-12 col-sm-7 col-md-6 col-lg-4">
                    <span class="col-xs-6 col-sm-6 col-md-6 col-lg-6"><button class="btn btn-default btn-lg">Indietro</button></span>
                    <span class="col-xs-6 col-sm-6 col-md-6 col-lg-6"><button class="btn btn-default btn-lg">Conferma</button> </span>
                    
                </div>

            </div>

                                 
            </div>     
        </div>
    </div>
</div>
</div>

