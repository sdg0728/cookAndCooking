package com.proj.cookingAndCook;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.proj.beans.cookingcls.RecipeDTO;
import com.proj.command.cookingcls.AdminRecipeUp;
import com.proj.command.cookingcls.RecipeCommand;
import com.proj.command.cookingcls.RecipeDeleteCommand;
import com.proj.command.cookingcls.RecipeListCommand;
import com.proj.command.cookingcls.RecipeReadCommand;

import common.D;

@Controller
@RequestMapping("/admin")
public class AdminRecipeController {
	
	private SqlSession sqlSession;
	   
	   @Autowired
	   public void setSqlSession(SqlSession sqlSession) {
	      this.sqlSession = sqlSession;
	      D.sqlSession = sqlSession;
	   }
	
	
	@RequestMapping("/recipe/detail")
	public String recipeDetail(int rid ,Model model) {

		model.addAttribute("rid", rid);
		new RecipeReadCommand().execute(model);

		return "adminRecipe/recipeDetail";
	}
	

	@RequestMapping("/recipe/list")
	public String recipeList(Model model) {
		
		new RecipeListCommand().execute(model);
		
		return "adminRecipe/recipeList";
	}
	
	@RequestMapping("/recipe/deleteOk")
	public String recipeDelete(int rid, Model model) {
		
		model.addAttribute("rid",rid);
		new RecipeDeleteCommand().execute(model);
		
		
		return "adminRecipe/recipeDeleteOk";
	}
	
	
	@RequestMapping("/recipe/create")
	public String recipeCreate(RecipeDTO dto, Model model , HttpServletRequest request) {
		
		/// 1. sql 컬럼명 2. bean dto 3. input name
		
		
		return "adminRecipe/recipeWrite";
	}
	
	

	
	   @RequestMapping(value="/recipe/recipeWriteOk", method= RequestMethod.POST)
	   public String uploadRecipeOk(RecipeDTO dto,Model model,HttpServletRequest request, MultipartFile upload) throws IOException, Exception {
	      String uploadPath = request.getSession().getServletContext().getRealPath("/upload/recipe");
	         
	      System.out.println(uploadPath+"얘도 맞나 확인 uploadPath");
	      System.out.println(upload.getBytes()+"byte");
	         String savedName = upload.getOriginalFilename();
	         
	         System.out.println(savedName+" 이름 저장된 이름");
	         savedName = uploadFile(savedName, upload.getBytes(), uploadPath);
	               
	         upload.transferTo(new File(uploadPath+"/"+savedName));
	         System.out.println(uploadPath+"/"+savedName+"주소는 잘 찍히니?");
	         
	         dto.setImg(savedName);
	         model.addAttribute("dto", dto);
	         
	         new RecipeCommand().execute(model);	         
	         
	         return "adminRecipe/recipeWriteOk";
	   }
	
	@RequestMapping("/recipe/update")
	public String recipeUpdate(int rid,Model model) {
		
		model.addAttribute("rid", rid);
		new RecipeReadCommand().execute(model);
		
		
		return "adminRecipe/recipeUpdate";
	}

	
	@RequestMapping("/cooking")
	public String cooking() {
		
		return "adminCls/adminCooking";
	}
	
	
	 @RequestMapping("recipe/updateOk")
		public String updateRecipeOk2(Model model,HttpServletRequest request, MultipartFile upload, RecipeDTO dto) throws IOException, Exception {
	
		 if(upload.getOriginalFilename() != null && upload.getOriginalFilename() != ("")) {
	         String uploadPath = request.getSession().getServletContext().getRealPath("/upload/userRecipe");
	         
	         String savedName = upload.getOriginalFilename();
	         
	         savedName = uploadFile(savedName, upload.getBytes(), uploadPath);
	               
	         upload.transferTo(new File(uploadPath+"/"+savedName));
	         
	         dto.setImg(savedName);
	      }
		 
		 	model.addAttribute("dto",dto);
			 System.out.println("[DTO]" + dto);
			 new AdminRecipeUp().execute(model);
			 
			 return "adminRecipe/recipeWriteOk";
	 }
	
	
	 private String uploadFile(String originalName, byte [] fileData, String uploadPath) throws Exception {
         UUID uuid = UUID.randomUUID();
         
         String savedName = uuid.toString()+"_"+originalName;
         File target = new File(uploadPath, savedName);
         FileCopyUtils.copy(fileData, target);
         
         return savedName;
         
      }
	
	
}
