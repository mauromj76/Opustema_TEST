package it.logicadeisistemi.opustema.controller;

import it.logicadeisistemi.opustema.service.CoffeeShopService21;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CoffeeShopController21 {

    private static Logger logger = Logger.getLogger(CoffeeShopController21.class);    
    
    @Autowired
    private CoffeeShopService21 coffeShopServ21;

    @RequestMapping(value = {"/coffeeshop-form21"})
    public ModelAndView showForm() {
        ModelAndView mav = new ModelAndView("/scontrinoBar/coffeeShop21");
        return mav;
    }

    @RequestMapping(value = {"/coffees21"})
    public ModelAndView printReceipt(
            // too many parameter requests!
            // need to find a more compact form/way to submit them all at once
            @RequestParam("value01") double value01,
            @RequestParam("value02") double value02,
            @RequestParam("value03") double value03,
            @RequestParam("descr01") String descr01,
            @RequestParam("descr02") String descr02,
            @RequestParam("descr03") String descr03
    ) {
        ModelAndView mav = new ModelAndView();

        if (descr01.equals("acqua") && descr02.equals("pane")) 
        //        (coffeShopServ21.controlloIf(descr01, descr02))
        {
            mav.setViewName("/scontrinoBar/coffeeprova");

        } else {

            mav.setViewName("/scontrinoBar/coffeeShopReceipt21");

            // same situation as the one mentioned above
            // there are too many objects to add to the JSP
            // need to find a more compact form/way to submit them all at once
            mav.addObject("descr01", descr01);
            mav.addObject("descr02", descr02);
            mav.addObject("descr03", descr03);
            mav.addObject("value01", value01);
            mav.addObject("value02", value02);
            mav.addObject("value03", value03);
            mav.addObject("total", coffeShopServ21.printReceipt(value01, value02, value03));

        }
        return mav;
    }
}
