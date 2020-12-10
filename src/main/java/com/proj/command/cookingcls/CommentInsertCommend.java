package com.proj.command.cookingcls;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.RecipeCommentDAO;
import com.command.ajax.cookingcls.RecipeDAO;
import com.proj.beans.cookingcls.RecipeCommentDTO;
import com.proj.beans.cookingcls.RecipeDTO;

import common.Command;
import common.D;

public class CommentInsertCommend implements Command{

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
			Map<String, Object> map = model.asMap();
			RecipeCommentDTO dto = (RecipeCommentDTO)map.get("dto");
			RecipeCommentDAO dao = D.sqlSession.getMapper(RecipeCommentDAO.class);
			int insert = 0;
		   
			System.out.println("content"+dto.getContent());
			
		   String search = (String)model.getAttribute("search");
		   
		   StringBuffer message = new StringBuffer();
		   String status = "FAIL";
		   
		   insert = dao.insertComment(dto); // 읽기
		   
		   
		   try {         
			   System.out.println("command db는 다녀오니 ?");
			   
		      if(insert == 0) {
		         message.append("[해당 데이터가 없습니다]");
		      } else {
		         status = "OK";
		      }
		   } catch (Exception e) {
		      e.printStackTrace();
		      message.append("[에러: " + e.getMessage() + "]");
		   }
		   
		   model.addAttribute("insert", insert);
		   model.addAttribute("status", status);
		   model.addAttribute("message", message.toString());
	}
	
}
