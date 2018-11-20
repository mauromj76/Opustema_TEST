
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="it.logicadeisistemi.bol.hbol.controller.RisClienteController"%>
<div class="modal fade" role="dialog" id="sala-search-form">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h2 class="modal-title">Prenota Sala Riunione</h2>
            </div>
            <div class="modal-body">
                <form>

                    <div class="row">
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                            <div class="row">
                                <b>Città</b>&nbsp;&nbsp;
                                 <span class="badge" data-toggle="tooltip" data-placement="right"  
                                      title="Cita">i</span> 
                            </div>
                            <div class="row">
                                <select class="form-control">
                                    <option>Città</option>
                                    <option>Città</option>
                                    <option>Città</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <div class="row">
                                <b>Sede</b>&nbsp;&nbsp;
                                 <span class="badge" data-toggle="tooltip" data-placement="right"  
                                      title="Sede">i</span> 
                            </div>
                            <div class="row">
                                <select class="form-control">
                                    <option>Viale Egeo - EUR</option>
                                    <option>Viale Egeo - EUR</option>
                                    <option>Viale Egeo - EUR</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                        </div>

                    </div>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                            <div class="row">
                                <b>Data</b>&nbsp;&nbsp;
                                <span class="badge" data-toggle="tooltip" data-placement="right"  
                                      title="Data" >i</span> 
                            </div>
                            <div class="row">
                                <select class="form-control">
                                    <option>02.05.2015</option>
                                    <option>02.05.2015</option>
                                    <option>02.05.2015</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                        </div>
                        <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                            <div class="row">
                                <b>Orario</b>&nbsp;&nbsp;&nbsp;
                                <span class="badge" data-toggle="tooltip" data-placement="right"  
                                      title="Orario">i</span> 
                            </div>
                            <div class="row">
                                <div class="col-xs-6" style="padding-left: 0px;">
                                    dalle &nbsp;
                                    <select class="form-control dalle-alle">
                                        <option>09.00</option>
                                        <option>10.00</option>
                                        <option>11.00</option>
                                    </select>
                                </div>

                                <div class="col-xs-6" style="padding-left:0px;">
                                    alle &nbsp;
                                    <select class="form-control dalle-alle">
                                        <option>11.00</option>
                                        <option>12.00</option>
                                        <option>13.00</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-lg-2 col-lg-offset-8">
                            <a class="btn btn-lg btn-default" href="<c:url value='<%= RisClienteController.RQ_MI_PRENOTA_SALA_RIUNIONE%>'/>">Cerca</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->