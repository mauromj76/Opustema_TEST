package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.dao.ScuolaDao21;
import it.logicadeisistemi.opustema.model.Alunno21;
import it.logicadeisistemi.opustema.service.ScuolaService21;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ScuolaServiceImpl21 implements ScuolaService21 {

    @Autowired
    ScuolaDao21 scuolaDao21;

    @Override
    @Transactional
    public void testEntity21() {

        Alunno21 al_01 = new Alunno21();
        al_01.setCognome("Ciano");
        al_01.setNome("Aldebrando");
        Alunno21 al_02 = scuolaDao21.inserisciAlunno21(al_01);
        System.out.println("Alunno prima della creazione (a1) = " + al_01);
        System.out.println("Alunno dopo la scrittura su DB (a2) = " + al_02);
    }

    @Override
    public List<Alunno21> getAlunni21() {
        return scuolaDao21.findAll21();
    }

}
