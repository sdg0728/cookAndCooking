package com.command.ajax.admin;

import org.springframework.ui.Model;

import com.proj.beans.admin.RecipeAdminDAO;

import common.Command;
import common.D;

public class AdminApplyCheckCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeAdminDAO dao = D.sqlSession.getMapper(RecipeAdminDAO.class);
		int result1 = 0, result2 = 0;

		int applyno = (Integer) model.getAttribute("applyno");
		int a_check = (Integer) model.getAttribute("a_check");

		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {
			result1 = dao.applyCheck(applyno, a_check);
	         if(a_check == 1) {
	            result2 = dao.applyProduct(applyno);
	         } else if(a_check == 2) {
	            result2 = 1;
	         }

			if (result1 == 0) {
				message.append("[리스트할 데이터가 없습니다.]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			message.append("트랜젝션 에러: " + e.getMessage() + "]");
		}

		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("result1", result1);
		model.addAttribute("result2", result2);
		model.addAttribute("list", null);
	}

}
