package com.proj.command.recipe;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.recipe.RecipeDAO;
import com.proj.beans.recipe.RecipeDTO;

import common.Command;
import common.D;

public class RecipeSelectByKindCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		int kind = (Integer)map.get("kind");
		
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		
		model.addAttribute("list", dao.selectByKind(kind));

	}
	
	public List<RecipeDTO> getList(Model model) {
		Map<String, Object> map = model.asMap();
		
		int kind = (Integer)map.get("kind");
		
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		List<RecipeDTO> list = dao.selectByKind(kind);
		
		return list;
		
	}

}
