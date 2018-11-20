package it.logicadeisistemi.opustema.dao.impl;

import it.logicadeisistemi.opustema.dao.CriteriaApiDao21;
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
public class CriteriaApiDaoImpl21 implements CriteriaApiDao21{

    @PersistenceContext
    EntityManager em;
    
    @Override
    public List<Alunno> mostraTuttiAlunni() {
        
        //creo un builder
        CriteriaBuilder cb = em.getCriteriaBuilder();
        //crea la query vuota
        CriteriaQuery query = cb.createQuery();
        
        //imposto la query dalla classe Alunno
        //crea una definizione completa di query
        Root<Alunno> from = query.from(Alunno.class);
        //creiamo una query eseguibile 
        //chiediamo alla query di fare una SELECT
        CriteriaQuery qselect = query.select(from);
        //eseguo la query
        TypedQuery qe = em.createQuery(qselect);
        
        return qe.getResultList();
    }  
}
