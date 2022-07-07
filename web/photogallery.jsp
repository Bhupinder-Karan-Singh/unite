<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gallery</title>
        <link href="css/css1.css" rel="stylesheet" type="text/css"/>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <link href="styles.css" rel="stylesheet" type="text/css"/>
        <script>
            function go()
            {
                
                document.getElementById("div1").style.display = 'block';
            }
            function go1()
            {
                var xmlhttp = new XMLHttpRequest();
                var name = document.getElementById("an").value;
                var name1 = document.getElementById("ad").value;
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                    {
                        alert(xmlhttp.responseText);
                        window.location.href = "photogallery.jsp";
                    }
                };
                xmlhttp.open("GET", "createalbum.jsp?msg1=" + name + "&msg2=" + name1, true);
                xmlhttp.send();
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        
        <%@include file="index.html" %>
        <div id="all">
        <%@include file="sidebar.jsp" %>
        
        <div id="main" style="float:left; width:760px; background-color: white;">
            
            <input type="button" class="button_style" value="Create Album" onclick="go()" style="float:right;"/>
        
        
        <div id="div1" style="display: none;float:right;" >
            <fieldset class="fieldset_form">
                <legend>Add New Album</legend>
                   <table cellpadding="5" class="formtable_style">
                    <tr>
                    <td>Album Name</td>
                    <td><input type = "text" class="textfield_style" name="an" id="an"/> </td>
                </tr>
                <tr>
                    <td> Album Description </td>
                    <td><textarea cols="30" rows="5" class="textarea_style" id="ad"></textarea> </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="button" class="button_style" value="ADD" onclick="go1()"/></td>
                </tr>
            </table>
            </fieldset>
        </div>
        <%
            String email1 = (String) session.getAttribute("email");
            int i = 0, j = 0;
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
            Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs1 = stmt1.executeQuery("select * from album where email = '" + email1 + "' and status='active'");
        %>
        <fieldset class="fieldset_form" style="float:left;">
        <table cellpadding="10">
            <%
                while (rs1.next())
                {
                    if (i % 5 == 0)
                    {
            %>
            <tr>
                <%
                    }
                    String image = rs1.getString("cover_pic");
                    String name = rs1.getString("name");
                    String aid = rs1.getString("aid");
                  
                    String status=rs1.getString("status");
                %>
                <td>
                    <img src="<%=image%>" width="100" height="100"/>
                    <br>     
                    <b><%=name%></b>
                    <br>
                    <%
                    if(!name.equals("Profile Pictures"))
                    {
                    %>
                    <a href="upload_pics_in_album.jsp?aid=<%=aid%>"><b>Add Pictures</b></a><br>
                    <a href="view_album_pics.jsp?aid=<%=aid%>">View Pictures</a><br>
                    <a href="hide_album.jsp?aid=<%=aid%>">Delete</a>
                </td>
                    <%
                    }
                    else
                    {
                    %>
            <br>
                     <a href="view_profile_pics.jsp?aid=<%=aid%>"><input type="button" style="background-color: #355692; 
                                                                            padding: 10px;
                                                                            height: 40px;
                                                                            border: 2px solid #355692;
                                                                            border-radius: 5px;
                                                                            width: 100px;
                                                                            font-size: 12px;
                                                                            color: white;
                                                                       
                                                                            -moz-box-shadow: 0px 0px 8px #d9d9d9; 
                                                                            -webkit-box-shadow: 0px 0px 8px #d9d9d9;" value="View Pictures"/></a><br>
                    <%
                    }
                        i++;
                        if (i == j + 5)
                        {
                    %>
            </tr>
            <%
                    }
                }
            %>
        </table>
        </fieldset>
        </div>
        </div>
            <%@include file="footer.jsp" %>
      </body>
</html>