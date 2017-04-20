package dbconn;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;

public class LoadRcvDAO {
private static LoadRcvDAO instance = new LoadRcvDAO();
	
	public static LoadRcvDAO getInstance(){return instance;}
	
	public ArrayList<LoadRcvDTO> getLoad(String picked){
		LoadRcvDTO dto = null;
		ArrayList<LoadRcvDTO> list = new ArrayList<LoadRcvDTO>();
		
		try {
			Connection conn =null;
			String sql;
			conn = dbconn.dbcon.getConn();
			sql = String.format("select name,std_num from member,gright where member.std_num = gright.selector and gright.picked = '"+picked+"'");
	         PreparedStatement psmt = null;
	         psmt = conn.prepareStatement(sql);
	         ResultSet rs = psmt.executeQuery();
	         	         
	        	 while(rs.next()){
	        		 dto = new LoadRcvDTO();
	        		 dto.setName(rs.getString("NAME"));
	        		 dto.setStd_num(rs.getString("STD_NUM"));
	        		 list.add(dto);
	          }
	       
	         psmt.close();
	         conn.close();
	      } catch (ClassNotFoundException | SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
		return list;		
	}

	public ArrayList<LoadRcvDTO> getSend(String selector){
		LoadRcvDTO dto = null;
		ArrayList<LoadRcvDTO> list = new ArrayList<LoadRcvDTO>();
		
		try {
			Connection conn =null;
			String sql;
			conn = dbconn.dbcon.getConn();
			sql = String.format("select name,std_num from member,gright where member.std_num = gright.picked and gright.selector = '"+selector+"'");
			PreparedStatement psmt = null;
	         psmt = conn.prepareStatement(sql);
	         ResultSet rs = psmt.executeQuery();
	         	         
	        	 while(rs.next()){
	        		 dto = new LoadRcvDTO();
	        		 dto.setName(rs.getString("NAME"));
	        		 dto.setStd_num(rs.getString("STD_NUM"));
	        		 list.add(dto);
	          }
	       
	         psmt.close();
	         conn.close();
	      } catch (ClassNotFoundException | SQLException e) {
	         // TODO A7uto-generated catch block
	         e.printStackTrace();
	      }
		return list;		
	}
	
}
