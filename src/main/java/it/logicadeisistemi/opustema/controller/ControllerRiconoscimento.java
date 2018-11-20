package it.logicadeisistemi.opustema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControllerRiconoscimento {

    @RequestMapping(value = {"/riconoscimento1"})
    public ModelAndView metodo1() {
        ModelAndView mav = new ModelAndView("/riconoscimento03/RiconoscimentoJspForm");

        return mav;
    }

    @RequestMapping(value = {"/riconoscimento2"})
    public ModelAndView metodo2(
            @RequestParam("username") String user,
            @RequestParam("password") String pass) {
        
        ModelAndView mav = new ModelAndView();
        
        if((user.equals("Lorenzo") && pass.equals("Cappelli"))){
            
            mav.setViewName("/riconoscimento03/IdentificatoJSP");
            
        }else{
            mav.setViewName("/riconoscimento03/NonIdentificatoJSP");
            
        }

        return mav;
    }
}