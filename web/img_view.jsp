
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
            OutputStream img = null;
   byte[] barray = null;
            String num = request.getParameter("no");
            String num2 = request.getParameter("n");
            String num3 = request.getParameter("n1");
            
            try {
                    if(num!=null)
                    {
                    Connection con = dbconnection.DbConnection.getConnection();
                    
                   Statement st = con.createStatement();
                   ResultSet rs = st.executeQuery("select * from conference where conf_id="+num);
                   while(rs.next()){
                  barray = rs.getBytes("conf_image");
                    response.setContentType("image/jpg,image/png");
                    img = response.getOutputStream();
                    img.write(barray);
                   }
                  
                    }if(num2!=null)
                    {
                        Connection con = dbconnection.DbConnection.getConnection();
                    
                   Statement st = con.createStatement();
                   ResultSet rs = st.executeQuery("select img1 from gallery where g_id="+num2);
                   while(rs.next()){
                  barray = rs.getBytes("img1");
                    response.setContentType("image/jpg,image/png");
                    img = response.getOutputStream();
                    img.write(barray);
                   }
                  
                    }
                    if(num3!=null)
                    {
                        Connection con = dbconnection.DbConnection.getConnection();
                    
                   Statement st = con.createStatement();
                   ResultSet rs = st.executeQuery("select img1 from gallery where g_id="+num3);
                   while(rs.next()){
                  barray = rs.getBytes("img1");
                    response.setContentType("image/jpg,image/png");
                    img = response.getOutputStream();
                    img.write(barray);
                   }
                  
                    }
                  
                                
            } catch (Exception e) {
            }
            finally{
                img.flush();
                    img.close();
            }
            
            
      %>
    </body>
</html>
