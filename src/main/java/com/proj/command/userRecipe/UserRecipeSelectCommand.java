package com.proj.command.userRecipe;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.UserRecipeDTO;

import common.Command;
import common.D;

public class UserRecipeSelectCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		int user_rid = (Integer)map.get("user_rid");
		
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		
		model.addAttribute("list", dao.selectByRid(user_rid));
	}
	
	public List<UserRecipeDTO> getList(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		int user_rid = (Integer)map.get("user_rid");
		
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		
		List<UserRecipeDTO> list = dao.selectByRid(user_rid);
		
		return list;
	}

}
