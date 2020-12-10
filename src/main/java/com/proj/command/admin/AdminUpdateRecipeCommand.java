package com.proj.command.admin;

import org.springframework.ui.Model;

import com.proj.beans.admin.RecipeAdminDAO;

import common.Command;
import common.D;

public class AdminUpdateRecipeCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeAdminDAO dao = D.sqlSession.getMapper(RecipeAdminDAO.class);
		int result = 0;
		
		int pid = (Integer)model.getAttribute("pid");
		String p_img = (String)model.getAttribute("p_img");
		int price = (Integer)model.getAttribute("price");
		int kind = (Integer)model.getAttribute("kind");
		int taste = (Integer)model.getAttribute("taste");
		String content = (String)model.getAttribute("content");
		int count = (Integer)model.getAttribute("count");
		
		result = dao.recipeUpdate(pid, p_img, price, kind, taste, content, count);
		
		model.addAttribute("result", result);
	}

}
