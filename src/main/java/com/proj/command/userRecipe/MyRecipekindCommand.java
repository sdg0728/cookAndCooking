package com.proj.command.userRecipe;

import java.util.List;

import org.springframework.ui.Model;

import com.command.ajax.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.RecipeWriteDTO;

import common.Command;
import common.D;

public class MyRecipekindCommand implements Command {
	
	@Override
	public void execute(Model model) {
		UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
		List<RecipeWriteDTO> list = null;
		int kind = 0;
		
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {			
	
			kind = (Integer)model.getAttribute("kind");
			
			
			if(kind ==0) {
			list = dao.selectAll(); // 읽기
				System.out.println(list+"업어 ;;");
			}else {
				list= dao.selectBykind(kind);
			
			
			}if(list.size() == 0) {
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
