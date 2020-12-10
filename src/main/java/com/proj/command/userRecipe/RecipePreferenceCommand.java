package com.proj.command.userRecipe;

import org.springframework.ui.Model;

import com.command.ajax.userRecipe.UserRecipeDAO;

import common.Command;
import common.D;

public class RecipePreferenceCommand implements Command {

	@Override
	public void execute(Model model) {
		int result = 0;
		int result2 = 0;
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		
		String email =(String)model.getAttribute("email");
		int user_rid =(Integer)model.getAttribute("user_rid");
		String user_id =(String)model.getAttribute("user_id");
		double preference =(Double)model.getAttribute("preference");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {			
			result = dao.preference(user_rid, email, preference);
			result2 = dao.userScore(preference, user_id);	
			if(result != 0 && result2 != 0) {
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
