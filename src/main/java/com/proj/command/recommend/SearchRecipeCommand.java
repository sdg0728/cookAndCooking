package com.proj.command.recommend;

import java.util.ArrayList;
import java.util.List;
import org.springframework.ui.Model;

import com.proj.beans.recipe.RecipeDAO;
import com.proj.beans.recipe.RecipeDTO;
import com.proj.beans.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.UserRecipeDTO;

import common.Command;
import common.D;

public class SearchRecipeCommand implements Command {

	@Override
	public void execute(Model model) {
		
		RecipeDAO dao1 = D.sqlSession.getMapper(RecipeDAO.class);
		
		UserRecipeDAO dao2 = D.sqlSession.getMapper(UserRecipeDAO.class);
		
		String [] arr = (String[]) model.getAttribute("arr");
		
		List<RecipeDTO> list1 = dao1.select();
		List<UserRecipeDTO> list2 = dao2.select();
		
		List<Integer> res1 = new ArrayList<Integer>();
		List<Integer> res2 = new ArrayList<Integer>();
		
		if(arr != null) {
			for (int i = 0; i < arr.length; i++) {
				for (int j = 0; j < list1.size(); j++) {
					
					if(list1.get(j).getIngredient().contains(arr[i])) {
						if(i==0)
							res1.add(list1.get(j).getRid());
					}else {
						
						if(res1.indexOf(list1.get(j).getRid()) != -1) {
							int index = res1.indexOf(list1.get(j).getRid());
							res1.remove(index);
						}
					}
						
					
				}
				
				for (int j = 0; j < list2.size(); j++) {
					
					if(list2.get(j).getIngredient().contains(arr[i])) {
						if(i==0)
							res2.add(list2.get(j).getUser_rid());
					}else {
						
						if(res2.indexOf(list2.get(j).getUser_rid()) != -1) {
							int index = res2.indexOf(list2.get(j).getUser_rid());
							res2.remove(index);
						}
					}
						
				}
					
			}
		}
	
		model.addAttribute("list1", res1);
		model.addAttribute("list2", res2);
		
		new ResultRecommendCommand().execute(model);

	}

}
