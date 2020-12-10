package com.proj.command.userRecipe;



import java.util.List;
import org.springframework.ui.Model;
import com.command.ajax.userRecipe.UserRecipeDAO;
import com.proj.beans.userRecipe.Ur_commentDTO;
import common.Command;
import common.D;

public class RecipeSelectCommand implements Command {

   @Override
   public void execute(Model model) {
      // TODO Auto-generated method stub
      
	   UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
      List<Ur_commentDTO> list = null;
      int user_rid = (Integer)model.getAttribute("rid");
   
      StringBuffer message = new StringBuffer();
      String status = "FAIL";
      
      try {         

         list = dao.selectByCommentRid(user_rid); // 읽기
         System.out.println("command db는 다녀오니 ?");
         System.out.println("[list] "+list);
         if(list.size() == 0) {
            message.append("[해당 데이터가 없습니다]");
         } else {
            status = "OK";
         }
      } catch (Exception e) {
         e.printStackTrace();
         message.append("[에러: " + e.getMessage() + "]");
      }
      
      model.addAttribute("list", list);
      model.addAttribute("status", status);
      model.addAttribute("message", message.toString());
      
      
   }

}