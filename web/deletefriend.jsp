<%@page import="java.sql.*" %>
<%
    String friend_email=request.getParameter("friend_email");
    String email=(String) session.getAttribute("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from friends where (email='" +email+ "'and friend_email='"+friend_email+"' and status='friend')or (email='" +friend_email+ "'and friend_email='"+email+"' and status='friend')");
    while(rs.next())
    {
        rs.deleteRow();
    }
    out.println(friend_email+"is deleted from your friend list");
%>
    