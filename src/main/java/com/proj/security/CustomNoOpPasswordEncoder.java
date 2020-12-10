package com.proj.security;

import java.math.BigInteger;
import java.security.MessageDigest;

import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomNoOpPasswordEncoder implements PasswordEncoder {
	// 주어진 문자열 rawPassword 를 인코딩 하여 리턴, 일반적으로 SHA-1 혹은 그 이상의 알고리즘 활용
	@Override
	public String encode(CharSequence rawPassword) {
		
		String sha1 = "";
		
		// With the java libraries
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-1");
	        digest.reset();
	        digest.update(((String) rawPassword).getBytes("utf8"));
	        sha1 = String.format("%040x", new BigInteger(1, digest.digest()));
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return sha1.toString();
	}

	// 주어진 rawPassword 가 인코딩 된 비번(encodedPassword)과 동일한지 판정.
	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		String sha1 = "";
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-1");
	        digest.reset();
	        digest.update(((String) rawPassword).getBytes("utf8"));
	        sha1 = String.format("%040x", new BigInteger(1, digest.digest()));
		} catch (Exception e){
			e.printStackTrace();
		}
		System.out.println("matches 수행 : " + sha1 + "::" + encodedPassword);
		return sha1.equals(encodedPassword);
	}

}