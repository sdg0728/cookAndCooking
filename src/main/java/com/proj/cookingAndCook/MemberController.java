package com.proj.cookingAndCook;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import com.proj.beans.member.MemberDTO;
import com.proj.command.member.MemberAuthWriteCommand;
import com.proj.command.member.MemberDeleteCommand;
import com.proj.command.member.MemberSelectEmailCommand;
import com.proj.command.member.MemberUpdateCommand;
import com.proj.command.member.MemberWriteCommand;
import com.proj.command.member.PasswordChangeCommand;
import com.proj.command.member.SearchEmailCommand;
import com.proj.command.member.SearchPasswordCommand;
import com.proj.command.purchase.WebconnCommand;
import com.proj.command.recommend.SearchRecipeCommand;
import com.proj.security.CustomNoOpPasswordEncoder;
import com.proj.validation.member.MemberValidator;

import common.Command;
import common.D;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private Command command;
	
	private SqlSession sqlSession;
	
	CustomNoOpPasswordEncoder pwencoder = new CustomNoOpPasswordEncoder();
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		D.sqlSession = sqlSession;
	}

	
	@RequestMapping("/login")
	public void login() {}
	
	@RequestMapping("/sign")
	public void sign() {}
	
	@RequestMapping("/jusoPopup")
	public void jusoPopup() {}
	
	@RequestMapping(value = "/signOk", method = RequestMethod.POST)
	public String signOk(MemberDTO dto, Model model, MultipartFile upload, HttpServletRequest request, BindingResult result) throws Exception {
		
		String uesrpw = dto.getPw();
		String pwd = pwencoder.encode(uesrpw);
		dto.setPw(pwd);
			
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/member");
		
		String savedName = upload.getOriginalFilename();
		
		if(savedName == null || savedName.equals("") || savedName.length() == 0) {
			dto.setImg("noimg.png");
		}else {
			savedName = uploadFile(savedName, upload.getBytes(), uploadPath);			
			upload.transferTo(new File(uploadPath+"/"+savedName));
			dto.setImg(savedName);
		}
		
		model.addAttribute("dto", dto);
		showErrors(result);
		
		new MemberWriteCommand().execute(model);
		
		new MemberAuthWriteCommand().execute(model);
		
		return "member/signOk";
	}
	
	@RequestMapping("/id_search")
	public String idSearch() {
		return "member/id_search";
	}
	
	@RequestMapping("/id_searchOk")
	public String idSearchOk(String name, String tel, Model model) {
		model.addAttribute("name", name);
		model.addAttribute("tel", tel);
		
		new SearchEmailCommand().execute(model);
		return "member/id_searchOk";
	}
	
	@RequestMapping("/pw_search")
	public String pwSearch() {
		
		return "member/pw_search";
	}
	
	@RequestMapping(value = "/pw_searchOk", method = RequestMethod.POST)
	public String pwSearchOk(String email, String tel, Model model) {
		
		model.addAttribute("email", email);
		model.addAttribute("tel", tel);
		
		new SearchPasswordCommand().execute(model);
		
		return "member/pw_searchOk";
	}
	
	@RequestMapping("/search_popup")
	public String searchPopUp(String name, String tel, Model model) {
		
		model.addAttribute("name", name);
		model.addAttribute("tel", tel);
		
		new SearchEmailCommand().execute(model);
		
		return "member/search_popup";
	}
	
	@RequestMapping("/myaccount")
	public String myAccount(String email, Model model) {
		
		model.addAttribute("email", email);
		
		new MemberSelectEmailCommand().execute(model);
		
		return "member/myaccount";
	}
	
	@RequestMapping(value =  "/user_updateOk", method = RequestMethod.POST)
	public String myAccountOk(MemberDTO dto, Model model, MultipartFile upload, HttpServletRequest request) throws IOException, Exception {
		
		if(upload.getOriginalFilename() != null && upload.getOriginalFilename() != ("")) {
			String uploadPath = request.getSession().getServletContext().getRealPath("/upload/member");
			
			String savedName = upload.getOriginalFilename();
			
			savedName = uploadFile(savedName, upload.getBytes(), uploadPath);
					
			upload.transferTo(new File(uploadPath+"/"+savedName));
			
			dto.setImg(savedName);
		}
		
		model.addAttribute("dto", dto);
		
		new MemberUpdateCommand().execute(model);
		
		return "member/user_updateOk";
	}
	
	@RequestMapping("/change_password")
	public String changePassword() {
		return "member/change_password";
	}
	
	@RequestMapping(value =  "/password_updateOk", method = RequestMethod.POST)
	public String PasswordUpdateOk(String email, String pw, Model model) {
		
		model.addAttribute("email", email);
		String uesrpw = pw;
		String pwd = pwencoder.encode(uesrpw);
		pw = pwd;
		model.addAttribute("pw", pw);
		
		new PasswordChangeCommand().execute(model);
		
		
		return "member/password_updateOk";
	}
	
	@RequestMapping("/membership_withdrawal")
	public String membershipWithdrawal() {
		return "member/membership_withdrawal";
	}
	
	@RequestMapping(value =  "/user_deleteOk", method = RequestMethod.POST)
	public String userDeleteOk(String email, String pw, Model model) {
		
		model.addAttribute("email", email);
		String uesrpw = pw;
		String pwd = pwencoder.encode(uesrpw);
		pw = pwd;
		model.addAttribute("pw", pw);
		
		new MemberDeleteCommand().execute(model);
		
		return "member/user_deleteOk";
	}
	
	@RequestMapping("/myPage")
	public String myPage(String email, Model model) {
		
		try {
	         WebconnCommand webconnCommand = new WebconnCommand();
	        
	         model.addAttribute("result", webconnCommand.getProdList());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("email", email);
		
		new MemberSelectEmailCommand().execute(model);
		return "/member/myPage";
	}
	
	public void showErrors(Errors errors) {
		if(errors.hasErrors()) {
			System.out.println("에러개수: " + errors.getErrorCount());
			System.out.println("\t[field]\t| [code]");
			List<FieldError> errList = errors.getFieldErrors();
			for (FieldError err : errList) {
				System.out.println("\t" + err.getField() + "\t| " + err.getCode());
			}
		} else {
			System.out.println("에러 없슴");
		}
	}
	
	// 이 컨트롤러 클래스의 handler 에서 폼 데이터를 바인딩할때 '검증'을 수행하는 객체 지정
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(new MemberValidator());
	}
	
	private String uploadFile(String originalName, byte [] fileData, String uploadPath) throws Exception {
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString()+"-"+originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
		
	}
	
}
