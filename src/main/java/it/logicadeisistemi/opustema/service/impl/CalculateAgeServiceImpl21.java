package it.logicadeisistemi.opustema.service.impl;

import org.springframework.stereotype.Service;
import it.logicadeisistemi.opustema.service.CalculateAgeService21;
import java.time.Year;

@Service
public class CalculateAgeServiceImpl21 implements CalculateAgeService21 {

    @Override
    public int ageCalc(int year) {
        return (Year.now().getValue() - year);  // simple, clean, all-in-one
    }

}
