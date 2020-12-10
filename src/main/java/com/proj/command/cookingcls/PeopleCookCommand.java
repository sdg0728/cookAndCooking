package com.proj.command.cookingcls;

import java.util.List;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.ACookingDAO;
import com.command.ajax.cookingcls.CookRegDAO;
import com.proj.beans.cookingcls.CookRegDTO;
import com.proj.beans.cookingcls.CookingDTO;

import common.Command;
import common.D;

public class PeopleCookCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		CookRegDAO dao = D.sqlSession.getMapper(CookRegDAO.class);
		   List<CookRegDTO> list = null;
		  
		   int cno = (Integer)model.getAttribute("cno");
		   
		   StringBuffer message = new StringBuffer();
		   String status = "FAIL";
		   
		   try {         
			  list = dao.cookRegSel(cno);
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
