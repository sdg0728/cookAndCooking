package com.command.ajax.userRecipe;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.proj.beans.userRecipe.PreferenceDTO;
import com.proj.beans.userRecipe.RecipeWriteDTO;
import com.proj.beans.userRecipe.Ur_commentDTO;


@MapperScan
public interface UserRecipeDAO {
	public List<RecipeWriteDTO> select();
	public List<RecipeWriteDTO> selectByEmail(String email);
	public List<RecipeWriteDTO> selectByAllEmail(String email);
	public List<RecipeWriteDTO> selectByUid(int user_rid);
	public List<RecipeWriteDTO> selectByAdminAll();
	public List<RecipeWriteDTO> selectByRecipe(RecipeWriteDTO dto); //레시피 설명 갖고오는 거 
	public List<RecipeWriteDTO> selectBykind(int kind);
	public List<RecipeWriteDTO> selectAll();
	public List<RecipeWriteDTO> selectByNotify();
	public List<PreferenceDTO> preferenceChk(@Param("user_rid")int user_rid, @Param("user_id")String user_id);
	public List<RecipeWriteDTO> search(String search);
	public int commentInsert(Ur_commentDTO dto);
	public List<Ur_commentDTO> selectByCommentRid(int user_rid);
	public int deleteComment(int cid);
	public int notifyInsert(HashMap<String, Object>map);
	public int notifydelete(HashMap<String, Object>map);
	public int notifySelect(HashMap<String, Object>map);
	public int insert(RecipeWriteDTO dto);
	public int update(int user_rid, @Param("a") RecipeWriteDTO dto);
	public int deleteByUid(int user_rid);
	public int preference(@Param("user_rid")int user_rid, @Param("user_id")String user_id, @Param("preference")double preference);
	public int preferenceDel(@Param("user_rid")int user_rid, @Param("user_id")String user_id);
	public int userScore(@Param("preference") double preference,@Param("user_id") String user_id);
}