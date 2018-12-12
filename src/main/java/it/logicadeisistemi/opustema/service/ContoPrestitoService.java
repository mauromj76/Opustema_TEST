package it.logicadeisistemi.opustema.service;

import it.logicadeisistemi.opustema.dto.ContoPrestitoDto;
import it.logicadeisistemi.opustema.model.ContoPrestito;
import java.util.List;

/**
 *
 * @author Olbia
 */
public interface ContoPrestitoService {

    ContoPrestito addConto(ContoPrestitoDto dto);

    List<ContoPrestito> deleteConto(ContoPrestitoDto dto);

    List<ContoPrestito> listaContoPrestiti(ContoPrestitoDto dto);

}
