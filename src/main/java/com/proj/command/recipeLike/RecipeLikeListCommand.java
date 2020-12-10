package com.proj.command.recipeLike;

import java.util.List;

import org.springframework.ui.Model;

import com.proj.beans.like.RecipeLikeDAO;
import com.proj.beans.like.RecipeLikeDTO;


import common.Command;
import common.D;

public class RecipeLikeListCommand implements Command {

	@Override
	public void execute(Model model) {
		
		RecipeLikeDAO dao = D.sqlSession.getMapper(RecipeLikeDAO.class);
		List<RecipeLikeDTO> list = dao.select();
		
		model.addAttribute("list", list);

	}
		
	public List<RecipeLikeDTO> giveList(Model model) {
		RecipeLikeDAO dao = D.sqlSession.getMapper(RecipeLikeDAO.class);
		List<RecipeLikeDTO> list = dao.select();
		model.addAttribute("list", list);
		
		return list;
	}

}
