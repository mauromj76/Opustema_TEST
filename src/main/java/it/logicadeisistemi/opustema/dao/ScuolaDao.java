package it.logicadeisistemi.opustema.dao;

import it.logicadeisistemi.opustema.model.Alunno;
import java.util.List;

public interface ScuolaDao {

    Alunno creaAlunno(Alunno a);
    
    List<Alunno> findAll();
}
