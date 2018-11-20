<%-- 
    Contiene i filtri di ricerca
    (parte sinistra della schermata 3.1)
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.BookingController"%>

<!--Parametri di ricerca-->
<div id="bol-filter-form">
    <div id="bol-filter-form-title">
        Parametri di ricerca
    </div>
    <div id="bol-filter-form-criteria">
        <c:url value="<%= BookingController.RQ_SEARCH%>" var="formUrl"/>
        <form:form role="form" modelAttribute="searchForm" id="bol-filter-search-form" method="POST" action="${formUrl}">
            <div class="form-group">
                <div class="selectContainer">
                    <select class="form-control bol-hbol-search-field" id="nome-citta" name="nomeCitta" required onChange="nomeCittaHasChanged()">
                        <option value="">Città (obbligatorio)</option>
                        <c:forEach items="${listaCitta}" var="ct" varStatus="loopCounter">
                            <option value="<c:out value='${ct.nome}'/>" <c:if test="${ct.nome == searchForm.nomeCitta}">selected</c:if> > 
                                <c:out value='${ct.nome}'/> 
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <div class="selectContainer">
                    <select class="form-control  bol-hbol-search-field" id="nome-sede" name="sede" onChange="sedeHasChanged()">
                        <option value="">Sede</option>
                        <c:forEach items="${listaSedi}" var="ct" varStatus="loopCounter">
                            <option value="<c:out value='${ct.id}'/>"<c:if test="${ct.id == searchForm.sede}">selected</c:if> > 
                                <c:out value='${ct.indirizzo}'/> - <c:out value='${ct.citta}'/> 
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <input type="text" class="form-control  bol-hbol-search-field" id="bol-home-seleziona-periodo" name="periodo" placeholder="Periodo" 
                       value="<c:out value='${searchForm.periodo}'/>">
                <script type="text/javascript">
                    $(document).ready(function () {
                        var curDate = new Date();
                        $('#bol-home-seleziona-periodo').datepicker({
                            format: "mm-yyyy",
                            startView: "months",
                            minViewMode: "months",
                            autoclose: "true",
                            language: "it",
                            startDate: curDate
                        });
                    });
                </script>
            </div>

            <div class="form-group">
                <div class="selectContainer">
                    <select class="form-control  bol-hbol-search-field" id="fascia-oraria" name="fascia" >
                        <option value="">Fascia Oraria</option>
                        <c:forEach items="${listaFasce}" var="ct" varStatus="loopCounter">
                            <option value="<c:out value='${ct.id}'/>"<c:if test="${ct.id == searchForm.fasciaOraria}">selected</c:if> > 
                                <c:out value='${ct.fasciaStringa}'/> 
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <input type="number" min="1" class="form-control bol-hbol-search-field" 
                       id="numero-partecipanti" name="numeroPartecipanti" placeholder="Numero Partecipanti" 
                       <c:if test="${searchForm.numeroPartecipanti > 0}">value="${searchForm.numeroPartecipanti}"</c:if> > 
                </div>

                <div class="form-group">
                    <div class="selectContainer">
                        <select class="form-control  bol-hbol-search-field" id="configurazione" name="configurazione" >
                            <option value="">Configurazione</option>
                        <c:forEach items="${listaCfg}" var="ct" varStatus="loopCounter">
                            <option value="<c:out value='${ct.id}'/>"> 
                                <c:out value='${ct.nome}'/> 
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <input type="submit" value="Cerca" class="form-control bol-hbol-search-submit">
        </form:form>
    </div>
</div>
<!--Filtraggio per Caratteristiche-->
<!--<div id="bol-filter-form">
    <div id="bol-filter-form-title">
        Parametri di ricerca
    </div>
    <form role="form" id="bol-homepage-search-form" method="POST" action="<c:url value='<%= BookingController.RQ_FILTRA%>'/>">

        <div class="form-group bol-hbol-search-field">
            <div>
                Caratteristiche
            </div>
            <div class="checkbox">
                <label><input type="checkbox" value="">Caratteristica 1</label>
            </div>
            <div class="checkbox">
                <label><input type="checkbox" value="">Caratteristica 1</label>
            </div>
            <div class="checkbox">
                <label><input type="checkbox" value="">Caratteristica 1</label>
            </div>
            <div class="checkbox">
                <label><input type="checkbox" value="">Caratteristica 1</label>
            </div>
        </div>


        <input type="submit" value="Cerca" class="form-control bol-hbol-search-submit">
    </form>
</div>-->

<script>
    function nomeCittaHasChanged()
    {
        // CSRF prevention
        var csrfToken = $("meta[name='_csrf']").attr("content");
        var csrfHeader = $("meta[name='_csrf_header']").attr("content");
        // populate data bean to be passed to the Ajax controller
        var data = {};
        data["citta"] = $("#nome-citta").val();
        data["periodo"] = $("#bol-home-seleziona-periodo").val();
        data["sede"] = $("#nome-sede").val();
        data["fasciaOraria"] = $("#fascia-oraria").val();
        data["partecipanti"] = $("#partecipanti").val();
        data["configurazione"] = $("#configurazione").val();
        // Ajax call 
        var req = "<c:url value='<%= HomeAjaxController.AX_SEARCH_FORM_UPDATE_CITTA%>'/>";
//        window.alert(JSON.stringify(data) + req);

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: req,
            data: JSON.stringify(data),
            dataType: 'json',
            timeout: 100000,
            beforeSend: function (xhr) {
                // CSRF prevention
                xhr.setRequestHeader(csrfHeader, csrfToken);
            },
            success: function (data) {
                console.log("SUCCESS: ", data);
                // fills fields with new html code to reflect new data
                $("#nome-sede").html(data["sediOption"]);
                $("#fascia-oraria").html(data["fasceOrarieOption"]);
                $("#configurazione").html(data["configurazioniOption"]);
            },
            error: function (e) {
                console.log("ERROR: ", e);
//                window.alert(e);
            },
            done: function (e) {
                console.log("DONE");
            }
        });
    }

    function sedeHasChanged()
    {
        // CSRF prevention
        var csrfToken = $("meta[name='_csrf']").attr("content");
        var csrfHeader = $("meta[name='_csrf_header']").attr("content");

        // populate data bean to be passed to the Ajax controller
        var data = {};
        data["citta"] = $("#nome-citta").val();
        data["periodo"] = $("#bol-home-seleziona-periodo").val();
        data["sede"] = $("#nome-sede").val();
        data["fasciaOraria"] = $("#fascia-oraria").val();
        data["partecipanti"] = $("#partecipanti").val();
        data["configurazione"] = $("#configurazione").val();

        var req = "<c:url value='<%= HomeAjaxController.AX_SEARCH_FORM_UPDATE_SEDE%>'/>";
//        window.alert(JSON.stringify(data) + req);

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: req,
            data: JSON.stringify(data),
            dataType: 'json',
            timeout: 100000,
            beforeSend: function (xhr) {
                // CSRF prevention
                xhr.setRequestHeader(csrfHeader, csrfToken);
            },
            success: function (data) {
                console.log("SUCCESS: ", data);
                // $("#nome-sede").html(data["sediOption"]);
                $("#fascia").html(data["fasceOrarieOption"]);
                $("#configurazione").html(data["configurazioniOption"]);
            },
            error: function (e) {
                console.log("ERROR: ", e);
//                window.alert(e);
            },
            done: function (e) {
                console.log("DONE");
            }
        });
    }

</script>

