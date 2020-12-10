package com.command.ajax.userRecipe;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.UserRecipeDTO;

import common.Command;
import common.D;

public class AjaxUserRecipeRidCommand implements Command {

	@Override
	public void execute(Model model) {
		
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		List<UserRecipeDTO> list = new ArrayList<UserRecipeDTO>();
		
		int rid = (Integer)model.getAttribute("rid");

		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			list = dao.selectByRid(rid);
			if(list.size() == 0) {
				message.append("[해당 데이터가 없습니다]");
			} else {
				status = "OK";
			}
		}catch (Exception e) {
			status = "FAIL";
		}
		
		model.addAttribute("list", list);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());

	}

}