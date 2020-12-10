package com.command.ajax.purchase;

import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.purchase.RecipeProductAjaxDAO;
import com.proj.beans.purchase.RecipeProductDTO;

import common.Command;
import common.D;

public class ARecipeProdInsertCommand implements Command{

	@Override
	public void execute(Model model) {
		RecipeProductAjaxDAO dao = D.sqlSession.getMapper(RecipeProductAjaxDAO.class);
		List<RecipeProductDTO> list = null;

		int pid = 0, count = 0, pchk = 0;
		String email = "", p_name = "", price = "";
		
		pid = (Integer)model.getAttribute("pid");
		p_name = (String)model.getAttribute("p_name");
		price = (String)model.getAttribute("price");
		count = (Integer)model.getAttribute("count");
		email = (String)model.getAttribute("email");
		pchk = (Integer)model.getAttribute("pchk");
		
		// response에 필요한 것들
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			dao.insertCart(email, pid, p_name, price, 0, pchk, count);
			status = "OK";
		} catch (Exception e) {
			message.append("트랜젝션 에러: " + e.getMessage() + "]");
		}

		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("list", list);
	}

}
