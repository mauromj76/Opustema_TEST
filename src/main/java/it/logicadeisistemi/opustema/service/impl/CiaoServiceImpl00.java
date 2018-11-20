package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.service.CiaoService00;
import org.springframework.stereotype.Service;

@Service
public class CiaoServiceImpl00 implements CiaoService00{

    @Override
    public void stampaCiaone() {
        System.out.println("Ciao!");
    }
    
}
