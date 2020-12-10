package com.proj.command.userRecipe;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.UserRecipeDTO;

import common.Command;
import common.D;

public class UserRecipeSelectByKindCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		int kind = (Integer)map.get("kind");
		
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);

		model.addAttribute("list", dao.selectByKind(kind));
		
	}
	
	public List<UserRecipeDTO> getList(Model model) {
		Map<String, Object> map = model.asMap();
		
		int kind = (Integer)map.get("kind");
		
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		List<UserRecipeDTO> list = dao.selectByKind(kind);
		
		return list;
	}

}
