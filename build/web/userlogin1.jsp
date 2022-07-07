<html>
    <head>
        <title>signup</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
        <link href="css/css1.css" rel="stylesheet" type="text/css"/>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
        
    <script type="text/javascript">              
    var ref;  
    $(document).ready(function() {
    $(".quotes").delay(5000);
    $(".quotes1").delay(5000);
    var quotes = $(".quotes");
    var quoteIndex = -1;
    var quotes1 = $(".quotes1");
    var quoteIndex1 = -1;
    
    function showNextQuote()
    {
    ++quoteIndex;
    quotes.eq(quoteIndex % quotes.length)
    .fadeIn(1500)
    .delay(1500)
    .fadeOut(1000, showNextQuote);
    }
    showNextQuote();
     
    function showNextQuote1()
    {
        ++quoteIndex1;
        quotes1.eq(quoteIndex1 % quotes1.length)
        .fadeIn(1500)
        .delay(1500)
        .fadeOut(1000, showNextQuote1)
    }
    showNextQuote1();
});         
    </script>
    </head>
    <body onload="Function()">
        
        <%@include file="header0.jsp" %> 
        
        <div id="main" style="margin-left: auto;margin-right: auto;">
            <table  width="800" height="400" align="right" style="float: left">
                <tr>
                    <td align="center">
                        <img src="images/group1.png" class="quotes" width="300" height="250" style="display: none;"><br>
                        <font size="20" class="quotes1" style="color: #355692; display: none;">Connect with Unite</font>  
                        <img src="images/group2.png" class="quotes" width="250" height="250" style="display: none;"><br>
                        <font size="20" class="quotes1" style="color: #355692; display: none;">Connect with Friends</font>  
                        <img src="images/group3.png" class="quotes" width="250" height="250" style="display: none;"><br>
                        <font size="20" class="quotes1" style="color:#355692; display: none;">share your views</font>
                    </td>
                </tr>
            </table>
            
          <%@include file="signup1.jsp" %>
        </div>
        <%@include file="footer0.jsp" %>
    </body>
</html>
