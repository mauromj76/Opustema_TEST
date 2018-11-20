package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.service.CiaoService00;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServizioProvaController00 {

    @Autowired
    private CiaoService00 ciaoService00;

    @RequestMapping(value = {"/ciao00/{p1}"})
    public ModelAndView stampaCiao(@PathVariable("p1") int p1) {
        System.out.println("p1 = " + p1);
        ciaoService00.stampaCiaone();
        ModelAndView mav = new ModelAndView();
        mav.setViewName(HomeController.VW_HOME_SLASH);
        return mav;
    }

    @RequestMapping(value = {"/param00"})
    public ModelAndView parametrico(@RequestParam("p1") int p1) {
        System.out.println("p1 = " + p1);
        ciaoService00.stampaCiaone();
        ModelAndView mav = new ModelAndView();
        mav.setViewName(HomeController.VW_HOME_SLASH);
        return mav;
    }

    @RequestMapping(value = {"/nominativo00"})
    public ModelAndView nominativo(
            @RequestParam("nome") String n,
            @RequestParam("cognome") String c) {
        System.out.println("Nome = " + n);
        System.out.println("Cognome = " + c);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/home/nome-result00");
        mav.addObject("firstName", n);
        mav.addObject("lastName", c);
        return mav;
    }

    @RequestMapping(value = {"/nominativoForm00"})
    public ModelAndView nominativoForm() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/home/nome-form00");
        return mav;
    }

}
