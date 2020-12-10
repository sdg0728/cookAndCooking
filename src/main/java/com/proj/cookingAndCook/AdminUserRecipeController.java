package com.proj.cookingAndCook;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proj.command.userRecipe.AdminAllRecipeCommand;
import com.proj.command.userRecipe.AdminNotifyRecipeCommand;
import com.proj.command.userRecipe.AllRecipeCommand;

import common.D;


@Controller
@RequestMapping("/adminRecipe")
public class AdminUserRecipeController {

private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		D.sqlSession = sqlSession;
	}	
	
	
	@RequestMapping("/adminAllRecipe")
	public void adminAllRecipe(Model model) {
			//model.addAttribute("user_rid", user_rid);
			new AdminAllRecipeCommand().execute(model);
		}
		
		
	

	@RequestMapping("/adminWarningRecipe")
	public void adminWarningRecipe(Model model) {
		new AdminNotifyRecipeCommand().execute(model);
		
	}
}
