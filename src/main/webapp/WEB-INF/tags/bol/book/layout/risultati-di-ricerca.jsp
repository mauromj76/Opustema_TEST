<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="it.logicadeisistemi.bol.app.dto.GiornoRicercaClassiDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.SecurityAjaxController"%>

<div class="modal fade " role="dialog" id="risultati-di-ricerca">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h2 id="scegli-nome-aula-data" class="modal-title">Aula n.2 - martedì 29/3/2016</h2>
                <h3 id="scegli-indirizzo-aula" class="modal-title" style="color:gray">Roma - Viale Egeo - EUR</h3>
            </div>
            <div class="modal-body">
                <table id="table-fascia-scelta" class="table">
                    <thead>
                        <tr>
                            <td>
                                Fascia oraria
                            </td>
                            <td>
                                Configurazione
                            </td>
                            <td>
                                Servizi aggiuntivi
                            </td>
                            <td>
                                Prezzo
                            </td>
                            <td>

                            </td>
                        </tr>
                    </thead>
                    <tr>
                        <td style="text-align: center;">
                            <p id="fascia-scelta" style="color:gray;">
                                09:00 - 13:00
                            </p>
                        </td>
                        <td class="form-inline">
                            <select id="select-configurazioni" class="form-control">
                                <option>Aula Informatica</option>
                            </select>
                            <span class="badge" data-toggle="tooltip" data-placement="right"  
                                  title="help">?</span>
                        </td>
                        <td class="form-inline">
                            <select id="select-servizi" class="form-control">
                                <option>Coffe break - Virtual Machine</option>
                            </select>
                            <span class="badge" data-toggle="tooltip" data-placement="right"  
                                  title="help">?</span>
                        </td>
                        <td class="center">
                            <p>
                            <h4>200 &euro;</h4>
                            </p>
                            <p id="prezzo-riga">
                                <small>(110 crediti)</small>
                            </p>
                        </td>
                        <td style="border:0px none">
                            <a href="#">
                                <style>
                                    .glyphicon-shopping-cart:before {
                                        content: "\e116";
                                    }
                                </style>
                                <span class="glyphicon glyphicon-shopping-cart"></span>
                            </a>
                        </td>
                    </tr>
                </table>
                <br>
                <h4 id="potrebbero-interessarti">Potrebbero interessarti anche:</h4>
                <table id="fascia-altre" class="table">
                    <thead>
                        <tr>
                            <td>
                                Fascia oraria
                            </td>
                            <td>
                                Configurazione
                            </td>
                            <td>
                                Servizi aggiuntivi
                            </td>
                            <td>
                                Prezzo
                            </td>
                        </tr>
                    </thead>
                    <tbody id="altre-fasce-tbody">
                        <tr>
                            <td style="text-align: center;">
                                <h4 style="color:gray;">
                                    09:00 - 13:00
                                </h4>
                            </td>
                            <td class="form-inline">
                                <select class="form-control">
                                    <option>Aula Informatica</option>
                                </select>
                                <span class="badge" data-toggle="tooltip" data-placement="right"  
                                      title="help">?</span>
                            </td>
                            <td class="form-inline">
                                <select class="form-control">
                                    <option>Coffe break - Virtual Machine</option>
                                </select>
                                <span class="badge" data-toggle="tooltip" data-placement="right"  
                                      title="help">?</span>
                            </td>
                            <td class="center">
                                <h4>200 &euro;</h4>
                                <p>
                                    <small>(110 crediti)</small>
                                </p>
                            </td>
                            <td style="border:0px none">
                                <a href="#">
                                    <span class="glyphicon glyphicon-shopping-cart"></span>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div><!-- /.modal -->
