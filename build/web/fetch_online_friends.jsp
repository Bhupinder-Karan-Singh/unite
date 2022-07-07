<%@page import="java.sql.*"%>
<%
    String email = (String)session.getAttribute("email");
//    String email = "parwinder@gmail.com";
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select* from users,friends where friends.friend_email = '"+email+"' and friends.email = users.email and users.online_status= 'online'");
    %>
    <table cellpadding="5">
    <%
    while(rs.next())
    {
        String profilePic = rs.getString("profile_pic");
        String firstName = rs.getString("first_name");
        String lastName = rs.getString("last_name");
        String friend_email = rs.getString("email");
        
        %>
        <tr>
            <td><img onclick="startChat('<%=profilePic%>','<%=firstName%>','<%=lastName%>','<%=friend_email%>')" src="img/green.png" width="10" height="10"/></td>
            <td><img onclick="startChat('<%=profilePic%>','<%=firstName%>','<%=lastName%>','<%=friend_email%>')" src="<%=profilePic%>" style="border: 2px solid green; border-radius: 5px;" width="50" height="50"/></td>
            <td><label onclick="startChat('<%=profilePic%>','<%=firstName%>','<%=lastName%>','<%=friend_email%>')"><%=firstName%> <%=lastName%></label></td>
            
        </tr>
        <%
    }
    %>
    </table>