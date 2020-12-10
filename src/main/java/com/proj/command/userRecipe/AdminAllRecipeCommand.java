package com.proj.command.userRecipe;


import java.util.Map;

import org.springframework.ui.Model;

import com.command.ajax.userRecipe.UserRecipeDAO;

import common.Command;
import common.D;

public class AdminAllRecipeCommand implements Command{
	
	@Override
	public void execute(Model model) {
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		Map<String, Object> map= model.asMap();
		model.addAttribute("list",dao.selectByAdminAll());
		
	
	}
}
