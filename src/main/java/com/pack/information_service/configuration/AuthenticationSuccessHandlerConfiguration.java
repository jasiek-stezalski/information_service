package com.pack.information_service.configuration;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class AuthenticationSuccessHandlerConfiguration implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException {
        HttpSession session = httpServletRequest.getSession();
        String previousUrl = (String) session.getAttribute("previousUrl");
        if (previousUrl != null) {
            session.removeAttribute("previousUrl");
            httpServletResponse.sendRedirect(previousUrl);
        } else {
            httpServletResponse.sendRedirect("/mainPage");
        }

    }
}
