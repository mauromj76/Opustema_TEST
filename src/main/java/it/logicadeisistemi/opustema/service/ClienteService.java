package it.logicadeisistemi.opustema.service;

import it.logicadeisistemi.opustema.model.Cliente;
import java.util.List;

public interface ClienteService {

    Cliente get(Long id);

    Cliente save(Cliente aula);

    void deleteCliente(Long id);

    List<Cliente> listAll();
    
    
}
