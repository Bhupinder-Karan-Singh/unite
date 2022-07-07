<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user home</title>
        <script>
            var xmlhttp = new XMLHttpRequest();
            var xmlhttp1 = new XMLHttpRequest();

            function go1()
            {
                var first_name = document.getElementById("tf").value;
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        document.getElementById("searchresults").innerHTML = xmlhttp.responseText;
                    }

                }
                xmlhttp.open("GET", "searchresults.jsp?first_name=" + first_name, true);
                xmlhttp.send();
            }

            ///////////////////SADA CODE ////////////////////////
            function go2(friend_email)
            {

                alert(friend_email);
                xmlhttp1.onreadystatechange = function ()
                {


                    if (xmlhttp1.readyState == 4 && xmlhttp1.status == 200)
                    {
                        go1();
                        alert(xmlhttp1.responseText);
                        
                    }

                };
                xmlhttp1.open("GET", "sendfriendrequest.jsp?friend_email=" + friend_email, true);
                xmlhttp1.send();

            }
        
            /////////////////////////////////////////////////////
            
            
            
        </script>
    </head>
    <body>
        <%
            String email = (String) session.getAttribute("email");
            String friend_email = (String) session.getAttribute("friend_email");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select* from users where email='" + email + "'");
            if (rs.next())
            {
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String photopath = rs.getString("profile_pic");
        %>
        <h1> Welcome  </h1>
        <img src="<%=photopath%>" width="150" height="150"/><br>
        <form action="changeprofilepic.jsp" method="post" enctype="multipart/form-data">
            <input type="file" name="uploads"/>
            <input type="submit" value="changeprofilepic"/>
        </form>
        <br>
        <label style="color: red; font-style: italic"><%=firstName%> <%=lastName%></label>
        <br> 
        <input type="text" id="tf" />
        <input type="button" value="Search" onclick="go1()"/>
        <div id="searchresults"></div>
        <a href="viewpendingrequest.jsp"> View Pending Request </a>
        <br>
        <a href="friends.jsp">Friends</a><br>
        <a href="photogallery.jsp">Photo Gallery</a>
        <%
            }

        %>
        <br>

        <% String msg = request.getParameter("msg");
            if (msg != null) {
        %>
        <script>
            alert('<%=msg%>');

        </script>
        <%
            }
        %>
    </body>
</html>
