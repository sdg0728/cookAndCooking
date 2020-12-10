package com.proj.cookingAndCook;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.proj.command.purchase.WebconnCommand;
import com.proj.command.recommend.SearchRecipeCommand;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		try {
	         WebconnCommand webconnCommand = new WebconnCommand();
	        
	         model.addAttribute("list", webconnCommand.getProdList());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "index";
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
	
	@RequestMapping("/juso/apiSampleJSON")
	public void apiSampleJSON() {
		
	}
	
	@RequestMapping("/juso/apiSampleApplicationJSON")
	public void apiSampleApplicationJSON() {
		
	}
}
