<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>GAMES</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            function hello(path)
            {
               
                document.getElementById("embed1").src = path;
            }
        </script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="index.html" %>
        <%@include file="sidebar.jsp" %>
        <link href="css/css1.css" rel="stylesheet" type="text/css"/>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <link href="styles.css" rel="stylesheet" type="text/css"/>
        <div id="main" style="background-color: white;">
            <center>
            <fieldset class="fieldset_for_post">   
    
        <a href="games.jsp?a=games/Bike.swf">Bike</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="games.jsp?a=games/ben-10.swf">Ben-10</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="games.jsp?a=games/cars.swf">Cars</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="games.jsp?a=games/mario.swf">Mario</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="games.jsp?a=games/nowhere.swf">No-Where</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="games.jsp?a=games/wheely-4.swf">Wheely-4</a>
       
        <br><br>
            </fieldset><br><br><hr>
        <fieldset class="fieldset_for_post" style="display: inline;">
            <legend>My Game</legend>
            <%
            String a = request.getParameter("a");
            %>
            <embed id="embed1" style="border: 2px solid yellow; border-radius: 5px;" src="<%=a%>" width="700" height="480" align="middle" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash"></embed> 
            </fieldset>
            </center>
            
        
        </div>
    </body>
    <%@include file="footer.jsp"%>
</html>
