package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.service.CalculateAgeService21;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalculateAgeController21 {

    @Autowired
    private CalculateAgeService21 calcAgeServ21;

    @RequestMapping(value = {"/calcage-form21"})
    public ModelAndView showForm() {
        ModelAndView mav = new ModelAndView("/calcoloeta/calculateAge21");
        return mav;
    }

    @RequestMapping(value = {"/calcage21"})
    public ModelAndView findAge(@RequestParam("year") int year) {
        ModelAndView mav = new ModelAndView("/calcoloeta/calculateAgeResult21");
        mav.addObject("yourAge", calcAgeServ21.ageCalc(year));
        return mav;
    }

}
