<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    String email=(String)session.getAttribute("email");
    String album_name = request.getParameter("msg1");
    String description = request.getParameter("msg2");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from album");
    
    rs.moveToInsertRow();
    rs.updateString("name",album_name);
    rs.updateString("description",description);
    rs.updateString("email",email);
    rs.insertRow();
    
    String abspath = getServletContext().getRealPath("/uploads/users/"+email+"/pics/albums/"+album_name);
    File f = new File(abspath);
    f.mkdir();
    
    out.println("Album created successfully");
%>