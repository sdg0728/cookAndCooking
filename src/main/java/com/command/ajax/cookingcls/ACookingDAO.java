package com.command.ajax.cookingcls;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.proj.beans.cookingcls.CookingDTO;

@MapperScan
public interface ACookingDAO {

	public List<CookingDTO> selectAll();
	public List<CookingDTO> signCls(String email);
	public List<CookingDTO> selectBycno(int cno);
	public int insertCook(CookingDTO dto);
	
	/// 관리자 a_cook_class
	public List<CookingDTO> myCls(String email);
	public int insert(CookingDTO dto);
	public List<CookingDTO> selectAdmin();
	public List<CookingDTO> selectByaCno(int cno);
	public int updateChk(CookingDTO dto);
	public int deleteByAcno(int cno);
	
}
