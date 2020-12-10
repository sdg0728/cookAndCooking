package com.proj.command.cookingcls;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.RecipeDAO;
import com.proj.beans.cookingcls.RecipeDTO;

import common.Command;
import common.D;

public class RecipeListCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		model.addAttribute("list", dao.selectAll());

	}

}
