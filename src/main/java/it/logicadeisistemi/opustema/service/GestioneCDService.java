package it.logicadeisistemi.opustema.service;


import it.logicadeisistemi.opustema.dto.ContoDepositoRichiestaDto;
import it.logicadeisistemi.opustema.dto.ContoDepositoRispostaDto;
/**
 *
 * @author Team Perugia
 */
public interface GestioneCDService {
    
    ContoDepositoRispostaDto addRecord(ContoDepositoRichiestaDto dto);
    
    
}
