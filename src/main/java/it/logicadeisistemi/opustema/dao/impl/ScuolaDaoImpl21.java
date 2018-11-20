package it.logicadeisistemi.opustema.dao.impl;

import org.springframework.stereotype.Repository;
import it.logicadeisistemi.opustema.dao.ScuolaDao21;
import it.logicadeisistemi.opustema.model.Alunno21;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class ScuolaDaoImpl21 implements ScuolaDao21{

    @PersistenceContext
    EntityManager em;
    
    @Override
    public Alunno21 inserisciAlunno21(Alunno21 a) {
       return em.merge(a);
    }

    @Override
    public List<Alunno21> findAll21() {
        return em.createQuery("SELECT a FROM Alunno21 a").getResultList();
    }

    
}
