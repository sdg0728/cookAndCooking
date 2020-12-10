package com.proj.command.admin;

import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.admin.RecipeAdminDAO;
import com.proj.beans.admin.RecipeProductDTO;

import common.Command;
import common.D;

public class AdminRecipeUpdateCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeAdminDAO dao = D.sqlSession.getMapper(RecipeAdminDAO.class);
		int pid = (Integer) model.getAttribute("pid");
		List<RecipeProductDTO> list = null;
		
		list = dao.selectByPid(pid);
		
		model.addAttribute("dto", list.get(0));
		
	}

}
