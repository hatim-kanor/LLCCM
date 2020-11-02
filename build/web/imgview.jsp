
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <table border="1">
        
                
                    <%
                        String conf_id = request.getParameter("conf_id");
                        Connection con = dbconnection.DbConnection.getConnection();
                        PreparedStatement ps = con.prepareStatement("select * from gallery where conf_id = " + conf_id);
                        ResultSet rs = ps.executeQuery();
                        
                        while(rs.next())
                        {
                            
                    
                        %>
                        <tr><td><img src="view_gall.jsp?id=<%= rs.getString("conf_id") %>" height="50" width="50"></td>  </tr>
                    <% 
                      }
                    %>
              
          
        </table>
        
    </body>
</html>
