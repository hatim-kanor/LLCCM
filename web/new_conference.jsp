
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <%@include file="cssfile.jsp" %>
              <title>ADD NEW CONFERENCES</title>
     <style>
         body{
             margin:15px;
         }
        
         a{
             text-decoration: none;
             font-size:20px;
             text-align: center;
           
           
         }
         a:hover
         {
             background-color: brown;
             color:white;
         }
         
     </style>
     
      
    </head>
    <body>
        
         <div class="container">
             
             
         </div>
     
             <div class="container">
             
                 <%@include file="admin_left_panel.jsp" %>
                 <div class="col-md-8" style="border:1px solid black">
                     <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                     <div >
                         <%
                             String uname = (String)session.getAttribute("username");
                             out.println("Welcome: " + uname);
                         %>
                         <div>
                             <%
                                 String msg = request.getParameter("status");
                                 if(msg!=null)
                                 {
                                 if(msg.equals("fail"))
                                 {
                                     %><h2>Failed to Add Conference </h2>   
                                <% }
                                 else if(msg.equals("success"))
                                 {
                                      %><h2>Successfully added Conference </h2>   
                                <%
                                 }else if(msg.equals("fail_committee"))
                                    {
                                       %><h2>Failed to add convenor to current conference</h2><%
                                    }
                                    else if(msg.equals("date_diff"))
                                    {
                                       %><h2>Conference date should not be less that current date</h2><%
                                    }

                                 }

                                
                             %>
                         </div>
                         <form action="add_conf" method="POST" enctype="multipart/form-data">
                             <table>
                                 <caption><center>ADD CONFERENCE </center></caption>
                                 <tr>
                                     <td>
                                         Enter Conference Title
                                     </td>
                                     <td>
                                         <input type="text" name="c_title" required>
                                     </td>
                                 </tr>
                                     <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                                 
                                 <tr>
                                     <td>
                                         Collaboration With Banner: 
                                     </td>
                                     <td>
                                         <input type="file" name="conf_banner">
                                     </td>
                                 </tr>
                                 
                                 <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                                 <tr>
                                     <td>
                                         In Collaboration with
                                     </td>
                                     <td>
                                         <input type="text" name="c_with" required>
                                     </td>
                                 </tr>
                         <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                                     <td>
                                         About Conference
                                     </td>
                                     <td>
                                         <input type="text" name="about_c" required>
                                     </td>
                                 </tr>
                         <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                                 <tr>
                                     <td>
                                         Select Conference Date: 
                                     </td>
                                     <td>
                                         <input type="date" name="c_date">
                                     </td>
                                    
                                 </tr>
                                 <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                                 <tr>
                                     <td>
                                         Add Conference Venue:
                                     </td>
                                     <td>
                                         <input type="text" name="c_venue">
                                     </td>
                                 </tr>
                        <tr> 
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Add Conference Aim:
                        </td>
                        <td>
                            <textarea name="conf_aim" maxlength="350" minlength="20" required="true" placeholder="Conference Aim | Maximum 350 Characters" ></textarea> Maximum 350 characters
                        </td>
                        
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" name="add_conferece" value="ADD CONFERENCE">
                        </td>
                    </tr>
                             </table>
                         </form>
                         
                     </div>
                         
                         <div class="container-fluid" style="text-align: center;">
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
                    </tr>
                    
                    <%   
                   }
                   
                                     }catch(Exception e)
                                     {
                                         
                                     }
                                 %>
                             </table>
                             
                         </div>    
                 </div>
                 
            
     </div>
    </body>
</html>
