package com.proj.command.cookingcls;

import java.util.List;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.ACookingDAO;
import com.proj.beans.cookingcls.CookingDTO;

import common.Command;
import common.D;

public class AdminCookPerCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		ACookingDAO dao = D.sqlSession.getMapper(ACookingDAO.class);
		  int update = 0;
		  CookingDTO dto = (CookingDTO)model.getAttribute("dto");
		  
		   
		   StringBuffer message = new StringBuffer();
		   String status = "FAIL";
		   
		   try {         
			   update = dao.updateChk(dto); // 읽기
			   System.out.println("update 가니 ?");
		      if(update == 0) {
		         message.append("[해당 데이터가 없습니다]");
		      } else {
		         status = "OK";
		      }
		   } catch (Exception e) {
		      e.printStackTrace();
		      message.append("[에러: " + e.getMessage() + "]");
		   }
		   
		   model.addAttribute("update", update);
		   model.addAttribute("status", status);
		   model.addAttribute("message", message.toString());
	}

}
