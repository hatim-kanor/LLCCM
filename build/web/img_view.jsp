
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
   String url,title,type2 = "";
   String type1= "";
   int count_length;
           String modified_url = "";
           url = String.valueOf(request.getQueryString());
           count_length = url.length();
           //out.print("Count: " +count_length);
           if(count_length == 2)
           {
               type1 = url.substring(0,url.length()-1); //get the type if it is conference of gallery
           }
           else if(count_length == 3)
           {
               type1 = url.substring(0,url.length()-2); //get the type if it is conference of gallery
           }
           else if(count_length > 3)
           {
               type1 = url.substring(0,url.length()-3); //get the type if it is conference of gallery
           }
           //type1 = url.substring(0,url.length()-1); //get the type if it is conference of gallery
           type2 = url.substring(1); //get the number of id
           System.out.println(type2);
           //out.println("\nType : "+type1);
           //out.println("\nNumber: " + type2);
            
            try {
                    if(type1.equalsIgnoreCase("c"))
                    {
                    Connection con = dbconnection.DbConnection.getConnection();
                    
                   Statement st = con.createStatement();
                   ResultSet rs = st.executeQuery("select * from conference where conf_id="+type2);
                   while(rs.next()){
                  barray = rs.getBytes("conf_image");
                    response.setContentType("image/jpg,image/png");
                    img = response.getOutputStream();
                    img.write(barray);
                   }
                  
                    }
                    else if(type1.equalsIgnoreCase("g"))
                    {
                        Connection con = dbconnection.DbConnection.getConnection();
                    
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select img1 from gallery where g_id="+type2);
                        while(rs.next()){
                       barray = rs.getBytes("img1");
                         response.setContentType("image/jpg,image/png");
                         img = response.getOutputStream();
                         img.write(barray);
                   }
                  
                    }
                          else if(type1.equalsIgnoreCase("a"))
                    {
                        Connection con = dbconnection.DbConnection.getConnection();
                    
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select img1 from gallery where conf_id="+type2);
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
