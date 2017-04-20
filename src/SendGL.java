

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconn.dbcon;
/**
 * Servlet implementation class SendGL
 */
@WebServlet("/SendGL")
public class SendGL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendGL() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			String Send_num = request.getParameter("stdnum");
			String My_num = request.getParameter("stdNum");
			Connection conn = null;
	        PreparedStatement psmt = null;
	        int n=0;
	        int flag=0;
	      try {
	         conn = dbconn.dbcon.getConn();
	         String sql = String.format("INSERT INTO gright(SELECTOR,PICKED,REC_COUNT) VALUES(?,?,?)");
	         psmt = conn.prepareStatement(sql);
	         
				
				psmt.setString(1,Send_num);
				psmt.setString(2,My_num);
				psmt.setInt(3,flag);
	         
				n=psmt.executeUpdate();
				
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
	      RequestDispatcher dispatcher = request.getRequestDispatcher("CP.jsp");
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
