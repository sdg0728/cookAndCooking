package com.proj.command.userRecipeLike;

import java.util.Map;

import org.springframework.ui.Model;


import com.proj.beans.like.UserRecipeLikeDAO;

import common.Command;
import common.D;

public class UserRecipeLikeSelectCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		int user_id = (Integer)map.get("user_id");
		
		UserRecipeLikeDAO dao = D.sqlSession.getMapper(UserRecipeLikeDAO.class);
		model.addAttribute("list", dao.selectByUid(user_id));

	}
	
	

}
