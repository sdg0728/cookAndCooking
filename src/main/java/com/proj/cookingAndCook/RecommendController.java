package com.proj.cookingAndCook;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proj.command.purchase.WebconnCommand;
import com.proj.command.recommend.SearchRecipeCommand;

import common.Command;
import common.D;

@Controller
@RequestMapping("/recommend")
public class RecommendController {
	
	private Command command;
	
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		D.sqlSession = sqlSession;
	}

	@RequestMapping("/recommendAsIngredient")
	public String recommendAsIngredient(String ingredient, Model model) {
		
		String arr [] = null;
		try {
	         WebconnCommand webconnCommand = new WebconnCommand();
	        
	         model.addAttribute("list", webconnCommand.getProdList());
	        
	         if(!ingredient.equals("")) {
	        	
	        	arr = new String[ingredient.split(",").length];
	        	
	        	if(arr.length > 0) {
			         for (int i = 0; i < arr.length; i++) {
						arr[i] = ingredient.split(",")[i];
			         }
			         
			         model.addAttribute("arr", arr);
			         new SearchRecipeCommand().execute(model);
		         }
	        	
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
		
	      return "recommend/recommendAsIngredient";
		
	}
	
}
