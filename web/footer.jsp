<html>
    <head>
        <title>Unite</title>
        <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
       <script type="text/javascript">
        
var recf;
    $(document).ready(function(){
    $("#f_id1").delay(1000);//logo
    $("#f_id2").delay(1000);//bcet
    $("#f_id2_1").delay(1000);//establish
    
    $("#f_id3").delay(1000);//gears
    $("#f_id6").delay(1000);//copyrigt
    $("#f_id4").delay(1000);//developed by
    $("#f_id5").delay(1000);//me
    
    $("#f_id1").fadeIn(2000);//logo
    $("#f_id2").fadeIn(2000);//bcet
    $("#f_id2_1").fadeIn(2000);//established
    $("#f_id3").fadeIn(2000);//gears
    $("#f_id6").fadeIn(2000);//copyrigt
    $("#f_id4").fadeIn(2000);//developed by
    $("#f_id5").fadeIn(2000);//me
    
recf = function()
        {
        $("#f_id4").fadeIn(1000); 
        $("#f_id4").fadeOut(1200,recf);
        };
        recf();
       
});

</script>
    </head>
    <body onload="function()">
        <div id="footer">
            <table>
    <tr>
        <td align="center">
            <a href="https://www.facebook.com/bhupinder.singh.001" target="_blank" style="color: black; text-decoration: none;" >
                <img id="f_id1" src="images/bhupi.jpg" width="70" height="70" alt="bhupi" style="display:none;"/>
            </a>
         </td>
         <td width="900">
             <font id="f_id2" size="4" style="margin-left: 10px; font-family:arial;display:none;">
              <a href="https://www.facebook.com/bhupinder.singh.001" target="_blank" style=" color: black; text-decoration: none;">
                  Bhupinder Karan Singh<br>
              </a> </font>
              <font id="f_id2_1" size="2" style="display:none;margin-left: 10px; font-family:arial;">
              Software & Database developer<br>
              &nbsp;&nbsp;&nbsp; Lambton college, Mississauga
             </font>
         </td>
         <td  width="200" align="right">
             <img id="f_id3" src="images/gears6.gif" width="70" height="70" style="display:none;position:relative;"/><br>
         </td>
         <td align="right">
             <font id="f_id4" size="2" style="display:none; font-family:arial;"><b>Developed By</b><br></font>
             <font id="f_id5" size="2" style="display:none; font-family:arial;">Bhupinder Karan Singh</font><br>
             <font id="f_id6" size="1.8" style="display:none;font-family:arial; color: gray;">Unite &COPY 2015</font>
         </td> 
    </tr>
   </table>
  </div>
 </body>
</html>