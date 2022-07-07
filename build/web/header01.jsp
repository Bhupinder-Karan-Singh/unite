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
         
        <table style="float:left;" width="700px" height="100px">
            <tr>
                <td>
            <center>
                <input type="text" id="tf" style="width: 400px;
                                                  height: 10px;
                                                  border-radius: 5px;
                                                  padding: 12px;
                                                  font-size: 13px;
                                                  box-shadow: 0px 0px 8px #d9d9d9; 
                                                  -moz-box-shadow: 0px 0px 8px #d9d9d9; 
                                                  -webkit-box-shadow: 0px 0px 8px #d9d9d9;"/>&nbsp;
                <input type="button" value="Search" onclick="go1()" style="background-color: #355692; 
                                                                            padding: 10px;
                                                                            height: 40px;
                                                                            border: 2px solid #355692;
                                                                            border-radius: 5px;
                                                                            width: 100px;
                                                                            font-size: 12px;
                                                                            color: white;
                                                                       
                                                                            -moz-box-shadow: 0px 0px 8px #d9d9d9; 
                                                                            -webkit-box-shadow: 0px 0px 8px #d9d9d9;"/>
                </center>
        </td>
            </tr>
        </table>
   
         </div>
        </body>
</html>
