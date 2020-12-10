package com.proj.command.cookingcls;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.ACookingDAO;
import com.proj.beans.cookingcls.CookingDTO;

import common.Command;
import common.D;

public class CookInsertCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		CookingDTO dto = (CookingDTO)map.get("dto");
		ACookingDAO dao = D.sqlSession.getMapper(ACookingDAO.class);
	
		model.addAttribute("result",dao.insert(dto));
		
		
	}

}
