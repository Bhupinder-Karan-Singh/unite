<%@page import="java.sql.*"%>
<%

    String email = (String) session.getAttribute("email");
    String comment = request.getParameter("comment");
    int pid = Integer.parseInt(request.getParameter("post_id"));

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs1 = stmt1.executeQuery("select * from comment");

    rs1.moveToInsertRow();
    rs1.updateString("comment", comment);
    rs1.updateInt("pid", pid);
    rs1.updateString("comment_by_email", email);
    rs1.insertRow();

    rs1.previous();

%>


<table>
    <%                                                    Class.forName("com.mysql.jdbc.Driver");
        Statement stmt2 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        ResultSet rs2 = stmt2.executeQuery("select * from comment,users where comment.pid=" + pid + " and comment.comment_by_email=users.email");
        while (rs2.next()) {
            String cmnt = rs2.getString("comment");
            String fname = rs2.getString("first_name");
            String lname = rs2.getString("last_name");
            String pic = rs2.getString("profile_pic");
            String date_time = rs2.getString("comment_date_time");

    %>
    <tr>
        <td><img src="<%=pic%>" width="50" height="50"/></td>
        <td><label style="color: blue"><%=fname%> <%=lname%></label></td>
        <td><p style="text-align: justify;"><%=cmnt%></p></td>

    </tr>
    <tr>
        <td></td>
        <td></td>
        <td><%=date_time%></td>
    </tr>
    <%
        }
    %>
</table>