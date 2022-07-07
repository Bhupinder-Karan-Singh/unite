<%@page import="java.sql.*" %>
 <%
    int aid=Integer.parseInt(request.getParameter("aid"));
    String albumname=request.getParameter("name");
    String email=(String)session.getAttribute("email");
    String desc=request.getParameter("description");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from album where aid="+aid);
    
    rs.next();
    rs.updateString("status","deleted");
    rs.updateRow();
    
    response.sendRedirect("photogallery.jsp");
    
     
    
%>
