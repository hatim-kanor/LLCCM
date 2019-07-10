

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Staff</title>
        <%@include file="cssfile.jsp" %>
        
    </head>
    <script>
        function check_contact()
        {
            var x = document.getElementById("staff_contact");
            if(x.length > 10 || x.length < 0 )
            {
                document.getElementById("contact_disp").innerHTML = "Contact Number should be 10 digits";
            }
        }
        
        function check_dept()
        {
            var x = document.getElementById("staff_department");
            if(x === "choose_department")
            {
                document.getElementById("disp_dept").innerHTML = "Please select Department";
                
            }
        }
    </script>
    <body>
        <div class="container">
            <% String ss = (String)session.getAttribute("username");
                            String role = (String)session.getAttribute("role");
                            if(ss!=null || role!=null)
                            {
                                if(role.equals("convenor"))
                                {
                                    %><%@include file="convenor_left_panel.jsp" %><%
                                }
                                    else if(role.equals("admin")) 
                                {
                                    %><%@include file="admin_left_panel.jsp" %><%
                                }}
            %> <div class="col-md-8" style="border:1px solid black">
                <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                <label>Add New Staff </label>
                <div>
                             <%
                                 String msg = request.getParameter("status");
                                 String edit = request.getParameter("edit");
                                String delete = request.getParameter("delete");
                                 if(msg != null)
                                {
                                    if(msg.equals("success"))
                                    {
                                      %>Staff Added Successfully<%  
                                    }
                                    else if(msg.equals("fail"))
                                    {
                                      %>Failed to add staff<%  
                                    }
                                     else if(msg.equals("dup"))
                                    {
                                      %>Staff Already Added<%  
                                    }

                                }
                                if(edit != null)
                                {
                                    if(edit.equals("success"))
                                    {
                                        %>Staff Updated Successfully<%
                                    }
                                    else if(edit.equals("fail"))
                                    {
                                        %>Failed to update staff<%
                                    }
                                }
                                if(delete != null)
                                {
                                    if(delete.equals("success"))
                                    {
                                        %>Staff Deleted Successfully<%
                                    }
                                    else if(delete.equals("fail"))
                                    {
                                        %>Failed to delete staff<%
                                    }
                                }


                                
                             %>
                         </div>
                          <form action="add_staff" method="POST">
                <table>
                    <tr>
                        <th>Staff Name: </th>
                        <td><input type="text" name="staff_name" placeholder="Staff Name" /></td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td>&nbsp;</td>
                    </tr>
                   <tr>
                        <th>Staff Email: </th>
                        <td><input type="email" name="staff_email" placeholder="Staff Email" /></td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th>Staff Contact: </th>
                        <td><input type="text" name="staff_contact" placeholder="Staff Name" onblur="check_contact()" id="staff_contact" />
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
                            <select name="staff_department" onblur="check_dept()" id="staff_department">
                                <option value="choose_department">Select Staff Department </option>
                                <option value="jr_college">Junior College</option>
                                <option value="sr_college">Senior College</option>
                                <option value="self_finance">Self Financed Department</option>
                                <option value="non_teaching">Non Teaching Staff</option>
                            </select>
                             <p id="disp_dept"></p>
                        </td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th><input type="submit" value="Register Staff" ></th>
                    
                    </tr>
                    
                   
                   
                   
                </table>
                 </form>
                         <br>
                         <div>
                             <table border="1" style="margin: 5px;padding:5px;">
                                 <caption>STAFF LIST</caption>
                                 <tr>
                                     <th>
                                         ID
                                     </th>
                                     <th>
                                         NAME
                                     </th>
                                     <th>
                                         STREAM
                                     </th>
                                     <th>
                                         EMAIL
                                     </th>
                                     <th>
                                         CONTACT
                                     </th>
                                     <th>
                                         ACTIONS
                                     </th>
                                 </tr>
                                     <%
                                    
                                     try {
                    
                    Connection con = dbconnection.DbConnection.getConnection();
                    
                   Statement st = con.createStatement();
                   ResultSet rs = st.executeQuery("select * from staff_list");
                   
                   while(rs.next())
                   {
                    %>
                    <tr>
                        <td>
                            <%= rs.getString("staff_id") %>
                        </td>
                        <td>
                            <%= rs.getString("staff_name") %>
                        </td>
                        <td>
                            <%= rs.getString("stream") %>
                        </td>
                        <td>
                            <%= rs.getString("email") %>
                        </td>
                        <td >
                            <%= rs.getString("contact") %>
                        </td>
                        <td>
                            <a href="edit_staff.jsp?no=<%= rs.getString("staff_id") %>">EDIT</a> | <a href="delete_staff.jsp?no=<%= rs.getString("staff_id") %>">DELETE</a>
                        </td>
                        
                        
                    </tr>
                    
                       <% }}catch(Exception e){out.println(e);} %>
                                 
                             </table>
                         </div>
                         
            </div>
            
        </div>
    </body>
</html>
