package com.proj.command.cookingcls;

import java.util.Map;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.ACookingDAO;
import com.command.ajax.cookingcls.CookRegDAO;
import com.proj.beans.cookingcls.CookRegDTO;
import com.proj.beans.cookingcls.CookingDTO;

import common.Command;
import common.D;

public class CookRegisterCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		int insert = 0;
		Map<String, Object> map = model.asMap();
		CookRegDTO dto = (CookRegDTO)map.get("dto");
		CookRegDAO dao = D.sqlSession.getMapper(CookRegDAO.class);
			
		   StringBuffer message = new StringBuffer();
		   String status = "FAIL";
		   
		   try {         
			   System.out.println("여기까진 오니..?");
			   insert = dao.cookRegInsert(dto); 
			   
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
