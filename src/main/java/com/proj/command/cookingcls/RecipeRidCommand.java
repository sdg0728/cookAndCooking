package com.proj.command.cookingcls;

import java.util.List;

import com.command.ajax.cookingcls.RecipeDAO;
import com.proj.beans.*;
import com.proj.beans.cookingcls.PreferenceDTO;
import com.proj.beans.cookingcls.RecipeDTO;

import common.Command;
import common.*;

import org.springframework.ui.Model;

public class RecipeRidCommand implements Command{

	@Override
	public void execute(Model model) {
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		List<RecipeDTO> list = null;
		List<PreferenceDTO> pref = null;

		int rid = (Integer)model.getAttribute("rid");
		String user_id = (String)model.getAttribute("user_id");
		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {         
			list = dao.selectByrid(rid); // 읽기
			pref = dao.preferenceChk(rid, user_id);
			if(list.size() == 0 || pref == null) {
				message.append("[해당 데이터가 없습니다]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[에러: " + e.getMessage() + "]");
		}

		model.addAttribute("list", list);
		model.addAttribute("status", status);
		model.addAttribute("pref", pref);
		model.addAttribute("message", message.toString());

	}


}

