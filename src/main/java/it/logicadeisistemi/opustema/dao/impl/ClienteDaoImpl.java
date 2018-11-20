package it.logicadeisistemi.opustema.dao.impl;

import it.logicadeisistemi.opustema.dao.ClienteDao;
import it.logicadeisistemi.opustema.model.Cliente;
import it.logicadeisistemi.spring.common.DaoImplBase;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import org.springframework.stereotype.Repository;

@Repository
public class ClienteDaoImpl extends DaoImplBase implements ClienteDao {

    @PersistenceContext
    private EntityManager em;

    @Override
    public Cliente get(Long id) {
        return em.find(Cliente.class, id);
    }

    @Override
    public Cliente save(Cliente cli) {
        return em.merge(cli);
    }

    @Override
    public void deleteCliente(Long id) {
        Cliente cx = get(id);
        em.remove(cx);
    }

    @Override
    public List<Cliente> listaAll() {
        logger.debug(this + ":listaAll entered");
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Cliente> c = cb.createQuery(Cliente.class);
        Root<Cliente> root = c.from(Cliente.class);
        c.select(root);
        List<Cliente> lista;
        lista = em.createQuery(c).getResultList();
        logger.debug(this + ":listaAll exiting with list of size " + lista.size());
        return lista;
    }
}
