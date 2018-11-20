
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.FotocopieAjaxController"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="modal fade" role="dialog" id="fotocopie-tipo">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h2 class="modal-title">Acquisto Fotocopie</h2>
            </div>
            <div class="modal-body">

                <div class="row" >
                    <h4>Seleziona il tipo di fotocopia</h4>
                </div>
                <div class="row">
                    <c:forEach items="${fotocopieTypes}" var="fotocopie" varStatus="loopCounter">
                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                            <div class="row border-div" style="text-align: center;background-color:#30437b">
                                <input type="radio" checked="true" name="selection" checked>
                            </div>
                            <div class="row border-div" style="text-align: center;">
                                <h4>${fotocopie.formato.substring(0,2)}</h4>
                                <small>${fotocopie.formato.substring(2,fotocopie.formato.length())}</small>
                            </div>
                        </div>
                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">

                        </div>
                    </c:forEach>
                </div>
                <br>
                <div class="row">
                    <div class="col-xs-3 col-xs-offset-9">
                        <a href="#" class="btn btn-default btn-lg" onclick="">
                            Avanti
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>