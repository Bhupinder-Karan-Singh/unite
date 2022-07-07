<%@page import="java.sql.*" %>
<%
    String first_name = request.getParameter("first_name");
    String email = (String) session.getAttribute("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from users where first_name like '" + first_name + "%'");
%>
<form action="sendfriendrequest.jsp">
    <fieldset class="fieldset_form">
            <table cellpadding="5">
        <tr>
            <th>Photo</th>
            <th>Name</th>
            <th>Operation</th>
        </tr>
        <%            
            while (rs.next())
            {
                String path = rs.getString("profile_pic");
                String fname = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String friendemail = rs.getString("email");

                Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs1 = stmt1.executeQuery("select * from friends where (email='" + email + "' and friend_email='" + friendemail + "') OR (email='" + friendemail + "' and friend_email='" + email + "')");

                if (rs1.next())
                {
                    String status = rs1.getString("status");

                    if (status.equals("pending"))
                    {
                        %>
                        <tr>
                            <td><img src="<%=path%>" width="50" height="50"></td>
                            <td><%=fname%> <%=lastName%></td>
                            <td><label>REQUEST PENDING</label></td>

                        </tr>
                        <%
                    } 
                    else
                    {
                     %>
                        <tr>
                            <td><img src="<%=path%>" width="50" height="50"></td>
                            <td><%=fname%> <%=lastName%></td>
                            <td>ALREADY FRIEND</td>

                        </tr>
                    <%
                        }
                    } 
                    else
                    {
                    %>
                    <tr>
                        <td><img src="<%=path%>" width="50" height="50"></td>
                        <td><%=fname%> <%=lastName%></td>
                        <td><input type="button" value="Add" onclick="go2('<%=friendemail%>')"/></td>
                    </tr>
                    <%
                    }
            }
        %>
            </table></fieldset>
</form>
