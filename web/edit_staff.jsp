<%-- 
    Document   : edit_staff
    Created on : Mar 18, 2019, 12:45:00 PM
    Author     : Manish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Staff</title>
    </head>
    <body>
     <div class="container">
            <%@include file="admin_left_panel.jsp" %>
            <div class="col-md-8" style="border:1px solid black">
                <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                <label>Update Staff </label>
                <div>
                             <%
                                 String no = request.getParameter("no");
                                 String msg = request.getParameter("status");
                                 if(msg!=null)
                                 {
                                 if(msg.equals("fail"))
                                 {
                                     %><h2>Failed to Add Staff </h2>   
                                <% }
                                 else if(msg.equals("success"))
                                 {
                                      %><h2>Staff added Successfully </h2>   
                                <%
                                 }
                                 }
                                   Connection con = dbconnection.DbConnection.getConnection();
                                   PreparedStatement ps = con.prepareStatement("select * from staff_list where staff_id = " + no);
                                   ResultSet rs = ps.executeQuery();
                                   while(rs.next())
                                    {


                             %>
                         </div>
                         <form action="editstaff.jsp" method="POST">
                <table>
                    <tr><input type="hidden" name="s_id" value="<%= rs.getString("staff_id") %>"  />
                   
                        <th>Staff ID: </th>
                        <td><input type="text" name="staff_id" value="<%= rs.getString("staff_id") %>"  /></td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th>Staff Name: </th>
                        <td><input type="text" name="staff_name" value="<%= rs.getString("staff_name") %>" /></td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td>&nbsp;</td>
                    </tr>
                   <tr>
                        <th>Staff Email: </th>
                        <td><input type="email" name="staff_email" value="<%= rs.getString("email") %>" /></td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th>Staff Contact: </th>
                        <td><input type="text" name="staff_contact" value="<%= rs.getString("contact") %>" onblur="check_contact()" id="staff_contact" />
                            <p id="contact_disp"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th>Staff Department: </th>
                        <td>
                            <input type="text" name="staff_dept" value="<%= rs.getString("stream") %>">
                             
                        </td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th><input type="submit" value="Update" ></th>
                    
                    </tr>
                    
                   
              <%     }%>
                   
                </table>
                 </form>
            </div>
    </body>
</html>
