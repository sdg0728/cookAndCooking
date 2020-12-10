package com.proj.command.cookingcls;

import java.util.List;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.ACookingDAO;
import com.proj.beans.cookingcls.CookingDTO;

import common.Command;
import common.D;

public class AdminCookSelCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		ACookingDAO dao = D.sqlSession.getMapper(ACookingDAO.class);
		   List<CookingDTO> list = null;
		   
		 //  String email = (String)model.getAttribute("email");
		   
		   StringBuffer message = new StringBuffer();
		   String status = "FAIL";
		   
		   try {         
			   list = dao.selectAdmin(); // 읽기
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
