package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.model.Citta;
import it.logicadeisistemi.opustema.service.CaricaCitiesService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CaricaCitiesController {

    @Autowired
    CaricaCitiesService caricaCitiesService;

    @RequestMapping(value = {"/caricaCities00"})
    public ModelAndView caricaCities() {
        ModelAndView mav = new ModelAndView("/home/lista-cities");
        List<Citta> lista = caricaCitiesService.carica();

        mav.addObject("elenco", lista);
        return mav;
    }

    @RequestMapping(value = {"/caricaCitiesStart00"})
    public ModelAndView caricaStart() {
        ModelAndView mav = new ModelAndView("/home/carica-citta");
        return mav;
    }

}
