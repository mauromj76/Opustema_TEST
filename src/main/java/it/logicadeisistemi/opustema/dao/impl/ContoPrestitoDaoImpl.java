package it.logicadeisistemi.opustema.dao.impl;

import it.logicadeisistemi.opustema.dao.ContoPrestitoDao;
import it.logicadeisistemi.opustema.model.ContoPrestito;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class ContoPrestitoDaoImpl implements ContoPrestitoDao {

    @PersistenceContext
    EntityManager em;

    @Override
    @Transactional
    public ContoPrestito save(ContoPrestito cp) {
        em.merge(cp);
        return cp;
    }

    @Override
    @Transactional
    public List<ContoPrestito> listaConti() {
        List<ContoPrestito> conto;
        String q = "select d from ContoPrestito d";
        Query query = em.createQuery(q);
        conto = query.getResultList();

        return conto;
    }

    @Override
    @Transactional
    public List<ContoPrestito> deleteConto(ContoPrestito cp) {
        List<ContoPrestito> conto;

        String q = "delete d from ContoPrestito d where d.codiceCP=:pippo";
        Query query = em.createQuery(q);
        query.setParameter("pippo", cp.getCodiceCP());
        conto = query.getResultList();
        return conto;
    }

}
