
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Conference</title>
    </head>
    <body>
        <div class="container">
            
                <%@include file="admin_left_panel.jsp" %>
                <div class="col-md-7">
                    <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                    
                    <div class="container-fluid" style="text-align: center;">
        
     
            
            <%
                String conf_id = request.getParameter("no");
                Connection con = dbconnection.DbConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("select * from conference where conf_id ="+conf_id);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    %>
                    <form action="editconference" method="POST">
                    <table>
                    <tr><input type="hidden" name="conf_id" value="<%= rs.getString("conf_id") %>"  />
                   
                        <th>Conference Title: </th>
                        <td><input type="text" name="conf_title" value="<%= rs.getString("title") %>"  /></td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th>Collaboration with: </th>
                        <td><input type="text" name="conf_collab" value="<%= rs.getString("collab_with") %>" /></td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td>&nbsp;</td>
                    </tr>
                   <tr>
                        <th>Conference Date: </th>
                        <td><input type="date" name="conf_date" value="<%= rs.getString("conf_date") %>" /></td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th>About Conference </th>
                        <td><input type="text" name="conf_about" value="<%= rs.getString("about_conf") %>" onblur="check_contact()" id="staff_contact" />
                            
                        </td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th> Venue: </th>
                        <td>
                            <input type="text" name="conf_venue" value="<%= rs.getString("venue") %>">
                             
                        </td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th><input type="submit" value="Update Conference" ></th>
                    
                    </tr>
                    
                   
              <%     }%>
                   
                </table>
                 </form>
                    
                    
              
        </div>
                </div>
    </body>
</html>
