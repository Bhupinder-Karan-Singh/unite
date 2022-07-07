<html>
    <head>
        <title>Unite</title>
        <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
       <script type="text/javascript">
        
    var recf;
    $(document).ready(function(){
    $("#f_id1").delay(1500);//logo
    $("#f_id2").delay(500);//bcet
    $("#f_id2_1").delay(500);//establish
    
    
 
  $("#f_id2").animate({
    left: "+=950"
  },1500);
  $("#f_id2_1").animate({
    left: "+=600"
  },1500);
    
    $("#f_id3").delay(1500);//gears
    $("#f_id6").delay(4000);//copyrigt
    $("#f_id4").delay(4000);//developed by
    $("#f_id5").delay(4000);//me
    
    $("#f_id1").fadeIn(2000);//logo
    $("#f_id2").fadeIn(2000);//bcet
    $("#f_id2_1").fadeIn(2000);//established
    $("#f_id3").fadeIn(2000);//gears
    $("#f_id6").fadeIn(2000);//copyrigt
    $("#f_id4").fadeIn(2500);
    //developed by
    $("#f_id5").fadeIn(2500);//me
    
    recf = function()
        {
        $("#f_id4").fadeIn(1000); 
        $("#f_id4").fadeOut(1200,recf);
        };
        recf();
   
$("#f_id3").animate({
    left: "+=140"
  },1500);

  
  $("#f_id2").animate({
    left: "-=450"
  },2500);
  $("#f_id2_1").animate({
    left: "-=100"
  },2000);
       
});

</script>
    </head>
    <body onload="function()">
        <div id="footer">
            <table style="float: left;" >
    <tr>
        <td align="center" width="80" height="80" style="white-space: nowrap;">
            <a href="https://www.facebook.com/bhupinder.singh.001" target="_blank" style="color: black; text-decoration: none;" >
                <img id="f_id1" src="images/bhupi.jpg" width="70" height="70" alt="bhupi" style="display:none;position: relative; border-radius:1em 1em"/>
            </a>
         </td>
         <td width="400" height="80" style="white-space: nowrap;">
             <font id="f_id2" size="4" style="margin-left: 10px; font-family:arial;position: relative;left: -500px;">
              <a href="https://www.facebook.com/bhupinder.singh.001" target="_blank" style=" text-decoration: none; color:black;">
                  Bhupinder Karan Singh<br>
              </a> </font>
              <font id="f_id2_1" size="2" style="margin-left: 10px; font-family:arial; position: relative; left: -500px;;">
              Software and Database Developer<br>
              &nbsp;&nbsp;&nbsp;Lambton College, Mississauga
             </font>
         </td>
         </table> 
            <table style="float: right; white-space: nowrap;">
           <td align="right"  width="150" height="80">
             <font id="f_id4" size="2" style="display:none; font-family:arial;"><b>Developed By</b><br></font>
             <font id="f_id5" size="2" style="display:none; font-family:arial;">Bhupinder Karan Singh
             </font><br>
             <font id="f_id6" size="1.8" style="display:none;font-family:arial; color: gray;">Unite &COPY 2015</font>
         </td>
    </tr>
    
 </table>
         <table  style="float: right;position: relative;overflow: hidden; white-space: nowrap; display: inline-block;">
         <td  width="200" height="80" >
             
             <img id="f_id3" src="images/gears6.gif" width="70" height="70" style="display:none;position:relative;"/><br>
               </td>
                
               </table>
             
       
</div>
    </body>
</html>