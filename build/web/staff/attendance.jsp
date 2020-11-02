
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../cssfile.jsp" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style type="text/css">
            tr{
                text-align: center;
            }
            th{
                text-align: center;
            }
            table{
                text-align: center;
            }
            td{
                text-align: center;
                margin: 5px;
                padding:5px;
            }
            a{
                text-decoration: none;
            }
            #btn
            {
                border: 0px;
                text-decoration: none;
                background-color: springgreen;
                color:black;
            }
        </style>
    </head>
    <body>

        <%
            Connection con = dbconnection.DbConnection.getConnection();
        %>
        <%
            String m = request.getParameter("m");
            String msg = "";
            Date d = new Date();
            String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
            String uname = (String) session.getAttribute("username");
            String email = (String) session.getAttribute("staff_email");
            String role = (String) session.getAttribute("role");
            String type = (String) session.getAttribute("header_type");
            try {
                
                    if (role != null) {
                        if (type != null) {

                            if (type.equals("normal")) {
        %><%@include file="staff_lef_panel.jsp" %><%
            msg = "Not Eligible";
        %>
        <div class="container-fluid">

            <div class="col-md-7">
                <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>

                <div class="container-fluid" style="text-align: center;">

                    <%= msg%>

                </div>
            </div>
            <%
            } else if (type.equals("soon")) {
            %><%@include file="staff_lef_panel.jsp" %><%
                msg = "CONFERENCE ATTENDENCE WILL BE LIVE ON THE CONFERENCE DAY ";
            %>
            <div class="container">

                <div class="col-lg-8">
                    <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>

                    <div class="container-fluid" style="text-align: center;">

                        <%= msg%>

                    </div>
                </div>
                <%
                } else if (type.equals("editable")) {
                %><%@include file="staff_lef_panel.jsp" %><%
                    msg = "Eligible";

                %>
                <div class="container-fluid">

                    <div style="width: 100%">

                        <div class="container-fluid" style="text-align: center;">
                            <%
                                if(m==null)
                                {
                                    out.println("");
                                }
                                else
                                {
                                if(m.equals("s"))
                                {
                                    out.println("<p style='color:green'><h4>REGISTRATION DATA UPDATED SUCCESSFULLY</h4></p>");
                                }
                                else if(m.equals("ud"))
                                {
                                    out.println("<p style='color:orange'><h4>KINDLY SELECT PROPER OPTIONS TO UPDATE DATA</h4></p>");
                                }
                                else if(m.equals("ne"))
                                {
                                    out.println("<p style='color:red'><h4>NOT ELIGIBLE AS USER CANNOT BE MARKED ATTENDED IF NOT PAID AMOUNT</h4></p>");
                                }
                                else
                                {
                                    out.println("");
                                }
                                }
                            %>


                            <%= msg%>
                            <form  method="POST" action="update_attendance.jsp">
                                <table border="1" style="width: 70%">
                                    <tr>
                                        <th>
                                            ID
                                        </th>
                                        <th>
                                            NAME
                                        </th>
                                        <th>
                                            CONTACT 
                                        </th>
                                        <th>
                                            PAYMENT MODE
                                        </th>
                                        <th>
                                            DESIGNATION
                                        </th>
                                        <th>
                                            AMOUNT
                                        </th>
                                        <th>
                                            PAYMENT STATUS
                                        </th>
                                        <th>
                                            USER STATUS
                                        </th>
                                        <th>
                                            ACTIONS
                                        </th>
                                    </tr>
                                    <%
                                        String payment_status = "", user_status = "", conf_id = "", title = "", email_user = "";
                                        PreparedStatement p = con.prepareStatement("select r.email,c.title,c.conf_id,r.reg_id,r.uname,r.contact,p.p_type,r.designation,pa.amount,r.payment_status,r.user_status from payment_amount pa,payment p,registration r,conference c where c.conf_date = '" + c_year + "' and c.conf_id=r.conf_id and p.payment_id = r.payment_id and pa.id = r.pa_id order by r.user_status desc");
                                        ResultSet r = p.executeQuery();
                                        while (r.next()) {
                                    %><%
                                        email_user = r.getString("r.email");
                                        title = r.getString("c.title");
                                        conf_id = r.getString("c.conf_id");
                                        payment_status = r.getString("r.payment_status");
                                        user_status = r.getString("r.user_status");
                                    %>

                                    <tr><td><%= r.getString("r.reg_id")%></td>
                                        <td><%= r.getString("r.uname")%></td>

                                        <td><%= r.getString("r.contact")%></td>

                                        <td><%= r.getString("p.p_type")%></td>

                                        <td><%= r.getString("r.designation")%></td>

                                        <td><%= r.getString("pa.amount")%></td>

                                        <td>

                                            <%
                                                if (payment_status.equals("PAID")) {
                                            %><%= payment_status%><%
                                            } else if (payment_status.equals("UNPAID")) {
%><select name="payment_status" id="payment_status">
                                                <option value="<%= payment_status%>">
                                                    <%= payment_status%>
                                                </option>
                                                <option value="PAID">
                                                    PAID
                                                </option>
                                            </select><%
                                                }

                                            %>
                                        </td>


                                        <td>
                                            <%                                           
                                                if (user_status.equals("Attended")) {
                                            %>
                                            <%= user_status%><%
                                            } else if (user_status.equals("Not Attended")) {
%><select name="user_status" id="user_status">
                                                <option value="<%= user_status%>">
                                                    <%= user_status%>
                                                </option>
                                                <option value="Attended">
                                                    ATTENDED
                                                </option>
                                            </select><%
                                                }

                                            %>
                                        </td>
                                        <td>
                                            
                                            <input type="hidden" name="reg_id" value="<%= r.getString("r.reg_id")%>" id="reg_id" />
                                            <input type="hidden" name="conf_id" value="<%= conf_id%>" id="conf_id" />
                                            <input type="hidden" name="uname" value="<%= r.getString("r.uname")%>" id="uname" />
                                            <input type="hidden" name="title" value="<%= title%>" id="title" />
                                            <input type="hidden" name="email_user" value="<%= email_user%>" id="email_user" />
                                            <% if(user_status.equals("Attended")) { }else{ %>
                                            <input type="submit" name="update_data" value="Update Data" id="btn" id="submit">
                                            <% } %>
                                        </td>
                                    </tr>
                                    <% }

                                    %>
                                </table>
                            </form>
                            <div style="margin-top: 2%;font-weight: bold">
                                <a href="download_list.jsp?c=<%= conf_id%>&&d=p&&t=<%= title %>" target="_blank">Download Pdf File</a>
                                
                            </div>

                        </div>
                    </div>
                    <%

                                        }
                                    }
                                }
                           
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>

                </div>
                    
                    <script>
$(document).ready(function() {
$("#submit").click(function() {
$.ajax({
url: "update_attendance.jsp",
type: "post",
data: {
uname:$('#uname').val(),
reg_id:$('#reg_id').val(),
conf_id:$('#conf_id').val(),
title:$('#title').val(),
payment_status:$('#payment_status').val(),
user_status:$('#user_status').val(),
user_email:$('#user_email').val();
}
});
});
});
</script>
                </body>
                </html>
