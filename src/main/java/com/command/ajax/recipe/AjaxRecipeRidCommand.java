package com.command.ajax.recipe;

import java.util.List;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.RecipeDAO;
import com.proj.beans.cookingcls.RecipeDTO;

import common.Command;
import common.D;

public class AjaxRecipeRidCommand implements Command {

	@Override
	public void execute(Model model) {
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		List<RecipeDTO> list = null;
		

		int rid = (Integer)model.getAttribute("rid");
		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {         
			list = dao.selectByrid(rid); // 읽기
			
			if(list.size() == 0) {
				message.append("[해당 데이터가 없습니다]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[에러: " + e.getMessage() + "]");
		}

		model.addAttribute("list", list);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());

	}

}


