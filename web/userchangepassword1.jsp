    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
        <link href="css/css1.css" rel="stylesheet" type="text/css"/>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="" />
        <script src="js/jquery-1.11.0.min.js"></script>
        <script>
            function check()
            {
                var new_password=document.getElementById("new_password").value;
                var confirm_password=document.getElementById("confirm_password").value;
                
                if(new_password==confirm_password)
                {
                    return true;
                    
                }
                else
                {
                    alert("New Password and Confirm Password do not match");
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        
        <%@include file="index.html" %>
        <div id="all">
        <%@include file="sidebar.jsp" %>
        <div id="main" style="background-color: white; border: 2px solid #355692; border-radius: 5px; float:left; width:760px;">
        <form action="userchangepassword2.jsp" method="post" onsubmit="return check()">
            <fieldset class="fieldset_form">
                <legend>Change Password Form</legend>
                <table class="formtable_style" cellpadding="5" colspan="2" align="center">
                <tr>
                    <td>Old Password </td>
                    <td><input type="password" class="password_style" name="old_password" placeholder="Old Password" id="old_password"/> </td>
                </tr>
                <tr>
                    <td> New Password</td>
                    <td><input type="password" class="password_style" name="new_password" placeholder="New Password" id="new_password"/> 
                        <td style="float: left;" valign="center" width="120" height="35">
                        <label id="lbii1" style="font-size: 10pt;"></label>
                       <label id="lbii2" style="font-size: 10pt;"></label>
                    </td>
                    </td>  
                </tr>
                <tr>
                    <td>confirm password</td>
                    <td><input type="password" class="password_style" id="confirm_password" placeholder="Confirm Password" required/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="submit" class="bt1"/> </td>
                </tr>
            </table>
                </fieldset>
        </form>
            <script type="text/javascript">
        document.getElementById("new_password").onkeyup = function()
        {
                var a;
                a=document.getElementById("new_password").value;
                
                if(a.length==0)
                {
                    document.getElementById("lbii1").innerHTML="";
                    document.getElementById("lbii2").innerHTML="";
                }
                
                else if(a.length<4)
                {
                    document.getElementById("lbii1").innerHTML="Password Strength: ";
                    document.getElementById("lbii2").innerHTML="Weak";
                    document.getElementById("lbii2").style.color="red";
                }
                
                else if(a.length>=4&&a.length<8)
                {
                    document.getElementById("lbii1").innerHTML="Password Strength: ";
                    document.getElementById("lbii2").innerHTML="Average";
                    document.getElementById("lbii2").style.color="orange";
                }
                else if(a.length>=8)
                {
                    document.getElementById("lbii1").innerHTML="Password Strength: ";
                    document.getElementById("lbii2").innerHTML="Strong";
                    document.getElementById("lbii2").style.color="green";
                } 
        }
         
        </script>
        </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
