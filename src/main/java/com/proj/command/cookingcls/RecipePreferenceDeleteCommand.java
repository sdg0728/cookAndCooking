package com.proj.command.cookingcls;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.RecipeDAO;

import common.Command;
import common.D;

public class RecipePreferenceDeleteCommand implements Command {

	@Override
	public void execute(Model model) {
		int result = 0;
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		
		String user_id =(String)model.getAttribute("user_id");
		int rid =(Integer)model.getAttribute("rid");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {			
			result = dao.preferenceDel(rid, user_id);
			System.out.println("[result] " + result);	
			if(result != 0) {
				status= "OK";
			} else {
				status = "FAIL";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[에러: " + e.getMessage() + "]");
		}
		
		model.addAttribute("result", result);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("notifydata", 0);
	}

}
