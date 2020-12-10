package com.command.ajax.recommend;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.recipe.RecipeDAO;
import com.proj.beans.recipe.RecipeDTO;
import com.proj.beans.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.UserRecipeDTO;

import common.Command;
import common.D;

public class ResultRecommendAjaxCommand implements Command {

	@Override
	public void execute(Model model) {
		
		List<Integer> list1 = (List<Integer>)model.getAttribute("list1");
		List<Integer> list2 = (List<Integer>)model.getAttribute("list2");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		List<RecipeDTO> res1 = new ArrayList<RecipeDTO>();
		List<UserRecipeDTO> res2 = new ArrayList<UserRecipeDTO>();
		
		try {
			RecipeDAO dao1 = D.sqlSession.getMapper(RecipeDAO.class);
			UserRecipeDAO dao2 = D.sqlSession.getMapper(UserRecipeDAO.class);
			
			for (int i = 0; i < list1.size(); i++) {
				List<RecipeDTO> temp1 = new ArrayList<RecipeDTO>();
				temp1 = dao1.selectByRid(list1.get(i));
				res1.addAll(temp1);
			}
			
			for (int i = 0; i < list2.size(); i++) {
				List<UserRecipeDTO> temp2 = new ArrayList<UserRecipeDTO>();
				temp2 = dao2.selectByRid(list2.get(i));
				res2.addAll(temp2);
			}
			
			status = "OK";
		}catch (Exception e) {
			status = "FAIL";
		}
		
		for (int i = 0; i < res1.size(); i++) {
			System.out.println(res1.get(i));
		}
			
		model.addAttribute("res1", res1);
		model.addAttribute("res2", res2);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());

	}

}
