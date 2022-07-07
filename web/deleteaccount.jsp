<%@page import="java.sql.*"%>
<%@ page import="javax. *,javax.servlet.*" %>
<%@ page import="javax.mail.internet.* ,javax.activation.*" %>
<%@ page import="java.io.*,java.util.* ,javax.mail.*" %>

<html>
    <head>
        <script type="text/javascript">
<%
String del_password = request.getParameter("del_password");
String fn = request.getParameter("firstname");
String ln = request.getParameter("lastname");
String email=(String)session.getAttribute("email");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
ResultSet rs = stmt.executeQuery("select* from users where Email='"+email+"'and password='"+del_password+"'");

if (rs.next()) 
{   
       
        
  String to = email;
  final String user = "karansingh1455";
  final String pass = "@Waheguru11";
             
  Properties props = new Properties();  
  props.put("mail.smtp.host", "smtp.gmail.com");   
  props.put("mail.smtp.auth", "true");
  props.put("mail.smtp.starttls.enable", "true");

  Session sessionmail = Session.getInstance(props,new javax.mail.Authenticator()
  {  
   protected PasswordAuthentication getPasswordAuthentication() {  
   return new PasswordAuthentication(user,pass);//change accordingly  
   }  
     });  
    
    
   Message message = new MimeMessage(sessionmail);  
   message.setFrom(new InternetAddress(user));//change accordingly  
   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
   message.setSubject("Unite : Account deleted");  
  
   message.setText("Dear "+request.getParameter("lastname")+" "+request.getParameter("lastname")+ " Your Unite account has been permanently deleted "); 
  
   //send message  
   Transport.send(message);  
   rs.deleteRow();
   %>
  
   
    var msg = "Your Account has been deleted"; 
    if(confirm(msg))
    {
        window.location.href = "userlogin1.jsp";
    }
    else
    {
       
        window.location.href = "userlogin1.jsp";
    }
    
      
   
    <%
   
     
            }
            else 
             {
                response.sendRedirect("userhomenew.jsp?msg=invalid username/password");
            }
        %>     
   
      </script>
</head>
<body>
    
</body>
</html>