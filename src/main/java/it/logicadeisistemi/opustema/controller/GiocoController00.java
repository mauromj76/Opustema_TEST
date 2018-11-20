package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.service.SetteService00;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GiocoController00 {

    @Autowired
    private SetteService00 ss;

    // Commento
    @RequestMapping(value = {"/gioca00"})
    public ModelAndView gioca() {
        System.out.println("Sout modificata");
        ModelAndView mav = new ModelAndView("/home/campo00");
        System.out.println("Discente 20");
        int i = ss.algoritmoSette();
        System.out.println("Risultato dell'algoritmo " + i);
        return mav;
    }

    @RequestMapping(value = {"/grotta00"})
    public ModelAndView goGrotta() {
        ModelAndView mav = new ModelAndView("/home/grotta00");
        return mav;
    }

    @RequestMapping(value = {"/castello00"})
    public ModelAndView goCastello() {
        ModelAndView mav = new ModelAndView("/home/castello00");
        
        String[] setteNani = {"Brontolo","Mammolo", "Pisolo","Cucciolo", "Eolo","Dotto","Gongolo"};
        mav.addObject("nani",setteNani);
        return mav;
    }

    @RequestMapping(value = {"/fiume00"})
    public ModelAndView goFiume() {
        ModelAndView mav = new ModelAndView("/home/paese00");
        return mav;
    }

    @RequestMapping(value = {"/torre00"})
    public ModelAndView goTorre() {
        ModelAndView mav = new ModelAndView("/home/drago00");
        return mav;
    }

    @RequestMapping(value = {"/scale00"})
    public ModelAndView goScale() {
        ModelAndView mav = new ModelAndView("/home/buca00");
        return mav;
    }

}
