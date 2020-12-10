package com.command.ajax.userRecipe;

import java.util.List;

//import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.proj.beans.userRecipe.RecipeWriteDTO;

@MapperScan
public interface IAjaxDAO {
	
	/**
	 * 페이징용 SELECT
	 * @param from : 몇번째 row 부터
	 * @param pageRows : 몇개의 데이터(게시글)
	 * @return  DTO 의 List
	 */
	/*
	 * public List<RecipeWriteDTO> selectFromRow(
	 * 
	 * @Param("from") int from,
	 * 
	 * @Param("pageRows") int pageRows );
	 */
	
	// 전체 글의 개수
	
	// 글 읽기
	public List<RecipeWriteDTO> selectByUid(int user_rid);
	
	

	
	// 글 수정
//	public int update(
//			@Param("uid") int uid,
//			@Param("subject") String subject,
//			@Param("content") String content
//			);
	public int update(RecipeWriteDTO dto);
	
	// 특정 uid 글(들) 삭제 하기
	public int deleteByUid(int [] uids);

}



















