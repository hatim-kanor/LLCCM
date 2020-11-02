
<%@page import="javax.print.DocFlavor.STRING"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Gallery</title>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div>
            
        </div>
        <%
             String c_id = request.getParameter("conf_id");
        %>
        <%@include file="convenor_left_panel.jsp" %>
        <div class="container">
            <div class="col-md-8" style="border:1px solid black">
                     <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                     <div>
                         <form action="view_gallery.jsp" method="POST">
                         <table>
                          
                             <tr>
                                 <td>
                                     Select Conference
                                 </td>
                            <td> <select name="conf_id" id="conf_id">
                                    <option value=""></option>
                         <%
                             
                             Connection con = dbconnection.DbConnection.getConnection();
                             PreparedStatement ps = con.prepareStatement("select g.conf_id,c.title from conference c,gallery g where g.conf_id = c.conf_id group by g.conf_id");
                             ResultSet rs = ps.executeQuery();
                             while(rs.next())
                             {
                         %><option value="<%= rs.getString("g.conf_id") %>"><%= rs.getString("c.title") %></option><%
                             }
                         %>
                          </td>
                             </select>

                         </tr>
                         <td>
                             <input type="submit" name="submit" value="View photos">
                         </td>
                         </table></form>
                          <br>
                          <table>
                      
                             <%
                      
                              if(c_id == null)
                              {
                                  
                              }else
                              {
                               PreparedStatement pst = con.prepareStatement("select * from gallery where conf_id = "+ c_id);
       
                                 ResultSet rst = pst.executeQuery();
                                
                                 while(rst.next())
                                 {
                                   
%> <tr><td id="img_disp" colspan="2"><img src="img_view.jsp?g<%= rst.getString("g_id") %>" height="50" width="50">  </td></tr><tr><td>&nbsp;</td> </tr><% 
                                 }}
                             %>
                          
                          
                       
                         </table>
                     </div>
            </div>
                         
            
        </div>
    </body>
</html>
<script>
//    $(document).ready(function () {
//        $("#conf_id").on("change", function () {
//            var conf_id = $("#conf_id").val();//id of country select box of index.jsp page;
//                $.ajax({
//                   // url: "view_gallery.jsp",//your jsp page name
//                    data: {c_id: conf_id},//sending request to state.jsp page.
//                    method: "POST",//HTTP method.
//                    success: function (data)
//                    {
//                        $("#img_disp").html(data);//output or response will display in state select box.
//                    }
//                });
//        });
//    });
//</script>