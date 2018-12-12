package it.logicadeisistemi.opustema.service;

import it.logicadeisistemi.opustema.dto.ClienteRichiestaDto;
import it.logicadeisistemi.opustema.dto.ClienteRispostaDto;
import java.util.List;

public interface ClienteService {

    List<ClienteRispostaDto> aggiungiCliente(ClienteRichiestaDto dto);

    List<ClienteRispostaDto> modificaCliente(ClienteRichiestaDto dto);

    List<ClienteRispostaDto> leggiClienti();

    List<ClienteRispostaDto> cancellaCliente(Long id);

}
