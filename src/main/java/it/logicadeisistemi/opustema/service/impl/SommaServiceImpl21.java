package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.service.SommaService21;
import org.springframework.stereotype.Service;

@Service
public class SommaServiceImpl21 implements SommaService21 {

    @Override
    public int somma(int op1, int op2) {
        return op1 + op2;
    }

}
