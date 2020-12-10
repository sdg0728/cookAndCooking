package com.command.ajax.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.UserRecipeDTO;

import common.Command;
import common.D;

public class AjaxUserRecipeStateCommand implements Command {

	@Override
	public void execute(Model model) {
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		List<UserRecipeDTO> temp = new ArrayList<UserRecipeDTO>();
		List<Integer> list = new ArrayList<Integer>();
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			
			temp = dao.select();
			int arr [] = new int[6];
			for (int i = 0; i < temp.size(); i++) {
				switch (temp.get(i).getKind()) {
				case 1:
					arr[0] += 1;
					break;
				case 2:
					arr[1] += 1;
					break;
				case 3:
					arr[2] += 1;
					break;
				case 4:
					arr[3] += 1;
					break;
				case 5:
					arr[4] += 1;
					break;
				case 6:
					arr[5] += 1;
					break;
				default:
					break;
				}
			}
			
			list.add(arr[0]);
			list.add(arr[1]);
			list.add(arr[2]);
			list.add(arr[3]);
			list.add(arr[4]);
			list.add(arr[5]);
			
			status = "OK";
			
		}catch (Exception e) {
			status = "FAIL";
		}
		
		model.addAttribute("list", list);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString()); 

	}

}
