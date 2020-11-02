<div>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            th{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <table border="1" style="width:100%;text-align: center;">
            <tr>
                <th>
                    Reg Id
                </th>
                <th>
                    Name
                </th>
                <th>
                    Contact
                </th>
                <th>
                    Payment
                </th>
                <th>
                    Designation
                </th>
            </tr>
            
        <%
            String conf_id = request.getParameter("conf_id");
            Connection con = dbconnection.DbConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("select c.reg_id,c.uname,c.contact,p.p_type,c.designation from registration c,payment p where p.payment_id = c.payment_id and conf_id =" + conf_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                
        %><tr><td><%= rs.getString("c.reg_id") %></td><td><%= rs.getString("c.uname") %></td><td><%= rs.getString("c.contact") %></td>
            <td><%= rs.getString("p.p_type") %></td><td><%= rs.getString("c.designation") %></td></tr><%  
            }
              session = request.getSession();
              session.setAttribute("conf_id", conf_id);
%>
        </table>
    </body>
</html>
</div>