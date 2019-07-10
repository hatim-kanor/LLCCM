
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Valedictory Members</title>
    </head>
    <body>
        <%@include file="convenor_left_panel.jsp" %>
         <div class="col-md-8" style="border:1px solid black">
                     <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                     <div>
                
        <%
            String status = request.getParameter("status");
            if(status!=null)
            {
                if(status.equals("dup"))
                {
                    out.println("<h3>Already Added chief guest or key note speaker</h3>");
                }
                else if(status.equals("success"))
                {
                    out.println("<h3>Chief Guest / Key note speaker added successfully</h3>");
                }
                else if(status.equals("fail"))
                {
                    out.println("<h3>Failed to add chief guest or key note speaker</h3>");
                }
            }
        %>
                 <!--Chief guest part start --> 
                   <form id="" method="POST" action="add_vali">
            <table> <caption><b>Chief Guest</b></caption>
                <input type="hidden" value="cg" name="vale" />
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
                        <th>Name </th>
                        <td><input type="text" name="c_username" placeholder="Chief Guest Name" /></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                   <tr>
                        <th>Designation </th>
                        <td><input type="text" name="c_desig" placeholder="Designation">
                        </td>
                    </tr> <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th>College/University Name</th>
                        <td>
                            <input type="text" name="c_clg" placeholder="Chief Guest College/University">
                        </td>
                    </tr>
                    
                      <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                            <!--Chief guest part end -->
                             
                             <!--key note speaker part start -->
                         <tr>
                        <th colspan="2"><b>KEY NOTE SPEAKER</b></th>
                        
                    </tr>   
                    <tr>
                        <th>Key_Note Speaker </th>
                        <td><input type="text" name="k_username" placeholder="Key_Note Speaker" /></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                   <tr>
                        <th>Designation </th>
                        <td><input type="text" name="k_desig" placeholder="Designation">
                        </td>
                    </tr> <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th>College/University Name</th>
                        <td>
                            <input type="text" name="k_clg" placeholder="Chief Guest College/University">
                        </td>
                    </tr>
                      </tr> <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td colspan="2"><input type="submit" value="Add" id="user_login"></td>
                        
                           
                    </tr>
            </table>
            
        </form><!-- key note speaker part end -->
                     </div>
        </div>
    </body>
</html>
