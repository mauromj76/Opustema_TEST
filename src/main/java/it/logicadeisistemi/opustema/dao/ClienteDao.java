package it.logicadeisistemi.opustema.dao;

import it.logicadeisistemi.opustema.model.Cliente;
import java.util.List;

public interface ClienteDao {

    /**
     * Permette di recuperare il cliente di id dato
     * @param id
     * @return 
     */
    Cliente get(Long id);

    Cliente save(Cliente aula);

    void deleteCliente(Long id);

    List<Cliente> listaAll();
}
