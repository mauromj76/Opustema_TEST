package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.service.BBService00;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service
public class BBServiceImpl00 implements BBService00 {

    private static Logger logger = Logger.getLogger(BBServiceImpl00.class);

    private int bbSegreto;
    private int minimo;
    private int massimo;
    private int ultimo;

    @Override
    public int generaBBSegreto() {
        bbSegreto = (int) Math.floor(Math.random() * 100 + 1);
        logger.debug("Numero segreto BB = " + bbSegreto);
        minimo = 1;
        massimo = 100;
        ultimo = 0;
        return bbSegreto;
    }

    @Override
    public int generaTentativoBB(String esito) {
        if (!esito.isEmpty()) {
            if (esito.equals("TG")) {
                massimo = ultimo;
            } else {
                minimo = ultimo;
            }
        }
        ultimo = (massimo + minimo) / 2;
        logger.debug("Tentativo BB = " + ultimo);
        return ultimo;

    }

    @Override
    public int checkTentativoHu(int num) {
        int res = num - bbSegreto;
        logger.debug("Esito tentativo HU " + res);
        return res;
    }
}
