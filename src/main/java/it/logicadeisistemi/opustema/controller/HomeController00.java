package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.model.Alunno;
import it.logicadeisistemi.opustema.service.ScuolaService;
import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController00 {

    @Autowired 
    ScuolaService scuolaService;
    
    public static final boolean IS_DEBUG_VERSION = false;

    public static final String RQ_HOME_SLASH = "/req00";

    public static final String VW_HOME_SLASH = "/home/home";

    @RequestMapping(value = {RQ_HOME_SLASH, "/luca00"},
            method = RequestMethod.GET)
    public ModelAndView index() {
        System.out.println("Ciao00");
        ModelAndView mav = new ModelAndView();

        // sets the view
        mav.setViewName("/home/home00");
        String s = "Benvenuto/a " + LocalDate.now();
        mav.addObject("saluto", s);

        return mav;
    }

    @RequestMapping(value = {"/insalunno00"},
            method = RequestMethod.GET)
    public ModelAndView insAlunno() {
        System.out.println("Insalunno");
        ModelAndView mav = new ModelAndView();

        scuolaService.testEntity();
        
        List<Alunno> lista = scuolaService.getAlunni();
        for (Alunno alunno : lista) {
            System.out.println(alunno);
        }
        
        // sets the view
        mav.setViewName("/home/home00");
        String s = "Benvenuto/a " + LocalDate.now();
        mav.addObject("saluto", s);

        return mav;
    }
}
