package com.command.ajax.purchase;

import org.springframework.ui.Model;

import com.proj.beans.purchase.RecipeProductAjaxDAO;

import common.Command;
import common.D;

public class ADeleteCartCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeProductAjaxDAO dao = D.sqlSession.getMapper(RecipeProductAjaxDAO.class);
		int result = 0;
		
		int purchaseno = (Integer)model.getAttribute("purchaseno");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {
			result = dao.deleteCart(purchaseno);

			if (result == 0) {
				message.append("[리스트할 데이터가 없습니다.]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[트랜젝션 에러: " + e.getMessage() + "]");
		}
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("list", null);
	}

}
