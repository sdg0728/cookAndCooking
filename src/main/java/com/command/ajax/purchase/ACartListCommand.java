package com.command.ajax.purchase;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.purchase.PurchaseDTO;
import com.proj.beans.purchase.RecipeProductAjaxDAO;

import common.Command;
import common.D;

public class ACartListCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeProductAjaxDAO dao = D.sqlSession.getMapper(RecipeProductAjaxDAO.class);
		List<PurchaseDTO> list = new ArrayList<PurchaseDTO>();
		
		String email = (String)model.getAttribute("email");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {
			list = dao.cartList(email);

			if (list == null) {
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
		model.addAttribute("list", list);

	}

}
