<%@page import="java.sql.*"%> 
<%
    String messageByEmail = (String) session.getAttribute("email");
    String msg = request.getParameter("msg");
    String messageToEmail = request.getParameter("message_to_email");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select* from chat_message");
    rs.moveToInsertRow();
    rs.updateString("message_by_email", messageByEmail);
    rs.updateString("message_to_email", messageToEmail);
    rs.updateString("message", msg);
    rs.insertRow();

    Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs1 = stmt1.executeQuery("select* from chat_message where (message_by_email='" + messageByEmail + "' and message_to_email='" + messageToEmail + "' ) or (message_by_email='" + messageToEmail + "' and message_to_email='" + messageByEmail + "' )");

%>
<table>
    <%        while (rs1.next())
        {
    %>
    <tr>
        <%
            String mbe = rs1.getString("message_by_email");
            String mte = rs1.getString("message_to_email");
            String msg1 = rs1.getString("message");
            String date_time = rs1.getString("date_time");
            if (mbe.equals(messageByEmail))
            {
        %>
        <td></td>
        <td>
            <div class="baloon2">
                <div class="baloon_top2">
                    <div class="baloon_bottom2">
                        <p style="padding-right: 20px; padding-left: 10px; text-align: justify;"><%=msg1%></p>
                        <p style="padding-right: 20px; padding-left: 10px; color: white;"><%=date_time%></p>
                    </div>
                </div>
            </div>
        </td>
        <%
        } else
        {
        %>
        <td>
            <div class="baloon1">
                <div class="baloon_top1">
                    <div class="baloon_bottom1">
                        <p style="padding-right: 10px; padding-left: 20px; text-align: justify;"><%=msg1%></p>
                        <p style="padding-right: 10px; padding-left: 20px; color: white;"><%=date_time%></p>
                    </div>
                </div>
            </div>
        </td>
        <td</td>
        <%
            }
        %>
    </tr>
    <%
        }
    %>
</table>
