

import java.io.IOException;
import dbconn.SignupDTO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;
/**
 * Servlet implementation class search
 */
@WebServlet("/searchName")
public class searchName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchName() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		SignupDTO dto = null;
		ArrayList<SignupDTO> list = new ArrayList<SignupDTO>();
		
		try {
			Connection conn =null;
			String sql;
			conn = dbconn.dbcon.getConn();
			if(type.equals("0")){
				String userName = request.getParameter("name");
				sql = String.format("select * from member where name = '"+userName+"'");
			}
			else{
				String stdNum = request.getParameter("std");
				sql = String.format("select * from member where std_num = '"+ stdNum +"'");
			}
	         PreparedStatement psmt = null;
	         psmt = conn.prepareStatement(sql);
	         ResultSet rs = psmt.executeQuery();
	         	         
	        	 while(rs.next()){
	        		 dto = new SignupDTO();
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
	        		 list.add(dto);
	          }
	        	 	
	         psmt.close();
	         conn.close();
	      } catch (ClassNotFoundException | SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
		request.setAttribute("List", list);
		RequestDispatcher dispatcher = request.getRequestDispatcher("S_Result.jsp");
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
