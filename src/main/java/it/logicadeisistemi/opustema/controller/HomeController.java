package it.logicadeisistemi.opustema.controller;

import java.time.LocalDate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    public static final boolean IS_DEBUG_VERSION = false;

    public static final String RQ_HOME_SLASH = "/" ;
    
    public static final String VW_HOME_SLASH = "/home/home";

    
    @RequestMapping(value = {RQ_HOME_SLASH},
            method = RequestMethod.GET)
    public ModelAndView index() {

        ModelAndView mav = new ModelAndView();

        // sets the view
        mav.setViewName(VW_HOME_SLASH);
        String s = "Benvenuto/a " + LocalDate.now();
        mav.addObject("saluto", s);

        return mav;
    }

}
