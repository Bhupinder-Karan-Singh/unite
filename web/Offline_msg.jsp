
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jsp page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        
        <%@include file="index.html" %>
        <div id="all">
        <%@include file="sidebar.jsp" %>
        <link href="css/css1.css" rel="stylesheet" type="text/css"/>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <link href="styles.css" rel="stylesheet" type="text/css"/>
        <div id="main" style="background-color: white;">
        <table>
                        <%  String email2 = (String) session.getAttribute("email");
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
                            Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                             ResultSet rs1 = stmt1.executeQuery("select * from message where msg_to='"+email2+"'");
                            while (rs1.next()) 
                            {
                                
                                
                                                               
                                
                                String email1=rs1.getString("msg_by");
                                String title = rs1.getString("title");
                                String message = rs1.getString("msg");
                                String msg_date_time = rs1.getString("msg_date_time");
                                Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs2 = stmt2.executeQuery("select * from users where email='"+email1+"'");
                                while (rs2.next())
                                {
                                String first_name=rs2.getString("first_name");
                                String last_name=rs2.getString("last_name");
                                String profile_pic=rs2.getString("profile_pic");
                                
                            
                            
                        %>
                        
                        <tr>
                            <td style="width:1000 px;">
                                <fieldset class="fieldset_for_post" style="background-color: white;">
                                    
                                <img src="<%=profile_pic%>" width="50" height="50" style="border: 2px solid #355692; border-radius: 5px;"/>   
                                <label style="color:#355692;"><%=first_name%> <%=last_name%></label><br>
                                 <label></label><br>
                                 <label>Title: <%=title%> </label> <br><br>
                                 <label> Message: <%=message%></label>  <br>  <br>
                                  <label>Time: <%=msg_date_time%></label> 
                                </td>    
   
                                </tr>
                                <tr><td>
                                        <hr></td>
                                </tr>
                                <%
                                }
                                
                                
                                }
                                %>
        </table>
        </div>
        </div>
                                    <%@include file="footer.jsp" %>                            
    </body>
</html>
