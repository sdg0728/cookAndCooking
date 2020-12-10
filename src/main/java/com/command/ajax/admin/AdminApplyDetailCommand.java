package com.command.ajax.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.admin.AdminRecipeProductDTO;
import com.proj.beans.admin.RecipeAdminDAO;
import com.proj.beans.purchase.ApplyRecipeDTO;

import common.Command;
import common.D;

public class AdminApplyDetailCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeAdminDAO dao = D.sqlSession.getMapper(RecipeAdminDAO.class);
		List<ApplyRecipeDTO> list = new ArrayList<ApplyRecipeDTO>();

		int applyno = (Integer) model.getAttribute("applyno");

		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {
			list = dao.applyDetail(applyno);

			if (list == null) {
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
	}

}
