package com.command.ajax.cookingcls;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.proj.beans.cookingcls.PreferenceDTO;
import com.proj.beans.cookingcls.RecipeDTO;

@MapperScan
public interface RecipeDAO {
	
	public List<RecipeDTO> selectAll();
	public RecipeDTO select(int rid);
	public int insert(RecipeDTO dto);
	public int deleteByUserRid(int rid);
	public List<RecipeDTO> search(String name);
	
	
	public List<RecipeDTO> selectBykind(int kind);
	
	public int preference(@Param("user_rid")int user_rid, @Param("user_id")String user_id, @Param("preference")double preference);
	public int preferenceDel(@Param("user_rid")int user_rid, @Param("user_id")String user_id);
	public List<PreferenceDTO> preferenceChk(@Param("user_rid")int user_rid, @Param("user_id")String user_id);
	public List<RecipeDTO> selectByrid(int rid);
	public int update(int rid, @Param("a") RecipeDTO dto);
}
