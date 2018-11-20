package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.model.Citta1221;
import it.logicadeisistemi.opustema.service.CittaService1221;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CittaController1221 {
    
    @Autowired
    CittaService1221 cittaService1221;
         
    @RequestMapping(value = {"/stampacitta1221"})
    public ModelAndView testCitta1221(){
        ModelAndView mav = new ModelAndView("/home/stampacitta1221");
        List<Citta1221> citta1221 = cittaService1221.inserisci();
        
        mav.addObject("elencoCitta", citta1221);
        return mav;
    }
    
    @RequestMapping(value = {"/avviacitta1221"})
    public ModelAndView startCitta(){
        ModelAndView mav = new ModelAndView("/home/startcitta1221");
        return mav;
    }

}
