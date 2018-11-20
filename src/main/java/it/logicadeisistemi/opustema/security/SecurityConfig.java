package it.logicadeisistemi.opustema.security;

import it.logicadeisistemi.opustema.controller.HomeController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        System.out.println("=======================> configureGlobal started");
//        auth.inMemoryAuthentication().withUser("cliente1!").password("cliente1!").authorities(SecurityRoles.CLIENTE);
//        auth.inMemoryAuthentication().withUser("affiliato1!").password("affiliato1!").authorities(SecurityRoles.AFFILIATO);
//        auth.inMemoryAuthentication().withUser("gestore1!").password("gestore1!").authorities(SecurityRoles.GESTORE);
//        auth.inMemoryAuthentication().withUser("devcli01").password("devcli01").authorities(SecurityRoles.CLIENTE);
//        auth.inMemoryAuthentication().withUser("devaff01").password("devaff01").authorities(SecurityRoles.AFFILIATO);
//        auth.inMemoryAuthentication().withUser("devges01").password("devges01").authorities(SecurityRoles.GESTORE);
//        auth.inMemoryAuthentication().withUser("tstcli01").password("tstcli01").authorities(SecurityRoles.CLIENTE);
//        auth.inMemoryAuthentication().withUser("tstaff01").password("tstaff01").authorities(SecurityRoles.AFFILIATO);
//        auth.inMemoryAuthentication().withUser("tstges01").password("tstges01").authorities(SecurityRoles.GESTORE);
//        auth.inMemoryAuthentication().withUser("super").password("super")
//                .authorities(SecurityRoles.CLIENTE,SecurityRoles.AFFILIATO,SecurityRoles.GESTORE);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        System.out.println("=======================> Configure security started 2");
        http.authorizeRequests()
                .antMatchers("/**").permitAll(); 
//                .antMatchers("/").access("hasRole('" + SecurityRoles.CLIENTE + "')")
                //                .antMatchers("/").permitAll()
                //                .antMatchers("/bol/hbol/**").permitAll()
                //                .antMatchers("/bol/dummy/**").permitAll()
                //                .antMatchers("/appws/app/**").permitAll()
                //                .antMatchers("/bol/secpub/**").permitAll()
                //                .antMatchers("/bol/risaffiliato/**").access("hasRole('" + SecurityRoles.AFFILIATO + "')")
                //                .antMatchers("/bol/riscliente/**").access("hasRole('" + SecurityRoles.CLIENTE + "')")
                //                .antMatchers("/bol/risgestore/**").access("hasRole('" + SecurityRoles.GESTORE + "')")
                //                .and()
                //                .formLogin().loginPage(HomeController.RQ_HOME_SLASH)
                //                .defaultSuccessUrl("/")
                //                .successHandler(new LoginSuccessHandler())
                //                .failureUrl(HomeController.RQ_HOME_SLASH + "?error")
                //                .usernameParameter("username").passwordParameter("password")
                //                .and()
                //                .logout().logoutSuccessUrl(HomeController.RQ_HOME_SLASH + "?logout");
                // excludes some paths from CSRF check for app
        http.csrf().ignoringAntMatchers("/**");

        // Activates session request cache to save request before redirecting to login
        http.requestCache().requestCache(new HttpSessionRequestCache());
    }

}
