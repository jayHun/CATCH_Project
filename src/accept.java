
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconn.SignupDTO;

/**
 * Servlet implementation class accept
 */
@WebServlet("/accept")
public class accept extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public accept() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("UTF-8");
      SignupDTO dto = null;
      ArrayList<SignupDTO> list = new ArrayList<SignupDTO>();
      
      try {
         Connection conn =null;
         String sql;
         String sql1;
         conn = dbconn.dbcon.getConn();
         String stdNum = request.getParameter("stdNum");
         String pickNum = request.getParameter("pickNum");
         sql = String.format("select * from member where std_num = '"+ stdNum +"'");
         sql1 = String.format("update gright set rec_count= '1' where selector= '"+stdNum+"'"+"and picked = '"+pickNum+"'");
         PreparedStatement pstmt = null;
            pstmt = conn.prepareStatement(sql1);
            pstmt.executeUpdate();
            PreparedStatement psmt = null;
            psmt = conn.prepareStatement(sql);
            ResultSet rs = psmt.executeQuery();
                        
               while(rs.next()){
                  dto = new SignupDTO();
                  dto.setId(rs.getString("ID"));
                  dto.setName(rs.getString("NAME"));
                  dto.setStd_num(rs.getInt("STD_NUM"));
                  dto.setAge(rs.getInt("AGE"));
                  dto.setBirth(rs.getString("BIRTH"));
                  dto.setHobby(rs.getString("HOBBY"));
                  dto.setHp(rs.getInt("HP"));
                  dto.setNick(rs.getString("NICK"));
                  dto.setIntroduce(rs.getString("INTRODUCE"));
                  dto.setReligion(rs.getString("RELIGION"));
                  dto.setSector(rs.getString("SECTOR"));
             }
                  
            psmt.close();
            conn.close();
         } catch (ClassNotFoundException | SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      request.setAttribute("Dto", dto);
      RequestDispatcher dispatcher = request.getRequestDispatcher("accept.jsp");
      dispatcher.forward(request, response);
   }
   

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}