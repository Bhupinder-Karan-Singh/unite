<%@page import="java.sql.*" %>
<head>
  
<script src="js/lightbox.min.js"></script>
<link href="css/lightbox.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>

</head>

<%
    String email_sidebar = (String) session.getAttribute("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select* from users where email='" + email_sidebar + "'");
    if (rs.next())
    {
        String firstName = rs.getString("first_name");
        String lastName = rs.getString("last_name");
        String photopath = rs.getString("profile_pic");
       
%>

<div id="sidebar">
   
    <a href="<%=photopath%>" data-lightbox="image-1">
        
    <img src="<%=photopath%>" width="200" height="200" style='border: 1px solid black; border-radius: 5px;'/><br>
    </a>
    <label style="color:#355692;font-size: 20px; font-family: oswald"><%=firstName%> <%=lastName%></label>
    <br>
    <br>
        <form action="changeprofilepic.jsp" method="post" enctype="multipart/form-data">
            <input type="file" name="uploads" />
            
            <br>
            <br>
 
            <input type="submit" value="changeprofilepic"/>
        </form>
    
</div>

        
        
      
        
       
</div>
         <%
            }

        %>