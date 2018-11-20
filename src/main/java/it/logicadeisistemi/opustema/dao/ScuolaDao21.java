package it.logicadeisistemi.opustema.dao;

import it.logicadeisistemi.opustema.model.Alunno21;
import java.util.List;

public interface ScuolaDao21 {
    Alunno21 inserisciAlunno21(Alunno21 a);
    List<Alunno21> findAll21();
}
