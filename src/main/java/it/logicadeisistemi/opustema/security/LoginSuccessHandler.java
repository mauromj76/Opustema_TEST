/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.logicadeisistemi.opustema.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

/**
 *
 * @author Luca
 */
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
     @Override
     public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                    Authentication authentication) throws ServletException, IOException {
         System.out.println("Entered ----------------- onAuthenticationSuccess");
         request.getSession().setMaxInactiveInterval(60 * 60); //one hour
         System.out.println("Session set up for 60min");
         super.onAuthenticationSuccess(request, response, authentication);
      }
     
     
}
