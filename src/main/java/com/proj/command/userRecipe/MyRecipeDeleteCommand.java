package com.proj.command.userRecipe;



import java.util.Map;

import org.springframework.ui.Model;

import com.command.ajax.userRecipe.UserRecipeDAO;

import common.Command;
import common.D;

public class MyRecipeDeleteCommand implements Command{
	
	@Override
	public void execute(Model model) {
	
	Map<String, Object> map= model.asMap();
	int user_rid = (Integer)map.get("user_rid");
	String email = (String)model.getAttribute("email");
	UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
	model.addAttribute("result",dao.deleteByUid(user_rid));
	model.addAttribute("email",email);
	
	}
}
