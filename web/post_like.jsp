<%@page import="java.sql.*" %>
<%
    
    String email = (String)session.getAttribute("email");
    String pid = request.getParameter("post_id");
    
    System.out.println("email ---------------- "+email);
    System.out.println("post_id ----------------------- "+pid);
    
    Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt2 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs2 = stmt2.executeQuery("select * from likes where like_by='"+email+"' and post_id="+pid);
    if(rs2.next())
    {
        rs2.deleteRow();
        out.print("Like");
    }
    else
    {
        rs2.moveToInsertRow();
        rs2.updateString("like_by",email);
        rs2.updateInt("post_id",Integer.parseInt(pid));
        rs2.insertRow();
        out.print("Unlike");
    }
        
%>