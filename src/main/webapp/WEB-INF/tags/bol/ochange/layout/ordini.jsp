

<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <div class="row">
     
        <table class="table-bordered" id="tb-ordini">
            <thead>
                <tr>
                    <th class="col-xs-1 col-sm-1 col-md-1 col-lg-1">Numero</th>
                    <th class="col-xs-1 col-sm-1 col-md-1 col-lg-1">Data</th>
                    <th class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Tipo</th>
                    <th class="col-xs-1 col-sm-1 col-md-1 col-lg-1">Fattura</th>
                    <th class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Importo</th>
                    <th class="col-xs-5 col-sm-5 col-md-5 col-lg-5">Gestisci</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1"><h4>6789</h4></td>
                    <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1"><h4>01/03/2016</h4></td>
                    <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Prenotazione Aule</td>
                    <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                        <a href="#">
                        <img class ="img-responsive" src='<c:url value="/web-resources/css/images/file_extension_pdf.ico"/>'/>
                        346/2016</a>
                    </td>
                    <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2"><h4>1200 €</h4><h5>(600 crediti)</h5></td>
                    <td class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                        <span class="col-xs-12 col-sm-6 col-md-4 col-lg-4" ><a href="#">Visualizza</a></span>
                        <span class="col-xs-12 col-sm-6 col-md-4 col-lg-4"><a href=#modificaOrdine" data-toggle="modal" data-target="#modifica-ordine">Modifica</a>                  
<!--                             include file="modal-modificaAula.jsp"-->
                        </span>
                        <span class="col-xs-12 col-sm-6 col-md-4 col-lg-4" ><a href="#">Annulla</a></span>
                    </td>
                </tr>
                <!-- repeat rows for each element -->
                 <tr>
                    <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1"><h4>6789</h4></td>
                    <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1"><h4>01/03/2016</h4></td>
                    <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Prenotazione Aule</td>
                    <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                        <a href="#">
                        <img class ="img-responsive" src='<c:url value="/web-resources/css/images/file_extension_pdf.ico"/>'/>
                        346/2016</a>
                    </td>
                    <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2"><h4>1200 €</h4><h5>(600 crediti)</h5></td>
                    <td class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                        <span class="col-xs-12 col-sm-6 col-md-4 col-lg-4" ><a href="#">Visualizza</a></span>
                        <span class="col-xs-12 col-sm-6 col-md-4 col-lg-4"><a href=#modificaOrdine" data-toggle="modal" data-target="#modifica-ordine">Modifica</a>                  
<!--                            <-- include file="modal-modificaAula.jsp"-->
                        </span>
                        <button class="btn btn-default btn-sm glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="top" title="Message goes here" id="non-annullabile"></button>
                        
                    </td>
                </tr>
                <tr>
                    <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1"><h4>6789</h4></td>
                    <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1"><h4>01/03/2016</h4></td>
                    <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2">Prenotazione Aule</td>
                    <td class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                        <a href="#">
                        <img class ="img-responsive" src='<c:url value="/web-resources/css/images/file_extension_pdf.ico"/>'/>
                        346/2016</a>
                    </td>
                    <td class="col-xs-2 col-sm-2 col-md-2 col-lg-2"><h4>1200 €</h4><h5>(600 crediti)</h5></td>
                    <td class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                        <span class="col-xs-12 col-sm-6s col-md-4 col-lg-4" ><a href="#">Visualizza</a></span>
                        <button class="btn btn-default btn-sm glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="top" title="Message goes here" id="non-mod-anul"></button>
                        
                    </td>
                </tr>
                
            </tbody>
        </table>
         
