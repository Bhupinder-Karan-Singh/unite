<html>
    <head>
        <title>Unite</title>
        <link href="css/css1.css" rel="stylesheet" type="text/css"/>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
       <script type="text/javascript">
           
    var rec;
        $(document).ready(function(){
        $("#id1").fadeIn(2000);
        $("#id2").delay(1000);
        
        rec = function()
        {
        $("#id2").fadeIn(1000); 
        $("#id2").fadeOut(1200,rec);
        };
        rec();
     });
    function checkheader0()
            {
                var em=document.getElementById("email").value;
                var pw=document.getElementById("password").value;
                if( em == ""|| pw == "" )
                {
                    alert("fill username and password");
                    return false; 
                }
                else
                { 
                    return true; 
        }
    }

    </script>
    </head>
    <body onload="function()">
        <div id="header">  
    <table style="float:left;" width="250px" height="100px">
        <tr>
        <td height="50" valign="bottom">
        <font id="id1" size="10" style="display:none; margin-left: 50px; font-family:arial;">
        <a href="userlogin1.jsp" style="color: White; text-decoration: none; padding-top: 20px;" >Unite</a>
        </font>
        </td>
        </tr>
        
        <tr>
        <td>
        <font id="id2" size="3" style="display:none; margin-left: 40px; font-family:arial; color: white;" >connecting people&nbsp;
        <img width="15" height="15"src="images/group_icon.png"/>
        </font> 
        </td>
        </tr>
    </table >
    
    <table  style="float:left;" width="auto" height="auto">      
    </table>
        <form action = "userlogin2.jsp" method="post" onsubmit="return checkheader0()">
        <table  style="float:right; padding-right: 10px;" >
            <tr height="60px">
                <td><font style="color: white;" >&nbsp;Email</font><br>
                    <input type="text" class="textfield_style" name="email" id="email" placeholder="email">&nbsp;
                </td>
                <td><font style="color: white">&nbsp;Password</font>
                    <br><input type="password" class="password_style" name="password" id="password" placeholder="password"/>&nbsp;&nbsp;
                </td>
                <td><br>
                    <input type="submit" class="bt1" value="Login"/>
                </td>
            </tr>
                <tr height="25">
                <td align="right">
        <%
        String msg = request.getParameter("msg");
        if (msg != null)       
            {
        %>
        <label style="color: orangered;font-style:italic;">
            <%=msg%>
        </label>
        <%
            }
        %>
                    </td>
                    <td align="right">
                      <a href="forgotpassword1.jsp"><font size="2" style="color: white;padding-right: 10px">Forgot Password</font></a>
                    </td>
                    </tr>   
                 </table>
            </form>
         </div>
        </body>
</html>

