package it.logicadeisistemi.opustema.dao.impl;

import it.logicadeisistemi.opustema.dao.CittaDao;
import it.logicadeisistemi.opustema.model.Citta;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.springframework.stereotype.Repository;

@Repository
public class CittaDaoImpl implements CittaDao {

    @PersistenceContext
    EntityManager em;

    @Override
    public Citta salva(Citta c) {
        return em.merge(c);
    }

    @Override
    public List<Citta> findAll() {
        // Crea definizione vuota di query
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery query = cb.createQuery();
        
        // Crea una definizione completa di query 
        Root<Citta> from = query.from(Citta.class);
        CriteriaQuery qselect = query.select(from);
        
        // Crea una query eseguibile
        TypedQuery<Citta> qe = em.createQuery(qselect);
        
        // esegue la query
        return qe.getResultList();
    }

}
