<%@page import="java.io.File"%>
<%@page import="java.sql.*" %>
<html>
    <head>
        
    
<%@include file="header.jsp" %>

<%@include file="index.html" %>
<div id="all">
<%@include file="sidebar.jsp" %>
<link href="css/css1.css" rel="stylesheet" type="text/css"/>
<link href="css/newcss.css" rel="stylesheet" type="text/css"/>
<link href="styles.css" rel="stylesheet" type="text/css"/>

<style>
    
div.show-image {
    position: relative;
    float:left;
  
}
div.show-image:hover img{
    opacity:0.6;
}


</style>

    </head>
    <body>
<div id="main" style="background-color: white; border: 2px solid #355692; border-radius: 5px; float:left; width:760px;">
   
    
<%
   
    String email1 = (String) session.getAttribute("email");
  
    String path = getServletContext().getRealPath("/uploads/users/"+email1+"/profilepics");
    
    
    File f = new File(path);
    
    File f1 []  = f.listFiles();
    for(int i=0; i<f1.length;i++)
    {
      
        %>
         <div class="show-image">
       
        <a href="./uploads/users/<%=email1%>/profilepics/<%=f1[i].getName()%>" data-lightbox="image-1">
        <img src="./uploads/users/<%=email1%>/profilepics/<%= f1[i].getName() %>" width="180" height="180" style="border: 1px solid black; border-radius:5px;"/>
            </a>&nbsp;&nbsp;
        </div>
        <%
       
    }
    
  
   
    
%>

</div>
</div>
<%@include file="footer.jsp" %>
    
</body>
</html>