package com.proj.command.admin;

import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.admin.AdminTotalPrice;
import com.proj.beans.admin.RecipeAdminDAO;
import com.proj.beans.purchase.PurchaseDTO;

import common.Command;
import common.D;

public class AdminSellListCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeAdminDAO dao = D.sqlSession.getMapper(RecipeAdminDAO.class);
		List<PurchaseDTO> list = dao.selectSelList(1, 10);
		List<AdminTotalPrice> list2 = dao.selectPrice();
		int totalPage = dao.adminCountAll();
		
		if(totalPage % 10 == 0) {
			totalPage /= 10;
		} else {
			totalPage = totalPage / 10 + 1;
		}
		
		int total = 0;
		for (AdminTotalPrice price : list2) {
			total += price.total();
		}
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("list", list);
	}

}
