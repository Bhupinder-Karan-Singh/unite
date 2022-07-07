
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="header0.jsp" %>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        <link href="css/css1.css" rel="stylesheet" type="text/css"/>
        <script>
            var xmlhttp = new XMLHttpRequest();
            var email="";
            function go1()
            {
                email = document.getElementById("emaill").value;
                
                if (email=="")
                {
                    alert("Enter email first");
                }
                else
                {
                    xmlhttp.onreadystatechange = go2;
                    xmlhttp.open("GET", "fetchsecurityquestion.jsp?email="+email, true);
                    xmlhttp.send();
                }
            }
            function go2()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    var response = xmlhttp.responseText;
                   
                    if(response=="fail")
                    {
                        alert("Wrong Email Address");
                    }
                    else
                    {
                        document.getElementById("form").style.display="block";
                        document.getElementById("security_question").value = response;
                        document.getElementById("em").value = email;
                    }
                }
            }
        </script>
    </head>
    <body>
       
      <div id="main" style="margin-left: auto;margin-right: auto;">
        
        <h1>Enter Email</h1><input type="text" class="textfield_style" name="email" id="emaill"/>
        <input type="button" value="go" class="button_style" onclick="go1()"/>
        
        <form style="display: none" id="form" action="forgotpassword2.jsp">
            <fieldset class="fieldset_form" >
            <legend>Forgot Password Form</legend>
                <table class="formtable_style" cellpadding="5">
                <tr>
                    <td>Security Question</td>
                    <td><input type="text" class="textfield_style" readonly name="security_question" id="security_question"/></td>
                </tr>
                <tr>
                    <td>Security Answer</td>
                    <td><input type="text" class="textfield_style" required name="security_answer"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" /></td>
                </tr>
            </table>
            <input type="hidden" name="em" id="em" value=""/>
            </fieldset>
        </form>
      </div>
        <%@include file="footer.jsp" %>
</html>
