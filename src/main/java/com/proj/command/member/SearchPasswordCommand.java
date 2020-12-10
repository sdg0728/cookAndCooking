package com.proj.command.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.proj.beans.member.MemberDAO;
import com.proj.beans.member.MemberDTO;

import common.Command;
import common.D;

public class SearchPasswordCommand implements Command {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		String email = (String)map.get("email");
		String tel = (String)map.get("tel");
		
		map2.put("email", email);
		map2.put("tel", tel);
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		List<MemberDTO> list = dao.selectToPassword(map2);
		
		model.addAttribute("email", email);
		model.addAttribute("list", list);
		
		new PasswordUpdateCommand().execute(model);

	}

}
