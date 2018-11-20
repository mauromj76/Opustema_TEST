package it.logicadeisistemi.opustema.dao.impl;

import it.logicadeisistemi.opustema.dao.ScuolaDao;
import it.logicadeisistemi.opustema.model.Alunno;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class ScuolaDaoImpl implements ScuolaDao {

    @PersistenceContext
    EntityManager em;

    @Override
    public Alunno creaAlunno(Alunno a) {
        return em.merge(a);
    }

    @Override
    public List<Alunno> findAll() {
        
//        ArrayList
        return em.createQuery(
                "SELECT a FROM Alunno a")
                .getResultList();
    }
}
