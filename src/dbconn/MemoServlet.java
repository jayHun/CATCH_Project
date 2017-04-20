package dbconn;
import java.io.*;
import java.sql.* ;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import dbconn.MemoDTO;
import dbconn.MemoImpl;

@WebServlet("/MemoServlet")
public class MemoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response) {

         try {
            myFunction(request, response);
         } catch (ClassNotFoundException e) {
            e.printStackTrace();
         } catch (ServletException e) {
            e.printStackTrace();
         } catch (IOException e) {
            e.printStackTrace();
         } catch (SQLException e) {
            e.printStackTrace();
         }
    }
    
    public void myFunction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
        request.setCharacterEncoding("UTF-8");
       
        String actionMode = request.getParameter("actionMode");
        
        if (actionMode.equals("INS")){
           
           MemoDTO bean = new MemoDTO();
            bean.setTitle(request.getParameter("title"));
            bean.setSender(request.getParameter("sender"));
            bean.setReceiver(request.getParameter("receiver"));
            bean.setContent(request.getParameter("content"));
            
            
            MemoImpl bi = new MemoImpl();
            bi.bInsert(bean);
            
           
            RequestDispatcher rd =
                request.getRequestDispatcher("/MemoServlet?actionMode=LIST");
            rd.forward(request, response); 
       
        } else if (actionMode.equals("VIEW")){
           
            MemoImpl bi = new MemoImpl();
           
            int memo_num = parseInt(request.getParameter("memo_num"));
           
            MemoDTO bean = bi.bSelect(memo_num);
            request.setAttribute("List", bean);
           
            RequestDispatcher rd = request.getRequestDispatcher("/View.jsp");
            rd.forward(request, response);
           
        } else if (actionMode.equals("LIST")){
        	response.sendRedirect("memosended.jsp");
        }
    }

	private int parseInt(String parameter) {
		// TODO Auto-generated method stub
		return 0;
	}
}