package com.proj.command.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.member.MemberDAO;

import common.Command;
import common.D;

public class SearchEmailCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		String name = (String)map.get("name");
		String tel = (String)map.get("tel");
		
		map2.put("name", name);
		map2.put("tel", tel);
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		model.addAttribute("list", dao.selectToEmail(map2));

	}

}
