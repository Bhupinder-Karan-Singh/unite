<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <link href="css/css1.css" rel="stylesheet" type="text/css"/>
        <link href="styles.css" rel="stylesheet" type="text/css"/>
        <style>
            div.baloon_top1
            {
                overflow:hidden;
                width:254px;
                background:url(images/orange_bal_top.gif) no-repeat 0 0;

            }
            div.baloon_bottom1
            {
                overflow:hidden;
                width:254px;
                background:url(images/orange_bal_bottom.gif) no-repeat 100% 100%;

            }
            div.baloon1
            {
                overflow:hidden;
                width:254px;
                background:url(images/orange_bal_center.gif) repeat-y 100% 0;

            }
            div.baloon_top2
            {
                overflow:hidden;
                width:254px;
                background:url(images/green_bal_top.gif) no-repeat 0 0;
            }
            div.baloon_bottom2
            {
                overflow:hidden;
                width:254px;
                background:url(images/green_bal_bottom.gif) no-repeat 0 100%;
            }

            div.baloon2
            {
                overflow:hidden;
                width:254px;
                background:url(images/green_bal_center.gif) repeat-y 0 100%;
            }
        </style>
    </head>
    <body onload="start()">
        <%@include file="header.jsp" %>
        
        <%@include file="index.html" %>
        <div id="all">
        <%@include file="sidebar.jsp" %>
        

      
        <div id="main" style=" border: 2px solid #355692; border-radius: 5px; float:left; width:650px; margin-right: 10px;">
            
            <div id="chatdiv" style="padding: 20px;display: none;">
                <fieldset class="fieldset_form" style="width: 90%;">
                    <legend><img id="chatimage" src="" width="100" height="100" style="border: 2px solid green; border-radius: 5px;"/></legend>
                    <label id="chatname" style="text-transform: capitalize; font-size: 20px; color: green; font-style: italic; font-family: times new roman"></label>
                    <center>
                        <div id="allmessagediv" class="textarea_style" style="width: 75%; height: 300px; overflow: auto;" ></div><br>
                <input type="text" class="textfield_style" id="msg"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" style="margin-bottom: 20px;" value="Send" onclick="sendMessage()" class="button_style">
                    </center> 
                </fieldset>
            </div>
           
        </div>
        <%@include file="sidebarnew.jsp" %>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
