
package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.service.DispariService21;
import org.springframework.stereotype.Service;

@Service
public class DispariServiceImpl21 implements DispariService21 {

    @Override
    public boolean disparicheck(int num1) {
        boolean dispari=true;
        if (num1 % 2 == 0) dispari=false;
        return dispari;
    }
    
}
