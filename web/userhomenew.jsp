<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home New Page</title>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="" />
        <script src="js/jquery-1.11.0.min.js"></script>
        <style>
            
   .scrollup {
    width: 40px;
    height: 40px;
    position: fixed;
    bottom: 110px;
    right: 100px;
    display: none;
    text-indent: -9999px;
    
    background-color: orange;
}

        </style>
        <script>
            function go1()
            {
                var xmlhttp = new XMLHttpRequest();
                var first_name = document.getElementById("tf").value;
                xmlhttp.onreadystatechange = function()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        document.getElementById("main_sub").innerHTML = xmlhttp.responseText;
                    }

                }
                xmlhttp.open("GET", "searchresults.jsp?first_name=" + first_name, true);
                xmlhttp.send();
            }

            function go2(friend_email)
            {
                var xmlhttp1 = new XMLHttpRequest();

                xmlhttp1.onreadystatechange = function()
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
            function show_upload_div(val)
            {
                if (val == "status")
                {
                    document.getElementById("text_div").style.display = "block";
                    document.getElementById("image_div").style.display = "none";
                    document.getElementById("video_div").style.display = "none";
                }
                else if (val == "picture")
                {
                    document.getElementById("text_div").style.display = "none";
                    document.getElementById("image_div").style.display = "block";
                    document.getElementById("video_div").style.display = "none";
                }
                else
                {
                    document.getElementById("text_div").style.display = "none";
                    document.getElementById("image_div").style.display = "none";
                    document.getElementById("video_div").style.display = "block";
                }
            }
            function go3()
            {
                var xmlhttp1 = new XMLHttpRequest();
                var post_content = document.getElementById("post_content").value;
                alert(post_content);
                xmlhttp1.onreadystatechange = function()
                {
                    if (xmlhttp1.readyState == 4 && xmlhttp1.status == 200)
                    {
                        document.getElementById("text_div").style.display = "none";
                        document.getElementById("image_div").style.display = "none";
                        document.getElementById("video_div").style.display = "none";
                        window.location.href = "userhomenew.jsp";
                    }

                };
                xmlhttp1.open("GET", "post_text_msg.jsp?post_content=" + post_content, true);
                xmlhttp1.send();
            }
            function go10()
            {

                var desc = document.getElementById("upload_image_ta").value;
                alert(desc);
                if (desc == "")
                {
                    document.getElementById("form_upload_image").action = "upload_image.jsp?desc=nodesc";
                }
                else
                {
                    document.getElementById("form_upload_image").action = "upload_image.jsp?desc=" + desc;

                }
                return true;
            }

            function go11()
            {

                var desc = document.getElementById("upload_video_ta").value;
                alert(desc);
                if (desc == "")
                {
                    document.getElementById("form_upload_video").action = "upload_video.jsp?desc=nodesc";
                }
                else
                {
                    document.getElementById("form_upload_video").action = "upload_video.jsp?desc=" + desc;
                }
                return true;
            }


            function go12(k)
            {

                document.getElementById("post_comment_div" + k).style.display = "block";
            }

            function go15(k,total)
            {
                var xml = new XMLHttpRequest();
                var comment_content = document.getElementById("comment_ta" + k).value;
                

                xml.onreadystatechange = function()
                {
                    if (xml.readyState == 4 && xml.status == 200)
                    {
                        
                        document.getElementById("post_comment_div" + k).style.display = "none";
                        document.getElementById("comments_div" + k).innerHTML = xml.responseText;
                        var total = document.getElementById("lb"+k).innerHTML;
                        total = parseInt(total);
                        total++;
                        document.getElementById("lb"+k).innerHTML = total;
                                      
                    }

                };
                xml.open("GET", "post_comment.jsp?comment=" + comment_content + "&post_id=" + k, true);
                xml.send();

            }
            function go13(data,pid)
            {
               
                alert(data);
                var lblnew = document.getElementById("lbnew"+pid);
                var t = lblnew.innerHTML;
                t = parseInt(t);
                
                if(data=="Like")
                {
                    t++;
                    lblnew.innerHTML = t;
                    document.getElementById("lbl1"+pid).innerHTML="Unlike";
                }
                else
                {
                    t--;
                    lblnew.innerHTML = t;
                    document.getElementById("lbl1"+pid).innerHTML="Like";
                }
                
                var xmlhttp = new XMLHttpRequest();
                //var comment_content = document.getElementById("comment_ta" + k).value;
                
                xmlhttp.onreadystatechange = function()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {
                        
                    }
                };
                xmlhttp.open("GET", "post_like.jsp?post_id="+pid, false);
                xmlhttp.send();
            }

$(document).ready(function () {

    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.scrollup').fadeIn();
        } else {
            $('.scrollup').fadeOut();
        }
    });

    $('.scrollup').click(function () {
        $("html, body").animate({
            scrollTop: 0
        }, 1000);
        return false;
    });

});

        </script>
    </head>
    <body >
        
        <%@include file="header01.jsp" %>
        
        <%@include file="index.html" %>
        <div id="all">
        <%@include file="sidebar.jsp" %>
        
        <link href="css/css1.css" rel="stylesheet" type="text/css"/>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <link href="styles.css" rel="stylesheet" type="text/css"/>
        
        
        <div id="main" style="background-color: white; border: 2px solid #355692; border-radius: 5px; float:left; width:760px;">
             
            <a href="#" class="scrollup"></a>
            
            <center>
                <br>
                <font id="id2" size="5" style=" font-family:arial; color: #355692" >Post Your</font>
                <br>
                <br>
                <input type="radio" value="status" onchange="show_upload_div(this.value)" name="status" /><font style="color:#355692; font-size: 15pt;">Status</font>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" value="picture" name="status" onchange="show_upload_div(this.value)"/><font style="color:#355692; font-size: 15pt;">Picture</font>&nbsp;&nbsp&nbsp;&nbsp;
                <input type="radio" value="video" name="status" onchange="show_upload_div(this.value)"/><font style="color:#355692; font-size: 15pt;">Video</font>
                <br>
                <br>

                <div id="text_div" style="display: none;">
                    <fieldset class="fieldset_for_post">
                        <legend>Update Status</legend>
                        <textarea class="textarea_style" id="post_content" style="width: 530px;">
                
                        </textarea><br><br>
                        <input type="button" value="Post" class="button_style" onclick="go3()"/>
                    </fieldset>
                </div>
                
                <div id="image_div" style="display: none;">
                    <fieldset class="fieldset_for_post">
                        <legend>Upload Picture</legend>
                        <form id="form_upload_image" action="upload_image.jsp" method="post" enctype="multipart/form-data" onsubmit="return go10()">
                            <input type="file" class="file_style" name="upload"/><br><br>
                            <textarea class="textarea_style" id="upload_image_ta" style="width: 530px;">
                
                            </textarea><br><br>
                            <input type="submit" value="Post" class="button_style" />
                        </form>
                    </fieldset>
                </div>
                
                <div id="video_div" style="display: none;">
                    <fieldset class="fieldset_for_post">
                        <legend>Upload Video</legend>
                        <form id="form_upload_video" action="update_video.jsp" method="post" enctype="multipart/form-data" onsubmit="return go11()">
                            <input type="file" class="file_style" name="upload"/><br><br>
                            <textarea class="textarea_style" id="upload_video_ta" style="width: 530px;">
                
                            </textarea><br><br>
                            <input type="submit" value="Post" class="button_style" />
                        </form>
                    </fieldset>
                </div>

                <br>
                <br>
                <br>

                <div id="main_sub">
                    <table>
                        <%  String email = (String) session.getAttribute("email");
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
                            Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs1 = stmt1.executeQuery("select * from post,users where (((post_by_email='" + email + "') OR (post_by_email in (select friend_email from friends where email='" + email + "'))) AND (post.post_by_email=users.email)) order by post_date_time desc;");
                            while (rs1.next()) {
                                int post_id1 = rs1.getInt("post_id");
                                String post_by_email = rs1.getString("post_by_email");
                                String post_content = rs1.getString("post_content");
                                String post_type = rs1.getString("post_type");
                                String post_date_time = rs1.getString("post_date_time");
                                String first_name = rs1.getString("first_name");
                                String last_name = rs1.getString("last_name");
                                String profile_pic = rs1.getString("profile_pic");
                                String desc = rs1.getString("description");
                                if (desc == null) {
                                    desc = "";
                                }
                        %>
                        <tr>
                            <td style="width: 300px;">
                                <fieldset class="fieldset_for_post" style="background-color: white;">
                                    <legend class="post_legend">
                                        <img src="<%=profile_pic%>" width="80" height="80" style="border: 2px solid #355692; border-radius: 5px;"/>
                                    </legend>
                                        <label class="post_legend"><%=first_name%> <%=last_name%></label> &nbsp; <label style="font-size: 10pt;"><%=post_date_time%></label>
                                        <br><br>
                                    <div>
                                        <div >
                                            <%
                                                if (post_type.equals("image")) {
                                            %>

                                            <a href="<%=post_content%>" data-lightbox="image-1" title="<%=first_name%> <%=last_name%>">
                                                <img src="<%=post_content%>" width="550" height="500" style=" border: 2px solid #355692; border-radius: 5px; "/>
                                            </a>

                                            <br>
                                            <label><%=desc%></label>
                                            <%
                                            } else if (post_type.equals("text")) {
                                            %>

                                            <p style="font-family: arial; font-size: 16px; color: black; text-align: justify; line-height: 20px;"><b><%=post_content%></b></p>
                                            <%
                                            } else if (post_type.equals("video")) {
                                            %>
                                            <video width="400" height="500" controls>
                                                <source src="<%=post_content%>" type="video/mp4">

                                                Your browser does not support the video tag.
                                            </video>
                                            <br>
                                            <label><%=desc%></label>
                                            <%
                                                }
                                            %>
                                        </div>
                                            
                                        <br>
                                        
                                        <div style="font-family: arial; font-size: 15px;">
                                            <%
                                              Statement stmt22 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                                              ResultSet rs22 = stmt22.executeQuery("select * from likes where post_id="+post_id1+" and like_by='"+email+"'");
                                              
                                              Statement stmt2 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                                 ResultSet rs2 = stmt2.executeQuery("select count(*)'total' from likes where post_id="+post_id1);
                                                 rs2.next();
                                                 int total = rs2.getInt("total");
                                                 
                                                 Statement stmt3 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                                 ResultSet rs3 = stmt3.executeQuery("select count(*)'total' from comment where pid="+post_id1);
                                                 rs3.next();
                                                 int total1 = rs3.getInt("total");
                                                 
                                              if(rs22.next())
                                              {
                                            %>
                                            <label id="lbl1<%=post_id1%>" style="color: #355692; cursor:pointer;" onclick="go13(this.innerHTML,<%=post_id1%>)">Unlike</label>
                                            <label id="lbnew<%=post_id1%>"><%=total%></label><label> people liked this post</label><br>
                                              <%
                                                 }
                                                 else
                                                 {
                                                     %>
                                                     <label id="lbl1<%=post_id1%>" style="color:#355692; cursor: pointer;" onclick="go13(this.innerHTML,<%=post_id1%>)">Like</label>&nbsp;
                                                     <label id="lbnew<%=post_id1%>"><%=total%></label><label> people liked this post</label><br>
                                                    <%
                                                 }
                                            %>
                                            <br><label style="color: #355692; cursor:pointer; " onclick="go12(<%=post_id1%>)">Comment</label>&nbsp;
                                            <label id="lb<%=post_id1%>"><%=total1%></label><label> people commented on this post</label>
                                               <br>
                                           
                
                                            <div id="post_comment_div<%=post_id1%>"  style="display:none">

                                                <textarea class="textarea_style" id="comment_ta<%=post_id1%>" style="width: 530px;">
                
                                                </textarea>

                                                <br>
                                                <input type="button" value="Post" class="button_style" style="height: 40px; width: 100px;" onclick="go15(<%=post_id1%>)" />

                                            </div>
                                          
                                             
                                            
                                                                                                                                                     
                                        </div>
                                        <br>
                                        <div style="font-family: arial; font-size: 13px;" id="comments_div<%=post_id1%>">
                                        </div>
                                    </div>
                                    <br>
                                </fieldset>
                            </td>
                        </tr>
                        <tr></tr>
                        <tr></tr>
                        <tr></tr>
                        <tr></tr>
                        <tr></tr>
                        <tr></tr>
                        <tr></tr>
                        <tr></tr>
                        <tr></tr>
                        <tr></tr>
                        <%                            }
                        %>    
                    </table>
                </div>





            </center>
        </div>

</div>
        <%@include file="footer.jsp" %>

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
