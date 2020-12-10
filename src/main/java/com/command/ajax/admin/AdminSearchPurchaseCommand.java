package com.command.ajax.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.admin.RecipeAdminDAO;
import com.proj.beans.purchase.PurchaseDTO;

import common.Command;
import common.D;

public class AdminSearchPurchaseCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeAdminDAO dao = D.sqlSession.getMapper(RecipeAdminDAO.class);
		List<PurchaseDTO> list = new ArrayList<PurchaseDTO>();
		
		String search = (String)model.getAttribute("search");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			Integer.parseInt(search);
			list = dao.serchPurchase1(search);
			
			if (list.size() == 0) {
				message.append("[리스트할 데이터가 없습니다.]");
			} else {
				status = "OK";
			}
		} catch (NumberFormatException e) {
			list = dao.serchPurchase2(search);
			
			if (list.size() == 0) {
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
