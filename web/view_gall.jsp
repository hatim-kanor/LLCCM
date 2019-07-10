
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    </head>
    <body>
  <%OutputStream img = null;
   byte[] barray = null;
      try{
      
      String conf_id = request.getParameter("id");
    
      Connection con = dbconnection.DbConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("select * from gallery where g_id = "+conf_id);
    ResultSet rs = ps.executeQuery();
    
    if(rs.next())
    {
        
             barray = rs.getBytes("img1");
                    response.setContentType("image/jpg,image/png");
                    img = response.getOutputStream();
                    img.write(barray);
        }
      }catch(Exception e)
      {
          out.println(e);
      }
      finally{
                 img.flush();
                    img.close();
      }
  %>
    </body>
</html>
