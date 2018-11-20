package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.service.CoffeeShopService21;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service
public class CoffeeShopServiceImpl21 implements CoffeeShopService21 {

    private static Logger logger = Logger.getLogger(CoffeeShopServiceImpl21.class);
    
    @Override
    public double printReceipt(
            double value01,
            double value02,
            double value03) {
        return (value01 + value02 + value03); // simple, clean, all-in-one      
    }

    @Override
    public boolean controlloIf(String descr01, String descr02) {
        boolean checkCorretto = false;
        logger.debug("check = " + checkCorretto);
        logger.debug("descr01 = " + descr01);
        logger.debug("descr02 = " + descr02);
        
        if (descr01.equals("acqua") && descr02.equals("pane")) {
            checkCorretto = true;
        }
        logger.debug("check dopo = " + checkCorretto);
        return checkCorretto;
    }

}
