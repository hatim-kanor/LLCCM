
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <select  name="staff_id" id="staff_id">
            
            <%

                String stream_id = request.getParameter("stream_id");//
                Connection con = dbconnection.DbConnection.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from staff_list where stream  LIKE '"+ stream_id+"'");
                while (rs.next()) {
            %>
            <option value="<%=rs.getString("staff_id")%>"><%=rs.getString("staff_name")%></option>
            <%
                }
            %>
        </select>

    </body>
</html>
