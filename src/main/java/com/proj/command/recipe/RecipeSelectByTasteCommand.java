package com.proj.command.recipe;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.recipe.RecipeDAO;
import com.proj.beans.recipe.RecipeDTO;

import common.Command;
import common.D;

public class RecipeSelectByTasteCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		int taste = (Integer)map.get("taste");
		
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		
		model.addAttribute("list", dao.selectByTaste(taste));

	}
	
	public List<RecipeDTO> getList(Model model) {
		Map<String, Object> map = model.asMap();
		
		int taste = (Integer)map.get("taste");
		
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		List<RecipeDTO> list = dao.selectByTaste(taste);
		
		return list;
		
	}

}
