
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTRATION - LLC</title>
        <style>
            tr
            {
                padding:10px;
                margin: 10px;
                font-style: oblique;
            }
            table
            {
                margin:10px;
                padding: 20px;
            }
            </style>
    </head>
    <body>
        <div class="container-fluid">
            <%@include file="conference_menu.jsp" %>
        </div>
        
        <div class="container">
            <%
                String reg = request.getParameter("reg");
                if(reg!=null)
                {
                    if(reg.equals("success"))
                    {
            %><span>Registration successful</span><%
                    }
                    if(reg.equals("unsuccess"))
                    {
            %><span>Could not register</span><%            
                    }
                    if(reg.equals("fail"))
                    {
                        %><span>Already Registered Kindly Login</span>
                        <%
                    }
                }
            %>
            
            <span style="text-align: center;"><h3>REGISTRATION FOR CONFERENCE</h3></span>
            
            <br>
            <form action="registration_user" method="POST">
            <table >
               
                 <tr>
                    <td>
                        <span>Select Conference </span>
                    </td>
                    <td>
                        <select name="conf_id">
                        <% 
                            Date d = new Date();
            String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
                             String query = "select * from conference where conf_date >= '" + c_year + "'";
               
                            Connection con = dbconnection.DbConnection.getConnection();
                        PreparedStatement pst = con.prepareStatement(query);
                        ResultSet rs = pst.executeQuery();
                        while(rs.next())
                        {
                        %><option value="<%= rs.getString("conf_id") %>"><%= rs.getString("title") %></option><%
                        }
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
               
                 <tr>
                    <td>
                        <span>Enter Name: </span>
                    </td>
                    <td>
                        <input type="text" name="uname" placeholder="User Name">
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <span>Enter Email ID: </span>
                    </td>
                    <td>
                        <input type="email" name="uemail" placeholder="User Email">
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <span>Enter Contact Number: </span>
                    </td>
                    <td>
                        <input type="tel" name="ucontact" placeholder="User Contact" minlength="10" maxlength="10">
                    </td>
                </tr>
                
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <span>Enter College/institute: </span>
                    </td>
                    <td>
                        <input type="text" name="coll" required="true" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <span>Enter Address: </span>
                    </td>
                    <td>
                        <textarea name="uaddress" required="true"></textarea>
                    </td>
                </tr>
                <tr>
                <tr>
                    
                    <td>
                        <span>Select Designation: </span>
                    </td>
                    <td>
                        <select name="desig">
                            <option value=" "> Select Designation</option>
                            <option value="teacher">Teacher</option>
                            <option value="student">Student</option>
                            <option value="other">Other</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <span>Select Payment Type: </span>
                    </td>
                    <td>
                      <select name="payment_type">
                        <% 
                            
                           
                        PreparedStatement pst1 = con.prepareStatement("select * from payment ");
                        ResultSet rs1 = pst1.executeQuery();
                        while(rs1.next())
                        {
                        %><option value="<%= rs1.getString("payment_id") %>"><%= rs1.getString("p_type") %></option><%
                        }
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                <input type="submit" value="REGISTER" name="btn_register">
                    </td>
                </tr>
               
            </table>
            </form>
        </div>
    </body>
</html>
