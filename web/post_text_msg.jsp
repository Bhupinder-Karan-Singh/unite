<%@page  import="java.sql.*"%>
<%
    String email = (String) session.getAttribute("email");
    String post_content = request.getParameter("post_content");

    System.out.println("Email = " + email);
    System.out.println("Post_Content = " + post_content);

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/batch1", "root", "1234");
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
    ResultSet rs = stmt.executeQuery("select * from post");

    rs.moveToInsertRow();

    rs.updateString("post_by_email", email);
    rs.updateString("post_content", post_content);
    rs.updateString("post_type", "text");
    rs.insertRow();


%>