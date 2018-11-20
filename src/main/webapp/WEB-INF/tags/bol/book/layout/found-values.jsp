<%-- 
    Contiene i risultati della ricerca 
    (parte destra della schermata 3.1
--%>

<%@page import="it.logicadeisistemi.bol.hbol.controller.ImageAjaxController"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@page import="it.logicadeisistemi.bol.app.dto.GiornoRicercaClassiDto"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.BookingAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.CarrelloAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.BookingController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.CarrelloAuleController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="container-fluid">
    <div class="row">
        <%@include file="../../messages/top-content-messages.jsp" %>
    </div>
    <div class="row">
        <div class="row top-content-information">
            <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                <h4>${searchForm.nomeCitta} trovate ${numeroAuleDisponibili} aule</h4>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 text-right">
                <h5>Visualizza Prezzi:</h5>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <select id="euro-crediti-select" class="form-control" onchange="moneyChanged()">
                    <option value="EUR" <c:if test="${searchForm.moneyType == 'EUR'}"> selected </c:if>>in Euro</option>
                    <option value="CRE" <c:if test="${searchForm.moneyType == 'CRE'}"> selected </c:if>>in Crediti</option>
                    </select>
                    <script>
                        function moneyChanged() {
                            // updates money type field
                            var data = $("#euro-crediti-select").val();
                            $("#moneyType").val(data);

                            // repeat last search to update results page
                            $("#search-repeat-form").submit();
                        }
                    </script>
                </div>
                <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
            </div>  
        </div>
        <div class="row top-content-sort-advance">
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                <form> 
                    Ordina per: 
                    <input type="radio" name="order-type" checked> Rilevanza
                    <input type="radio" name="order-type"> Valutazione
                </form>
                <!--            // FIXME: FORM TO FORM SELECT: http://stackoverflow.com/questions/17218693/how-to-pass-data-from-formselect-spring-mvc -->
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2"></div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 top-content-advance-links">
                <div class="row">
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 weeek-navigation text-right">
                        <h5 class="bold">Cambia settimana:</h5> 
                    </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 weeek-navigation">
                        <a class="btn btn-default" role="button" onclick="weekControlClicked('prevWeek')"><< Precedente</a>
                    </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 weeek-navigation">
                        <a class="btn btn-default" role="button" onclick="weekControlClicked('nextWeek')">Successiva >></a>
                    </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 weeek-navigation">
                        <a id="bol-res-sel-settimana" class="btn btn-default" role="button">Seleziona</a>
                        <script type="text/javascript">
                            $(document).ready(function () {
                                var curDate = new Date();
                                $('#bol-res-sel-settimana').datepicker({
                                    format: "mm-yyyy",
                                    startView: "days",
                                    minViewMode: "days",
                                    autoclose: "true",
                                    language: "it",
                                    startDate: curDate
                                });
                                $('#bol-res-sel-settimana').datepicker().on('changeDate', function (ev) {
                                    weekChanged(ev);
                                });
                            });
                        </script>
                    </div>
                </div>

            </div>
        </div>
        <script>
            function weekChanged(ev) {
                // gets the chosen date
                var data = ev.date;
                var sdata = data.getFullYear() + "-" + (data.getMonth() + 1) + "-" + data.getDate();
                $("#exactDate").val(sdata);

                // sets the search mode exact date
                $("#searchType").val('exactDate');

                // repeat last search to update results page
                $("#search-repeat-form").submit();
            }

            function weekControlClicked(command) {
                //            window.alert("weekControlClicked " + command);
                // sets that it is a week command 
                $("#searchType").val(command);

                // repeat last search to update results page
                $("#search-repeat-form").submit();
            }

        </script>
    <c:url value="/" var="appCtx"/>
    <c:forEach items="${listaDisponibili}" var="riga" varStatus="rigaCounter">
        <div class="row">
            <div class="box-border">
                <div class="row">

                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                        <h4 class="bold">${riga.aula.nome}</h4>
                        <c:if test="${riga.linkImmagineAula==null}">
                            <img class="img-responsive" src='<c:url value="/web-resources/images/imageNotFound.png"/>'/>
                        </c:if>
                        <c:if test="${riga.linkImmagineAula!= null}">
                            <a href="#"> <img class="aula-img img-responsive ricerca" src='${appCtx}/${riga.linkImmagineAula.imgUrl}'/></a>
                            </c:if>

                    </div>
                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                        <div class="row">

                            <table class="table-responsive table-aule-trovate">
                                <tr>
                                    <c:forEach items="${giorniSettimana}" var="gg" varStatus="dow">
                                        <td class="text-center">
                                            ${gg}  
                                        </td>
                                    </c:forEach>
                                </tr>
                                <tr class="table-bordered table-responsive">
                                    <c:forEach items="${riga.risultatiRicerca}" var="dow" varStatus="dowCounter">
                                        <td class="table-bordered">
                                            <c:set value="<%= GiornoRicercaClassiDto.TIPO_DISPONIBILE%>" var="disp"/>
                                            <c:set value="<%= GiornoRicercaClassiDto.TIPO_ALTRI_ORARI%>" var="altri"/>
                                            <c:set value="<%= GiornoRicercaClassiDto.TIPO_NON_DISPONIBILE%>" var="nonDisp"/>
                                            <c:if test="${dow.tipoDisponibilita == disp}">
                                                <div class="search-results-single-day">
                                                    <button type="button" class="btn btn-default btn-block" 
                                                            onclick="scegliDisponibile('${riga.aula.id}', '${dow.dataSimple}')">
                                                        a partire da<br>
                                                        <c:if test="${searchForm.moneyType == 'EUR'}">
                                                            <h4 class="bold">
                                                                <fmt:formatNumber value="${dow.bestEuro}" pattern="###,##0.00" /> €
                                                            </h4>
                                                            <br>
                                                            (<fmt:formatNumber value="${dow.bestCrediti}" pattern="###,##0.00" /> crediti)
                                                        </c:if>
                                                        <c:if test="${searchForm.moneyType == 'CRE'}">
                                                            <h4 class="bold">
                                                                <fmt:formatNumber value="${dow.bestCrediti}" pattern="###,##0.00" /> cr
                                                            </h4>
                                                            <br>
                                                            (<fmt:formatNumber value="${dow.bestEuro}" pattern="###,##0.00" /> €)
                                                        </c:if>
                                                        <br>
                                                        <br>
                                                        <p class="search-results-single-day-disp">
                                                            disponibile
                                                        </p>
                                                    </button>
                                                </div>
                                            </c:if>
                                            <c:if test="${dow.tipoDisponibilita == altri}">
                                                <div class="search-results-single-day-altri">
                                                    a partire da<br>
                                                    <h3><fmt:formatNumber value="${dow.bestEuro}" pattern="###,##0.00" /> €</h3>
                                                    (<fmt:formatNumber value="${dow.bestCrediti}" pattern="###,##0.00" /> crediti)
                                                    disponibile<br>
                                                    in altri orari
                                                </div>
                                            </c:if>
                                            <c:if test="${dow.tipoDisponibilita == nonDisp}">
                                                <div class="search-results-single-day-non-disp">
                                                    non disponibile
                                                </div>
                                            </c:if>
                                        </td>
                                    </c:forEach>

                                </tr>
                            </table>                 

                        </div>
                    </div>
                </div>
                <div class="row"> 
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                <span class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                    <img class="img-responsive logo" src='<c:url value="/web-resources/images/icone/PersoneMax.png"/>'/>
                                </span>
                                <span class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                    max. ${riga.aula.maxPosti} partecipanti
                                </span>
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                <span class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                    <img class="img-responsive logo" src='<c:url value="/web-resources/images/icone/Proiettore.png"/>'/>
                                </span>
                                <span class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                    presenza proiettore
                                </span>
                            </div>
                            <c:forEach items="${riga.listaCaratteristiche}" var="cc" varStatus="loopCounter">
                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                    <span class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                        <img class="img-responsive logo" src='<c:url value="/web-resources/images/icone/Help.png"/>'/>
                                    </span>
                                    <span class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                        ${cc.nome}
                                    </span>
                                </div>

                            </c:forEach>

                        </div>
                    </div>
                    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">

                    </div>
                    <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <div class="row">
                            <h5 class="bold">
                                Valutazione degli utilizzatori
                            </h5>
                        </div>
                        <div class="row">
                            <!--star for rating--> <div class="star"> 
                                <c:set value="${Math.floor(riga.aula.voto + 0.5)}" var="intVoto"/>
                                <c:forEach begin="${intVoto}" end="4">
                                    <span class="star-rating">
                                        <img class="img-responsive star" src='<c:url value="/web-resources/images/icone/678064-star-128 2.png"/>'/>
                                    </span>  
                                </c:forEach>

                                <c:forEach begin="${((intVoto-1) > 0 ? 0 : 1)}" end="${((intVoto-1) > 0 ? intVoto - 1 : 0)}">
                                    <span class="star-rating">
                                        <img class="img-responsive star" src='<c:url value="/web-resources/images/icone/678064-star-128.png"/>'/>
                                    </span>  
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </c:forEach>
</div>

<c:url value="<%= BookingController.RQ_SEARCH%>" var="formUrl"/>
<form:form role="form" modelAttribute="searchForm" name="searchForm" id="search-repeat-form" method="POST" action="${formUrl}">
    <input type="hidden" name="nomeCitta" value="<c:out value='${searchForm.nomeCitta}'/>">
    <input type="hidden" name="periodo" value="<c:out value='${searchForm.periodo}'/>">
    <input type="hidden" name="numeroPartecipanti" value="<c:out value='${searchForm.numeroPartecipanti}'/>">
    <input type="hidden" name="sede" value="<c:out value='${searchForm.sede}'/>">
    <input type="hidden" name="fasciaOraria" value="<c:out value='${searchForm.fasciaOraria}'/>">
    <input type="hidden" name="configurazione" value="<c:out value='${searchForm.configurazione}'/>">
    <input type="hidden" name="nextWeekDate" value="<c:out value='${weekControl.nextWeekDate}'/>">
    <input type="hidden" name="prevWeekDate" value="<c:out value='${weekControl.prevWeekDate}'/>">
    <input type="hidden" id="searchType" name="searchType" value="">
    <input type="hidden" id="exactDate" name="exactDate" value="<c:out value='${weekControl.exactDate}'/>">
    <input type="hidden" id="moneyType" name="moneyType" value="<c:out value='${searchForm.moneyType}'/>">
</form:form>            

<%--<%@include file="../layout/risultati-di-ricerca.jsp" %>--%>

<c:url value="<%= BookingController.RQ_CHOOSE_BOOKING%>" var="bookingFormUrl"/>
<form:form id="booking-form" modelAttribute="bookingForm" action="${bookingFormUrl}">
    <form:hidden id="req-id-aula" value="" path="idAula"/>
    <form:hidden id="req-data-simple" value="" path="dataPren"/>
</form:form>

<script type="text/javascript">
    function scegliDisponibile(idAula, dataSimple) {
        // Data collection for the call
        $("#req-id-aula").val(idAula);
        $("#req-data-simple").val(dataSimple);
        $("#booking-form").submit();
    }
</script>