
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
            String staff_id =  request.getParameter("s_id");
            
            String staff_name = request.getParameter("staff_name");
            String contact = request.getParameter("staff_contact");
            String email = request.getParameter("staff_email");
            try{
            Connection con = dbconnection.DbConnection.getConnection();
                              PreparedStatement st = con.prepareStatement("update staff_list set staff_name =?,email=?,contact=? where staff_id = " + staff_id);
                            st.setString(1,staff_name);
                            st.setString(2, email);
                            st.setString(3, contact);
                            
                              int i = st.executeUpdate();
                              if(i > 0 )
                              {
                               
                                  response.sendRedirect("add_staff.jsp?edit=success");
                              }
                              else
                              {
                                  response.sendRedirect("add_staff.jsp?edit=fail");
                              }
                                   
            }catch(Exception e)
            {
                out.println(e);
            } %>
    </body>
</html>
