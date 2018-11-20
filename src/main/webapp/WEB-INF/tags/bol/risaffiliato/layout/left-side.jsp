<%-- 
    Contiene i filtri di ricerca
    (parte sinistra della schermata 3.1)
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeAjaxController"%>
<%@page import="it.logicadeisistemi.bol.hbol.controller.HomeController"%>

<!--Parametri di ricerca-->
<div id="bol-filter-form">
    <div id="bol-filter-form-title">
        Parametri di ricerca
    </div>
    <div id="bol-filter-form-criteria">
        <form role="form" id="bol-homepage-search-form" method="POST" action="<c:url value='<%= HomeController.RQ_CERCA%>'/>">
            <div class="form-group">
                <div class="selectContainer">
                    <select class="form-control  bol-hbol-search-field" id="nome-citta" name="nomeCitta" required onChange="nomeCittaHasChanged()">
                        <option value="">Città (obbligatorio)</option>
                        <c:forEach items="${listaCitta}" var="ct" varStatus="loopCounter">
                            <option value="<c:out value='${ct.nome}'/>"> 
                                <c:out value='${ct.nome}'/> 
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <div class="selectContainer">
                    <select class="form-control  bol-hbol-search-field" id="nome-sede" name="sede" >
                        <option value="">Sede</option>
                        <c:forEach items="${listaSedi}" var="ct" varStatus="loopCounter">
                            <option value="<c:out value='${ct.id}'/>"> 
                                <c:out value='${ct.nome}'/> 
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <input type="text" class="form-control  bol-hbol-search-field" id="bol-home-seleziona-periodo" placeholder="Periodo">
                <script type="text/javascript">
                    $('#bol-home-seleziona-periodo').datepicker({
                        format: "mm-yyyy",
                        startView: "months",
                        minViewMode: "months",
                        autoclose: "true",
                        language: "it"
                    });
                </script>
            </div>

            <div class="form-group">
                <div class="selectContainer">
                    <select class="form-control  bol-hbol-search-field" id="fascia-oraria" name="fascia" >
                        <option value="">Fascia Oraria</option>
                        <c:forEach items="${listaFasce}" var="ct" varStatus="loopCounter">
                            <option value="<c:out value='${ct.nome}'/>"> 
                                <c:out value='${ct.nome}'/> 
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <div class="selectContainer">
                    <select class="form-control  bol-hbol-search-field" id="partecipanti" name="partecipanti" >
                        <option value="">Numero Partecipanti</option>
                        <c:forEach items="${listaPartecipanti}" var="ct" varStatus="loopCounter">
                            <option value="<c:out value='${ct.nome}'/>"> 
                                <c:out value='${ct.nome}'/> 
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <div class="selectContainer">
                    <select class="form-control  bol-hbol-search-field" id="configurazione" name="configurazione" >
                        <option value="">Configurazione</option>
                        <c:forEach items="${listaConfigurazioni}" var="ct" varStatus="loopCounter">
                            <option value="<c:out value='${ct.nome}'/>"> 
                                <c:out value='${ct.nome}'/> 
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

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


            <input type="submit" value="Cerca" class="form-control  bol-hbol-search-field">
        </form>
    </div>
</div>
<!--Filtraggio per Caratteristiche-->
<div id="bol-filter-form">
    <div id="bol-filter-form-title">
        Parametri di ricerca
    </div>
    <form role="form" id="bol-homepage-search-form" method="POST" action="<c:url value='<%= HomeController.RQ_CERCA%>'/>">

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


        <input type="submit" value="Cerca" class="form-control  bol-hbol-search-field">
    </form>
</div>

<script>
    function nomeCittaHasChanged()
    {
        var data = {};
        data["citta"] = $("#nome-citta").val();
        data["periodo"] = $("#bol-home-seleziona-periodo").val();
        data["sede"] = $("#nome-sede").val();
        data["fasciaOraria"] = $("#fascia-oraria").val();
        data["partecipanti"] = $("#partecipanti").val();
        data["configurazione"] = $("#configurazione").val();

        var req = "<c:url value='<%= HomeAjaxController.AX_SEARCH_FORM_UPDATE_CITTA%>'/>";
//        window.alert(JSON.stringify(data) + req);

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: req,
            data: JSON.stringify(data),
            dataType: 'json',
            timeout: 100000,
            success: function (data) {
                console.log("SUCCESS: ", data);
//                window.alert(JSON.stringify(data));
                var x = data["sediOption"];
//                window.alert(x);
                $("#nome-sede").html(x);
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

