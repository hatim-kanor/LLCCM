
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            try{
            Connection con = dbconnection.DbConnection.getConnection();
            String cm = request.getParameter("cm");
            String conf = request.getParameter("c");
            String staff_id = request.getParameter("staff_id");
            if(cm.equals("stage"))
            {
                String s1 = request.getParameter("st1");
                String s2 = request.getParameter("st2");
                String s3 = request.getParameter("st3");
                PreparedStatement ps = con.prepareStatement("insert into committee_list(conf_id,c_name,staff_id) values(?,?,?)");
                ps.setString(1, conf);
                ps.setString(2, "Stage");
                ps.setString(3,staff_id);
                
                int r = ps.executeUpdate();
                if(r > 0 )
                {
                    response.sendRedirect("committe_list.jsp?msg=success");
                }
                else
                {
                    response.sendRedirect("committe_list.jsp?msg=fail");
                }
                
            }}catch(Exception e)
                    {
                    out.println(e);
                    }
         
        %>
    </body>
</html>
