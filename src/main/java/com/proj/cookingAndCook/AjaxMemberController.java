package com.proj.cookingAndCook;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.command.ajax.member.EmailCheckAjaxCommand;
import com.command.ajax.member.NameCheckAjaxCommand;
import com.proj.beans.member.SignCheckResult;

@RestController
@RequestMapping("/member")
public class AjaxMemberController {
	
	@RequestMapping("/email")
	public SignCheckResult emailCheck(Model model, HttpServletRequest request) {
		String email = request.getParameter("email");
		
		model.addAttribute("email", email);
		new EmailCheckAjaxCommand().execute(model);
		return bulidCheck(model);
		
	}
	
	@RequestMapping("/name")
	public SignCheckResult nameCheck(Model model, HttpServletRequest request) {
		String name = request.getParameter("name");
		model.addAttribute("name", name);
		new NameCheckAjaxCommand().execute(model);
		return bulidCheck(model);
	}
	
	public SignCheckResult bulidCheck(Model model) {
		SignCheckResult result = new SignCheckResult();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		result.setResult((Integer)model.getAttribute("result"));
		result.setCount((Integer)model.getAttribute("result"));
		
		return result;
		
	}
}
