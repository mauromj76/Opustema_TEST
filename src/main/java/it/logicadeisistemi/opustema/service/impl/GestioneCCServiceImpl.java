package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.dao.GestioneCcDao;
import it.logicadeisistemi.opustema.dto.GestioneCcDto;
import it.logicadeisistemi.opustema.model.ContoCorrente;
import it.logicadeisistemi.opustema.service.GestioneCCService;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GestioneCCServiceImpl implements GestioneCCService {

    public static Logger logger = Logger.getLogger(GestioneCCServiceImpl.class);

    @Autowired
    GestioneCcDao gestioneCCDao;

    @Override
    @Transactional
    public List<ContoCorrente> aggiungiCC(GestioneCcDto dto) {

        // chiamata al DAO per aggiunta CC
        gestioneCCDao.aggiungiCc(dto);
        logger.debug("aggiunto cc");
        // chiamata al DAO con ritorno lista di contocorrente     
        return gestioneCCDao.findAll();
    }

    @Override
    @Transactional
    public List<ContoCorrente> eliminaCC(GestioneCcDto dto) {

        // chiamata al DAO per eliminazione CC
        gestioneCCDao.eliminaCc(dto);
        logger.debug("eliminato cc");
        // chiamata al DAO con ritorno lista di contocorrente    
        return gestioneCCDao.findAll();
    }

    @Override
    @Transactional
    public List<ContoCorrente> modificaCC(GestioneCcDto dto
    ) {

        // chiamata al DAO per modifica CC
        gestioneCCDao.modificaCc(dto);
        logger.debug("modificato cc");
        // chiamata al DAO con ritorno lista di contocorrente    
        return gestioneCCDao.findAll();
    }

}
