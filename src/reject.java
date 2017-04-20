

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
import javax.websocket.Session;

import dbconn.SignupDTO;

/**
 * Servlet implementation class reject
 */
@WebServlet("/reject")
public class reject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		try {
			Connection conn =null;
			String sql;
			conn = dbconn.dbcon.getConn();
			String stdNum = request.getParameter("StdNum");
			String pickNum = request.getParameter("pickNum");
			sql = String.format("delete from gright where picked = '"+ pickNum +"' and selector = '"+ stdNum +"'");
	         PreparedStatement psmt = null;
	         psmt = conn.prepareStatement(sql);
	         psmt.executeUpdate();
	        	        	 	
	         psmt.close();
	         conn.close();
	      } catch (ClassNotFoundException | SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
		RequestDispatcher dispatcher = request.getRequestDispatcher("Rec_rvGL.jsp");
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
