
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%
            String conf_id = (String)session.getAttribute("conf_id");
            
            Connection con = dbconnection.DbConnection.getConnection();
            
            if(conf_id == null || conf_id.equals(""))
            {
               response.sendRedirect("view_registered.jsp?msg=fail"); 
            }else
            {
                String url ="../registered_conference.csv ";
            FileWriter fw = new FileWriter(url);
            fw.append("Reg_ID");
            fw.append(",");
            fw.append("Name");
            fw.append(",");
            fw.append("Contact");
            fw.append(",");
            fw.append("Designation");
            fw.append(",");
            fw.append("Payment Type");
            fw.append("\n");
            PreparedStatement pst = con.prepareStatement("select c.reg_id,c.uname,c.contact,p.p_type,c.designation from registration c,payment p where p.payment_id = c.payment_id and conf_id =" + conf_id);
            ResultSet rst = pst.executeQuery();
            while(rst.next())
            {
                fw.append(rst.getString("c.reg_id"));
                fw.append(",");
                fw.append(rst.getString("c.uname"));
                fw.append(",");
                fw.append(rst.getString("c.contact"));
                fw.append(",");
                fw.append(rst.getString("c.designation"));
                fw.append(",");
                fw.append(rst.getString("p.p_type"));
                fw.append("\n");
                        
            }
            fw.flush();
            fw.close();
          
           
                
            }
            


        %>
    </body>
</html>
