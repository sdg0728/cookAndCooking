package com.command.ajax.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.admin.AdminTotalPrice;
import com.proj.beans.admin.RecipeAdminDAO;
import com.proj.beans.purchase.PurchaseDTO;
import com.proj.beans.recipe.RecipeDAO;

import common.Command;
import common.D;

public class AjaxPurchaseStateCommand implements Command {

	@Override
	public void execute(Model model) {
		
		RecipeAdminDAO dao = D.sqlSession.getMapper(RecipeAdminDAO.class);
		List<PurchaseDTO> temp = new ArrayList<PurchaseDTO>();
		List<Integer> list = new ArrayList<Integer>();
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			
			for (int i = 1; i <= 12; i++) {
				List<AdminTotalPrice> list2 = dao.selectPriceByDate(i+"");
				
				int total = 0;
				for (AdminTotalPrice price : list2) {
					total += price.total();
				}
				
				list.add(total);
				
			}
			
			status = "OK";
		}catch (Exception e) {
			status = "FAIL";
		}
		
		model.addAttribute("list", list);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		
	}

}
