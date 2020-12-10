package com.proj.cookingAndCook;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.proj.beans.admin.RecipeProductDTO;
import com.proj.beans.cookingcls.RecipeDTO;
import com.proj.command.admin.AdminApplyListCommand;
import com.proj.command.admin.AdminRecipeInsertCommand;
import com.proj.command.admin.AdminRecipeListCommand;
import com.proj.command.admin.AdminRecipeUpdateCommand;
import com.proj.command.admin.AdminSellListCommand;
import com.proj.command.admin.AdminUpdateRecipeCommand;
import com.proj.command.cookingcls.AdminRecipeUp;
import com.proj.command.cookingcls.RecipeReadCommand;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/admin_main")
	public String adminMain() {
		return "admin/admin_main";
	}
	
	@RequestMapping("/admin_member_list")
	public String list() {
		
		return "admin/admin_member_list";
	}
	
	@RequestMapping("/alist")
	public String alist(Model model) {
		new AdminRecipeListCommand().execute(model);
		
		return "admin/admin_prod_list";
	}
	
	@RequestMapping("/aplist")
	public String aplist(Model model) {
		new AdminApplyListCommand().execute(model);
		
		return "admin/apply_prod_list";
	}
	
	@RequestMapping("/slist")
	public String slist(Model model) {
		new AdminSellListCommand().execute(model);
		
		return "admin/admin_sell_list";
	}
	
	@RequestMapping("/aupdate")
	public String aupdate(Model model, int pid) {
		model.addAttribute("pid", pid);
		
		new AdminRecipeUpdateCommand().execute(model);
		
		return "admin/admin_prod_update";
	}
	
	@RequestMapping("/ainsert")
	public String ainsert() {
		return "admin/admin_prod_add";
	}
	
	@PostMapping("/ainsertOk")
	public String ainsertOk(HttpServletRequest request, Model model, MultipartFile upload, RecipeProductDTO dto) {
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/recipe");
		String savedName = upload.getOriginalFilename();
		
		try {
			savedName = uploadFile(savedName, upload.getBytes(), uploadPath);
			upload.transferTo(new File(uploadPath + "/" + savedName));
			dto.setP_img(savedName);
			model.addAttribute("dto", dto);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		new AdminRecipeInsertCommand().execute(model);
		
		return "admin/admin_prod_addOk";
	}
	
	@PostMapping("/updateOk")
	public String updateRecipe(HttpServletRequest request, Model model, MultipartFile upload,
			int pid, int price, int kind, int taste, String content, int count) {
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/recipe");
		String savedName = upload.getOriginalFilename();
		
		try {
			savedName = uploadFile(savedName, upload.getBytes(), uploadPath);
			upload.transferTo(new File(uploadPath + "/" + savedName));
			model.addAttribute("p_img", savedName);
			model.addAttribute("price", price);
			model.addAttribute("kind", kind);
			model.addAttribute("taste", taste);
			model.addAttribute("content", content);
			model.addAttribute("count", count);
			model.addAttribute("pid", pid);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		new AdminUpdateRecipeCommand().execute(model);
		
		return "admin/admin_prod_updateOk";
	}
	
	private String uploadFile(String originalName, byte [] fileData, String uploadPath) throws Exception {
	      UUID uuid = UUID.randomUUID();
	      
	      String savedName = uuid.toString()+"_"+originalName;
	      File target = new File(uploadPath, savedName);
	      FileCopyUtils.copy(fileData, target);
	      
	      return savedName;
	      
	}
	
}
