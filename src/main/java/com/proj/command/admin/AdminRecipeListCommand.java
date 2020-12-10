package com.proj.command.admin;

import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.admin.AdminRecipeProductDTO;
import com.proj.beans.admin.RecipeAdminDAO;

import common.Command;
import common.D;

public class AdminRecipeListCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeAdminDAO dao = D.sqlSession.getMapper(RecipeAdminDAO.class);
		List<AdminRecipeProductDTO> list = dao.select(1, 10);
		int count = dao.countAll();
		int totalPage = 0;
		
		for (AdminRecipeProductDTO dto : list) {
			dto.setR_score((double)((int)(dto.getR_score() * 10)) / 10); 
		}
		
		if(count % 10 == 0) {
			totalPage = count / 10;
		} else {
			totalPage = count / 10 + 1;
		}
		
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("list", list);

	}

}
