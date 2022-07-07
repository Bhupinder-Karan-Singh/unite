<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<html> 
    <head>
        <%@include file="header.jsp" %>
        
        <%@include file="index.html" %>
         <div id="all">
        <%@include file="sidebar.jsp" %>

        <link href="css/css1.css" rel="stylesheet" type="text/css"/>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <link href="styles.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            function deletefriend(friend_email)
            {
                var ans = confirm('are you sure you want to delete' + friend_email);
                if (ans == true)
                {
                    var xmlhttp = new XMLHttpRequest();
                    xmlhttp.onreadystatechange = function()
                    {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                        {
                            window.location.href = "friends.jsp";
                            alert(xmlhttp.responseText);

                        }
                    }
                    xmlhttp.open("GET", "deletefriend.jsp?friend_email=" + friend_email, true);
                    xmlhttp.send();
                }
            }
            function go1(friend_email)
            {
                document.getElementById("msg_div"+friend_email).style.display = "block";

            }

            function go2(friend_email)
            {
                var xmlhttp = new XMLHttpRequest();
                var tf = document.getElementById("msg_tf"+friend_email).value;
                var ta = document.getElementById("msg_ta"+friend_email).value;
                xmlhttp.onreadystatechange = function()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        window.location.href = "friends.jsp";


                    }
                }
                xmlhttp.open("GET", "sendmessage.jsp?friend_email1=" + friend_email + "&msg_tf1=" + tf + "&msg_ta1=" + ta, true);
                xmlhttp.send();

            }

        </script>
    </head>
    <body>
        <div id="main" style="background-color: white;">

            <div id="friends" style="overflow:auto; height:500px; background-color: white;">
                <fieldset class="fieldset_form">
                    <legend>Friends</legend>
                    <table class="formtable_style" cellpadding="5" >
                        <%  String email1 = (String) session.getAttribute("email");
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
                            Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs1 = stmt1.executeQuery("select * from friends where email='" + email1 + "'and status='friend'");
                        %> 
                               </table>
                        <table cellpadding="10" cellspacing="10">
                            <tr>
                                <%
                                    int count = 0;
                                    while (rs1.next())
                                    {
                                        String friend_email = rs1.getString("friend_email");
                                        
                                        System.out.println("hellllllllllllllllll --------------- "+friend_email);
                                        
                                        Statement stmt2 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

                                        ResultSet rs2 = stmt2.executeQuery("select * from users where email='" + friend_email + "'");
                                        if (rs2.next())
                                        {
                                            String first_name = rs2.getString("first_name");
                                            String last_name = rs2.getString("last_name");
                                            String path = rs2.getString("profile_pic");
                                            if (count % 5 == 0)
                                            {
                                %>
                            </tr>
                            <tr>
                                <td >
                                    <a href="friendprofile.jsp?friend_email=<%=friend_email%>"><img src="<%=path%>" width="100" height="100"/></a><br>
                                    <a href="friendprofile.jsp?friend_email=<%=friend_email%>"><%=first_name%><%=last_name%></a><br>
                                    <input type="button"  value="Delete" style="background-color: #355692; 
                                                                            padding: 10px;
                                                                            height: 40px;
                                                                            border: 2px solid #355692;
                                                                            border-radius: 5px;
                                                                            width: 100px;
                                                                            font-size: 12px;
                                                                            color: white;
                                                                           
                                                                            -moz-box-shadow: 0px 0px 8px #d9d9d9; 
                                                                            -webkit-box-shadow: 0px 0px 8px #d9d9d9;"
                                    onclick="deletefriend('<%=friend_email%>')" /><br>
                                    
                                    <label style="cursor: pointer; color: blue;" onclick="go1('<%=friend_email%>')">send message</label>

                                    <div id="msg_div<%=friend_email%>" style="display:none; z-index: 999; position: absolute; padding:30px;
                                         top: 360px; left: 500px; background-color: white; border: 2px solid grey; border-radius: 10px; box-shadow: 10px 10px 8px #355692;" >
                                        <input type="text" class="textfield_style" style="width: 530px;" id="msg_tf<%=friend_email%>"/>
                                        <br>
                                        <br>
                                        <textarea class="textarea_style" id="msg_ta<%=friend_email%>" style="width: 530px;">
                
                                        </textarea>

                                        <br>
                                        <input type="button" value="send" class="button_style" style="height: 40px; width: 100px; cursor: pointer;" onclick="go2('<%=friend_email%>')"/>

                                    </div>
                                </td>
                                <%
                                } else
                                {
                                %>
                                <td >
                                    <a href="friendprofile.jsp?friend_email=<%=friend_email%>"><img src="<%=path%>" width="100" height="100"/></a><br>
                                    <a href="friendprofile.jsp?friend_email=<%=friend_email%>"><%=first_name%><%=last_name%></a><br>
                                    <input type="button" class="button_style" value="Delete" style="background-color: #355692; 
                                                                            padding: 10px;
                                                                            height: 40px;
                                                                            border: 2px solid #355692;
                                                                            border-radius: 5px;
                                                                            width: 100px;
                                                                            font-size: 12px;
                                                                            color: white;
                                                                          
                                                                            -moz-box-shadow: 0px 0px 8px #d9d9d9; 
                                                                            -webkit-box-shadow: 0px 0px 8px #d9d9d9;"
                                    onclick="deletefriend('<%=friend_email%>')" />
                                    <br>
                                    <label style="cursor: pointer; color: blue;" onclick="go1('<%=friend_email%>')">send message</label>

                                    <div id="msg_div<%=friend_email%>" style="display:none; z-index: 999; position: absolute; padding:30px;
                                         top: 360px; left: 500px; background-color: white; border: 2px solid grey; border-radius: 10px; box-shadow: 10px 10px 8px grey" >
                                        <input type="text" class="textfield_style" style="width: 530px;" id="msg_tf<%=friend_email%>"/>
                                        <br>
                                        <br>
                                        <textarea class="textarea_style" id="msg_ta<%=friend_email%>" style="width: 530px;">
                
                                        </textarea>

                                        <br>
                                        <input type="button" value="send" class="button_style" style="height: 40px; width: 100px; cursor: pointer;" onclick="go2('<%=friend_email%>')"/>

                                    </div>

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
</div>
                        <%@include file="footer.jsp" %>
                        </body>
                        </html>



