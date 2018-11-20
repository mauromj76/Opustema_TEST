
package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.service.CiaoService21;
import org.springframework.stereotype.Service;

@Service
public class CiaoServiceImpl21 implements CiaoService21 {
    
    @Override
    public void stampaCiao (){
        System.out.println("Ciao"); 
    }
}
