package it.logicadeisistemi.opustema.dao.impl;

import it.logicadeisistemi.opustema.dao.CriteriaApiDao;
import it.logicadeisistemi.opustema.model.Alunno;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.springframework.stereotype.Repository;

@Repository
public class CriteriaApiDaoImpl implements CriteriaApiDao{

    @PersistenceContext
    EntityManager em;
    
    @Override
    public List<Alunno> mostraTuttiAlunni() {
        // Crea definizione vuota di query
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery query = cb.createQuery();
        
        // Crea una definizione completa di query 
        Root<Alunno> from = query.from(Alunno.class);
        CriteriaQuery qselect = query.select(from);
        
        // Crea una query eseguibile
        TypedQuery<Alunno> qe = em.createQuery(qselect);
        
        // esegue la query
        return qe.getResultList();
    }
    
}
