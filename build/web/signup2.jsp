
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link href="css/newcss.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <%
            String fn = request.getParameter("firstname");
            String ln = request.getParameter("lastname");
            String em = request.getParameter("email");
            String pw = request.getParameter("password");
            String g = request.getParameter("gender");
            String db = request.getParameter("dob");
            String sq = request.getParameter("securityquestion");
            String sa = request.getParameter("securityanswer");

            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");

            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

            ResultSet rs = stmt.executeQuery("select* from users where email='" + em + "'");

            if (rs.next())
            {
                response.sendRedirect("userlogin1.jsp?msg1=Email already registered, try with different email");
            } 
            else
            {
                rs.moveToInsertRow();
                rs.updateString("first_name", fn);
                rs.updateString("last_name", ln);
                rs.updateString("email", em);
                rs.updateString("password", pw);

                rs.updateString("gender", g);
                rs.updateString("dob", db);
                rs.updateString("security_question", sq);
                rs.updateString("security_answer", sa);

                if (g.equals("female"))
                {
                    rs.updateString("profile_pic", "./uploads/defaultimages/female.jpg");
                }
                else
                {
                    rs.updateString("profile_pic", "./uploads/defaultimages/male.jpg");
                }
                rs.insertRow();

                session.setAttribute("email", em);
                
                new File("C:\\Users\\bhupi\\OneDrive\\Documents\\NetBeansProjects\\SocialNetworking\\uploads\\users\\"+em).mkdir();
                new File("C:\\Users\\bhupi\\OneDrive\\Documents\\NetBeansProjects\\SocialNetworking\\uploads\\users\\"+em+"\\profilepics").mkdir();
                new File("C:\\Users\\bhupi\\OneDrive\\Documents\\NetBeansProjects\\SocialNetworking\\uploads\\users\\"+em+"\\pics").mkdir();
                new File("C:\\Users\\bhupi\\OneDrive\\Documents\\NetBeansProjects\\SocialNetworking\\uploads\\users\\"+em+"\\videos").mkdir();
                new File("C:\\Users\\bhupi\\OneDrive\\Documents\\NetBeansProjects\\SocialNetworking\\uploads\\users\\"+em+"\\pics\\albums").mkdir();
                new File("C:\\Users\\bhupi\\OneDrive\\Documents\\NetBeansProjects\\SocialNetworking\\uploads\\users\\"+em+"\\pics\\openpics").mkdir();
                new File("C:\\Users\\bhupi\\OneDrive\\Documents\\NetBeansProjects\\SocialNetworking\\uploads\\users\\"+em+"\\pics\\albums\\Profile Pictures").mkdir();

                Statement stmt1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs1 = stmt1.executeQuery("select* from album");
                rs1.moveToInsertRow();
                rs1.moveToInsertRow();
                
                rs1.updateString("name", "Profile Pictures");
                rs1.updateString("description", "This album contains your profile pictures");
                rs1.updateString("email",em);
               // rs1.insertRow();

               
                
             String to = em;//change accordingly  
             final String user = "karansingh1455";
             final String pass = "@Waheguru11";
             
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
   message.setSubject("Unite Registration Successful");  
  

   message.setText("Welcome "+fn+" "+ln+"                           .Please Do-not-reply. This is an Auto-generated email in response to your registration.");  
   
   //send message  
   Transport.send(message);  
                     
                response.sendRedirect("userhomenew.jsp");
            }




        %>

    </body>
</html>
