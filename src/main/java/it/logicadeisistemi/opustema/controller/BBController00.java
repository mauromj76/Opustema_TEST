package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.service.BBService00;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BBController00 {

    private static Logger logger = Logger.getLogger(BBController00.class);

    @Autowired
    BBService00 bbService00;

    /**
     * Riceve dalla JSP centrale i dati di gioco:
     *
     * @param huTen numero inserito dall'umano
     * @param bbEsito TG per tentativo BB troppo grande, TP per troppo piccolo
     */
    @RequestMapping("/play00")
    public ModelAndView play(
            @RequestParam("huten") Integer huTen,
            @RequestParam("bbesito") String bbEsito
    ) {
        logger.debug("Huten = " + huTen);
        logger.debug("Bbesito = " + bbEsito);
        ModelAndView mav = new ModelAndView();
        int c = bbService00.checkTentativoHu(huTen);
        if (c == 0) {
            mav.setViewName("/bb00/huvince00");
        } else {
            mav.setViewName("/bb00/game00");
            int t = bbService00.generaTentativoBB(bbEsito);
            mav.addObject("tentativoBB", t);
            if (c > 0) {
                mav.addObject("esitoHu", huTen + " è troppo grande!");
            } else {
                mav.addObject("esitoHu", huTen + " è troppo piccolo!");
            }
        }

        return mav;
    }

    /**
     * Avvia il gioco
     */
    @RequestMapping("/init00")
    public ModelAndView init() {
        ModelAndView mav = new ModelAndView("/bb00/game00");
        bbService00.generaBBSegreto();
        int t = bbService00.generaTentativoBB("");
        mav.addObject("tentativoBB", t);
        return mav;
    }

    /**
     * Vittoria di BeepBlue
     */
    @RequestMapping("/vintoBB00")
    public ModelAndView bbVince() {
        ModelAndView mav = new ModelAndView("/bb00/bbvince00");
        return mav;
    }

}
