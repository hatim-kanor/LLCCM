
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schedule List</title>
        <!-- Style for time--><style>
            input:invalid+span:after{
                position: absolute;
                content: 'x';
                padding-left: 5px;
            }
            input:valid+span:after{
                position: absolute;
                content: 'Correct';
                padding-left: 5px;
            }
        </style><!-- Style for time-->
            
    </head>
    <body>
        <%@include file="convenor_left_panel.jsp" %>
                <div class="col-md-8" style="border:1px solid black">
                     <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                     <div>
         <!-- Msg for printing--><%
                                    String msg = request.getParameter("msg");
                                    if(msg!=null)
                                    {
                                        if(msg.equals("dup"))
                                        {
                                            out.println("Already Schedule Updated for currrent conferene");
                                        }
                                        else if(msg.equals("success"))
                                        {
                                            out.println("Schedule Updated for Current Conference");
                                        }
                                        else if(msg.equals("fail"))
                                        {
                                            out.println("Failed to update conference");
                                        }
                                    }
                                %><!-- Msg for printing-->
        <form action="schedule" method="POST">
        <table>
            
                <tr>
                    <td colspan="3">
                       Schedule List
                    </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                        &nbsp;
                    </td>
                    </tr>
                    <tr>
                        <td>
                            Select Conference
                        </td>
                        <td colspan="2">
                            <center>
                            <select name="conf_id">
                                
                                <option value="">&nbsp;</option>
                                <%
                                    
                                    Connection con = dbconnection.DbConnection.getConnection();
                                     Date d = new Date();
                             String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
                            
                             
                             String query = "select c.conf_id,c.title from conference c where c.conf_date >='"+c_year+"'" ;
                             PreparedStatement ps = con.prepareStatement(query);
                             ResultSet rs = ps.executeQuery(); 
                            
                             while(rs.next())
                             {
                                 %>
                                     <option value="<%= rs.getString("c.conf_id")  %>"><%= rs.getString("c.title")  %> </option> 
<%
                                 
                             }
                                %>
                                
                            </select></center>
                    
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                        &nbsp;
                    </td>
                    </tr>
                    
                    <tr>
                    <td>
                        1
                    </td>
                    <td>
                        Registration
                    </td>
                    <td>
                        <input type="time" name="reg_time" min="08:00" max="9:00"><span id="validity"></span>
                    </td>
                    </tr>
                    
                    <tr>
                        <td colspan="3">
                        &nbsp;
                    </td>
                    </tr>
                
                    
                     <tr>
                    <td>
                        2
                    </td>
                    <td>
                        Break-Fast
                    </td>
                    <td>
                        <input type="time" name="bf" min="09:00" max="10:00"><span id="validity"></span>
                    </td>
                    </tr>
                
                
                <tr>
                        <td colspan="3">
                        &nbsp;
                    </td>
                    </tr>
                    
                 <tr>
                    <td>
                        3
                    </td>
                    <td>
                        Inaugration
                    </td>
                    <td>
                        <input type="time" name="inaug" min="10:00" max="10:30" ><span id="validity"></span>
                    </td>
                </tr>
                
                <tr>
                        <td colspan="3">
                        &nbsp;
                    </td>
                    </tr>
                    
                 <tr>
                    <td>
                        4
                    </td>
                    <td>
                        Introduction
                    </td>
                    <td>
                        <input type="time" name="intro" min="10:30" max="11:00"><span id="validity"></span>
                    </td>
                    
                </tr>
                
                <tr>
                        <td colspan="3">
                        &nbsp;
                    </td>
                    </tr>
                
                 <tr>
                    <td>
                        5
                    </td>
                    <td>
                        Speech By principal
                    </td>
                    <td>
                        <input type="time" name="sbp" min="11:00" max="11:30"><span id="validity"></span>
                    </td>
                    
                </tr>
                
                <tr>
                        <td colspan="3">
                        &nbsp;
                    </td>
                    </tr>
                
                 <tr>
                    <td>
                        6
                    </td>
                    <td>
                        Speech By Chief Guest
                    </td>
                    <td>
                        <input type="time" name="sbcg" min="11:30" max="12:00" ><span id="validity"></span>
                    </td>
                    
                </tr>
                
                <tr>
                        <td colspan="3">
                        &nbsp;
                    </td>
                    </tr>
                
                 <tr>
                    <td>
                        7
                    </td>
                    <td>
                        Speech By Keynote Speaker
                    </td>
                    <td>
                        <input type="time" name="sbkns"  min="12:00" max="12:30"><span id="validity"></span>
                                                                                       
                    </td>
                    
                </tr>
                
                <tr>
                        <td colspan="3">
                        &nbsp;
                    </td>
                    </tr>
                
                 <tr>
                    <td>
                        8
                    </td>
                    <td>
                        Paper Presentation part I
                    </td>
                    <td>
                        <input type="time" name="pp1" min="12:30" max="14:00" ><span id="validity"></span>
                    </td>
                </tr>
                
                <tr>
                        <td colspan="3">
                        &nbsp;
                    </td>
                    </tr>
                
                 <tr>
                    <td>
                        9
                    </td>
                    <td>
                        Lunch Break
                    </td>
                    <td>
                        <input type="time" name="lb" min="14:00" max="15:00" ><span id="validity"></span>
                    </td>
                </tr>
                
                <tr>
                        <td colspan="3">
                        &nbsp;
                    </td>
                    </tr>
                
                 <tr>
                    <td>
                        10
                    </td>
                    <td>
                        Paper Presentation Part II 
                    </td>
                    <td>
                        <input type="time" name="pp2" min="15:00" max="16:30" ><span id="validity"></span>
                                                                                         
                    </td>
                </tr>
                
                <tr>
                        <td colspan="3">
                        &nbsp;
                    </td>
                    </tr>
                
                 <tr>
                    <td>
                        11
                    </td>
                    <td>
                        Results And Certificates Distribution
                     </td>
                    <td>
                        <input type="time" name="racd" min="16:30" max="17:30"><span id="validity"></span>
                    </td>
                </tr>
                
                <tr>
                        <td colspan="3">
                        &nbsp;
                    </td>
                    </tr>
                
                 <tr>
                    <td>
                        12
                    </td>
                    <td>
                        Vote Of Thanks
                    </td>
                    <td>
                        <input type="time" name="vot" min="17:30" max="18:00" ><span id="validity"></span>
                    </td>
                </tr>
                <tr>
                        <td colspan="3">
                        &nbsp;
                    </td>
                    </tr>
                <tr>
                        <td colspan="3">
                            <input type="submit" name="submit" value="Add">
                    </td>
                    </tr>
                
            
        </table>
            </form>
                     </div>
                </div>
     
    </body>
</html>


