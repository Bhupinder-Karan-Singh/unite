<%@page import="java.sql.*" %>
<%@page import="vmm.*" %>
<%
    String email = (String)session.getAttribute("email");
    
    
    String relativepath = "/uploads/users/"+email+"/profilepics";
    String absolutepath = getServletContext().getRealPath(relativepath);
    
    System.out.println("RELATIVE PATH = "+relativepath);
    System.out.println("ABSOLUTE PATH = "+absolutepath);
    try
    {
    String filename = vmm.FileUploader.savefile(request,absolutepath);
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    
    ResultSet rs = stmt.executeQuery("select * from users where email='" + email+ "'");
    if(rs.next())
    {
        rs.updateString("profile_pic","."+relativepath+"/"+filename);
        rs.updateRow();
    }

   
    response.sendRedirect("userhomenew.jsp");
    
   
    }
    
    catch(Exception ex)
    {
        out.println(ex.getMessage());
    } 
    
%>