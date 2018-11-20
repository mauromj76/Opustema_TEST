package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.service.SommaService;
import org.springframework.stereotype.Service;

@Service
public class SommaServiceImpl implements SommaService {

    @Override
    public int somma(int o1, int o2) {
        return o1 + o2;
    }

}
