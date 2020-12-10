package com.proj.command.userRecipe;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.UserRecipeDTO;

import common.Command;
import common.D;

public class UserRecipeSelectByTasteCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		int taste = (Integer)map.get("taste");
		
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		
		model.addAttribute("list", dao.selectByTaste(taste));
	}
	
	public List<UserRecipeDTO> getList(Model model) {
		
		Map<String, Object> map = model.asMap();

		int taste = (Integer)map.get("taste");
				
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		List<UserRecipeDTO> list = dao.selectByTaste(taste);
		
		return list;
	}

}
