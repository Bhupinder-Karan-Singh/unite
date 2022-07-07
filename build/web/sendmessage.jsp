<%@page import="java.sql.*"%>
<%
  String msg_by1=(String)session.getAttribute("email");
  String msg_to1=request.getParameter("friend_email1");
  String title=request.getParameter("msg_tf1");
  String message=request.getParameter("msg_ta1");
  
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
  Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
  ResultSet rs1 = stmt1.executeQuery("select * from message ");
  rs1.moveToInsertRow();
  rs1.updateString("title", title);        
  rs1.updateString("msg", message);        
  rs1.updateString("msg_by",msg_by1);        
  rs1.updateString("msg_to",msg_to1);
  rs1.insertRow();
  response.sendRedirect("friends.jsp");
    
    
%>