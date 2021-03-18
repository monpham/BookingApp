package com.example.demo.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Component
public class AuthenticationSuccessHandlerCustom implements AuthenticationSuccessHandler {
    private static final String PASSENGER_ROLE = "PASSENGER";
    private static final String ADMINISTRATOR_ROLE = "ADMINISTRATOR";
    private static final String EMPLOYEE_ROLE = "EMPLOYEE";

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        boolean isPassengerRole = false;
        boolean isAdministratorRole = false;
        boolean isEmployeeRole = false;

        List<GrantedAuthority> grantedAuthorities = (List<GrantedAuthority>) authentication.getAuthorities();
        for (GrantedAuthority grantedAuthority : grantedAuthorities) {
            if (grantedAuthority.getAuthority().equals(ADMINISTRATOR_ROLE)) {
                isAdministratorRole = true;
                break;
            } else if (grantedAuthority.getAuthority().equals(EMPLOYEE_ROLE)) {
                isEmployeeRole = true;
                break;
            } else if (grantedAuthority.getAuthority().equals(PASSENGER_ROLE)) {
                isPassengerRole = true;
                break;
            }
        }
        if (isAdministratorRole) {
            redirectStrategy.sendRedirect(httpServletRequest, httpServletResponse, "admin/adminHome");
        } else if (isEmployeeRole) {
            redirectStrategy.sendRedirect(httpServletRequest, httpServletResponse, "admin/adminHome");
        } else if (isPassengerRole) {
            redirectStrategy.sendRedirect(httpServletRequest, httpServletResponse, "/");
        } else {
            throw new IllegalStateException();
        }
    }
}
