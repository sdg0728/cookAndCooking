package com.proj.command.cookingcls;

import java.util.List;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.RecipeDAO;
import com.proj.beans.cookingcls.RecipeDTO;

import common.Command;
import common.D;

public class RecipeKindCommand implements Command{

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		 RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		   List<RecipeDTO> list = null;
		   
		   
		   StringBuffer message = new StringBuffer();
		   String status = "FAIL";
		   
		   try {         
			   
			   int kind = (Integer)model.getAttribute("kind");
			   
			   
			   if(kind==0) {
				   System.out.println("[readAll]");
				   list = dao.selectAll(); // 읽기
				   
			   }else {
				   list = dao.selectBykind(kind);
			   }
			   
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
