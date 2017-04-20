package dbconn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;

public class MemoDTO {
   private int num;
   private String sender, receiver, content, title;
   
   public int getNum() {
      return num;
   }

   public void setNum(int num){
      this.num = num;
   }
   
   public String getSender() {
      return sender;
   }
   
   public void setSender(String sender){
      this.sender = sender;
   }

   public String getReceiver() {
      return receiver;
   }
   
   public void setReceiver(String receiver){
      this.receiver = receiver;
   }

   public String getContent() {
      return content;
   }
   
   public void setContent(String content){
      this.content = content;
   }

   public String getTitle() {
      return title;
   }
   
   public void setTitle(String title){
      this.title = title;
   }
   
   public void readDB() throws ServletException{
		Connection conn = null;
		Statement stmt = null;
		try{
			conn = dbcon.getConn();
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from memo where memo_nu = '" + num + "'");
			if(rs.next()){
				num = rs.getInt("memo_nu");
				title = rs.getString("title");
				content = rs.getString("m_content");
				sender = rs.getString("sender");		
			}
		}
		catch (Exception e){
			throw new ServletException(e);
		}
		finally{
			try{stmt.close();}catch(Exception ignored){}
			try{conn.close();}catch(Exception ignored){}
		}
	}
   
}