package com.proj.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class CustomAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		request.authenticate(response);
		System.out.println(accessDeniedException.getMessage());
		System.out.println("Access Denined Handler");
		System.out.println("에러처리후 redirec 합니다.");
		response.sendRedirect(request.getContextPath() + "/security/accessError");

	}

}
