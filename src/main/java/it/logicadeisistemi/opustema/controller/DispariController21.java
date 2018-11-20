package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.service.DispariService21;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DispariController21 {
    
    @Autowired
    private DispariService21 dispserv21;
    
    @RequestMapping(value = {"/dispari-form21"})
    public ModelAndView mostraForm() {
        ModelAndView mav = new ModelAndView("/dispari/dispariform21");
        return mav;
    }

    @RequestMapping(value = {"/dispari21"})
    public ModelAndView checkNumero(
            @RequestParam("numero") int numero) {
        
        if (dispserv21.disparicheck(numero)){
            ModelAndView mav = new ModelAndView("/dispari/numerodispari21");
            mav.addObject("numero", numero);
            return mav;
        } else {
            ModelAndView mav = new ModelAndView("/dispari/numeropari21");
            mav.addObject("numero", numero);
            return mav;
        }
      
    }
    
}
