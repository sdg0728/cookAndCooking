package com.command.ajax.cookingcls;

import com.proj.beans.cookingcls.UserInfoDTO;

public interface UserInfoDAO {

	public UserInfoDTO selectById(String email); 
	
	
}
