
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Registered</title>
        <%@include file="cssfile.jsp" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            Connection con = dbconnection.DbConnection.getConnection();
            
        %>
          <div class="container">
             
             
         </div>
     
             <div class="container">
             
                 <%@include file="convenor_left_panel.jsp" %>
                 <div class="col-md-8" style="border:1px solid black">
                     <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                     <div>
                         <table>
                             <tr>
                                 <td colspan="2">
                                     Select Year of Conference
                                 </td>
                                 <td colspan="3"><select name="conf_id" id="conf_id"><option value="">&nbsp;</option>
                                 <%
                                     String c_id ="";
                                     PreparedStatement ps = con.prepareStatement("select * from conference");
                                     ResultSet rs = ps.executeQuery();
                                     while(rs.next())
                                     {
                                 %><option value="<%= rs.getString("conf_id") %>"><%= rs.getString("title") %></option><%
                                     }
                                 %></select></td>
                             </tr>
                             </table>
                             <table style="width: 100%;text-align: center;">
                             <tr>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                             </tr>
                             <tr>
                                 <td id="disp_data"></td>
                             </tr>
                         </table>
                             <a href="export.jsp">Export Data</a>
                     </div>
                 </div>
             </div>
       
    </body>
</html>
<script>
    $(document).ready(function () {
        $("#conf_id").on("change", function () {
            var conf_id = $("#conf_id").val();//id of country select box of index.jsp page;
                $.ajax({
                    url: "conf_view.jsp",//your jsp page name
                    data: {conf_id: conf_id},//sending request to state.jsp page.
                    method: "POST",//HTTP method.
                    success: function (data)
                    {
                        $("#disp_data").html(data);//output or response will display in state select box.
                    }
                });
        });
    });
</script>
