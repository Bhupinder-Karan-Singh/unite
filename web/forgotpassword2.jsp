<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>

<html>
    <head>
        <script type="text/javascript">
<%
   
      
    String email = request.getParameter("em");
    String security_question = request.getParameter("security_question");
    String security_answer = request.getParameter("security_answer");
    String password="";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1","root","1234");
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        ResultSet rs = stmt.executeQuery("select * from users where email = '"+email+"' and security_question='"+security_question+"' and security_answer='"+security_answer+"'");
        
        
      
        if(rs.next())
        {
            password = rs.getString("password"); 
            System.out.println("Your unite password is :" +password);
     try{
             String to = email;//change accordingly  
             final String user = "";
             final String pass = "";
             
  //Get the session object  
  Properties props = new Properties();  
  props.put("mail.smtp.host", "smtp.gmail.com");  
  //props.put("mail.smtp.socketFactory.port", "465");  
 // props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");  
  props.put("mail.smtp.auth", "true");
  props.put("mail.smtp.starttls.enable", "true");
  //props.put("mail.smtp.port", "465");  
   
   
  Session sessionmail = Session.getInstance(props,new javax.mail.Authenticator()
  {  
   protected PasswordAuthentication getPasswordAuthentication() {  
   return new PasswordAuthentication(user,pass);//change accordingly  
   }  
  });  
   
  //compose message  
    
   Message message = new MimeMessage(sessionmail);  
   message.setFrom(new InternetAddress(user));//change accordingly  
   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
   message.setSubject("Unite password recovery");  
  

   message.setText("Your unite password is: "+password);  
     
   //send message  
   Transport.send(message);  
  
   System.out.println("message sent successfully");  
   
  } catch (MessagingException e) {e.printStackTrace();}  
        %>
            
   
            
    var msg = "Your Password has been sent to your Email"; 
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
            
            %>
                var msg = "Your Security Answer is Wrong";
    if(confirm(msg))
    {
        window.location.href = "forgotpassword1.jsp";
    }
    else
    {
        window.location.href = "userlogin1.jsp";
    }
                <%
        } 
%> 
   
    </script>
</head>
<body>
    
</body>
</html>