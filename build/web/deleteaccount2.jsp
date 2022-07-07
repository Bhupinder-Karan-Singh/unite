<%@page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>

<html>
    <head>
        <script type="text/javascript">
<%
String del_password = request.getParameter("del_password");
String fn = request.getParameter("firstname");
String ln = request.getParameter("lastname");
String email=(String)session.getAttribute("email");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
ResultSet rs = stmt.executeQuery("select* from users where Email='"+email+"'and password='"+del_password+"'");

if (rs.next()) 
{   
        session.setAttribute("email", email);
        String path = "C:\\Users\\bhupi\\OneDrive\\Documents\\NetBeansProjects\\SocialNetworking\\uploads\\users\\"+email;
        File f = new File(path);
        f.delete();
}       

        %>     
   
      </script>
</head>
<body>
    
</body>
</html>