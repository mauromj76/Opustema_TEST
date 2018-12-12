package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.dao.ClienteDao;
import it.logicadeisistemi.opustema.dto.ClienteRichiestaDto;
import it.logicadeisistemi.opustema.dto.ClienteRispostaDto;
import it.logicadeisistemi.opustema.model.Cliente;
import it.logicadeisistemi.opustema.service.ClienteService;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ClienteServiceImpl implements ClienteService {

    public static Logger logger = Logger.getLogger(ClienteService.class);

    @Autowired
    ClienteDao clienteDao;

    //Servizio che aggiunge un nuovo cliente nel DB
    @Override
    @Transactional
    public List<ClienteRispostaDto> aggiungiCliente(ClienteRichiestaDto dto) {

        logger.debug("Entrato in service aggiungiCliente con id " + dto.getId());

        // Istanzio l'entità da passare al DAO
        Cliente client = new Cliente();

        // Ci riverso i dati del DAO (creo quindi una copia)
        client.setNome(dto.getNome());
        client.setCognome(dto.getCognome());
        client.setCodiceFiscale(dto.getCodiceFiscale());
        client.setIndirizzo(dto.getIndirizzo());
        client.setTelefono(dto.getTelefono());

        client = clienteDao.save(client);

        // Ritorno la lista aggiornata
        return leggiClienti();
    }

    @Override
    @Transactional
    public List<ClienteRispostaDto> modificaCliente(ClienteRichiestaDto dto) {

        logger.debug("Entrato in service modificaCliente con id " + dto.getId());

        clienteDao.modificaCliente(dto);

        // Ritorno la lista aggiornata
        return leggiClienti();
    }

    @Override
    public List<ClienteRispostaDto> leggiClienti() {

        // Istanzio una lista(entità) e la riempio con la findAll
        List<Cliente> list = clienteDao.findAll();

        // Istanzio una lista(DTO) da passare al client
        List<ClienteRispostaDto> ris = new ArrayList<>();

        // Itero sulla lista(entità) e la riverso in quella dto
        for (int i = 0; i < list.size(); i++) {

            // Per ogni iterazione istanzio un nuovo oggetto dto dove ricopio i valori dell'entità. Una copia.
            ClienteRispostaDto r = new ClienteRispostaDto(
                    list.get(i).getId(),
                    list.get(i).getNome(),
                    list.get(i).getCognome(),
                    list.get(i).getCodiceFiscale(),
                    list.get(i).getIndirizzo(),
                    list.get(i).getTelefono()
            );
// Aggiungo la copia alla lista(dto)
            ris.add(r);
        }

        // Ritorno la lista(DTO)
        return ris;
    }

    @Override
    public List<ClienteRispostaDto> cancellaCliente(Long id) {

        clienteDao.delete(id);

        // Ritorno la lista aggiornata
        return leggiClienti();
    }

}
