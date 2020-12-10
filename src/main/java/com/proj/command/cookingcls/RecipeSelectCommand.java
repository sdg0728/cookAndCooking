package com.proj.command.cookingcls;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.RecipeCommentDAO;
import com.proj.beans.cookingcls.RecipeCommentDTO;

import common.Command;
import common.D;

public class RecipeSelectCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		RecipeCommentDAO dao = D.sqlSession.getMapper(RecipeCommentDAO.class);
		List<RecipeCommentDTO> list = null;
		int rid = (Integer)model.getAttribute("rid");
   
	   StringBuffer message = new StringBuffer();
	   String status = "FAIL";
	   
	   try {         

		   list = dao.selectByrid(rid); // 읽기
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
