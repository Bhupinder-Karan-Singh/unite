<%@page import="java.sql.*"%>
        <%
        String old_password = request.getParameter("old_password");
        String new_password = request.getParameter("new_password");
        String email=(String)session.getAttribute("email");
       
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select* from users where Email='"+email+"'and password='"+old_password+"'");
            if (rs.next()) 
            {
                rs.updateString("password",new_password);
                rs.updateRow();
                response.sendRedirect("userhomenew.jsp?msg=password changed successfully");
            } 
            else 
             {
                response.sendRedirect("userhomenew.jsp?msg=invalidusername/password");
            }
        %>     
   
