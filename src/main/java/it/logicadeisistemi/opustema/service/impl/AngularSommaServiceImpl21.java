package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.dto.AngularSommaDto21;
import it.logicadeisistemi.opustema.service.AngularSommaService21;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AngularSommaServiceImpl21 implements AngularSommaService21 {

    private static Logger logger = Logger.getLogger(AngularSommaServiceImpl21.class);
//    
//    @Autowired
//    AngularSommaDto21 angularSommaDto21;

    @Override
    public double somma(AngularSommaDto21 dto) {

        double risultato;

        logger.debug("valori dto " + dto.getAdd01() + " " + dto.getAdd02());

        return (risultato = (dto.getAdd01() + dto.getAdd02()));
    }

}
