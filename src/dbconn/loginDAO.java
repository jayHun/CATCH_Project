package dbconn;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
@WebServlet("/loginDAO")
public class loginDAO extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public loginDAO() {
        super();
    }
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Connection conn = null;
      PreparedStatement psmt = null;
      
      String userId = request.getParameter("ID");
      String passwd = request.getParameter("PW");
      int flag=0;
      try {
         conn = dbconn.dbcon.getConn();
         String sql = String.format("SELECT id,std_num from MEMBER WHERE id ='"+userId+"'and passwd='"+passwd+"'");
         psmt = conn.prepareStatement(sql);
         
         ResultSet rs = psmt.executeQuery();
         String std_num=null; 
         while(rs.next()){

            std_num = rs.getString("std_num");
            flag++;
         }
         if(flag!=0){
            HttpSession session = request.getSession();
            session.setAttribute("ID", userId);   
            session.setAttribute("STD_NUM", std_num);
            response.sendRedirect("Search.jsp");
         }
         else{
            rs.close();
            psmt.close();
            conn.close();   
            response.sendRedirect("Search.jsp");
         }
         
         
   
         
      } catch (ClassNotFoundException | SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      finally {
          try {
              psmt.close();
          }
          catch (Exception ignored) {
          }
          try {
              conn.close();
          }
          catch (Exception ignored) {
          }
      }

   }
}