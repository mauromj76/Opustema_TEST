package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.dao.CittaDao1221;
import it.logicadeisistemi.opustema.model.Citta1221;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import it.logicadeisistemi.opustema.service.CittaService1221;

@Service
public class CittaServiceImpl1221 implements CittaService1221 {

    @Autowired
    CittaDao1221 cittaDao1221;

    @Override
    @Transactional
    public List<Citta1221> inserisci() {
        for (int i = 1; i <= 10; i++) {
            Citta1221 citta1221 = new Citta1221("Nome_" + i, "Cap_" + i, "Prov_" + i);
            cittaDao1221.crea(citta1221);
        }
        return cittaDao1221.findAll();
    }
}