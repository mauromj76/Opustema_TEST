package it.logicadeisistemi.opustema.service;

import it.logicadeisistemi.opustema.dto.GestioneCcDto;
import it.logicadeisistemi.opustema.model.ContoCorrente;
import java.util.List;

public interface GestioneCCService {

    List<ContoCorrente> aggiungiCC(GestioneCcDto dto);
    List<ContoCorrente> eliminaCC(GestioneCcDto dto);
    List<ContoCorrente> modificaCC (GestioneCcDto dto);
}
