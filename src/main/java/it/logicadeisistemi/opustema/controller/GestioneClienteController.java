package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.dto.ClienteRichiestaDto;
import it.logicadeisistemi.opustema.dto.ClienteRispostaDto;
import it.logicadeisistemi.opustema.service.ClienteService;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin("*")
public class GestioneClienteController {

    public static Logger logger = Logger.getLogger(GestioneClienteController.class);
    @Autowired
    ClienteService clienteService;

    // Creo il controller che gestisce la creazione di un nuovo cliente 
    @RequestMapping("/aggiungicliente10")
    @ResponseBody
    public List<ClienteRispostaDto> aggiungiCliente(
            @RequestBody ClienteRichiestaDto dto) {

        logger.debug("Entrato in controller aggiungiCliente con id " + dto.getId());

        return clienteService.aggiungiCliente(dto);
    }

    //Creo il controller che gestisce la modifica di un cliente
    //TODO
    @RequestMapping("/modificacliente10")
    @ResponseBody
    public List<ClienteRispostaDto> modificaCliente(
            @RequestBody ClienteRichiestaDto dto) {

        logger.debug("Entrato in controller modificaCliente con id " + dto.getId());

        return clienteService.modificaCliente(dto);
    }

    //Creo il controller che gestisce la cancellazione di un cliente
    //TODO
    @RequestMapping("/cancellacliente10")
    @ResponseBody
    public List<ClienteRispostaDto> cancellaCliente(
            @RequestBody Long id) {

        logger.debug("Entrato in controller cancellaCliente con id " + id);
        return clienteService.cancellaCliente(id);
    }

    @RequestMapping("/leggiclienti10")
    @ResponseBody
    public List<ClienteRispostaDto> leggiClienti() {
        logger.debug("Entrato in controller leggiClienti");

        return clienteService.leggiClienti();
    }

}
