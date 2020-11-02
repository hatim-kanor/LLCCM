
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Convenor</title>
        <%@include file="cssfile.jsp" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
         <div class="container">
             
                 <%@include file="admin_left_panel.jsp" %>
                 <div class="col-md-8" style="border:1px solid black">
                     <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                     <div>
                         <%
                             String msg = request.getParameter("msg");
                             String del = request.getParameter("del");
                             String up = request.getParameter("up");
                             if(msg!=null)
                             {
                                 if(msg.equals("fail"))
                                 {
                                     %><h2>Failed to add convenor</h2><%
                                 }
                                else if(msg.equals("dup"))
                                {
                                    %><h2>Convenor already selected for conference</h2><%
                                }
                                else if(msg.equals("success"))
                                {
                                    %><h2>Successfully added Convenor</h2><%
                                }
                             }
                             if(del!=null)
                             {
                                 if(del.equals("fail"))
                                 {
                                     %><h2>Failed to delete convenor</h2><%
                                 }
                                else if(del.equals("success"))
                                {
                                    %><h2>Convenor deleted Successfully</h2><%
                                }
                                
                             }
                             if(up!=null)
{
if(up.equals("success"))
{
                                    %><h2>Convenor edited Successfully</h2><%
}
else if(up.equals("fail"))
{
                                    %><h2>Failed to edit</h2><%
}
}

                         %>
                         <form id="staff" action="add_convenor" method="POST">
                           <table>
                               <tr> <td>Select Conference </td><td><select name="conf_id" id="conf_id">
                         <%
                             
                              Date d = new Date();
                             String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
                             String query = "select * from conference where conf_date >= '" + c_year + "'";
                             Connection con = dbconnection.DbConnection.getConnection();
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
    <td><select name="stream_id" id="stream_id"><option value="">Select Stream</option>
                                 
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
                     </div>
                       <br><br>

                    <div>
                        <table class="table-responsive" border="1">
                            <tr>
                                <th>Committee ID</th>
                                <th>Staff Name</th>
                                <th>Conference</th>
                                <th>Role</th>
                                <th>Action</th>
                            </tr>
                            
                            <%
                                PreparedStatement preparedStatement = con.prepareStatement("select c.c_id,e.staff_name,f.title,c.cm_role from committee_list c,staff_list e,conference f where c.staff_id = e.staff_id and f.conf_id = c.conf_id and (c.c_name = 'CONVENOR' OR c.c_name='convenor')");
                                ResultSet resultset = preparedStatement.executeQuery();
                                while(resultset.next())
                                {
                            %><tr><td><%= resultset.getString("c.c_id") %></td><%
                            %><td><%= resultset.getString("e.staff_name") %></td><%
                            %><td><%= resultset.getString("f.title") %></td><%
                            %><td><%= resultset.getString("c.cm_role") %></td><%
                            %><td><a href="convenor_edit.jsp?update=<%= resultset.getString("c.c_id") %>&&msg=edit">Edit</a> | <a href="convenor_edit.jsp?update=<%= resultset.getString("c.c_id") %>&&msg=delete">Delete</a></td></tr><%
                                     
                                }
                            %>
                            
                        </table>
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
