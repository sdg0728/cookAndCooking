package com.proj.command.recipe;

import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.recipe.RecipeDAO;
import com.proj.beans.recipe.RecipeDTO;

import common.Command;
import common.D;

public class RecipeListCommand implements Command {

	@Override
	public void execute(Model model) {
		
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		
		model.addAttribute("list", dao.select());
		
	}
	
	public List<RecipeDTO> getList(Model model) {
		
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		List<RecipeDTO> list = dao.select();
		
		return list;
		
	}

}
