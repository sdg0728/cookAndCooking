package com.command.ajax.userRecipe;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.UserRecipeDTO;

import common.Command;
import common.D;

public class AjaxUserRecipeSeleteUserIdCommand implements Command {

	@Override
	public void execute(Model model) {
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		List<Integer> noList = (List<Integer>)model.getAttribute("noList");
		List<UserRecipeDTO> list = new ArrayList<UserRecipeDTO>();
		
		try {
			
			UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
			for (int i = 0; i < noList.size(); i++) {
				List<UserRecipeDTO> temp = new ArrayList<UserRecipeDTO>();
				temp = dao.selectByRid(noList.get(i));
				list.addAll(temp);
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
