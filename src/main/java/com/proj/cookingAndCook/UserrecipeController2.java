package com.proj.cookingAndCook;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.proj.beans.userRecipe.RecipeWriteDTO;
import com.proj.command.userRecipe.AllRecipeCommand;
import com.proj.command.userRecipe.MyRecipeCommand;
import com.proj.command.userRecipe.MyRecipeDeleteCommand;
import com.proj.command.userRecipe.MyRecipeEditorCommand;
import com.proj.command.userRecipe.MyRecipeupdateCommand;
import com.proj.command.userRecipe.UserRecipeCommand;

import common.D;


@Controller
@RequestMapping(value= {"/userRecipe","/adminRecipe"})
public class UserrecipeController2 {

	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		D.sqlSession = sqlSession;
	}

	@RequestMapping("/allRecipe")
	public void allRecipe(Model model, String email) {
		System.out.println(email);
		model.addAttribute("email", email);
		new AllRecipeCommand().execute(model);
	}
	
	@RequestMapping("/uploadRecipe")
	public void uploadRecipe() {
		
	}
	
	@RequestMapping(value="/uploadRecipeOk", method=RequestMethod.POST)
	public void uploadRecipeOk(RecipeWriteDTO dto,Model model,HttpServletRequest request, MultipartFile upload) throws IOException, Exception {
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/userRecipe");
	     
	      String savedName = upload.getOriginalFilename();
	      
	      savedName = uploadFile(savedName, upload.getBytes(), uploadPath);
	            
	      upload.transferTo(new File(uploadPath+"/"+savedName));
	      
	      dto.setImg(savedName);
	      model.addAttribute("dto", dto);	
	      
	      new UserRecipeCommand().execute(model); 
	}
	
	@RequestMapping("/myRecipe")
	public void myrecipe(String email, Model model) {
		model.addAttribute("email", email);
		new MyRecipeCommand().execute(model);
		
	}
	
	 private String uploadFile(String originalName, byte [] fileData, String uploadPath) throws Exception {
	      UUID uuid = UUID.randomUUID();
	      String savedName = uuid.toString()+"_"+originalName;
	      File target = new File(uploadPath, savedName);
	      FileCopyUtils.copy(fileData, target);
	      return savedName;
	   }
	 
	 @PostMapping("/deleteOk")
		public void deleteOk(Model model, int user_rid, String email) {
		 	model.addAttribute("user_rid",user_rid);
		 	model.addAttribute("email",email);
			new MyRecipeDeleteCommand().execute(model);
		}
	 
	 @PostMapping("/deleteOk2")
		public void deleteOk2(Model model, int user_rid, String email) {
		 	model.addAttribute("user_rid",user_rid);
		 	model.addAttribute("email",email);
			new MyRecipeDeleteCommand().execute(model);
		}
	 
	 @PostMapping("/notifydeleteOk")
		public void notifydeleteOk(Model model, int user_rid, String email) {
		 	model.addAttribute("user_rid",user_rid);
		 	model.addAttribute("email",email);
			new MyRecipeDeleteCommand().execute(model);
		}
	 
	 @RequestMapping("/editorRecipe")
		public void editorRecipe(int user_rid, Model model) {
			 model.addAttribute("user_rid",user_rid);
			 new MyRecipeEditorCommand().execute(model);
		}
	 
	 @RequestMapping("/editorRecipeOk")
		public void editorRecipeOk(Model model,HttpServletRequest request, MultipartFile upload, RecipeWriteDTO dto) throws IOException, Exception {
	
		 if(upload.getOriginalFilename() != null && upload.getOriginalFilename() != ("")) {
	         String uploadPath = request.getSession().getServletContext().getRealPath("/upload/userRecipe");
	         
	         String savedName = upload.getOriginalFilename();
	         
	         savedName = uploadFile(savedName, upload.getBytes(), uploadPath);
	               
	         upload.transferTo(new File(uploadPath+"/"+savedName));
	         
	         dto.setImg(savedName);
	      }
		 
		 model.addAttribute("dto",dto);
			 System.out.println("[DTO]" + dto);
			 new MyRecipeupdateCommand().execute(model);
		}
}
