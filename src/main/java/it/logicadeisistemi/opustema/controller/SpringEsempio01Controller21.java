package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.service.SpringEsempioService21;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SpringEsempio01Controller21 {

    private static Logger logger = Logger.getLogger(SpringEsempio01Controller21.class);

    @Autowired
    SpringEsempioService21 SpringEsempioService21;

    // request invocata dalla pagina iniziale dopo l'input utente
    @RequestMapping("/eseguiesempio01")
    public ModelAndView eseguiEsempio01(
            @RequestParam("variabileinput01") int input01
    ) {
        ModelAndView mav = new ModelAndView();
        // int input01_ris = input01 * 100;
        mav.setViewName("/SpringEsempio01_21/risultatoesempio01");
//        int ris = SpringEsempioService21.calcoloPerCento(input01);
//        mav.addObject("variabileinput01_ris", ris);
        mav.addObject("variabileinput01_ris", SpringEsempioService21.calcoloPerCento(input01));
        return mav;
    }

    // inizializza la jsp iniziale
    @RequestMapping("/startesempio01")
    public ModelAndView startEsempio01() {
        ModelAndView mav = new ModelAndView("/SpringEsempio01_21/paginainiziale21");
        return mav;
    }

}
