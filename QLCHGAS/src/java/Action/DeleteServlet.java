package Action;

import java.sql.Statement;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.PreparedStatement;

@WebServlet(urlPatterns = "/de")
public class DeleteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");

        try {
            String mabg = request.getParameter("mabg");
            
            Connection conn = Action.ConServlet.getView();
            Statement stmt = conn.createStatement();  
            String sql = "DELETE FROM sanpham WHERE ma_san_pham = ?";

            PreparedStatement st = conn.prepareStatement(sql);
            
            st.setString(1, mabg);
            PrintWriter out = response.getWriter();
            int check = st.executeUpdate();
            if (check > 0) {
               response.sendRedirect("/QLCHGAS/view.jsp");   
            } else {
                out.print("xóa thất bại!!!");
            }
            stmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(UpServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
