package com.proj.command.cookingcls;

import java.util.Map;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.UserInfoDAO;
import com.proj.beans.cookingcls.UserInfoDTO;

import common.Command;
import common.D;

public class CookNewCommand implements Command{

	
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = model.asMap();
		String email = (String)map.get("email");
		
		
		UserInfoDAO dao = D.sqlSession.getMapper(UserInfoDAO.class);
		UserInfoDTO dto = dao.selectById(email);
		model.addAttribute("user_id",dto.getUser_id());
		model.addAttribute("score",dto.getScore());
		
	}
}
