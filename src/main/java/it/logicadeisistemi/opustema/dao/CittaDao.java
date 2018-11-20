package it.logicadeisistemi.opustema.dao;

import it.logicadeisistemi.opustema.model.Citta;
import java.util.List;

public interface CittaDao {

    Citta salva(Citta c);

    List<Citta> findAll();
}
