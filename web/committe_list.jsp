

<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="javax.mail.*,javax.mail.internet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>committee_List</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    </head>
    <body>
        <%!
            public static class SMTPAuthenticator extends Authenticator {

                public PasswordAuthentication getPasswordAuthentictation() {
                    return new PasswordAuthentication("conference.lalacollege@gmail.com", "admin@root");
                }
            }
        %>

        <%
            Connection con = dbconnection.DbConnection.getConnection();
        %>
        <%@include file="convenor_left_panel.jsp" %>
        <div class="container">
            <div class="col-md-8" style="border:1px solid black">
                <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                <div>
                    <%
                        String email = "", name = "", str = "", msg = "", title = "", conf_date = "";
                        String conference = request.getParameter("conf_id");
                        String stream = request.getParameter("stream_id");
                        String staff_id = request.getParameter("staff_id");
                        String committee = request.getParameter("committee");
                        PreparedStatement c = con.prepareStatement("select c.title,c.conf_date,sl.email,sl.staff_name,sl.stream from staff_list sl,conference c where sl.staff_id=" + staff_id);
                        ResultSet cc = c.executeQuery();
                        while (cc.next()) {
                            email = cc.getString("sl.email");
                            name = cc.getString("sl.staff_name");
                            str = cc.getString("sl.stream");
                            title = cc.getString("c.title");
                            conf_date = cc.getString("c.conf_date");
                        }
                        int res = 0, res1 = 0;
                        String btn_pressed = request.getParameter("committee");
                        if (btn_pressed != null) {

                            PreparedStatement b = con.prepareStatement("insert into committee_list(c_name,conf_id,staff_id,cm_role) values(?,?,?,?)");
                            b.setString(1, committee);
                            b.setString(2, conference);
                            b.setString(3, staff_id);
                            b.setString(4, committee);
                            res = b.executeUpdate();
                            if (res > 0) {
                                String email_username = "conference.lalacollege@gmail.com";
                                String email_password = "admin@root";
                                String d_host = "smtp.gmail.com";
                                int d_port = 465;
                                msg = "<h4 style='background-color:yellow;color:black'>Hello <i>" + name + "</i></h4>, <br>";
                                msg = msg.concat("<p style='text-align:center'>Lala Lajpatrai College of Commerce And Economics is Coming up With A New Conference Entitled <br><center><h3><b>" + title + "</b></h3></center> </p><br>on <br><center> Date: " + conf_date + "</center> ");
                                msg = msg.concat("<br> <p style='text-align:center'>You have been allocated the <b>COMMITTEE " + committee + "</b> for the particular event </p>");
                                msg = msg.concat("<br> <p style='text-align:center'>We request you to kindly make this CONFERENCE a successful one </p>");
                                msg = msg.concat("<br><i>Regards,<br>Thanks, <br>Team Lala Conference </i>");

                                String email_title = "Committee List for Conference";

                                //email code
                                Properties prop = new Properties();

                                SMTPAuthenticator auth = new SMTPAuthenticator();
                                Session ses = Session.getInstance(prop, auth);

                                MimeMessage mime = new MimeMessage(ses);
                                mime.setContent(msg, "text/html");
                                mime.setSubject(email_title);
                                

                                mime.setFrom(new InternetAddress(email_username));
                                mime.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                                mime.addRecipient(Message.RecipientType.BCC, new InternetAddress("hatimkanor21@gmail.com"));

                                try {
                                    Transport transport = ses.getTransport("smtps");
                                    transport.connect(d_host, d_port, email_username, email_password);
                                    transport.sendMessage(mime, mime.getAllRecipients());

                                    transport.close();

                                    out.println("<h2><p style='color:green'>Added Successfully to committee List</p></h2>");
                                } catch (Exception e) {
                                    out.println(e);
                                }

                            }

                        }
                    %>

                    <form action="committe_list.jsp" method="POST" onsubmit="check_dropdown()">
                        <table>
                            <tr>
                                <td>Select Conference </td>
                                <td>
                                    <select name="conf_id" id="conf_id">
                                        <%String conf = "";

                                            Date d = new Date();
                                            String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
                                            String query = "select * from conference where conf_date >= '" + c_year + "'";

                                            PreparedStatement ps = con.prepareStatement(query);
                                            ResultSet rs = ps.executeQuery();

                                            while (rs.next()) {
                                                conf = rs.getString("conf_id");
                                                out.println(conf);
                                        %>
                                        <option value="<%= rs.getString("conf_id")%>"><%= rs.getString("title")%> </option> 
                                        <%

                                            }
                                        %>
                                    </select> 
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2">
                                    &nbsp;
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    Select Stream
                                </th>
                                <td>
                                    <% if (conf != null) {%>
                                    <select name="stream_id" id="stream_id"><option value="">Please select Stream</option>
                                        <%
                                            PreparedStatement a = con.prepareStatement("select stream,staff_name,staff_id from staff_list group by stream");
                                            ResultSet aa = a.executeQuery();
                                            while (aa.next()) {
                                        %><option value="<%= aa.getString("stream")%>"><%= aa.getString("stream")%></option><%
                                            }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2">
                                    &nbsp;
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    Select Faculty
                                </th>
                                <td id="staff_id">

                                </td>
                            </tr>
                            <tr>
                                <th colspan="2">
                                    &nbsp;
                                </th>
                            </tr>
                            <tr>
                                <th>
                                    Select Committee
                                </th>
                                <td>
                                    <select name="committee" id="committee">
                                        <option value="ORGANIZING">
                                            Organizing
                                        </option>
                                        <option value="HOSPITALITY">
                                            Hospitality
                                        </option>
                                        <option value="IT">
                                            IT
                                        </option>
                                        <option value="REGISTRATION">
                                            Registration
                                        </option>
                                        <option value="STAGE">
                                            Stage
                                        </option>
                                        <option value="BOOK_PRINTING">
                                            Book printing
                                        </option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <th colspan="2" style="text-align: center;">
                                    <input type="submit" name="committee" value="Add Committee">
                                </th>
                            </tr>
                            <% } else if (conf == null || conf == "") {
                                    out.println("No new conference ");

                                }%>
                        </table>
                    </form> </div>
                        <br><br>
                        <div>
                            <table border="1">
                                <tr>
                                    <th>
                                        DATE
                                    </th>
                                    <th>
                                        TITLE
                                    </th>
                                    <th>
                                        STAFF_ID
                                    </th>
                                    <th>
                                        STAFF_NAME
                                    </th>
                                    <th>
                                        COMMITTEE
                                    </th>
                                </tr>
                            <%
                                try {
                                        PreparedStatement v = con.prepareStatement("select c.conf_date,c.title,sl.staff_id,sl.staff_name,cl.c_name from committee_list cl,staff_list sl,conference c where c.conf_date >= SYSDATE() and sl.staff_id = cl.staff_id and cl.conf_id = c.conf_id;");
                                        ResultSet vv = v.executeQuery();
                                        while(vv.next())
                                        {
                                       out.println("<tr><td>"+vv.getString("c.conf_date")+"</td><td>"+vv.getString("c.title")+"</td>");
                                       out.println("<td>"+vv.getString("sl.staff_id")+"</td><td>"+vv.getString("sl.staff_name")+"</td>");
                                       out.println("<td>"+vv.getString("cl.c_name")+"</td></tr>");
                                        }
                                    } catch (Exception e) {
                                    }
                            %>
                            </table>
                        </div>

            </div>
    </body>
</html>
<script>
    $(document).ready(function () {
        $("#stream_id").on("change", function () {
            var stream_id = $("#stream_id").val();//id of country select box of index.jsp page;
            $.ajax({
                url: "staffview.jsp", //your jsp page name
                data: {stream_id: stream_id}, //sending request to state.jsp page.
                method: "POST", //HTTP method.
                success: function (data)
                {
                    $("#staff_id").html(data);//output or response will display in state select box.
                }
            });
        });

    });
</script>
