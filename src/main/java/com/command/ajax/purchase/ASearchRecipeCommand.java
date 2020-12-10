package com.command.ajax.purchase;

import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.purchase.RecipeProductAjaxDAO;
import com.proj.beans.purchase.RecipeProductDTO;

import common.Command;
import common.D;

public class ASearchRecipeCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeProductAjaxDAO dao = D.sqlSession.getMapper(RecipeProductAjaxDAO.class);
		List<RecipeProductDTO> list = null;

		// 페이징관련 세팅값
		String search = "";
		
		search = (String)model.getAttribute("search");
		
		// response에 필요한 것들
		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {

			list = dao.searchRecipe(search);

			if (list == null) {
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
