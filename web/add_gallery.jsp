
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Gallery</title>
    </head>
    <body>
        <div class="container">
            <%@include file="convenor_left_panel.jsp" %>
            <div class="col-md-8" style="border:1px solid black">
                     <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                     <div >
                     <%
                             String uname = (String)session.getAttribute("username");
                             out.println("Welcome: " + uname);
                         %>
                         <div>
                             <%
                                 String msg = request.getParameter("msg");
                                 if(msg!=null)
                                 {
                                     if(msg.equals("success"))
                                     {
                                         out.println("<h3 style=color:#9ddd94>Successfully added photos to gallery</h3>");
                                     }
                                     else if(msg.equals("fail"))
                                     {
                                         out.println("<h3 style=color:red>Could not upload photos to gallery</h3>");
                                     }
                                     else if(msg.equals("dup"))
                                     {
                                         out.println("<h3 style=color:red>Photos already to gallery for current conference</h3>");
                                     }
                                 }
                                 
                              %>
                                
                         </div>
                         <form action="add_gallery" method="POST" enctype="multipart/form-data">
                             <table>
                                 <caption><center>Add Photos</center></caption>
                                 <tr>
                                     <th>
                                         Select Conference
                                     </th>
                                     <td>
                                         <select name="conf_id">
                                <%
                                    try{
                                    Connection con = dbconnection.DbConnection.getConnection();
                                    PreparedStatement ps = con.prepareStatement("select conf_id,title from conference");
                                    ResultSet rs = ps.executeQuery();
                                    while(rs.next())
                                    {
                                %><option value="<%= rs.getString("conf_id") %>"><%= rs.getString("title") %></option><%
                                    }
}catch(Exception e)
{
out.println(e);
}
                                %>   </select>      
                                     </td>
                                 </tr>
                                 <tr>
                                     <th>
                                         &nbsp;
                                     </th>
                                     <td>
                                         &nbsp;
                                     </td>
                                 </tr>
                                 <tr>
                                     <th>
                                         Photo 1
                                     </th>
                                     <td>
                                         <input type="file" name="gallery_1" />
                                     </td>
                                 </tr>
                                 <tr>
                                     <th>
                                         &nbsp;
                                     </th>
                                     <td>
                                         &nbsp;
                                     </td>
                                 </tr>
                                 <tr>
                                     <th>
                                         Photo 2
                                     </th>
                                     <td>
                                         <input type="file" name="gallery_2" />
                                     </td>
                                 </tr>
                                 <tr>
                                     <th>
                                         &nbsp;
                                     </th>
                                     <td>
                                         &nbsp;
                                     </td>
                                 </tr>
                                 <tr>
                                     <th>
                                         Photo 3
                                     </th>
                                     <td>
                                         <input type="file" name="gallery_3" />
                                     </td>
                                 </tr>
                                 <tr>
                                     <th>
                                         &nbsp;
                                     </th>
                                     <td>
                                         &nbsp;
                                     </td>
                                 </tr>
                                 <tr>
                                     <th>
                                         Photo 4
                                     </th>
                                     <td>
                                         <input type="file" name="gallery_4" />
                                     </td>
                                 </tr>
                                 <tr>
                                     <th>
                                         &nbsp;
                                     </th>
                                     <td>
                                         &nbsp;
                                     </td>
                                 </tr>
                                 <tr>
                                     <th>
                                         Photo 5
                                     </th>
                                     <td>
                                         <input type="file" name="gallery_5" />
                                     </td>
                                 </tr>
                                 <tr>
                                     <th>
                                         &nbsp;
                                     </th>
                                     <td>
                                         &nbsp;
                                     </td>
                                 </tr>
                                 
                                 <tr>
                                     <th colspan="2">
                                         <input type="submit" name="add_gallery" value="Add Photos">
                                     </th>
                                     
                                 </tr>
                             </table>  
                         </form>
        </div>
    </body>
</html>
