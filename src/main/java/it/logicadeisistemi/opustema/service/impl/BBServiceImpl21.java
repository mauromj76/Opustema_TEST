package it.logicadeisistemi.opustema.service.impl;

import it.logicadeisistemi.opustema.service.BBService21;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service
public class BBServiceImpl21 implements BBService21 {

    private static Logger logger = Logger.getLogger(BBServiceImpl21.class);

    private int bbSegreto;
    private int minimo;
    private int massimo;
    private int ultimo;

    @Override
    public int generaBBSegreto() {
        bbSegreto = (int) Math.floor(Math.random() * 100 + 1);
        logger.debug("Numero segreto BB = " + bbSegreto);
        //inizializzazione limiti ed ultimo valore tentato
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
        // la variabile ultimo adesso diventa il prossimo tentativo di BB
        ultimo = (massimo + minimo) / 2;
        logger.debug("Tentativo BB = " + ultimo);
        // viene restituito il tentativo successivo
        return ultimo;
    }

    @Override
    public int controllaTentativoHuman(int num) {
        /* si possono avere tre casi, maggiore, minore od uguale
        ** questo è il metodo che solitamente si utilizza
        ** restituisce un valore negativo se è minore
        ** un valore positivo se è maggiore
        ** zero se è uguale
        */
        int res = num - bbSegreto;
        logger.debug("Esito tentativo HU " + res);
        return res;
    }
}