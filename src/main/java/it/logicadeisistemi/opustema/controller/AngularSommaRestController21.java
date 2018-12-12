package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.dto.AngularSommaDto21;
import it.logicadeisistemi.opustema.service.AngularSommaService21;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

// queste due notazioni vanno a braccetto
// crossorigin consente l'accesso da chiamate http
// restcontroller definisce il tipo di controller
@CrossOrigin("*")
@RestController
public class AngularSommaRestController21 {
    
    private static Logger logger = Logger.getLogger(AngularSommaRestController21.class);
    
    // inietto servizio
    @Autowired
    AngularSommaService21 sommaService;

    // mappata chiamata da Angular e import dati di tipo responsebody
    @RequestMapping (value="/angularsomma21")
    @ResponseBody
    public double somma( // import dati da angular con requestbody
    @RequestBody AngularSommaDto21 dto){
        
        logger.debug("risultato " + sommaService.somma(dto));
        // chiamata servizio e ritorno valore
        return sommaService.somma(dto);
    }
    
}
