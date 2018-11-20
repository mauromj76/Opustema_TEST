package it.logicadeisistemi.opustema.security;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

public class AuthenticationManagerBoL implements AuthenticationManager {

    @Override
    public Authentication authenticate(Authentication auth) throws AuthenticationException {
//
//        List<GrantedAuthority> res = utenteRegistratoBolDao.checkCredentials(auth.getName(), (String) auth.getCredentials());
//
//        if (res == null) {
//            throw new BadCredentialsException("Bad Credentials");
//        }
//        return new UsernamePasswordAuthenticationToken(auth.getName(),
//                auth.getCredentials(), res);
        return null;
    }

}
