package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.service.CiaoService21;
import it.logicadeisistemi.opustema.service.SommaService21;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ServizioProvaController21 {

    @Autowired
    private CiaoService21 ciao21;

    @RequestMapping(value = {"/ciao21/{p1}"})
    public ModelAndView stampaCiao(@PathVariable(name = "p1") int p1) {
        ciao21.stampaCiao();
        System.out.println("p1 = " + p1);
        ModelAndView mav = new ModelAndView();
        mav.setViewName(HomeController.VW_HOME_SLASH);
        return mav;
    }

    @RequestMapping(value = {"/param21"})
    public ModelAndView parametrico(@RequestParam("p1") int p1) {
        System.out.println("p1 = " + p1);
        ModelAndView mav = new ModelAndView();
        mav.setViewName(HomeController.VW_HOME_SLASH);
        return mav;
    }

    @RequestMapping(value = {"/nominativoform21"})
    public ModelAndView nominativoForm() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/home/nome-form21");
        return mav;
    }

    @RequestMapping(value = {"/nominativo21"})
    public ModelAndView nominativo(
            @RequestParam("nome") String n,
            @RequestParam("cognome") String c) {
        System.out.println("Nome = " + n);
        System.out.println("Cognome = " + c);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/home/nome-result21");
        mav.addObject("firstname", n); // passiamo una variabile jsp dove mettere il nome ed una per il cognome
        mav.addObject("lastname", c);
        return mav;
    }

    @Autowired
    private SommaService21 sommaService;

    @RequestMapping(value = {"/sommaform21"})
    public ModelAndView sommaForm() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("/home/somma-form21");
        return mav;
    }

    @RequestMapping(value = {"/somma21"})
    public ModelAndView somma(
            @RequestParam("Numero1") int add1,
            @RequestParam("Numero2") int add2) {
        // System.out.println("Nome = " + n);
        // System.out.println("Cognome = " + c);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("/home/somma-risultato21");
        mav.addObject("primonum", add1); // passiamo una variabile jsp dove mettere il nome ed una per il cognome
        mav.addObject("secondonum", add2);
        mav.addObject("risultato", sommaService.somma(add1, add2));

        // mav.addObject("risultato", (add1 + add2)); // lo sposto nel servizio
        return mav;
    }
}
