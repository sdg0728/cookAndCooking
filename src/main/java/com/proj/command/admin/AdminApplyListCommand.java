package com.proj.command.admin;

import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.admin.RecipeAdminDAO;
import com.proj.beans.purchase.ApplyRecipeDTO;

import common.Command;
import common.D;

public class AdminApplyListCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeAdminDAO dao = D.sqlSession.getMapper(RecipeAdminDAO.class);
		List<ApplyRecipeDTO> list = dao.selectApplyList();
		model.addAttribute("list", list);
	}

}
