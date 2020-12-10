package com.proj.command.userRecipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.UserRecipeDTO;

import common.Command;
import common.D;

public class UserRecipeSelectByKindAndTasteCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		
		int kind = (Integer)map.get("kind");
		int taste = (Integer)map.get("taste");
		
		map2.put("kind", kind);
		map2.put("taste", taste);
		
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		
		model.addAttribute("list", dao.selectByKindAndTaste(map2));

	}
	
	public List<UserRecipeDTO> getList(Model model) {
		
		Map<String, Object> map = model.asMap();
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		int kind = (Integer)map.get("kind");
		int taste = (Integer)map.get("taste");
		
		map2.put("kind", kind);
		map2.put("taste", taste);
		
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		List<UserRecipeDTO> list = dao.selectByKindAndTaste(map2);
		
		return list;
	}

}
