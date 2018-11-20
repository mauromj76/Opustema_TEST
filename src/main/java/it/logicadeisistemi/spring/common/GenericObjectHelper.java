/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.logicadeisistemi.spring.common;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 *
 * @author Luca
 */
public class GenericObjectHelper {

    public static String stringify(Object ox) {
        return ToStringBuilder.reflectionToString(ox, ToStringStyle.JSON_STYLE);
    }

    public static String toJSON(Object object) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(SerializationFeature.INDENT_OUTPUT, false);
//        ObjectWriter ow = mapper.writer().withDefaultPrettyPrinter();
        String json = mapper.writeValueAsString(object);
        return json;
    }

    public static void printArray(Object[] arr) {
        if (arr == null) {
            System.out.println("printArray: passed object array is null!");
        } else {
            for (Object object : arr) {
                System.out.println("printArray: array element " + object);
            }
        }
    }
}
