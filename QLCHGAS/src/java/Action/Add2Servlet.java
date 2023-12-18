package Action;

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

/**
 *
 * @author hieu0
 */
@WebServlet(urlPatterns = "/add2")
public class Add2Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mabg = request.getParameter("mabg");
            String tenbg = request.getParameter("tenbg");
            String nsx = request.getParameter("nsx");
            String tgbh = request.getParameter("tgbh");
            String dg = request.getParameter("dg");
            int tg = Integer.parseInt(tgbh);
            float dongia = Float.parseFloat(dg);
        try {           
            Connection conn = Action.ConServlet.getView2();
            String sql = "INSERT INTO sanpham (ma_san_pham, ten_san_pham, nha_san_xuat, thoi_gian_bao_hanh, don_gia) VALUES (?, ?, ?, ?, ?)";
            
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, mabg);
            st.setString(2, tenbg);
            st.setString(3, nsx);
            st.setInt(4, tg);
            st.setFloat(5, dongia);
            PrintWriter out = response.getWriter();
            int check = st.executeUpdate();
            if (check > 0) {
               response.sendRedirect("/QLCHGAS/view2.jsp");   
            } else {
                out.print("thêm thất bại!!!");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AddServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
