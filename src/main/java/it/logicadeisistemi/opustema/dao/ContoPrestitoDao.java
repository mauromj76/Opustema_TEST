package it.logicadeisistemi.opustema.dao;

import it.logicadeisistemi.opustema.model.ContoPrestito;
import java.util.List;

public interface ContoPrestitoDao {

    ContoPrestito save(ContoPrestito cp);

    List<ContoPrestito> listaConti();

    List<ContoPrestito> deleteConto(ContoPrestito cp);
    
}
