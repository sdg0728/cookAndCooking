package com.proj.command.cookingcls;

import java.util.List;

import org.springframework.ui.Model;

import com.command.ajax.cookingcls.RecipeDAO;
import com.proj.beans.cookingcls.PreferenceDTO;

import common.Command;
import common.D;

public class RecipePreferenceCommand implements Command {

	@Override
	public void execute(Model model) {
		int result = 0;
		RecipeDAO dao = D.sqlSession.getMapper(RecipeDAO.class);
		
		String user_id =(String)model.getAttribute("user_id");
		int rid =(Integer)model.getAttribute("rid");
		double preference =(Double)model.getAttribute("preference");
		List<PreferenceDTO> pref = null;
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {			
			result = dao.preference(rid, user_id, preference);
			pref = dao.preferenceChk(rid, user_id);
			
			if(result != 0 && pref != null) {
				status= "OK";
			} else {
				status = "FAIL";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[에러: " + e.getMessage() + "]");
		}
		
		model.addAttribute("result", result);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("notifydata", 0);
		model.addAttribute("pref", pref);
	}

}
