/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.logicadeisistemi.opustema.dao.impl;

import it.logicadeisistemi.opustema.dao.GestioneCcDao;
import it.logicadeisistemi.opustema.dto.GestioneCcDto;
import it.logicadeisistemi.opustema.model.ContoCorrente;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author studente
 */
@Repository
public class GestioneCcDaoImpl implements GestioneCcDao {

    @PersistenceContext
    //Ignietto l'entity managment
    EntityManager entityManager;

    //Elimina il conto corrente
    @Override
    public void eliminaCc(GestioneCcDto dto) {
        //Elimino il conto corrente in base all' numero di conto

        //Prendo il valore attuale
        String numConto = dto.getIdCcAttuale();

        //Creo la query
        Query query = entityManager.createQuery("DELETE u FROM ContoCorrente WHERE id = :CONTO");

        //Assegno il parametro alla stringa query
        entityManager.setProperty("CONTO", numConto);

        //Invio la richiesta di eliminazione al DB
        query.executeUpdate();

    }

    //Aggiungi il conto corrente
    @Override
    public void aggiungiCc(GestioneCcDto cc) {
        //Inserisco il nuovo conto corrente
        entityManager.merge(cc);
    }

    //Modifica ilconto corrente
    @Override
    public void modificaCc(GestioneCcDto cc) {
        //Ricavo il numero del conto corrente
        //Attuale e da modificare
        String numContoAttuale = cc.getIdCcAttuale();
        String numContoNuovo = cc.getIdCcNuovo();

        //Cerco il conto corrente
        //Creo la stringa
        Query query = entityManager.createQuery("UPDATE ContoCorrente c SET  c.numConto = ':numContoN' WHERE c.id = ':numContoA'");
        //Assegno il parametro alla stringa query
        entityManager.setProperty("CONTOA", numContoAttuale);
        entityManager.setProperty("CONTON", numContoNuovo);

        //Invio la richiesta di eliminazione al DB
        query.executeUpdate();
    }

    //Cerco tutti i conti correnti
    @Override
    public List<ContoCorrente> findAll() {
        //Creo la lista degli utenti
        List<ContoCorrente> listaconticorrenti = new ArrayList<>();

        //Creo la query
        Query query = entityManager.createQuery("SELECT u FROM ContoCorrente u");

        //Ritorno la lista
        listaconticorrenti = query.getResultList();
        return listaconticorrenti;
    }

}
