package com.proj.command.userRecipe;


import org.springframework.ui.Model;

import com.command.ajax.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.Ur_commentDTO;

import common.Command;
import common.D;

public class UserCommentRecipeCommand implements Command{
	 @Override
	   public void execute(Model model) {
	      // TODO Auto-generated method stub
		   	UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
	        int insert = 0;
		   	Ur_commentDTO dto =(Ur_commentDTO)model.getAttribute("dto");
		   	System.out.println(dto);
	         StringBuffer message = new StringBuffer();
	         String status = "FAIL";
	         
	         try {         
	        	insert = dao.commentInsert(dto);
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
