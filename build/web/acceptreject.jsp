<%@page import="java.sql.*" %>
<%
    String email=(String)session.getAttribute("email");
    String opr= request.getParameter("opr");
    String friendemail=request.getParameter("friend_email");
    System.out.println("EMAIL = "+email);
    System.out.println("OPR  = "+opr);
    System.out.println("FRIEND EMAIL = "+friendemail);
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from friends where email='" +friendemail+ "' and friend_email='"+email+"' and status='pending'");
    if(rs.next())
    {
        if(opr.equals("accept"))
        {
            rs.updateString("status","friend");
            rs.updateRow();
            
            rs.moveToInsertRow();
            rs.updateString("email",email);
            rs.updateString("friend_email",friendemail);
            rs.updateString("status","friend");
            rs.insertRow();
            
        }
        else
        {
            rs.deleteRow();
        }
        out.println("done");
    }
%>