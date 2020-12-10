package com.proj.beans.like;

import java.util.List;

public interface UserRecipeLikeDAO {
	public List<UserRecipeLikeDTO> select();
	public List<UserRecipeLikeDTO> selectByUid(int user_id);
}
