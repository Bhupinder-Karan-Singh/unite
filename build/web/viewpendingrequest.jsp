<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.sql.*"%>

    <%@include file="header.jsp" %>
    
    <%@include file="index.html" %>
    <div id="all">
    <%@include file="sidebar.jsp" %>
    <link href="css/css1.css" rel="stylesheet" type="text/css"/>
    <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
    <link href="styles.css" rel="stylesheet" type="text/css"/>
    <script>
    function acpt(email)
    {
        alert(email);
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function()
        {
            if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
            {
                alert(email+"has become your friend");
                window.location.href = "viewpendingrequest.jsp";
            }
        
        };
        xmlhttp.open("GET","acceptreject.jsp?opr=accept&friend_email="+email,true);
        xmlhttp.send();
    }
    function reject(email)
    {
        var xmlhttp1 = new XMLHttpRequest();
        xmlhttp1.onreadystatechange = function()
        {
            if(xmlhttp1.readyState == 4 && xmlhttp1.status == 200)
            {
                alert("FRIEND REQUEST DELETED SUCCESSFULLY");
                window.location.href = "viewpendingrequest.jsp";
            }
        };
        xmlhttp1.open("GET","acceptreject.jsp?opr=reject&friend_email="+email,true);
        xmlhttp1.send();
    }
</script>

<%
      
    String email=(String)session.getAttribute("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs1 = stmt1.executeQuery("select * from friends where friend_email='"+email+"' and status='pending'");
%>
<div id="main" style="background-color: white; float:left; width:760px; ">
   
    
    <table cellpadding="5"  style="float: left;">
        
        <%
        while(rs1.next())
        {
            String data = rs1.getString("email");
            Statement stmt2 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            ResultSet rs2 = stmt2.executeQuery("select * from users where email = '"+data+"'");
            rs2.next();
            String path = rs2.getString("profile_pic");
            String firstname = rs2.getString("first_name");
            String lastname = rs2.getString("last_name");
        %>
        <tr >
        <th style="color:#355692;">Profile Pic</th>
        <th style="color:#355692;">Name</th>
        <th style="color:#355692;">Friend Requests</th>
        </tr>
          <tr>
            <td><img src= "<%=path%>" height="75" width="75"/></td>
            <td><%=firstname%> <%=lastname%></td>
            <td><input type="button" value="Accept" onclick="acpt('<%=data%>') " class="bt1"/>
            <input type="button" value="Reject" onclick="reject('<%=data%>')" class="bt1" />
            </td>             
        </tr>
          
        <tr>
            <td colspan="3">
          <hr>
            </td>
        </tr>
          
        <%
         }
        %>
       
    </table>
</div>
        </div>
        <%@include file="footer.jsp" %>
        