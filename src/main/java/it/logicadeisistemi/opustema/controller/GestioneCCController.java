package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.dto.GestioneCcDto;
import it.logicadeisistemi.opustema.model.ContoCorrente;
import it.logicadeisistemi.opustema.service.GestioneCCService;
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
public class GestioneCCController {

    public static Logger logger = Logger.getLogger(GestioneCCController.class);

    @Autowired
    GestioneCCService gestioneCCService;

    // requestmapping per aggiunta nuovo conto corrente
    @RequestMapping("/aggiungicc")
    @ResponseBody
    public List<ContoCorrente> aggiungiCC(
            // dto passato dal lato client
            @RequestBody GestioneCcDto dto) {
        logger.debug("Entrato in aggiungiCC");
        // chiamata al servizio e ritorno lista di conto corrente aggiornata
        return gestioneCCService.aggiungiCC(dto);
    }

    // requestmapping per modifica conto corrente esistente
    @RequestMapping("/modificacc")
    @ResponseBody
    public List<ContoCorrente> modificaCC(
            // dto passato dal lato client
            @RequestBody GestioneCcDto dto) {
        logger.debug("Entrato in modificaCC");
        // chiamata al servizio e ritorno lista di conto corrente aggiornata
        return gestioneCCService.modificaCC(dto);
    }

    // requestmapping per eliminazione conto corrente esistente
    @RequestMapping("/eliminacc")
    @ResponseBody
    public List<ContoCorrente> eliminaCC(
            // dto passato dal lato client
            @RequestBody GestioneCcDto dto) {
        logger.debug("Entrato in eliminaCC");
        // chiamata al servizio e ritorno lista di conto corrente aggiornata
        return gestioneCCService.eliminaCC(dto);
    }

}
