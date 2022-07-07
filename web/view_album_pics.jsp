<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>

<%@include file="index.html" %>
<div id="all">
<%@include file="sidebar.jsp" %>
<link href="css/css1.css" rel="stylesheet" type="text/css"/>
<link href="css/newcss.css" rel="stylesheet" type="text/css"/>
<link href="styles.css" rel="stylesheet" type="text/css"/>
<div id="main">
<%
   
    int aid = Integer.parseInt(request.getParameter("aid"));
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    
    ResultSet rs1 = stmt1.executeQuery("select * from album_pics where aid="+aid);
    while(rs1.next())
    {
        String path=rs1.getString("path");
        %>
        <img src="<%=path%>" width="200" height="200" style="border:1px solid black; border-radius: 5px"/>
        <%
    }
    
%>
</div>
</div>
<%@include file="footer.jsp" %>