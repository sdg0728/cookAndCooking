package com.proj.command.userRecipe;

import java.util.HashMap;

import org.springframework.ui.Model;

import com.command.ajax.userRecipe.UserRecipeDAO;

import common.Command;
import common.D;

public class RecipeNotifySelectCommand implements Command {
	
	@Override
	public void execute(Model model) {
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		int result = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		int user_id =(Integer)model.getAttribute("user_id");
		int user_rid =(Integer)model.getAttribute("user_rid");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		map.put("user_id", user_id);
		map.put("user_rid", user_rid);
		try {			
	
			
			result = dao.notifySelect(map);
				
			if(result ==1 ) {
				model.addAttribute("notifydata", user_rid);
				status= "OK";
			}
				
			else
				status = "FAIL";
			
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[에러: " + e.getMessage() + "]");
		}
		model.addAttribute("result", result);
		
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		
		
	}
	
}
