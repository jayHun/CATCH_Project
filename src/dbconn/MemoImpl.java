package dbconn;
import dbconn.dbcon; 
import dbconn.MemoDTO;
import java.sql.*;
import java.util.ArrayList;

public class MemoImpl implements Memo {

    public ArrayList<MemoDTO> bList() throws ClassNotFoundException, SQLException{
        ArrayList<MemoDTO> list = new ArrayList<MemoDTO>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        conn = dbcon.getConn();
        dbcon db = new dbcon();
        try {   
            String sql =
                  "select memo_num, title, content, sender, receiver"
                  + "from Memo order by memo_num";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()){               
                // bean에 select된 값 넣기    
                MemoDTO bean = new MemoDTO();
                bean.setNum(rs.getInt("memo_num"));
                bean.setTitle(rs.getString("title"));
                bean.setContent(rs.getString("content"));
                bean.setSender(rs.getString("sender"));
                bean.setReceiver(rs.getString("receiver"));
                list.add(bean);
            }   
 
        } catch(SQLException se) {
            se.printStackTrace();      
        } catch(Exception e) {
            e.printStackTrace();
        }finally{
			if(conn != null) try{conn.close();} catch(SQLException ex){}
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
        }
        return list;
    }
   
    public MemoDTO bSelect(int bseq) throws ClassNotFoundException, SQLException {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        conn = dbcon.getConn();       
        MemoDTO bean = new MemoDTO();
        dbcon db = new dbcon();
        try {   
            String sql =
            "select memo_num, title, content, sender " +
            "from Memo where bseq = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,bseq);
            rs = pstmt.executeQuery(); 
           
            rs.next();           
            bean.setNum(rs.getInt("bseq"));
            bean.setTitle(rs.getString("title"));
            bean.setContent(rs.getString("content"));
            bean.setSender(rs.getString("sender"));
            bean.setReceiver(rs.getString("receiver"));

        } catch(SQLException se) {
            se.printStackTrace();       
        } catch(Exception e) {
            e.printStackTrace();
        }finally{
			if(conn != null) try{conn.close();} catch(SQLException ex){}
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
			if(rs != null) try{rs.close();} catch(SQLException ex){}
        }
        return bean;
    } 
 
    public int bInsert(MemoDTO bean) throws SQLException, ClassNotFoundException {

        int res=0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        conn = dbcon.getConn();
        try{
            String isql =
            "insert into Memo (memo_nu, title, m_content, sender, receiver, m_date)" +
            "values(memo_seq.nextval,?,?,?,?,sysdate)";
            pstmt = conn.prepareStatement(isql); 
            pstmt.setString(1, bean.getTitle());
            pstmt.setString(2, bean.getContent());
            pstmt.setString(3, bean.getSender());
            pstmt.setString(4, bean.getReceiver());
            res = pstmt.executeUpdate();

        }catch(SQLException se){
            se.printStackTrace();   
        }catch(Exception e){
            e.printStackTrace();
        }finally{
			if(conn != null) try{conn.close();} catch(SQLException ex){}
			if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
        }
        return res;
    }
}