package it.logicadeisistemi.opustema.dao.impl;

import it.logicadeisistemi.opustema.dao.ClienteDao;
import it.logicadeisistemi.opustema.dto.ClienteRichiestaDto;
import it.logicadeisistemi.opustema.model.Cliente;
import it.logicadeisistemi.opustema.service.ClienteService;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

// L'implementazione del DAO va annotata come @Repository
@Repository
public class ClienteDaoImpl implements ClienteDao {

    public static Logger logger = Logger.getLogger(ClienteService.class);

    // Annotazioni necessarie per utilizzare l'EntityManager
    @PersistenceContext
    EntityManager em;

    @Override
    public Cliente save(Cliente c) {

        logger.debug("Entrato in service aggiungiCliente con id " + c.getId());

        // merge aggiorna, ma lo utilizziamo anche per creare un record nuovo
        return em.merge(c);
    }

    @Override
    public List<Cliente> findAll() {

        logger.debug("Entrato in dao findAll");

        // query JPQL che fa la select di tutti i record
        String q = "select u from Cliente u";
        Query query = em.createQuery(q);
        List<Cliente> clienti = query.getResultList();
        return clienti;
    }

    @Override
    public Cliente findById(Long id) {
        logger.debug("Entrato in dao findById con id " + id);

        // query parametrica, la sintassi vuole "= :nome_parametro"
        String q = "select c from Cliente c"
                + " where c.id = :nn"; // andiamo a capo per assicurarci che ci sia sempre lo spazio prima di where

        Query query = em.createQuery(q);
        query.setParameter("nn", id);
        Cliente app;

        try {
            app = (Cliente) query.getSingleResult();
        } catch (NoResultException ex) {
            logger.warn("Warning: no result found by dao findById with id " + id + ". Returning null.");
            return null;
        }
        return app;
    }

    @Override
    public Cliente modificaCliente(ClienteRichiestaDto dto) {

        logger.debug("Entrato in service aggiungiCliente con id " + dto.getId());

        // Istanzio un nuovo Cliente
        Cliente cl = new Cliente();

        // Ci riverso tutti gli attributi del Cliente(dto) presi dal client
        cl.setId(dto.getId());
        cl.setNome(dto.getNome());
        cl.setCognome(dto.getCognome());
        cl.setIndirizzo(dto.getIndirizzo());
        cl.setTelefono(dto.getTelefono());

        // Faccio l'update col merge
        em.merge(cl);

        return cl;
    }

    @Override
    public void delete(Long id) {
        logger.debug("Entrato in dao delete con id " + id);

        // Per la remove è necessario prendere l'entità direttamente dal database.
        // se creassimo invece un nuovo oggetto, anche se con le stesse proprietà prese dal DTO,
        // incorreremmo in un' IllegalArgumentException, poichè l'entità sarebbe riconosciuta come detached entity
        em.remove(findById(id));
        em.flush();

    }
}
