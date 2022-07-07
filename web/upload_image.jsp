<%@page import="java.sql.*"%>
<%
    String email = (String)session.getAttribute("email");
    String desc = request.getParameter("desc");
    
    System.out.println("DESCRITPTION --------------------- "+desc);
    
    String absolutePath = getServletContext().getRealPath("/uploads/users/"+email+"/pics/openpics");
    String filename = vmm.FileUploader.savefile(request, absolutePath);
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs1 = stmt1.executeQuery("select * from post");
    rs1.moveToInsertRow();
    rs1.updateString("post_by_email",email);
    rs1.updateString("post_content","./uploads/users/"+email+"/pics/openpics/"+filename);
    rs1.updateString("post_type","image");
    if(desc=="nodesc")
    {
        rs1.updateString("description","");
    }                    
    else
    {
        rs1.updateString("description",desc);
    }
    rs1.insertRow();
    response.sendRedirect("userhomenew.jsp");
    
%>