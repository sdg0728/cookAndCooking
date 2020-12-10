package com.proj.command.cookingcls;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.RecipeDAO;
import com.command.ajax.cookingcls.UserInfoDAO;
import com.proj.beans.cookingcls.RecipeDTO;
import com.proj.beans.cookingcls.UserInfoDTO;

import common.Command;
import common.D;

public class RecipeViewCommand implements Command {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		Map<String, Object> map = model.asMap();
		String email = (String)map.get("username");
		
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		//new RecipeRidCommand().execute(model);
		List<RecipeDTO> list = dao.selectAll();
		UserInfoDAO user = D.sqlSession.getMapper(UserInfoDAO.class);
		UserInfoDTO dto = user.selectById(email);
		
		model.addAttribute("user_id", dto.getUser_id());
		model.addAttribute("list", list);
		
		
	}

}
