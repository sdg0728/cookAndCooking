package com.proj.command.userRecipeLike;

import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.like.UserRecipeLikeDAO;
import com.proj.beans.like.UserRecipeLikeDTO;

import common.Command;
import common.D;

public class UserRecipeLikeListCommand implements Command {

	@Override
	public void execute(Model model) {
		
		UserRecipeLikeDAO dao = D.sqlSession.getMapper(UserRecipeLikeDAO.class);
		List<UserRecipeLikeDTO> list = dao.select();
		
		model.addAttribute("list", list);

	}
		
	public List<UserRecipeLikeDTO> giveList(Model model) {
		UserRecipeLikeDAO dao = D.sqlSession.getMapper(UserRecipeLikeDAO.class);
		List<UserRecipeLikeDTO> list = dao.select();
		model.addAttribute("list", list);
		
		return list;
	}

}
