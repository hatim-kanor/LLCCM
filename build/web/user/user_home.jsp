
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <%@include file="cssfile.jsp" %>
    </head>
    <body>
        <%
            Date d = new Date();
            String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
            String uname = (String) session.getAttribute("username");
            String email = (String) session.getAttribute("password");
            String contact = (String) session.getAttribute("contact");

        %>
        <%@include file="user_menu.jsp" %>
        <div class="container">
            <div>
                <h4>Welcome: <%= uname%></h4>

            </div>
            <div>
                <table border="1">
                    <tr>
                        <th>Email</th>
                        <th>Conference</th>
                        <th>Designation</th>
                        <th>Amount</th>
                        <th>Payment Status</th>
                        <th>Status</th>
                        <th>Feedback</th>
                    </tr>

                    <%
                        String user_status = "", dt = "0", conf = "", feed_status = "";
                        int c = 0;
                        Connection con = dbconnection.DbConnection.getConnection();
                        PreparedStatement ps = con.prepareStatement("select r.email,c.conf_date,c.title,r.designation,r.user_status,p.amount,r.feed_status,r.payment_status from registration r,conference c,payment_amount p where (r.contact =" + contact + " and r.email = '" + email + "') and c.conf_id=r.conf_id and p.id=r.pa_id");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                            user_status = rs.getString("r.user_status");
                            feed_status = rs.getString("r.feed_status");
                            dt = rs.getString("c.conf_date");
                            conf = rs.getString("c.title");
                    %><tr><td><%= rs.getString("r.email")%></td>
                        <td><%= rs.getString("c.title")%></td>
                        <td><%= rs.getString("r.designation")%></td>
                        <td><%= rs.getString("p.amount")%></td>
                        <td><%= rs.getString("r.payment_status")%></td>
                        <%c = (dt).compareTo(c_year);
                            
                        %><td><%
                            if (c >= 1) { %>
                            <% out.println("Upcoming Conference");%>

                            <% } else if (c < 1) {%>
                            Conference Completed
                            <% } else if (c == 0) { %>
                            Conference Day<% }%>
                        </td>
                        <td>
                            <% if (c < 1) {
                                    if (user_status.equals("Not Attended")) {
                            %>Not Eligible for feedback as did not attend conference<%
                            } else if (user_status.equals("Attended")) {
                                if (feed_status.equals("Updated")) {
                                    out.println("Feedback Submitted");
                            }
                        else if(feed_status.equals("Not Updated")){%>
                            <a href="feedback.jsp?em=<%= rs.getString("r.email")%>&&c=<%= conf%>">Give Feedback</a>
                            <% }}
                            } else if (c >= 1) {
                                out.println("Not Eligible as conference not started");
                            }%></td>
                    </tr>
                    <%
                        }


                    %>
                </table>
            </div>
        </div>
    </body>
</html>
