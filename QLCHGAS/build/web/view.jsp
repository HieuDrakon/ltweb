<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> View list bếp gas </title>
    </head>
    <body>
        <h1> Danh sách sản phẩm </h1>
     <a href="/QLCHGAS/add.jsp">ADD</a>
    
     
         <table border="1">
        <tr>
            <th>Ma bep gas</th>
            <th>Ten bep gas</th>
            <th>Nha san xuat</th>
            <th>Thoi gian bao hanh(ngay)</th>
            <th>don gia</th>
        </tr>
        <% 
            try {
               
                java.sql.Connection con = Action.ConServlet.getView();
                if (con != null) {
                    java.sql.Statement stml = con.createStatement();
                    String sql = "select * from sanpham";
                    java.sql.ResultSet rs = stml.executeQuery(sql);
                    
                    while (rs.next()) {
                        String mabg = rs.getString("ma_san_pham");
                        String tenbg = rs.getString("ten_san_pham");
                        String nsx = rs.getString("nha_san_xuat");
                        float dg = rs.getFloat("don_gia");
                        int tgbh = rs.getInt("thoi_gian_bao_hanh");
        %>
                        <tr>
                            <td><%= mabg %></td>
                            <td><%= tenbg %></td>
                            <td><%= nsx %></td>
                            <td><%= tgbh %></td>
                            <td><%= dg %></td>
                            <td><a href="http://localhost:9999/QLCHGAS/up.jsp">edit</a></td>  
                            <td><a href="http://localhost:9999/QLCHGAS/delete.jsp">delete</a></td>                                                      
                        </tr>
        <%
                    }
                    rs.close();
                    con.close();
                } else {
                    out.println("Connection is null");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </table>
    
        <h1> Danh sách hãng sản xuất </h1>
     <a href="http://localhost:9999/QLCHGAS/add.jsp">ADD</a>
        
         <table border="1">
        <tr>
            <th>Ma hang san xuat</th>
            <th>Ten hang san xuat</th>
            <th>dia chi vp chinh tai vn</th>
            <th>so dien thoai</th>           
        </tr>
        <% 
            try {
               
                java.sql.Connection con = Action.ConServlet.getView();
                if (con != null) {
                    java.sql.Statement stml = con.createStatement();
                    String sql = "select * from hang_san_xuat";
                    java.sql.ResultSet rs = stml.executeQuery(sql);
                    
                    while (rs.next()) {
                        String mahsx = rs.getString("ma_hang_sx");
                        String tenhsx = rs.getString("ten_hang_sx");
                        String dc = rs.getString("dia_chi_vpchinh_tai_vn");
                        String sdt = rs.getString("so_dien_thoai");
                        
        %>
                        <tr>
                            <td><%= mahsx %></td>
                            <td><%= tenhsx %></td>
                            <td><%= dc %></td>
                            <td><%= sdt %></td>                           
                            <td><a href="http://localhost:9999/QLCHGAS/up.jsp">edit</a></td>
                            <td><a href="http://localhost:9999/QLCHGAS/delete.jsp">delete</a></td>                                                      
                        </tr>
        <%
                    }
                    rs.close();
                    con.close();
                } else {
                    out.println("Connection is null");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </table>
    <h1> Danh sách khách hàng </h1>
     <a href="http://localhost:9999/QLCHGAS/add.jsp">ADD</a>
        
         <table border="1">
        <tr>
            <th>Ma khach</th>
            <th>Ten khach</th>
            <th>dia chi </th>
            <th>so dien thoai</th>           
        </tr>
        <% 
            try {
               
                java.sql.Connection con = Action.ConServlet.getView();
                if (con != null) {
                    java.sql.Statement stml = con.createStatement();
                    String sql = "select * from khach_hang";
                    java.sql.ResultSet rs = stml.executeQuery(sql);
                    
                    while (rs.next()) {
                        String makh = rs.getString("ma_khach");
                        String tenkh = rs.getString("ten_khach");
                        String dckh = rs.getString("dia_chi");
                        String sdtkh = rs.getString("so_dien_thoai");
                        
        %>
                        <tr>
                            <td><%= makh %></td>
                            <td><%= tenkh %></td>
                            <td><%= dckh %></td>
                            <td><%= sdtkh %></td>                           
                            <td><a href="http://localhost:9999/QLCHGAS/up.jsp">edit</a></td>
                            <td><a href="http://localhost:9999/QLCHGAS/delete.jsp">delete</a></td>                                                      
                        </tr>
        <%
                    }
                    rs.close();
                    con.close();
                } else {
                    out.println("Connection is null");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </table>
    <h1> Danh sách chi tiết phiếu xuất </h1>
     <a href="http://localhost:9999/QLCHGAS/add.jsp">ADD</a>
        
         <table border="1">
        <tr>
            <th>so phieu xuat</th>
            <th>ma san pham</th>
            <th>so luong</th>
                     
        </tr>
        <% 
            try {
               
                java.sql.Connection con = Action.ConServlet.getView();
                if (con != null) {
                    java.sql.Statement stml = con.createStatement();
                    String sql = "select * from chi_tiet_phieu_xuat";
                    java.sql.ResultSet rs = stml.executeQuery(sql);
                    
                    while (rs.next()) {
                        int spx = rs.getInt("so_phieu_xuat");
                        String masp = rs.getString("ma_san_pham");
                        int sl = rs.getInt("so_luong");                                    
        %>
                        <tr>
                            <td><%= spx %></td>
                            <td><%= masp %></td>
                            <td><%= sl %></td>
                                                      
                            <td><a href="http://localhost:9999/QLCHGAS/up.jsp">edit</a></td>
                            <td><a href="http://localhost:9999/QLCHGAS/delete.jsp">delete</a></td>                                                      
                        </tr>
        <%
                    }
                    rs.close();
                    con.close();
                } else {
                    out.println("Connection is null");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </table>
    <h1> Danh sách phiếu xuất </h1>
     <a href="http://localhost:9999/QLCHGAS/add.jsp">ADD</a>
        
         <table border="1">
        <tr>
            <th>so phieu xuat</th>
            <th>ma khach</th>
            <th>ngay lap phieu</th>
                     
        </tr>
        <% 
            try {
               
                java.sql.Connection con = Action.ConServlet.getView();
                if (con != null) {
                    java.sql.Statement stml = con.createStatement();
                    String sql = "select * from phieu_xuat";
                    java.sql.ResultSet rs = stml.executeQuery(sql);
                    
                    while (rs.next()) {
                        int spx = rs.getInt("so_phieu_xuat");
                        String makh = rs.getString("ma_khach");
                        String nlp = rs.getString("ngay_lap_phieu");                                    
        %>
                        <tr>
                            <td><%= spx %></td>
                            <td><%= makh %></td>
                            <td><%= nlp %></td>
                                                      
                            <td><a href="http://localhost:9999/QLCHGAS/up.jsp">edit</a></td>
                            <td><a href="http://localhost:9999/QLCHGAS/delete.jsp">delete</a></td>                                                      
                        </tr>
        <%
                    }
                    rs.close();
                    con.close();
                } else {
                    out.println("Connection is null");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </table>
    <h1> Danh sách nơi bảo hành </h1>
     <a href="http://localhost:9999/QLCHGAS/add.jsp">ADD</a>
        
         <table border="1">
        <tr>
            <th>ma hang san xuat</th>
            <th>so tt</th>
            <th>ten diem bao hanh</th>
            <th>dia chi</th>
            <th>so dien thoai</th>
                     
        </tr>
        <% 
            try {
               
                java.sql.Connection con = Action.ConServlet.getView();
                if (con != null) {
                    java.sql.Statement stml = con.createStatement();
                    String sql = "select * from noi_bao_hanh";
                    java.sql.ResultSet rs = stml.executeQuery(sql);
                    
                    while (rs.next()) {
                        String mahsx = rs.getString("ma_hang_sx");
                        int sott = rs.getInt("so_tt");
                        String tdbh = rs.getString("ten_diem_bao_hanh"); 
                        String dc = rs.getString("dia_chi");
                        String sdt = rs.getString("so_dien_thoai");


        %>
                        <tr>
                            <td><%= mahsx%></td>
                            <td><%= sott %></td>
                            <td><%= tdbh %></td>
                            <td><%= dc %></td>
                            <td><%= sdt %></td>
                                                      
                            <td><a href="http://localhost:9999/QLCHGAS/up.jsp">edit</a></td>
                            <td><a href="http://localhost:9999/QLCHGAS/delete.jsp">delete</a></td>                                                      
                        </tr>
        <%
                    }
                    rs.close();
                    con.close();
                } else {
                    out.println("Connection is null");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </table>
    </body>   
</html>

