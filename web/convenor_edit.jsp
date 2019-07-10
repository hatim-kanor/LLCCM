
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@include file="admin_left_panel.jsp" %>
        
        <div class="container-fluid">
            <div class="col-md-8" style="border:1px solid black">
                     <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                     <div>
                    
        <%
            String status = request.getParameter("update");
            String msg = request.getParameter("msg");
            
            if(msg!=null)
            {
                if(msg.equals("edit"))
                {
                    %>
                    <form action="update_staff" method="POST">
                    <table>
                       <tr> <td>Select Conference </td><td><select name="conf_id" id="conf_id">
                         <%Connection con = dbconnection.DbConnection.getConnection();
                             
                              Date d = new Date();
                             String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
                             String query = "select * from conference where conf_date >= '" + c_year + "'";
                             PreparedStatement ps = con.prepareStatement(query);
                             ResultSet rs = ps.executeQuery(); 
                            
                             while(rs.next())
                             {
                                 %>
                                     <option value="<%= rs.getString("conf_id")  %>"><%= rs.getString("title")  %> </option> 
<%
                                 
                             }
                             %>
                             </select> </td></tr>
                               <tr>
                                   <td>
                                       &nbsp;
                                   </td>
                                   <td>
                                       &nbsp;
                                   </td>
                               </tr>                               
<tr><td >Select Staff Stream </td>
                                     <td><select name="stream_id" id="stream_id">
                                 
                           <%
                               PreparedStatement pst = con.prepareStatement("select stream,staff_id from staff_list group by stream");
                               ResultSet rst = pst.executeQuery();
                               while(rst.next())
                               {
                             %>
                                           <option value="<%= rst.getString("stream") %>"><%= rst.getString("stream") %></option>
<%
                               }
                           %> </select> </td>    </tr>
<tr>
                                   <td>
                                       &nbsp;
                                   </td>
                                   <td>
                                       &nbsp;
                                   </td>
                               </tr>
                         <tr><td >Select Staff</td>
                             <td id="staff_id"></td></tr>
                         <tr>
                                   <td>
                                       &nbsp;
                                   </td>
                                   <td>
                                       &nbsp;
                                   </td>
                               </tr>
                               <tr>
                                   <td colspan="2">
                                       <input type="submit" name="submit" value="Add Convenor" id="submit">
                                   </td>
                                   
                               </tr>
                    </table>
                    </form>
                    <%
                    
                }
                else if(msg.equals("delete"))
                {
Connection con = dbconnection.DbConnection.getConnection();
                    PreparedStatement ps = con.prepareStatement("delete from committee_list where c_id = ?");
                    ps.setString(1, status);
                    int result = ps.executeUpdate();
                    if(result > 0)
                    {
                        response.sendRedirect("add_convenor.jsp?del=success");
                    }
                    else
                    {
                        response.sendRedirect("add_convenor.jsp?del=fail");
                    }
                            
                }
                    
            }
        %>
                     </div>
            </div>
        </div>
            
        
    </body>
    
</html>
<script>
    $(document).ready(function () {
        $("#stream_id").on("change", function () {
            var stream_id = $("#stream_id").val();//id of country select box of index.jsp page;
                $.ajax({
                    url: "staffview.jsp",//your jsp page name
                    data: {stream_id: stream_id},//sending request to state.jsp page.
                    method: "POST",//HTTP method.
                    success: function (data)
                    {
                        $("#staff_id").html(data);//output or response will display in state select box.
                    }
                });
        });
    });
</script>
