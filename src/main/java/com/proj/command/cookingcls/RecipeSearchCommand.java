package com.proj.command.cookingcls;

import java.util.List;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.RecipeDAO;
import com.proj.beans.cookingcls.RecipeDTO;

import common.Command;
import common.D;

public class RecipeSearchCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		  RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		   List<RecipeDTO> list = null;
		   
		   String search = (String)model.getAttribute("search");
		   
		   StringBuffer message = new StringBuffer();
		   String status = "FAIL";
		   
		   
		   
		   try {         
			   list = dao.search(search); // 읽기
			   System.out.println("command db는 다녀오니 ?");
			   
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
