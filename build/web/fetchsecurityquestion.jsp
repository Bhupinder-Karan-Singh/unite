<%@page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    System.out.println("EMAIL----------------------------- "+email);
    
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1","root","1234");
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
         ResultSet rs = stmt.executeQuery("select * from users where email = \'"+email+"\'");
        
        if(rs.next())
        {
            String security_question = rs.getString("security_question");
            out.println(security_question);
        }
        else
        {
            out.println("fail");
        }
%>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        