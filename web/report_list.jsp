
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reports</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script type="text/javascript">
         
            function check_date()
            {
                var x = document.getElementById("from_date").value;
                var y = document.getElementById("to_date").value;
                if(!Date.parse(x))
                {
                    alert("enter from date");
                   
                }
                if(!Date.parse(y))
                {
                    alert("enter to date");
                    
                }
                
            }
        </script>
        <style type="text/css">
            #disp
            {
                font-size: 14px;
                color:black;
                text-align: center;
                font-style: oblique;
            }
            th{
                text-align: center;
            }
        </style>
    </head>
    <body onload="body_load()">
        <div class="container-fluid">
            <%
                Connection con = dbconnection.DbConnection.getConnection();
            %>
            <%@include file="convenor_left_panel.jsp" %>
            <div class="col-md-8" style="border:1px solid black">
                <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>

                <div>


                    <!-- section of total seminars-->
                    <div id="total_seminars" class="total_seminars" style="width:100%">
                        <form action="report_list.jsp" method="POST" onsubmit="check_date()">
                            <table>

                                <tr>
                                    <th>
                                        Select From Date: 
                                    </th>
                                <input type="hidden" name="check_date" value="" id="hidden_date">
                                    <td>
                                        <input type="date" name="from_date" id="from_date"  />
                                    </td>
                                    <th>
                                        Select To Date:
                                    </th>
                                    <td>
                                        <input type="date" name="to_date" id="to_date">
                                    </td>

                                </tr>
                                <tr>
                                    <th>&nbsp;</th>
                                </tr>
                                <tr>
                                    <th>Select option to view Reports</th>
                                    <th>
                                        <select name="reports">
                                            <option value="blank">
                                                Select Option
                                            </option>

                                            <option value="total_seminars">
                                                Total Seminars
                                            </option>
                                            <option value="detail_seminars">
                                                Details of  Seminars
                                            </option>
                                           
                                            <option value="kns_seminars">
                                                Key Note Speakers List
                                            </option>
                                            <option value="cg_seminars">
                                                Chief Guest List
                                            </option>
                                            <option value="registration_amount">
                                                Registration Amount
                                            </option>
                                            <option value="total_staff_registered">
                                                Total Staff Registered
                                            </option> 
                                                
                                        </select>
                                    </th>
                                </tr>
                                <tr>
                                    <th>&nbsp;</th>
                                </tr>
                                <tr><th>
                                        <input type="submit" name="report_button" value="View Data" style="margin-left: 70%;margin-right: 5%"></th>
                                </tr>

                            </table>
                        </form>

                    </div>
                    <!-- section of total seminars-->

                    <section id="disp1">
                        <%try {
                                String to_date = "";
                                String from_date = "";
                                String submit_button = request.getParameter("report_button");
                                String check_hidden = request.getParameter("check_date");
                                to_date = request.getParameter("to_date");
                                from_date = request.getParameter("from_date");
                                if (submit_button != null) {
                                    String dropdown = request.getParameter("reports");
                                    
                                        if (dropdown != null) {
                                            if (dropdown.equals("blank")) {
                                                out.println("Please select option");
                                            }

                                            if (dropdown.equals("total_seminars")) {
                                                PreparedStatement ps = con.prepareStatement("select count(conf_id) as COUNT from conference where conf_date >= '" + from_date + "' and conf_date <= '" + to_date + "'");
                                                ResultSet rs = ps.executeQuery();
                                                while (rs.next()) {
                                                    out.println("<br><br><h3 style=color:green>Result</h3><br>");
                                                    out.println("Total Conferences held between " + from_date + " and " + to_date + " are <br> <p>" + rs.getString("COUNT") + "</p>");

                                                }
                                                out.println("<table border=1 style='width:100%'>");
                                                out.println("<tr><th>Date</th><th>Title</th><th>Action</th></tr>");

                                                PreparedStatement ss = con.prepareStatement("select conf_id,conf_date,title from conference where conf_date >= '" + from_date + "' and conf_date<='" + to_date + "'");
                                                ResultSet ts = ss.executeQuery();
                                                while (ts.next()) {
                                                    out.println("<tr><td>" + ts.getString("conf_date") + "</td><td>" + ts.getString("title") + "</b></td>");
                        %><td><a href="detailed_report.jsp?id=<%= ts.getString("conf_id")%>">View Detailed Report</a></td><%
                                                }

                                                out.println("</table>");
                                            } else if (dropdown.equals("cg_seminars")) {
                                                out.println("<br><br><h3 style=color:green>Result</h3><br>");
                                                PreparedStatement ns = con.prepareStatement("select c.conf_date,cg.conf_id,c.title,cg.cg_name,cg.desig,cg.college from chief_guest cg,conference c where c.conf_date >= '" + from_date + "' and conf_date <= '" + to_date + "' and c.conf_id = cg.conf_id group by c.conf_id");
                                                ResultSet nss = ns.executeQuery();
                                                out.println("<table border=1 style='width:100%'>");
                                                out.println("<tr><th>Date</th><th>Title</th><th>Chief Guest Name</th><th>Designation</th><th>College</th></tr>");
                                                while (nss.next()) {

                                                    out.println("<tr><td>" + nss.getString("c.conf_date") + "</td>");
                                                    out.println("<td>" + nss.getString("c.title") + "</td>");
                                                    out.println("<td> " + nss.getString("cg.cg_name") + "</td>");
                                                    out.println("<td> " + nss.getString("cg.desig") + "</td>");
                                                    out.println("<td>" + nss.getString("cg.college") + "</td></tr>");
                                                }
                                                out.println("</table>");
                                            } else if (dropdown.equals("kns_seminars")) {
                                                out.println("<br><br><h3 style=color:green>Result</h3><br>");
                                                PreparedStatement ds = con.prepareStatement("select c.conf_date,cg.conf_id,c.title,cg.spk_name,cg.spk_desig,cg.spk_coll from chief_guest cg,conference c where c.conf_date >= '" + from_date + "' and conf_date <= '" + to_date + "' and c.conf_id = cg.conf_id group by c.conf_id");
                                                ResultSet dss = ds.executeQuery();
                                                out.println("<table border=1 style='width:100%'>");
                                                out.println("<tr><th>Date</th><th>Title</th><th>Key Note Speaker Name</th><th>Designation</th><th>College</th></tr>");
                                                while (dss.next()) {

                                                    out.println("<tr><td>" + dss.getString("c.conf_date") + "</td>");
                                                    out.println("<td>" + dss.getString("c.title") + "</td>");
                                                    out.println("<td> " + dss.getString("cg.spk_name") + "</td>");
                                                    out.println("<td> " + dss.getString("cg.spk_desig") + "</td>");
                                                    out.println("<td>" + dss.getString("cg.spk_coll") + "</td></tr>");
                                                }
                                                out.println("</table>");
                                            } else if (dropdown.equals("registration_amount")) {
                                                out.println("<br><br><h3 style=color:green>Result</h3><br>");
                                                PreparedStatement mm = con.prepareStatement("select c.conf_id,c.conf_date,c.title,count(DISTINCT(r.reg_id)) AS REGISTERED,sum(p.amount) AS AMOUNT from conference c,payment_amount p,registration r where c.conf_date >= '"+from_date+"' and c.conf_date <= '" + to_date +"' and c.conf_id=p.conf_id and r.pa_id = p.id group by c.title");
                                                ResultSet mmm = mm.executeQuery();
                                                out.println("<table border=1 style='width:100%'>");
                                                out.println("<tr><th>Date</th><th>Title</th><th>Total Registered</th><th>Total Amount</th></tr>");
                                                while(mmm.next())
                                                    {
                                                        out.println("<tr>");
                                                        out.println("<td>"+ mmm.getString("c.conf_date") +"</td>");
                                                        out.println("<td>"+mmm.getString("c.title")+"</td>");
                                                        out.println("<td>"+mmm.getString("REGISTERED")+"</td>");
                                                        out.println("<td>"+mmm.getString("AMOUNT") + "</td>");
                       %></tr><%

                                                    }
                                            } else if(dropdown.equals("detail_seminars")){
                                                out.println("<br><br><h3 style=color:green>Result</h3><br>");
                                                PreparedStatement nn = con.prepareStatement("select c.conf_id,c.title,c.conf_date,count(DISTINCT(r.reg_id)) AS REGISTERED,cg.cg_name,cg.spk_name,sl.staff_name from conference c,registration r,chief_guest cg,committee_list cl,staff_list sl where c.conf_date>='"+from_date+"' and c.conf_date <='" +to_date+ "' and c.conf_id = cg.conf_id and cl.c_name='Convenor' and sl.staff_id = cl.staff_id group by c.title");
                                                ResultSet nnn = nn.executeQuery();
                                                out.println("<table border=1 style='width:100%;text-align:center;'>");
                                                out.println("<tr><th>Date</th><th>Title</th><th>Total Registered</th><th>Chief Guest</th><th>Key Note Speaker</th><th>Convenor</th></tr>");
                                                while(nnn.next())
                                                    {
                                                         out.println("<tr>");
                                                        out.println("<td>"+ nnn.getString("c.conf_date") +"</td>");
                                                        out.println("<td>"+nnn.getString("c.title")+"</td>");
                                                        out.println("<td>"+nnn.getString("REGISTERED")+"</td>");
                                                        out.println("<td>"+nnn.getString("cg.cg_name") + "</td>");
                                                        out.println("<td>"+nnn.getString("cg.spk_name") + "</td><td>"+nnn.getString("sl.staff_name")+"</td></tr>");
                                                    }
                                                }
else if(dropdown.equals("total_staff_registered"))
{
 out.println("<br><br><h3 style=color:green>Result</h3><br>");
                                                PreparedStatement nn = con.prepareStatement("select c.conf_id,c.title,c.conf_date,count(DISTINCT(r.reg_id)) AS REGISTERED from conference c,registration r,committee_list cl,staff_list sl where c.conf_date>='"+from_date+"' and c.conf_date <='"+to_date+"' and r.email=sl.email group by c.title");
                                                ResultSet nnn = nn.executeQuery();
                                                out.println("<table border=1 style='width:100%;text-align:center;'>");
                                                out.println("<tr><th>ID</th><th>Title</th><th>CONF DATE</th><th>REGISTERED</th></tr>");
                                                while(nnn.next())
                                                    {
                                                         out.println("<tr>");
                                                        out.println("<td>"+ nnn.getString("c.conf_id") +"</td>");
                                                        out.println("<td>"+nnn.getString("c.title")+"</td>");
                                                        out.println("<td>"+nnn.getString("c.conf_date")+"</td>");
                                                        out.println("<td>"+nnn.getString("REGISTERED") + "</td>");
                                                        
                                                    }
}
                                               
                                                }
                                                else {
                                                out.println("Drop Down Blank");
                                            }

                                        } 
                                    }

                               
                            catch (Exception e) {
                                out.println(e);
                            }


                            %>
                    </section>
                    <br><br>


                </div>
            </div>
        </div>
    </body>
</html>
