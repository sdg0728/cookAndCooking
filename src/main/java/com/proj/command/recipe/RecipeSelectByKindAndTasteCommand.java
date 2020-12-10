package com.proj.command.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.recipe.RecipeDAO;
import com.proj.beans.recipe.RecipeDTO;

import common.Command;
import common.D;

public class RecipeSelectByKindAndTasteCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		
		int kind = (Integer)map.get("kind");
		int taste = (Integer)map.get("taste");
		
		map2.put("kind", kind);
		map2.put("taste", taste);
		
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		
		model.addAttribute("list", dao.selectByKindAndTaste(map2));

	}
	
	public List<RecipeDTO> getList(Model model) {
		Map<String, Object> map = model.asMap();
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		int kind = (Integer)map.get("kind");
		int taste = (Integer)map.get("taste");
		
		map2.put("kind", kind);
		map2.put("taste", taste);
		
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		List<RecipeDTO> list = dao.selectByKindAndTaste(map2);
		
		return list;
		
	}

}
