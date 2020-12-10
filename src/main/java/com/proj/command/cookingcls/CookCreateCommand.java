package com.proj.command.cookingcls;

import java.util.Map;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.ACookingDAO;
import com.command.ajax.cookingcls.UserInfoDAO;
import com.proj.beans.cookingcls.CookingDTO;
import com.proj.beans.cookingcls.UserInfoDTO;

import common.Command;
import common.D;

public class CookCreateCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
			
		int insert = 0;
		Map<String, Object> map = model.asMap();
		CookingDTO dto = (CookingDTO)map.get("dto");
		ACookingDAO dao = D.sqlSession.getMapper(ACookingDAO.class);
			
		   StringBuffer message = new StringBuffer();
		   String status = "FAIL";
		   
		   try {         
			   System.out.println("여기까진 오니..?");
			   insert = dao.insert(dto); 
			   
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
