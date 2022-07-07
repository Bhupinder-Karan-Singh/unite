<html>
    <head>
        <title>Unite</title>
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


   
</script>
    </head>
    
    <body onload="function()">
        <div id="header">  
    <table style="float:left;" width="250px" height="100px">
        <tr>
            <td height="50" valign="bottom">
         <font id="id1" size="10" style="display:none; margin-left: 50px; font-family:arial;">
         <a href="userhomenew.jsp" style="color: White; text-decoration: none; padding-top: 20px;" >Unite</a>
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
        
   
         </div>
        </body>
</html>
