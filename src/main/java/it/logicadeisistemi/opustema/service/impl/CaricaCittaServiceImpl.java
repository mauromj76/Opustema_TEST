package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.dao.CittaDao;
import it.logicadeisistemi.opustema.model.Citta;
import it.logicadeisistemi.opustema.service.CaricaCitiesService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CaricaCittaServiceImpl implements CaricaCitiesService {

    @Autowired
    CittaDao cittaDao;

    @Override
    @Transactional
    public List<Citta> carica() {
       Citta cx = new Citta("Napoli", "00222", "NA");
       cittaDao.salva(cx);
       cx = new Citta("Milano", "23456", "MI");
       cittaDao.salva(cx);
       cx = new Citta("Roma", "32456", "RM");
       cittaDao.salva(cx);
       
       return cittaDao.findAll();
    }
      
    
}
