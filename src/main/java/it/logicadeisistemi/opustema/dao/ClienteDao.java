package it.logicadeisistemi.opustema.dao;

import it.logicadeisistemi.opustema.dto.ClienteRichiestaDto;
import it.logicadeisistemi.opustema.model.Cliente;
import java.util.List;

public interface ClienteDao {

    Cliente save(Cliente c);

    List<Cliente> findAll();

    Cliente findById(Long id);

    Cliente modificaCliente(ClienteRichiestaDto dto);

    void delete(Long id);
}
