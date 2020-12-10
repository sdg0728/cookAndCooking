package com.command.ajax.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.admin.RecipeAdminDAO;

import common.Command;
import common.D;

public class AdminSellUpdataCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeAdminDAO dao = D.sqlSession.getMapper(RecipeAdminDAO.class);
		int result = 0, result2 = 0;
		
		int purchaseno = (Integer)model.getAttribute("purchaseno");
		int deliverchk = (Integer)model.getAttribute("deliverchk");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			result = dao.updateDeliver(purchaseno, deliverchk);
			result2 = dao.updateADeliver(purchaseno, deliverchk);

			if (result == 0 || result2 == 0) {
				message.append("[리스트할 데이터가 없습니다.]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			message.append("트랜젝션 에러: " + e.getMessage() + "]");
		}

		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("result", result);
		model.addAttribute("result2", result2);
	}

}
