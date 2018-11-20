
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-fluid">
   <div class="modal fade" id="modificaAula" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="dialog">

    <div class="modal-content scroll-inside">             
       <div class="modal-body">
                <div class="container-fluid">
               <!-- Body goes here (on modal) -->
               <div class="row">
                   <form class ="form" role="form" id="modal-body-frm"> 
                       
                       <span class="form-group col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
                            <label for="nomeaula">Nome Aula</label>
                            <input type="text" class="form-control" id="nomeaula" value="Aula n.1">
                        </span>
                                              
                         <span class="form-group col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <label for="maxparticipanti">Max partecipanti</label>
                            <input type="text" class="form-control" id="maxparticipanti" value="18">
                        </span>
                       
                       <span class="form-group col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <label for="prezzobase">Prezzo base</label>
                            <input type="text" class="form-control" id="prezzobase" value="300">
                        </span>
                       
                       <div class="form-group">           
                            <label for="descrizione">Descrizione</label>
                            <textarea class="form-control" id="descrizzione" rows="4"> Lorem ipsum dolor sit consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
                            ad minim veniam, quis exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
                            non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                            </textarea>
                        </div>
                   </form>    
               </div>
               
               
               <div class="row">
                   <form class ="form col-xs-6 col-sm-6 col-md-6 col-lg-6" role="form" id="modal-frm-conf-charecteristiche">
                        <h5>Configurazioni disponibili</h5>
                            <div class="box-border">
                                <div class="one-servis col-xs-12 col-sm-12 col-md-12 col-lg-12" id="one-configurazione">
                                    <div class="checkbox col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                        <label class="checkbox-inline">
                                        <input type="checkbox" id="inlineCheckbox" value="option-x"> Aula Informatizzata
                                        </label>
                                    </div>

                                    <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-4 col-md-push-1 col-lg-push-2"> 
                                        <label for="prezzo" >Diff. Prezzo</label>
                                        <input type="text">
                                     </div>
                                </div> <!--div repeats for each component -->
                                <div class="one-servis col-xs-12 col-sm-12 col-md-12 col-lg-12" id="one-configurazione">
                                    <div class="checkbox col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                        <label class="checkbox-inline">
                                        <input type="checkbox" id="inlineCheckbox" value="option-x"> Aula Informatizzata
                                        </label>
                                    </div>

                                    <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-4 col-md-push-1 col-lg-push-2"> 
                                        <label for="prezzo" >Diff. Prezzo</label>
                                        <input type="text">
                                     </div>
                                </div>
                                <div class="one-servis col-xs-12 col-sm-12 col-md-12 col-lg-12" id="one-configurazione">
                                    <div class="checkbox col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                        <label class="checkbox-inline">
                                        <input type="checkbox" id="inlineCheckbox" value="option-x"> Aula Informatizzata
                                        </label>
                                    </div>

                                    <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-4 col-md-push-1 col-lg-push-2"> 
                                        <label for="prezzo" >Diff. Prezzo</label>
                                        <input type="text">
                                     </div>
                                </div>
                                <div class="one-servis col-xs-12 col-sm-12 col-md-12 col-lg-12" id="one-configurazione">
                                    <div class="checkbox col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                        <label class="checkbox-inline">
                                        <input type="checkbox" id="inlineCheckbox" value="option-x"> Aula Informatizzata
                                        </label>
                                    </div>

                                    <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-4 col-md-push-1 col-lg-push-2"> 
                                        <label for="prezzo" >Diff. Prezzo</label>
                                        <input type="text">
                                     </div>
                                </div>
                                <div class="one-servis col-xs-12 col-sm-12 col-md-12 col-lg-12" id="one-configurazione">
                                    <div class="checkbox col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                        <label class="checkbox-inline">
                                        <input type="checkbox" id="inlineCheckbox" value="option-x"> Aula Informatizzata
                                        </label>
                                    </div>

                                    <div class="form-group col-xs-6 col-sm-6 col-md-5 col-lg-4 col-md-push-1 col-lg-push-2"> 
                                        <label for="prezzo" >Diff. Prezzo</label>
                                        <input type="text">
                                     </div>
                                </div>
                                
                                
                            </div> 
                   </form>
                   <form class ="form col-xs-3 col-sm-3 col-md-3 col-lg-3" role="form" id="modal-frm-caratt-principali">
                        <h5>Caratteristiche principali</h5>
                       <div class="box-border">
                                <div>
                                    <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox" value="option-x"> Presenza proiettore
                                    </label>
                                </div> <!-- repeat div for each component -->
                                 <div>
                                    <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox" value="option-x"> Presenza proiettore
                                    </label>
                                </div> 
                                 <div>
                                    <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox" value="option-x"> Presenza proiettore
                                    </label>
                                </div> 
                                 <div>
                                    <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox" value="option-x"> Presenza proiettore
                                    </label>
                                </div> 
                       </div>
                   </form>
                   <form class ="form col-xs-3 col-sm-3 col-md-3 col-lg-3" role="form" id="modal-frm-caratt-sec">
                        <h5>Caratteristiche secondari</h5>
                       <div class="box-border">
                                <div>
                                    <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox" value="option-x"> Nome cratteristica
                                    </label>
                                </div> <!-- repeat div for each component -->
                                 <div>
                                    <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox" value="option-x"> Nome cratteristica
                                    </label>
                                </div>
                                <div>
                                    <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox" value="option-x"> Nome cratteristica
                                    </label>
                                </div>
                       </div>
                   </form>
                   
                </div>  
                       
                    
               
               </div>
                            
            <%@ include file="selezionefoto.jsp" %>   
                         
    </div>
        
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Annulla</button>
            <button type="button" class="btn btn-primary">Salva Modifiche</button>
          </div>
        </div>
        </div>
    </div>
</div>
