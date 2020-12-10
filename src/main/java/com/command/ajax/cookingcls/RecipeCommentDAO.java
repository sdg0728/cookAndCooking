package com.command.ajax.cookingcls;

import java.util.List;

import com.proj.beans.cookingcls.RecipeCommentDTO;

public interface RecipeCommentDAO {
	
	public List<RecipeCommentDTO> selectByrid(int rid);
	public int insertComment(RecipeCommentDTO dto);
	public int deleteComment(int cid);
	
	
}
