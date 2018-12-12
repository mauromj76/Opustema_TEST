package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.dto.ContoPrestitoDto;
import it.logicadeisistemi.opustema.model.ContoPrestito;
import it.logicadeisistemi.opustema.service.ContoPrestitoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin("*")
@RestController
public class ContoPrestitoController {

    @Autowired
    ContoPrestitoService cps;

    //salva e controlla se elemento gia esistente. ritorna la lista aggiornata
    @ResponseBody
    @RequestMapping(value = "addCP0423")
    public List<ContoPrestito> addAndLoad(@RequestBody ContoPrestitoDto dto) {
        List<ContoPrestito> conto;
        cps.addConto(dto);
        conto = cps.listaContoPrestiti(dto);
        return conto;
    }

    //chiamata per cancellare conto prestito e ricaricare lista aggiornata
    @ResponseBody
    @RequestMapping(value = "deleteCP0423")
    public List<ContoPrestito> deleteAndLoad(@RequestBody ContoPrestitoDto dto) {
        List<ContoPrestito> conto;
        conto = cps.deleteConto(dto);
        return conto;
    }
}
