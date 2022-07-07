<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
    </head>
    <body>
        <%
            String em = request.getParameter("email");
            String pw = request.getParameter("password");

            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
            
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            
            ResultSet rs = stmt.executeQuery("select* from users where Email='" + em + "'and password='" + pw + "'");
            

            if (rs.next()) {
                session.setAttribute("email", em);

              
                

//                new File("C:\\Users\\bhupi\\OneDrive\\Documents\\NetBeansProjects\\SocialNetworking\\uploads\\users\\"+em).mkdirs();
           
                
//                if (f.exists() == false) 
//                {
//                    
//                    f = new File(absolutepath + "/profilepics");
//                    f.mkdir();
//                    f = new File(absolutepath + "/pics");
//                    f.mkdir();
//                    f = new File(absolutepath + "/videos");
//                    f.mkdir();
//
//                }

                rs.updateString("online_status","online");
                rs.updateRow();
                
                response.sendRedirect("userhomenew.jsp");

            } else 
            {

                response.sendRedirect("userlogin1.jsp?msg=Invalid username or password");

            }
        %>


    </body>
</html>
