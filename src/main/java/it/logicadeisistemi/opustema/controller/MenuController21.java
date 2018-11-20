package it.logicadeisistemi.opustema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MenuController21 {

    @RequestMapping(value = {"/menu21"})
    public ModelAndView gestisciMenuA() {
        System.out.println("gestisciMenua");
        ModelAndView mav = new ModelAndView("/home/item21");
        return mav;
    }
   
    @RequestMapping(value = {"/start21"})
    public ModelAndView gestisciMenu() {
        System.out.println("gestisciMenua");
        ModelAndView mav = new ModelAndView("/home/menu21");
        return mav;
    }
}
