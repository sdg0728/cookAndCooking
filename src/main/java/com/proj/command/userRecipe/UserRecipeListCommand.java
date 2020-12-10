package com.proj.command.userRecipe;

import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.UserRecipeDTO;

import common.Command;
import common.D;

public class UserRecipeListCommand implements Command {

	@Override
	public void execute(Model model) {
		
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		
		model.addAttribute("list", dao.select());

	}
	
	public List<UserRecipeDTO> getList(Model model) {
		
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		
		List<UserRecipeDTO> list = dao.select();
		
		return list;
	}

}
