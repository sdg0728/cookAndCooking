package com.command.ajax.member;

import org.springframework.ui.Model;

import com.proj.beans.member.MemberDAO;

import common.Command;
import common.D;

public class EmailCheckAjaxCommand implements Command{

	@Override
	public void execute(Model model) {
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		String email = (String)model.getAttribute("email");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		int result = 0;
		
		try {
			
			result = dao.emailCheck(email);
			
			status = "OK";
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("result", result);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		
	}
	
}
