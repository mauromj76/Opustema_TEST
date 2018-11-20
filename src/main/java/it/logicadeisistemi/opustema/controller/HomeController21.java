package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.model.Alunno21;
import it.logicadeisistemi.opustema.service.ScuolaService21;
import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController21 {

    @Autowired
    ScuolaService21 scuolaService21;

    public static final boolean IS_DEBUG_VERSION = false;

    public static final String RQ_HOME_SLASH = "/req21";

    public static final String VW_HOME_SLASH = "/home/home";

    @RequestMapping(value = {RQ_HOME_SLASH, "/mj21", "/menua21"},
            method = RequestMethod.GET)
    public ModelAndView index() {

        System.out.println("Ciao21");

        ModelAndView mav = new ModelAndView();

        // sets the view
        mav.setViewName("/home/home21");  // ci vuole /home perché Spring ha fissato tale parametro
        String s = "Benvenuto/a " + LocalDate.now();
        mav.addObject("saluto", s);

        return mav;
    }

    @RequestMapping(value = {"/insalunno21"},
            method = RequestMethod.GET)
    public ModelAndView insAlunno21() {
        System.out.println("Inserisci Alunno21");
        ModelAndView mav = new ModelAndView();

        scuolaService21.testEntity21();

        List<Alunno21> lista = scuolaService21.getAlunni21();
        for (Alunno21 alunno_tmp : lista) {
            System.out.println(alunno_tmp);
        }
        mav.setViewName("/home/home21");
        String s = "Benvenuto/a " + LocalDate.now();
        mav.addObject("saluto", s);

        return mav;
    }
}
