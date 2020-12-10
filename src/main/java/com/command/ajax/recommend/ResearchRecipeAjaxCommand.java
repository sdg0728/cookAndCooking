package com.command.ajax.recommend;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.recipe.RecipeDAO;
import com.proj.beans.recipe.RecipeDTO;
import com.proj.beans.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.UserRecipeDTO;
import com.proj.command.recipe.RecipeListCommand;
import com.proj.command.recipe.RecipeSelectByKindAndTasteCommand;
import com.proj.command.recipe.RecipeSelectByKindCommand;
import com.proj.command.recipe.RecipeSelectByTasteCommand;
import com.proj.command.recipe.RecipeSelectCommand;
import com.proj.command.userRecipe.UserRecipeListCommand;
import com.proj.command.userRecipe.UserRecipeSelectByKindAndTasteCommand;
import com.proj.command.userRecipe.UserRecipeSelectByKindCommand;
import com.proj.command.userRecipe.UserRecipeSelectByTasteCommand;
import com.proj.command.userRecipe.UserRecipeSelectCommand;

import common.Command;
import common.D;

public class ResearchRecipeAjaxCommand implements Command {

	@Override
	public void execute(Model model) {
		
		//RecipeDAO dao1 = D.sqlSession.getMapper(RecipeDAO.class);
		//UserRecipeDAO dao2 = D.sqlSession.getMapper(UserRecipeDAO.class);
		
		String kind = (String)model.getAttribute("kinds");
		String taste = (String)model.getAttribute("tastes");
		String ingre = (String)model.getAttribute("ingre");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		List<RecipeDTO> rList1 = new ArrayList<RecipeDTO>();
		List<UserRecipeDTO> rList2 = new ArrayList<UserRecipeDTO>();
		
		List<Integer> res1 = new ArrayList<Integer>();
		List<Integer> res2 = new ArrayList<Integer>();
	
		try {
			
			if((!kind.equals("")) &&
					(taste.equals(""))) {
				
				String temp [] = kind.split(",");
				
				for (int i = 0; i < temp.length; i++) {
					int tempKind = Integer.parseInt(temp[i]);
					model.addAttribute("kind", tempKind);
					rList1.addAll(new RecipeSelectByKindCommand().getList(model));
					rList2.addAll(new UserRecipeSelectByKindCommand().getList(model));
				}
				
				status = "OK";
			}else if((kind.equals("")) &&
					(!taste.equals(""))) {
				
				String temp [] = taste.split(",");
				
				for (int i = 0; i < temp.length; i++) {
					int tempTaste = Integer.parseInt(temp[i]);
					model.addAttribute("taste", tempTaste);
					rList1.addAll(new RecipeSelectByTasteCommand().getList(model));
					rList2.addAll(new UserRecipeSelectByTasteCommand().getList(model));
				}
				
				status = "OK";
				
			}else if((!kind.equals("")) &&
					(!taste.equals(""))) {
				
				String temp1 [] = kind.split(",");
				String temp2 [] = taste.split(",");
				
				for (int i = 0; i < temp1.length; i++) {
					int tempKind = Integer.parseInt(temp1[i]);
					model.addAttribute("kind", tempKind);
					
					for (int j = 0; j < temp2.length; j++) {
						int tempTaste = Integer.parseInt(temp2[j]);
						model.addAttribute("taste", tempTaste);
						rList1.addAll(new RecipeSelectByKindAndTasteCommand().getList(model));
						rList2.addAll(new UserRecipeSelectByKindAndTasteCommand().getList(model));
					}
					
				}
				
				status = "OK";
			}else {
				rList1.addAll(new RecipeListCommand().getList(model));
				rList2.addAll(new UserRecipeListCommand().getList(model));
				status = "OK";
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		String arr [] = null;
		try {
	        
	         if(!ingre.equals("") || ingre != null) {
	        	
	        	
	        	arr = new String[ingre.split(",").length];
	        	
	        	if(arr.length > 0) {
			         for (int i = 0; i < arr.length; i++) {
						arr[i] = ingre.split(",")[i];
			         }
			         
			         model.addAttribute("arr", arr);
			         
			         if(arr != null) {
			 			for (int i = 0; i < arr.length; i++) {
			 				for (int j = 0; j < rList1.size(); j++) {
			 					
			 					if(rList1.get(j).getIngredient().contains(arr[i])) {
			 						if(i==0)
			 							res1.add(rList1.get(j).getRid());
			 					}else {
			 						
			 						if(res1.indexOf(rList1.get(j).getRid()) != -1) {
			 							int index = res1.indexOf(rList1.get(j).getRid());
			 							res1.remove(index);
			 						}
			 					}
			 				
			 				}
			 				
			 				for (int j = 0; j < rList2.size(); j++) {
			 					
			 					if(rList2.get(j).getIngredient().contains(arr[i])) {
			 						if(i==0)
			 							res2.add(rList2.get(j).getUser_rid());
			 					}else {
			 						
			 						if(res2.indexOf(rList2.get(j).getUser_rid()) != -1) {
			 							int index = res2.indexOf(rList2.get(j).getUser_rid());
			 							res2.remove(index);
			 						}
			 					}
			 				
			 				}
			 				
			 				
			 			}
			 		}
			         
		         }
	        	
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	
		model.addAttribute("list1", res1);
		model.addAttribute("list2", res2);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		new ResultRecommendAjaxCommand().execute(model);

	}

}
