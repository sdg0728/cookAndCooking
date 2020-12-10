package com.command.ajax.purchase;

import org.springframework.ui.Model;

import com.proj.beans.purchase.RecipeProductAjaxDAO;

import common.Command;
import common.D;

public class ABuyPurchaseCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeProductAjaxDAO dao = D.sqlSession.getMapper(RecipeProductAjaxDAO.class);
		
		int[] purchaseno = (int[])model.getAttribute("purchaseno");
		String name = (String)model.getAttribute("name");
		String phone = (String)model.getAttribute("phone");
		String address = (String)model.getAttribute("address");
		
		int result = 0, result2 = 0;
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {
			result = dao.buyCart(purchaseno, name, phone, address);
			result2 = dao.adminBuyCart(purchaseno);
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
		model.addAttribute("result2", result2);
		model.addAttribute("list", null);
	}

}
