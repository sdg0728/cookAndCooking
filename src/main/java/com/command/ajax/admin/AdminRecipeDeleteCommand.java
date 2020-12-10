package com.command.ajax.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.admin.AdminRecipeProductDTO;
import com.proj.beans.admin.RecipeAdminDAO;

import common.Command;
import common.D;

public class AdminRecipeDeleteCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeAdminDAO dao = D.sqlSession.getMapper(RecipeAdminDAO.class);
		List<AdminRecipeProductDTO> list = new ArrayList<AdminRecipeProductDTO>();
		int result = 0, page = 0;

		int[] pid = (int[]) model.getAttribute("pid");

		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {
			result = dao.deleteRecipe(pid);
			page = dao.countAll();

			if (page % 10 == 0) {
				page /= 10;
			} else {
				page = page / 10 + 1;
			}

			for (int i = 0; i < page; i++) {
				list.add(new AdminRecipeProductDTO());
			}

			if (result == 0) {
				message.append("[리스트할 데이터가 없습니다.]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			message.append("트랜젝션 에러: " + e.getMessage() + "]");
		}

		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("list", list);
		model.addAttribute("result", result);
	}

}
