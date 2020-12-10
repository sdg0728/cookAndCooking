package com.proj.beans.member;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface MemberDAO {
	public List<MemberDTO> select();
	public List<MemberDTO> selectByUserId(int user_id);
	public List<MemberDTO> selectByEmail(String email);
	public int selectUserIdByEmail(String email);
	public int insert(MemberDTO dto);
	public int emailCheck(String email);
	public int nameCheck(String name);
	public int update(MemberDTO dto);
	public int delete(HashMap<String, Object> map);
	public List<MemberDTO> selectToEmail(HashMap<String, Object> map);
	public List<MemberDTO> selectToPassword(HashMap<String, Object> map);

	public int updatePw(HashMap<String, Object> map);
	
	public int insertTOUserInfoAuth(MemberAuthDTO dto);
	public int deleteTOUserInfoAuth(String email);
	
	public List<MemberDTO> searchMember(HashMap<String, Object> map);
	public List<String> selectName(String email);
	public List<String> selectNameByUserId(int user_id);
	
}
