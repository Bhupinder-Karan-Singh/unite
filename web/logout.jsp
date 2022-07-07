<%@page import="java.sql.*" %>
<%
    
    String email = (String)session.getAttribute("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select* from users where email = '"+email+"'");
            
    rs.next();
    rs.updateString("online_status","offline");
    rs.updateRow();
    
    session.setAttribute("email", null);
    response.sendRedirect("userlogin1.jsp");
%>