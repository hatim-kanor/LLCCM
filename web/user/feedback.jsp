
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
        <style type="text/css">
            table{
                border-collapse: collapse;
                width: 100%;
            }
            th, td {
                padding: 8px;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }
            tr{
                text-align:center;

            }
        </style>
    </head>
    <body>
        <%@include file="user_menu.jsp" %>
        <div class="container">
            <div>
                <%
                    String email = "", fd_email = "", fd_title = "";
                    Connection con = dbconnection.DbConnection.getConnection();
                    Date d = new Date();
                    String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
                    String uname = (String) session.getAttribute("username");
                    email = (String) session.getAttribute("password");
                    String contact = (String) session.getAttribute("contact");
                    fd_email = request.getParameter("em");
                    fd_title = request.getParameter("c");
                    String conf_id = "", reg_id = "";

                    int res1 = 0, res2 = 0, res3 = 0, res4 = 0, res5 = 0, res6 = 0, res7 = 0, res8 = 0;

                    String button_press = request.getParameter("submit");
                    if (button_press != null) {
                        PreparedStatement x = con.prepareStatement("select r.conf_id,r.reg_id from registration r,conference c where r.email = '" + fd_email + "' and r.conf_id");
                        ResultSet xx = x.executeQuery();
                        while (xx.next()) {
                            conf_id = xx.getString("r.conf_id");
                            reg_id = xx.getString("r.reg_id");
                            out.println(conf_id + " " + reg_id);

                            String a1 = request.getParameter("question1");
                            String a2 = request.getParameter("question2");
                            String a3 = request.getParameter("question3");
                            String a4 = request.getParameter("question4");
                            String a5 = request.getParameter("question5");
                            String a6 = request.getParameter("question6");
                            String a7 = request.getParameter("question7");
                            String in = request.getParameter("overall_thought");
                            PreparedStatement z = con.prepareStatement("insert into feedback(confid,regid,q1,q2,q3,q4,q5,q6,q7,q8) values(?,?,?,?,?,?,?,?,?,?)");
                            z.setString(1, conf_id);
                            z.setString(2, reg_id);
                            z.setString(3, a1);
                            z.setString(4, a2);
                            z.setString(5, a3);
                            z.setString(6, a4);
                            z.setString(7, a5);
                            z.setString(8, a6);
                            z.setString(9, a7);
                            z.setString(10, in);
                            res1 = z.executeUpdate();
                            if (res1 > 0) {
                                PreparedStatement z1 = con.prepareStatement("update registration set feed_status='Updated' where reg_id=" + reg_id);
                                res2 = z1.executeUpdate();
                                if (res2 > 0) {
                                    out.println("Feedback Updated Successfully");
                                } else {
                                    out.println("Failed to Update Feedback");
                                }
                            }
                        }
                    }
                %>
                <table>
                    <%  if (email.equals(fd_email)) {
                            String user_status = "", dt = "0", conf = "", feed_status;
                            int c = 0;

                            PreparedStatement ps = con.prepareStatement("select r.email,c.conf_date,c.title,r.designation,r.user_status,p.amount,r.feed_status from registration r,conference c,payment_amount p where c.conf_id=r.conf_id and p.id=r.pa_id and r.email ='" + fd_email + "'");
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                                feed_status = rs.getString("r.feed_status");
                                user_status = rs.getString("r.user_status");
                                dt = rs.getString("c.conf_date");
                                conf = rs.getString("c.title");
                    %>
                    <tr>
                        <%c = (dt).compareTo(c_year);

                        %><td>

                            <%  if (c < 1) {

                                    if (user_status.equals("Not Attended")) {
                                        out.println("<br>Not Eligible for feedback as did not attend conference<br>");
                                    } else if (user_status.equals("Attended")) {
                                        if (feed_status.equals("Not Updated")) {
                            %>

                            <section>
                                <form action="feedback.jsp" method="POST">
                                    <table border="0" style="width:100%;text-align: center;">
                                        <caption style="color:black;text-align: center;">PLEASE PROVIDE US WITH YOUR VALUABLE FEEDBACK</caption>
                                        <tr style="background-color: grey;font-size: 12pt;color:white">
                                            <th style="text-align: center">SR NO</th>
                                            <th style="text-align: center">QUESTION</th>
                                            <th style="text-align: center">OPTION 1</th>
                                            <th style="text-align: center">OPTION 2</th>
                                            <th style="text-align: center">OPTION 3</th>
                                            <th style="text-align: center">OPTION 4</th>
                                        </tr>
                                        <tr style="text-align: center;">
                                            <th>1</th>
                                            <th>How useful did you find todays conference?</th>
                                            <th><input type="radio" name="question1" value="good">Good</th>
                                            <th><input type="radio" name="question1" value="very_good">Very Good</th>
                                            <th><input type="radio" name="question1" value="satisfactory">Satisfactory</th>
                                            <th><input type="radio" name="question1" value="excellent">Excellent</th>
                                        </tr>
                                        <tr>
                                            <td colspan="6">&nbsp;</td>
                                        </tr>
                                        <tr style="text-align: center;">
                                            <th>2</th>
                                            <th>Do you think the event met its goals?</th>
                                            <th><input type="radio" name="question2" value="no">No</th>
                                            <th><input type="radio" name="question2" value="little_bit">Little Bit</th>
                                            <th><input type="radio" name="question2" value="almost">Almost</th>
                                            <th><input type="radio" name="question2" value="completely">Completely</th>    
                                        </tr>
                                        <tr>
                                            <td colspan="6">&nbsp;</td>
                                        </tr>
                                        <tr style="text-align: center;">
                                            <th>3</th>
                                            <th>What is your level of satisfaction for this conference?</th>
                                            <th><input type="radio" name="question3" value="very_satisfied">Very Satisfied</th>
                                            <th><input type="radio" name="question3" value="somewhat_satisfied">Somewhat Satisfied</th>
                                            <th><input type="radio" name="question3" value="neutral">Neutral</th>
                                            <th><input type="radio" name="question3" value="dissatisfied">Dissatisfied</th>    
                                        </tr>
                                        <tr>
                                            <td colspan="6">&nbsp;</td>
                                        </tr>
                                        <tr style="text-align: center;">
                                            <th>4</th>
                                            <th>Were the organizers properly able to manage the whole conference?</th>
                                            <th><input type="radio" name="question4" value="very_satisfied">Very Satisfied</th>
                                            <th><input type="radio" name="question4" value="somewhat_satisfied">Somewhat Satisfied</th>
                                            <th><input type="radio" name="question4" value="neutral">Neutral</th>
                                            <th><input type="radio" name="question4" value="dissatisfied">Dissatisfied</th>    
                                        </tr>
                                        <tr>
                                            <td colspan="6">&nbsp;</td>
                                        </tr>
                                        <tr style="text-align: center;">
                                            <th>5</th>
                                            <th>How would you rate our conference venue and equipment in regards to how it is served?</th>
                                            <th><input type="radio" name="question5" value="very_satisfied">Very Satisfied</th>
                                            <th><input type="radio" name="question5" value="somewhat_satisfied">Somewhat Satisfied</th>
                                            <th><input type="radio" name="question5" value="neutral">Neutral</th>
                                            <th><input type="radio" name="question5" value="dissatisfied">Dissatisfied</th>    
                                        </tr>
                                        <tr>
                                            <td colspan="6">&nbsp;</td>
                                        </tr>
                                        <tr style="text-align: center;">
                                            <th>6</th>
                                            <th>How would you rate our conference Key Note Speaker with their message?</th>
                                            <th><input type="radio" name="question6" value="very_satisfied">Very Satisfied</th>
                                            <th><input type="radio" name="question6" value="somewhat_satisfied">Somewhat Satisfied</th>
                                            <th><input type="radio" name="question6" value="neutral">Neutral</th>
                                            <th><input type="radio" name="question6" value="dissatisfied">Dissatisfied</th>    
                                        </tr>
                                        <tr>
                                            <td colspan="6">&nbsp;</td>
                                        </tr>
                                        <tr style="text-align: center;">
                                            <th>7</th>
                                            <th>Did you enjoy attending the conference?</th>
                                            <th><input type="radio" name="question7" value="no">No</th>
                                            <th><input type="radio" name="question7" value="little_bit">Little Bit</th>
                                            <th><input type="radio" name="question7" value="almost">Almost</th>
                                            <th><input type="radio" name="question7" value="completely">Completely</th>    
                                        </tr>
                                        <tr>
                                            <td colspan="6">&nbsp;</td>
                                        </tr>
                                        <tr style="text-align: center;">
                                            <th>8</th>
                                            <th>Please share you thoughts on the conference as a whole?</th>
                                            <th colspan="4"><input type="text" name="overall_thought" placeholder="Please provide your thought"></th>   
                                        </tr>
                                        <tr>
                                            <td colspan="6">&nbsp;</td>
                                        </tr>
                                        <tr><th colspan="6" style="text-align: center;">
                                                <input type="submit" name="submit" value="Submit Feedback" />
                                            </th></tr>

                                    </table>
                                </form>
                            </section>
                            <% } else if (feed_status.equals("Updated")) {
                                            out.println("<h3>No new conference </h3>");
                                        }
                                    }
                                } else if (c >= 1) {
                                    out.println("<h3>No new conference </h3>");
                                }
                                if (c == 0) {
                                    out.println("Conference Day");
                                }%></td>

                    </tr>
                    <%
                            }
                        }

                    %>
                </table>
            </div>
        </div>
    </body>
</html>
