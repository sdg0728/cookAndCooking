package com.command.ajax.recipe;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.recipe.RecipeDAO;
import com.proj.beans.recipe.RecipeDTO;

import common.Command;
import common.D;

public class AjaxRecipeSeleteUserIdCommand implements Command {

	@Override
	public void execute(Model model) {
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		List<Integer> noList = (List<Integer>)model.getAttribute("noList");
		List<RecipeDTO> list = new ArrayList<RecipeDTO>();
		
		try {
			
			RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
			for (int i = 0; i < noList.size(); i++) {
				List<RecipeDTO> temp = new ArrayList<RecipeDTO>();
				temp = dao.selectByRid(noList.get(i));
				list.addAll(temp);
			}
			
			status = "OK";
		}catch (Exception e) {
			status = "FAIL";
		}
		
		model.addAttribute("list", list);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());

	}

}
