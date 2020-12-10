package com.proj.command.userRecipe;


import org.springframework.ui.Model;


import com.command.ajax.userRecipe.UserRecipeDAO;
import common.Command;
import common.D;

public class CommentRecipeDelete implements Command {

   @Override
   public void execute(Model model) {
      // TODO Auto-generated method stub
	   UserRecipeDAO dao = D.sqlSession.getMapper(UserRecipeDAO.class);
      int delete = 0;
      int cid = (Integer)model.getAttribute("cid");
   
      StringBuffer message = new StringBuffer();
      String status = "FAIL";
      
      try {         

         delete = dao.deleteComment(cid); // 읽기
         System.out.println("command db는 다녀오니 ?");
         
         if(delete == 0) {
            message.append("[해당 데이터가 없습니다]");
         } else {
            status = "OK";
         }
      } catch (Exception e) {
         e.printStackTrace();
         message.append("[에러: " + e.getMessage() + "]");
      }
      
      model.addAttribute("delete", delete);
      model.addAttribute("status", status);
      model.addAttribute("message", message.toString());
   }

}