package com.proj.command.purchase;

import org.springframework.ui.Model;

import com.proj.beans.purchase.ApplyRecipeDTO;
import com.proj.beans.purchase.RecipeProductDAO;

import common.Command;
import common.D;

public class RecipeApplyCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeProductDAO dao = D.sqlSession.getMapper(RecipeProductDAO.class);
		
		ApplyRecipeDTO dto = (ApplyRecipeDTO) model.getAttribute("dto");
		int result = 0;
		
		result = dao.applyRecipe(dto);
		
		model.addAttribute("result", result);
	}

}
