
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
 <%
            String staff_id = request.getParameter("no");
            
            try{
            Connection con = dbconnection.DbConnection.getConnection();
                                  Statement ps = con.createStatement();
                                 
                              int i = ps.executeUpdate("delete from staff_list where staff_id = " + staff_id );
                              if(i > 0 )
                              {
                                  out.println("Data updated successfully");
                                  response.sendRedirect("add_staff.jsp?delete=success");
                              }
                              else
                              {
                                  response.sendRedirect("add_staff.jsp?delete=fail");
                              }
                                   
            }catch(Exception e)
            {
                out.println(e);
            } %>
    </body>
</html>
