<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Home New Page</title>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="" />
        <script src="js/jquery-1.11.0.min.js"></script>

        <script type="text/javascript">
            </script>

    </head>
    
    
    <body>
        <%@include file="header.jsp" %>
        
        <%@include file="index.html" %>
        <div id="all">
        <%@include file="sidebar.jsp" %>
        
        <div id="main" style="background-color: white; border: 2px solid #355692; border-radius: 5px; float:left; width:760px;">
            
        <form action="deleteaccount.jsp" method="post" onsubmit="return check()">
            <fieldset class="fieldset_form">
                <legend>Account settings</legend>
                <table class="formtable_style" cellpadding="5" colspan="2" align="center">
                <tr>
                    <td>Enter your password</td>
                    <td><input type="password" class="password_style" name="del_password" placeholder="Password" id="del_password"/> </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Delete" class="bt1"/> </td>
                </tr>
            </table>
                </fieldset>
        </form>
            <script type="text/javascript">
        </script>
        </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
