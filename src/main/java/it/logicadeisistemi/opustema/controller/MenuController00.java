package it.logicadeisistemi.opustema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MenuController00 {
        @RequestMapping(value = {"/menua00"})
        public ModelAndView gestisciMenuA(){
            System.out.println("gestisciMenuA");
            ModelAndView mav = new ModelAndView("/home/itema00");
            return mav;
        }

        @RequestMapping(value = {"/start00"})
        public ModelAndView gestisciMenu(){
            System.out.println("gestisciMenu");
            ModelAndView mav = new ModelAndView("/home/menu00");
            return mav;
        }
}
