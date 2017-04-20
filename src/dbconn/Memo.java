package dbconn;

import java.sql.SQLException;
import java.util.ArrayList;

public interface Memo {
   public ArrayList<MemoDTO> bList() throws ClassNotFoundException, SQLException;
    public MemoDTO bSelect(int bseq) throws SQLException, ClassNotFoundException;
    public int bInsert(MemoDTO bean) throws SQLException, ClassNotFoundException;
}