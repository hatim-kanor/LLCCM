


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            Connection con = dbconnection.DbConnection.getConnection();
        %>
        <%
            String from_date_ts = request.getParameter("from_date_ts");
            String to_date_ts = request.getParameter("to_date_ts");
            if(from_date_ts != "" || to_date_ts != "")
            {
                PreparedStatement ps = con.prepareStatement("select count(conf_id) AS TOTAL from conference where conf_date >= "+ from_date_ts +"and conf_date <= "+ to_date_ts);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    out.println("Total No of conferences between "+ from_date_ts + " and "+to_date_ts + "are : " + rs.getString("TOTAL"));
                }
                
            }


        %>
    </body>
</html>
