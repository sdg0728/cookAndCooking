package com.proj.command.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.member.MemberDAO;

import common.Command;
import common.D;

public class PasswordChangeCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		String email = (String)map.get("email");
		String pw = (String)map.get("pw");
		HashMap<String, Object> map2 = new HashMap<String, Object>();

		map2.put("email", email);
		map2.put("pw", pw);
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		model.addAttribute("result", dao.updatePw(map2));
	}

}
