package com.proj.command.cookingcls;

import java.util.Map;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.RecipeDAO;

import common.Command;
import common.D;

public class RecipeDeleteCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		int rid = (Integer)map.get("rid");
		
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);	
	
		
		model.addAttribute("delete",dao.deleteByUserRid(rid));
		
	}

}
