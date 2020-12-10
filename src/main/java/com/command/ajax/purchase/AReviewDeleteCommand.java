package com.command.ajax.purchase;

import org.springframework.ui.Model;

import com.proj.beans.purchase.RecipeProductAjaxDAO;

import common.Command;
import common.D;

public class AReviewDeleteCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeProductAjaxDAO dao = D.sqlSession.getMapper(RecipeProductAjaxDAO.class);
		
		int prid = (Integer)model.getAttribute("prid");
		int result = 0;
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {
			result = dao.delete(prid);

			if (result == 0) {
				message.append("[리스트할 데이터가 없습니다.]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("트랜젝션 에러: " + e.getMessage() + "]");
		}
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("result", result);
		model.addAttribute("list", null);

	}

}
