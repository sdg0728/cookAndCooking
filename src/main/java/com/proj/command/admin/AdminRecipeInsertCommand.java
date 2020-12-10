package com.proj.command.admin;

import org.springframework.ui.Model;

import com.proj.beans.admin.RecipeAdminDAO;
import com.proj.beans.admin.RecipeProductDTO;

import common.Command;
import common.D;

public class AdminRecipeInsertCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeAdminDAO dao = D.sqlSession.getMapper(RecipeAdminDAO.class);
		RecipeProductDTO dto = (RecipeProductDTO)model.getAttribute("dto");
		int result = 0;
		dto.setKind();
		dto.setTaste();
		
		result = dao.addRecipeProduct(dto);

		model.addAttribute("result", result);
	}

}
