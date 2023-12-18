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

@WebServlet(urlPatterns = "/up")
public class UpServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");

        try {
            String mabg = request.getParameter("mabg");
            String tenbg = request.getParameter("tenbg");
            String nsx = request.getParameter("nsx");
            String tgbh = request.getParameter("tgbh");
            String dg = request.getParameter("dg");
            int tg = Integer.parseInt(tgbh);
            float dongia = Float.parseFloat(dg);
            Connection conn = Action.ConServlet.getView();
            Statement stmt = conn.createStatement();  
            String sql = "update sanpham set ten_san_pham = ?, nha_san_xuat = ?, thoi_gian_bao_hanh = ?, don_gia=? where ma_san_pham = ?";

            PreparedStatement st = conn.prepareStatement(sql);
            
            st.setString(1, tenbg);
            st.setString(2, nsx);
            st.setInt(3, tg);
            st.setFloat(4, dongia);
            st.setString(5, mabg);
            PrintWriter out = response.getWriter();
            int check = st.executeUpdate();
            if (check > 0) {
               response.sendRedirect("/QLCHGAS/view.jsp");   
            } else {
                out.print("sửa thất bại!!!");
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
