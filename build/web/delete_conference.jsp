
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Conference JSP</title>
    </head>
    <body>
      <%
          String d = request.getParameter("no");
          
          try {
              Connection con = dbconnection.DbConnection.getConnection();
              
              
              Statement st = con.createStatement();
              
              int i= st.executeUpdate("delete from conference where conf_id = '"+d+"'");
              
              if(i != 0)
              {
              response.sendRedirect("view_edit_conference.jsp?msg=success");
              }
              else
              {
                  response.sendRedirect("view_edit_conference.jsp?msg=fail");
              }
                  
              } catch (Exception e) {
                  out.println(e);
              }
      
      %>
    </body>
</html>
