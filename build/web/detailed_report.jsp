<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detailed Report</title>
        <%@include file="cssfile.jsp" %> 
    </head>
    <body>
    <center>
        <div class="container">
            <%
                Connection con = dbconnection.DbConnection.getConnection();
            %>

            <div class="col-md-12" style="border:1px solid black;margin:5px;padding:10px;">
                <p style="background-color: greenyellow;color: black;font-size: 25px;text-align: center;">DETAILED REPORT </p> <br><br>

                <div>

                    <%
                        String conf_id = request.getParameter("id");
                        if (conf_id != null) {
                            PreparedStatement ps = con.prepareStatement("select conf_id,title,collab_with,conf_date from conference where conf_id=" + conf_id);
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                    %><img src="img_view.jsp?no=<%= rs.getString("conf_id")%>" height="70" width="70" /><%
                                out.println("<h3><center>TITLE: " + rs.getString("title") + "</center></h3>");
                                out.println("<br><h4>In Collaboration <br>with <br><b>" + rs.getString("collab_with") + "</b></h4><br>");
                                out.println("<h4>On " + rs.getString("conf_date") + "</h4><br>");
                            }
                            PreparedStatement a = con.prepareStatement("select * from chief_guest where conf_id=" + conf_id);
                            ResultSet aa = a.executeQuery();

                            while (aa.next()) {
                                out.println("<div class='col-md-6'>");
                                out.println("<b>Chief Guest <br>" + aa.getString("cg_name") + "</b><br> " + aa.getString("desig") + "<br>" + aa.getString("college"));
                                out.println("</div>");
                                out.println("<div class='col-md-5'>");
                                out.println("<b>Key Note Speaker <br>" + aa.getString("spk_name") + "</b><br> " + aa.getString("spk_desig") + "<br>" + aa.getString("spk_coll"));
                                out.println("</div>");
                            }
                            out.println("<br><br><br>");
                            PreparedStatement b = con.prepareStatement("select sl.staff_name from staff_list sl,committee_list cl,conference c where c.conf_id = " + conf_id + " and cl.c_name='Convenor' and sl.staff_id = cl.staff_id");
                            ResultSet bb = b.executeQuery();
                            while (bb.next()) {
                                out.println("<br><br><b>CONVENOR</b><br>" + bb.getString("sl.staff_name") +"<br>");
                            }
                            out.println("<br><br><br>");
                            out.println("Registration Report");
                            out.println("<table border=1 style='width:50%;text-align:center;'><tr><th style='text-align:center'>Total Registered</th><th style='text-align:center'>Attended</th></tr>");
                            out.println("<tr>");
                            PreparedStatement c = con.prepareStatement("select COUNT(DISTINCT(r.reg_id)) AS REGISTERED from registration r where r.conf_id = " +conf_id);
                            ResultSet cc = c.executeQuery();
                            while(cc.next())
                            {
                                out.println("<td style='text-align:center'>"+cc.getString("REGISTERED") + "</td>");
                            }
                           
                            PreparedStatement e = con.prepareStatement("select COUNT(r.reg_id) AS ATTENDED from registration r where r.user_status ='Attended' and r.conf_id =" + conf_id + "");
                            ResultSet ee = e.executeQuery();
                            while(ee.next()){
                            out.println("<td style='text-align:center'>"+ee.getString("ATTENDED") + "</td>");

                            }
                            out.println("</tr></table>");
                            
                            out.println("<br><br><br>");
                            
                        }
                    %>
                </div>
            </div>
    </center>
</body>
</html>
