<%@include file="header.jsp" %>
<%@include file="index.html" %>
<%@include file="sidebar.jsp" %>
<link href="css/css1.css" rel="stylesheet" type="text/css"/>
<link href="css/newcss.css" rel="stylesheet" type="text/css"/>
<link href="styles.css" rel="stylesheet" type="text/css"/>
<%
    int aid = Integer.parseInt(request.getParameter("aid"));
%>
<div id="main">
<form action ="upload_pics_in_album2.jsp?aid=<%=aid%>" method="post" enctype="multipart/form-data">
  
        <input type="file" name="upload" class="fieldset_form"/>
<input type="submit" value="UPLOAD" style="background-color: #355692; 
                                        padding: 10px;
                                        height: 40px;
                                        border: 2px solid #355692;
                                        border-radius: 5px;
                                        width: 100px;
                                        font-size: 12px;
                                        color: white;
                                   
                                        -moz-box-shadow: 0px 0px 8px #d9d9d9; 
                                        -webkit-box-shadow: 0px 0px 8px #d9d9d9;"/>

</form>
</div>
<%@include file="footer.jsp" %>



