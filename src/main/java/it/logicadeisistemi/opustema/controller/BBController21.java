package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.service.BBService21;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BBController21 {

    // logger dichiarato static per accettare anche eventuali metodi statici
    private static Logger logger = Logger.getLogger(BBController21.class);

    @Autowired
    BBService21 BBService21;

    @RequestMapping("/giocabb21")
    public ModelAndView giocaBB21(
            @RequestParam("huten21") Integer huTen21,
            @RequestParam("bbesito21") String bbEsito21
    ) {
        logger.debug("Huten = " + huTen21);
        logger.debug("Bbesito = " + bbEsito21);
        ModelAndView mav = new ModelAndView();
        int c = BBService21.controllaTentativoHuman(huTen21);
        if (c == 0) {
            // il controllo del tentativo ha restituito zero
            // pertanto human ha indovinato il numero
            mav.setViewName("/bb21/vincehuman21");
        } else {
            mav.setViewName("/bb21/giocabb21");
            int t = BBService21.generaTentativoBB(bbEsito21);
            mav.addObject("tentativoBB21", t);
            if (c > 0) {
                // il controllo del tentativo ha restituito un valore maggiore
                // pertanto stampo "troppo grande"
                mav.addObject("esitoHu", huTen21 + " è troppo grande!");
            } else {
                // il controllo del tentativo ha restituito un valore minore
                // pertanto stampo "troppo piccolo"
                mav.addObject("esitoHu", huTen21 + " è troppo piccolo!");
            }
        }
        return mav;
    }

    @RequestMapping("/avviabb21")
    public ModelAndView initBB21() {
        ModelAndView mav = new ModelAndView("/bb21/giocabb21");
        BBService21.generaBBSegreto();
        // genero il primo tentativo di BB passando una stringa nulla perché non c'è un tentativo precedente
        int t = BBService21.generaTentativoBB("");
        mav.addObject("tentativoBB21", t);
        return mav;
    }

    @RequestMapping("/vincebb21")
    public ModelAndView vinceBB() {
        ModelAndView mav = new ModelAndView("/bb21/vincebb21");
        return mav;
    }
}
