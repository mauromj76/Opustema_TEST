package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.dao.ContoPrestitoDao;
import it.logicadeisistemi.opustema.dto.ContoPrestitoDto;
import it.logicadeisistemi.opustema.model.ContoPrestito;
import it.logicadeisistemi.opustema.service.ContoPrestitoService;
import java.util.List;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Olbia
 */
@Service
public class ContoPrestitoServiceImpl implements ContoPrestitoService {

    public static Logger logger = Logger.getLogger(ContoPrestitoServiceImpl.class);

    @Autowired
    ContoPrestitoDao contoPrestitoDao;

    //salva solamente l'elemento passato
    @Override
    public ContoPrestito addConto(ContoPrestitoDto dto) {
        ContoPrestito conto = new ContoPrestito();
        conto.setCodiceCP(dto.getCodiceCP());
        contoPrestitoDao.save(conto);
        return conto;
    }

    //delete e ritorno lista
    @Override
    public List<ContoPrestito> deleteConto(ContoPrestitoDto dto) {
        List<ContoPrestito> conto;
        ContoPrestito prestito = new ContoPrestito();
        prestito.setCodiceCP(dto.getCodiceCP());
        conto = contoPrestitoDao.deleteConto(prestito);
        return conto;
    }

    //non fa nulla se non ritornare la lista
    @Override
    public List<ContoPrestito> listaContoPrestiti(ContoPrestitoDto dto) {
        List<ContoPrestito> conto;
        conto = contoPrestitoDao.listaConti();
        return conto;

    }

}
