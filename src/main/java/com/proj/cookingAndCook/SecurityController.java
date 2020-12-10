package com.proj.cookingAndCook;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/security")
public class SecurityController {
	
	@GetMapping("/accessError")
	public void accessError() {
		
	}
	
	@RequestMapping("/login")
	public void login(String error, String logout, Model model) {
		if(error != null) {
			System.out.println("ERROR!!!!!");
			model.addAttribute("error", "Login Error Check your account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!");
		}
	}
	
	@PostMapping("/logout")
	public void logoutGET() {}
}
