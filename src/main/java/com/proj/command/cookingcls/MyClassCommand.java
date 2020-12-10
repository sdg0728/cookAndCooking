package com.proj.command.cookingcls;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.ACookingDAO;
import com.proj.beans.cookingcls.CookingDTO;

import common.Command;
import common.D;

public class MyClassCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		String email = (String)map.get("email");
		
		ACookingDAO dao = D.sqlSession.getMapper(ACookingDAO.class);	
		List<CookingDTO> dto = dao.myCls(email);
	
		model.addAttribute("list", dto);
		
		
		
	}

}
