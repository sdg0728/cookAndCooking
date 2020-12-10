package com.proj.validation.member;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.proj.beans.member.MemberDTO;

public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberDTO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberDTO dto = (MemberDTO)target;
		
		String email = dto.getEmail();
		String pw = dto.getPw();
		String name = dto.getName();
		String address = dto.getAddress();
		String tel = dto.getTel();
		// String img = dto.getImg();
		
		if(email == null || email.trim().isEmpty()) 
			errors.rejectValue("email", "emptyEmail");
		if(pw == null || pw.trim().isEmpty())
			errors.rejectValue("pw", "emptyPw");
		if(name == null || name.trim().isEmpty())
			errors.rejectValue("pw", "emptyPw");
		if(address == null || address.trim().isEmpty())
			errors.rejectValue("pw", "emptyPw");
		if(tel == null || tel.trim().isEmpty())
			errors.rejectValue("pw", "emptyPw");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "subject", "emptySubject");

	}

}
