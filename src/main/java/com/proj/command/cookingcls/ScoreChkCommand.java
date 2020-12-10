package com.proj.command.cookingcls;

import java.util.List;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.ACookingDAO;
import com.command.ajax.cookingcls.UserInfoDAO;
import com.proj.beans.cookingcls.CookingDTO;
import com.proj.beans.cookingcls.UserInfoDTO;

import common.Command;
import common.D;

public class ScoreChkCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		UserInfoDAO dao = D.sqlSession.getMapper(UserInfoDAO.class);
		  UserInfoDTO user = null;
		   
		   String email = (String)model.getAttribute("email");
		   
		   StringBuffer message = new StringBuffer();
		   String status = "FAIL";
		   
		   try {         
			   System.out.println("여기까진 오니..?");
			   user = dao.selectById(email); 
			   
		      if(user == null) {
		         message.append("[해당 데이터가 없습니다]");
		      } else {
		         status = "OK";
		      }
		   } catch (Exception e) {
		      e.printStackTrace();
		      message.append("[에러: " + e.getMessage() + "]");
		   }
		   
		   model.addAttribute("user", user);
		   model.addAttribute("status", status);
		   model.addAttribute("message", message.toString());
	}

}
