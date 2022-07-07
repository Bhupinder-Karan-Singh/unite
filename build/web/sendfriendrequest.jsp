<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    
    String friend_email = request.getParameter("friend_email");
    String email = (String)session.getAttribute("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from friends");
        rs.moveToInsertRow();
        rs.updateString("email",email);
        rs.updateString("friend_email",friend_email);
        rs.insertRow();
        out.println("request sent");
        
%> 


