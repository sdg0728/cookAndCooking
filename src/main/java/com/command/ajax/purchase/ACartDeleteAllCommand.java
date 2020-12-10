package com.command.ajax.purchase;

import java.util.Arrays;

import org.springframework.ui.Model;

import com.proj.beans.purchase.RecipeProductAjaxDAO;

import common.Command;
import common.D;

public class ACartDeleteAllCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeProductAjaxDAO dao = D.sqlSession.getMapper(RecipeProductAjaxDAO.class);
		int result = 0;

		int[] purchaseno = (int[])model.getAttribute("purchaseno");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			if(purchaseno != null) {
				result = dao.deleteCartAll(purchaseno);
			}
			status = "OK";
		} catch (Exception e) {
			message.append("트랜젝션 에러: " + e.getMessage() + "]");
		}

		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("result", result);
	}

}
