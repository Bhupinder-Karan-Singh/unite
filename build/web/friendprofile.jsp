<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<head>
        <%@include file="header.jsp" %>
        
        <%@include file="index.html" %>
         <div id="all">
        <%@include file="sidebar.jsp" %>

        <link href="css/css1.css" rel="stylesheet" type="text/css"/>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <link href="styles.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
           
        </script>
    </head>
<body>
<%
    String friend_email = request.getParameter("friend_email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn5 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt5 = conn5.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs5 = stmt5.executeQuery("select * from users where email='" + friend_email + "'");
    if (rs5.next())
    {
        String first_name = rs5.getString("first_name");
        String last_name = rs5.getString("last_name");
        String path = rs5.getString("profile_pic");
        String email5 = (String) session.getAttribute("email");
        String dateofbirth = rs.getString("dob");

%>

<div id="friends" style="overflow:auto; height:500px;">
    <fieldset class="fieldset_viewtable">
            <table class="viewtable" cellpadding="5"> 
                                                    <img src="<%=path%>" width="175" height="275"/><br>
                                    <label><%=first_name%><%=last_name%></label><br>
                                    <label><%=friend_email%></label><br>
                                    <label><%=dateofbirth%></label><br>
                                    <%
                                        }
                                    %>
                <%
                    Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs1 = stmt1.executeQuery("select * from friends where email='" +friend_email+ "' and status='friend'");

                %>  
                <table cellpadding="10" cellspacing="10">
                    <tr>
                        <%            
                            int count = 0;
                            while (rs1.next())
                            {
                                String femail = rs1.getString("friend_email");
                                Statement stmt2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                                ResultSet rs2 = stmt2.executeQuery("select * from users where email='" + femail + "'");
                                if (rs2.next())
                                {
                                    String first_name = rs2.getString("first_name");
                                    String last_name = rs2.getString("last_name");
                                    String path = rs2.getString("profile_pic");
                                    if (count % 4 == 0)
                                    {
                        %>
                    </tr>
                    <tr>
                        <td style="border: 2px solid gray;">
                            <a href="friendprofile.jsp?friend_email=<%=femail%>"><img src="<%=path%>" width="100" height="100"/></a><br>
                            <a href="friendprofile.jsp?friend_email=<%=femail%>"><%=first_name%><%=last_name%></a><br>
                        </td>
                        <%

                        }
                         else           
                        {
                        %>
                        <td style="border: 2px solid gray;">
                            <a href="friendprofile.jsp?friend_email=<%=femail%>"><img src="<%=path%>" width="100" height="100"/></a><br>
                            <a href="friendprofile.jsp?friend_email=<%=femail%>"><%=first_name%><%=last_name%></a><br>
                        </td>
                        <%
                                    }
                                }
                                count++;

                            }
                        %>
                </table>
    </fieldset>
 </div>
</div>
                <%@include file="footer.jsp" %>
</body>
 
</html>