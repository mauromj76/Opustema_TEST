package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.dao.ScuolaDao;
import it.logicadeisistemi.opustema.model.Alunno;
import it.logicadeisistemi.opustema.service.ScuolaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ScuolaServiceImpl implements ScuolaService {

    @Autowired
    ScuolaDao scuolaDao;

    @Override
    @Transactional
    public void testEntity() {
        Alunno a = new Alunno();
        a.setCognome("Rossi");
        a.setNome("Mario");
        Alunno b = scuolaDao.creaAlunno(a);
        System.out.println("Alunno prima della creazione (a) = " + a);
        System.out.println("Alunno dopo la scrittura su DB (b) = " + b);
    }

    @Override
    public List<Alunno> getAlunni() {
        return scuolaDao.findAll();
    }
    
    

}
