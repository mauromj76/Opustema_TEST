package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.service.SetteService21;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GameRPGController21 {
    
    @Autowired
    private SetteService21 ss;
    
    @RequestMapping(value = {"/startRPG21"})
    public ModelAndView goCampo() {
        System.out.println("Campo");
        ModelAndView mav = new ModelAndView("/home/campo21");
        int i = ss.algoritmoSette();
        System.out.println("Il risultato dell'algoritmo è " + i);
        return mav;
    }
   
    @RequestMapping(value = {"/grotta21"})
    public ModelAndView goGrotta() {
        System.out.println("Grotta");
        ModelAndView mav = new ModelAndView("/home/grotta21");
        return mav;
    }
    
    @RequestMapping(value = {"/castello21"})
    public ModelAndView goCastello() {
        System.out.println("Castello");
        ModelAndView mav = new ModelAndView("/home/castello21");
        return mav;
    }
    
    @RequestMapping(value = {"/paese21"})
    public ModelAndView goPaese() {
        System.out.println("Pause");
        ModelAndView mav = new ModelAndView("/home/paese21");
        return mav;
    }
    
    @RequestMapping(value = {"/buca21"})
    public ModelAndView goBuca() {
        System.out.println("Buca");
        ModelAndView mav = new ModelAndView("/home/buca21");
        return mav;
    }
    
    @RequestMapping(value = {"/drago21"})
    public ModelAndView goDrago() {
        System.out.println("Drago");
        ModelAndView mav = new ModelAndView("/home/drago21");
        return mav;
    }

}
