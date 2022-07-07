
<%@page import="java.sql.*" %>
<%
    String email = (String) session.getAttribute("email");
    int aid = Integer.parseInt(request.getParameter("aid"));

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from album where aid="+aid);
    rs.next();
    String albumname = rs.getString("name");
    
    String abspath = getServletContext().getRealPath("/uploads/users/"+email+"/pics/albums/"+albumname);
    String fileName = vmm.FileUploader.savefile(request, abspath);
    
    Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs1 = stmt1.executeQuery("select * from album_pics");
    rs1.moveToInsertRow();
    rs1.updateString("path","./uploads/users/"+email+"/pics/albums/"+albumname+"/"+fileName);
    rs1.updateInt("aid",aid);
    rs1.insertRow();
    
    response.sendRedirect("upload_pics_in_album.jsp?aid="+aid);
 
%>