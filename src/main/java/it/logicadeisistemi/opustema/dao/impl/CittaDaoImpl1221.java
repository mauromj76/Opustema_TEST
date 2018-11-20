package it.logicadeisistemi.opustema.dao.impl;

import it.logicadeisistemi.opustema.dao.CittaDao1221;
import it.logicadeisistemi.opustema.model.Citta1221;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.springframework.stereotype.Repository;

@Repository
public class CittaDaoImpl1221 implements CittaDao1221 {

    @PersistenceContext
    EntityManager em;

    @Override
    public Citta1221 crea(Citta1221 citta1221) {
        return em.merge(citta1221);
    }

    @Override
    public List<Citta1221> findAll() {
        //creo un builder
        CriteriaBuilder cb = em.getCriteriaBuilder();
        //crea la query vuota
        CriteriaQuery query = cb.createQuery();

        //imposto la query dalla classe Citta1221
        //crea una definizione completa di query
        Root<Citta1221> from = query.from(Citta1221.class);

        //chiediamo alla query di fare una SELECT
        CriteriaQuery qselect = query.select(from);

        //creiamo una query eseguibile 
        TypedQuery<Citta1221> qe = em.createQuery(qselect);

        //eseguo la query
        return qe.getResultList();

    }

}
