package com.proj.command.recipeLike;

import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.like.RecipeLikeDAO;

import common.Command;
import common.D;

public class RecipeLikeSelectCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		int user_id = (Integer)map.get("user_id");
		
		RecipeLikeDAO dao = D.sqlSession.getMapper(RecipeLikeDAO.class);
		model.addAttribute("list", dao.selectByUid(user_id));

	}
	
	

}
