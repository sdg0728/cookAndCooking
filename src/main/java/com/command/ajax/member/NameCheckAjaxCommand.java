package com.command.ajax.member;

import org.springframework.ui.Model;

import com.proj.beans.member.MemberDAO;

import common.Command;
import common.D;

public class NameCheckAjaxCommand implements Command {

	@Override
	public void execute(Model model) {
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		String name = (String)model.getAttribute("name");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		int result = 0;
		
		try {
			result = dao.nameCheck(name);
			
			status = "OK";
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("result", result);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		
	}

}
