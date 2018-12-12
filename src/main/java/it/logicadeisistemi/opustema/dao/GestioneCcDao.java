/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.logicadeisistemi.opustema.dao;

import it.logicadeisistemi.opustema.dto.GestioneCcDto;
import it.logicadeisistemi.opustema.model.ContoCorrente;
import java.util.List;

/**
 *
 * @author studente
 */
public interface GestioneCcDao {

    //Elimino il conto correne
    public void eliminaCc(GestioneCcDto dto);

    //Aggiungi un conto corrente
    public void aggiungiCc(GestioneCcDto dto);

    //Modifica un conto corrente
    public void modificaCc(GestioneCcDto dto);

    //Cerco tutti i conti correnti
    public List<ContoCorrente> findAll();

}
