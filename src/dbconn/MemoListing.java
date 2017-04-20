package dbconn;

import javax.servlet.http.*;
import javax.websocket.Session;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import java.io.*;
import java.sql.*;

@WebServlet("/MemoListing")
public class MemoListing extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userID = (String) request.getParameter("ID");
		String strUpperSeqNo = request.getParameter("LAST_SEQ_NO"); 
		int upperSeqNo;
		if(strUpperSeqNo == null)
			upperSeqNo = Integer.MAX_VALUE;
		else
			upperSeqNo = Integer.parseInt(strUpperSeqNo);
		MemoList list = readDB(upperSeqNo, userID);
		request.setAttribute("MEMO_LIST", list);
		RequestDispatcher dis = request.getRequestDispatcher("MemoListView.jsp");
		dis.forward(request, response);
	}

	@SuppressWarnings("null")
	private MemoList readDB(int upperSeqNo, String userID) throws ServletException{
		MemoList list = new MemoList();
		Connection conn = null;
		Statement stmt = null;
		try{
			conn = dbcon.getConn();
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from memo where memo_nu < " + upperSeqNo + " and receiver = '" + userID + "'");
			for(int cnt = 0; cnt<5; cnt++){
				if(!rs.next())
					break;
				list.setMnum(cnt,  rs.getInt("memo_nu"));
				list.setTitle(cnt, rs.getString("title"));
				list.setSender(cnt, rs.getString("sender"));
			}
			if (!rs.next())
				list.setLastPage(true);
		}
		catch (Exception e) {
			throw new ServletException(e);
		}
		finally{
			try{stmt.close();}catch(Exception ignored){}
			try{conn.close();}catch(Exception ignored){}
		}
		return list;
	}
}