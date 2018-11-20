
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisGestoreAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div ng-controller="SysParController">
    <div class="row box-border" style="margin-right: 10px; padding-left: 20px;">
        <div class="row">
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <h2>Parametri prenotazioni</h2>
            </div>
        </div>
        <div class="row table-min-height-258">
            <c:url value="<%=RisGestoreController.RQ_MI_PARAMETRI_SISTEMA%>" var="formActionUrl"/>
            <form:form method="POST" modelAttribute="sysPar" role="form" action="${formActionUrl}">
                <table class="table gestione">
                    <thead>
                        <tr>
                            <th>
                                Nome Parametro
                            </th>
                            <th>
                                Valore
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                Numero minimo giorni anticipo prenotazione
                            </td>
                            <td>
                                <form:input path="minimumAdvanceDays" type="numeric" required="required" maxlength="3"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Numero massimo di giorni di anticipo su una prenotazione (oltre non è possibile prenotare)
                            </td>
                            <td>
                                <form:input path="maximumAdvanceDays" type="numeric" required="required" maxlength="4"/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Numero minimo giorni last minute
                            </td>
                            <td>
                                <form:input path="lastMinuteMinimumDays" type="numeric" required="required" maxlength="3"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Numero massimo di giorni perchè una prenotazione possa rientrare nelle offerte last minute
                            </td>
                            <td>
                                <form:input path="lastMinuteMaximumDays" type="numeric" required="required" maxlength="3"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Numero minimo di giorni per cercare una prenotazione "anticipata" 
                                (usato dall'algoritmo di calcolo delle offerte)
                            </td>
                            <td>
                                <form:input path="earlyBookingMinimumDays" type="numeric" required="required" maxlength="4"/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                Numero minimo giorni anticipo per cancellare o modificare una prenotazione
                                (al di sotto non è possibile modificare o cancellare)
                            </td>
                            <td>
                                <form:input path="cancelBookingMinimumDays" type="numeric" required="required" maxlength="3"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Giorni durata crediti aule dall'ultima ricarica
                            </td>
                            <td>
                                <form:input path="giorniScadenzaCrAule" type="numeric" required="required" maxlength="3"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Giorni durata crediti fotocopie dall'ultima ricarica
                            </td>
                            <td>
                                <form:input path="giorniScadenzaCrFotocopie" type="numeric" required="required" maxlength="3"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Giorni durata crediti sale dall'ultima ricarica
                            </td>
                            <td>
                                <form:input path="giorniScadenzaCrSale" type="numeric" required="required" maxlength="3"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Fattore di conversione Euro / Crediti (1 Credito = ? EUR)
                            </td>
                            <td>
                                <form:input path="creditsConversionFactor" type="numeric" required="required" maxlength="3"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Sconto per il calcolo del prezzo in Crediti di un'aula
                            </td>
                            <td>
                                <form:input path="creditsDiscount" type="numeric" required="required" maxlength="3"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Numero di ore di una giornata didattica (usato per il calcolo dello sconto per quantità)
                            </td>
                            <td>
                                <form:input path="oreGiornata" type="numeric" required="required" maxlength="2"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Server SMTP per l'invio di mail
                            </td>
                            <td>
                                <form:input path="mailSMTP" type="text" required="required" maxlength="100"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Porta SMTP per l'invio di mail
                            </td>
                            <td>
                                <form:input path="smtpPort" type="text" required="required" maxlength="6"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Autenticazione SMTP abilitata per l'invio di mail
                            </td>
                            <td>
                                <form:checkbox path="smtpAuth" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                STARTTLS abilitato per l'invio di mail
                            </td>
                            <td>
                                <form:checkbox path="smtpStarttlsEnable" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Server SMTPS per l'invio di mail
                            </td>
                            <td>
                                <form:input path="smtpsHost" type="text" required="required" maxlength="100"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Autenticazione SMTPS abilitata per l'invio di mail
                            </td>
                            <td>
                                <form:checkbox path="smtpsAuth"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mail per l'invio di comunicazioni NoReply
                            </td>
                            <td>
                                <form:input path="noReplyMail" type="text" required="required" maxlength="100"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Nome utente e-mail NoReply
                            </td>
                            <td>
                                <form:input path="noReplyUser" type="text" required="required" maxlength="100"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Password per utente e-mail NoReply
                            </td>
                            <td>
                                <form:input path="noReplyPassword" type="text" required="required" maxlength="32"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Descrizione del mittente e-mail NoReply
                            </td>
                            <td>
                                <form:input path="noReplyDescription" type="text" required="required" maxlength="100"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Indirzzo mail per la ricezione dei contratti
                            </td>
                            <td>
                                <form:input path="contractEmail" type="text" required="required" maxlength="100"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Numero fax per la ricezione dei contratti
                            </td>
                            <td>
                                <form:input path="contractFax" type="text" required="required" maxlength="100"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Indirizzo postale per la ricezione dei contratti
                            </td>
                            <td>
                                <form:input path="contractAddress" type="text" required="required" maxlength="100"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button class="btn btn-primary btn-lg" type="submit" >Salva</button>
                <c:url value="<%=RisGestoreController.RQ_MI_RIEPILOGO%>" var="riepilogoUrl"/>
                <a href="${riepilogoUrl}"><button type="button" class="btn btn-secondary btn-lg">Annulla</button></a>
            </form:form>
        </div>
    </div>
</div>