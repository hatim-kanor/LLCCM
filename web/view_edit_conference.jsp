
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VIEW & EDIT CONFERENCE</title>
         <%@include file="cssfile.jsp" %>
    </head>
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
                                }
            %>
               
                <div class="col-md-7">
                    <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                    
                    <div class="container-fluid" style="text-align: center;">
                        <%
                            
                                
                            }
                            else
                            {
                                
                            }
                            String msg = request.getParameter("msg");
                            String update = request.getParameter("update");
                            if(msg!=null)
                            {
                                if(msg.equals("success"))
                                {
                                    out.print("Conference Deleted Successfully");
                                }
                                else if(msg.equals("fail"))
                                {
                                    out.println("Failed to delete conference");
                                }
                            }
                            if(update != null)
                            {
                                if(update.equals("success"))
                                {
                                    out.println("Conference Updated Successfully");
                                }
                                else
                                {
                                    out.println("Failed to update conference");
                                }
                            }
                        
                        %>
                             <h4>CONFERENCES</h4>
                             <table border="1" style="font-size: 15px;">
                                 <tr style="background-color: #28a4c9;color: black;">
                                     <th>
                                         ID
                                     </th>
                                     <th>
                                         TITLE
                                     </th>
                                     <th>
                                         DATE
                                     </th>
                                     <th>
                                         LOCATION
                                     </th>
                                     <th>
                                         BANNER
                                     </th>
                                     <th>
                                         EDIT
                                     </th>
                                     <th>
                                         DELETE
                                     </th>
                                     
                                 </tr>
                                 
                                 <%
                                    
                                     try {
                    
                    Connection con = dbconnection.DbConnection.getConnection();
                    
                   Statement st = con.createStatement();
                   ResultSet rs = st.executeQuery("select * from conference");
                   
                   while(rs.next())
                   {
                    %>
                    <tr>
                        <td>
                            <%= rs.getString("conf_id") %>
                        </td>
                        <td>
                            <%= rs.getString("title") %>
                        </td>
                        <td>
                            <%= rs.getString("conf_date") %>
                        </td>
                        <td>
                            <%= rs.getString("venue") %>
                        </td>
                        <td >
                            
                            <img src="img_view.jsp?no=<%= rs.getString("conf_id") %>" height="100" width="100" />
                            
                        </td>
                        <td>
                            <a href="edit_conference.jsp?no=<%= rs.getString("conf_id") %>">EDIT</a>
                        </td>
                        <td>
                            
                            <a href="delete_conference.jsp?no=<%= rs.getString("conf_id") %>">DELETE</a>
                        </td>
                        
                    </tr>
                    
                    <%   
                   }
                   
                                     }catch(Exception e)
                                     {
                                        out.println(e); 
                                     }
                                 %>
                             </table>
                             
                         </div>
                    
                    
                </div>
                
                
            
            
        </div>
    </body>
</html>
