package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.service.SpringEsempioService21;
import org.springframework.stereotype.Service;

@Service
public class SpringEsempioServiceImpl21 implements SpringEsempioService21 {

    @Override
    public int calcoloPerCento(int var) {
        return (var*100);
    }      
}
