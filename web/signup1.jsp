<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link href="css/css1.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">   
           function check()
           {
               var pass = document.getElementById("pass").value;
               var cpass = document.getElementById("cpassword").value;
               
               var e = document.getElementById("eemail").value;
           
               if(pass!=cpass)
               {
                   alert('password and confirm password do not match');
                   return false;
               }
               
               if(e.indexOf("@")==-1 || e.indexOf(".")==-1)
                   {
                       alert("invalid email ID")
                       document.getElementById("eemail").focus() ;
                       return false;
                   }
                   if(e.indexOf(" ")>=0 )
                   {
                       alert("Whitespace found in email")
                       document.getElementById("eemail").focus() ;
                       return false;
                   }
               else
               {
                   return true;
               }
           }
        </script>
    </head>
    <body>
        <form action="signup2.jsp" method="post">
            
                <table class="formtable_style" align="right">
                    <tr>
                        <td colspan="2" align="center">
                            <font size="4" style="color: #355692">Sign up</font></td>
                    </tr>
                <tr>
                    <td>First Name</td>
                    <td><input type="text" class="textfield_style" required name ="firstname" placeholder="firstname"/></td>
                </tr>
                <tr>
                    <td>Last Name</td>
                    <td> <input type="text" class="textfield_style" required name="lastname" placeholder="lastname"/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" class="textfield_style" required name="email" placeholder="email" id="eemail"/></td>
                </tr>
                <tr>
                    <td>password</td>
                    <td style="float: left;position: relative;overflow: hidden; white-space: nowrap; display: inline-block;">
                        <input type="password" class="password_style"  required name="password" id="pass" placeholder="password"/></td>
                    <td style="float: left;" valign="center" width="120" height="35">
                        <label id="lbi1" style="font-size: 10pt;"></label>
                       <label id="lbi2" style="font-size: 10pt;"></label>
                    </td>
                </tr>
                <tr>
                    <td>Confirm password</td>
                    <td><input type="password" class="password_style"  required name="password" id="cpassword" placeholder="password"/></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><input type="radio"  name="gender" checked/>Male
                    <input type="radio"  name="gender"/>Female</td>
                </tr>
                <tr>
                    <td>DOB</td>
                    <td><input type="date" class="date_style" required name="dob"/></td>
                </tr>
                <tr>
                    <td>Security Question</td>
                    <td> <select name="securityquestion">
                            <option>where you born</option>
                            <option>what is your favourite color</option>
                            <option>what is your favourite food</option>
                            <option>what is you favourite place</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Security Answer</td>
                    <td><input type="text" class="textfield_style" required name="securityanswer"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Signup" class="button_style" onclick="return check();" /></td>
                </tr>
                
                
       </table>
        </form>
        <script type="text/javascript">
        document.getElementById("pass").onkeyup = function()
        {
                var a;
                a=document.getElementById("pass").value;
                
                if(a.length==0)
                {
                    document.getElementById("lbi1").innerHTML="";
                    document.getElementById("lbi2").innerHTML="";
                }
                
                else if(a.length<4)
                {
                    document.getElementById("lbi1").innerHTML="Password Strength: ";
                    document.getElementById("lbi2").innerHTML="Weak";
                    document.getElementById("lbi2").style.color="red";
                }
                
                else if(a.length>=4&&a.length<8)
                {
                    document.getElementById("lbi1").innerHTML="Password Strength: ";
                    document.getElementById("lbi2").innerHTML="Average";
                    document.getElementById("lbi2").style.color="orange";
                }
                else if(a.length>=8)
                {
                    document.getElementById("lbi1").innerHTML="Password Strength: ";
                    document.getElementById("lbi2").innerHTML="Strong";
                    document.getElementById("lbi2").style.color="green";
                } 
        }
         
        </script>
        <%
            String msg1 = request.getParameter("msg1");
            if (msg1 != null) {
        %>
        <label style="color:red;font-style:italic;">
            <%=msg1%>
        </label>
        <%
            }
        %>


    </body>
</html>
