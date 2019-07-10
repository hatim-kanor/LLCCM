<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>STAFF HOME</title>
        <%@include file="../cssfile.jsp" %>
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            String msg = "";
            Date d = new Date();
            String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
            String uname = (String) session.getAttribute("username");
            String email = (String) session.getAttribute("staff_email");
            String role = (String) session.getAttribute("role");
            String calll = (String)session.getAttribute("calll");
            String type = (String) session.getAttribute("header_type");
            //String dur = (String) session.getAttribute("dura");
   try{         
       if(role!=null)
       {
           
        %><%@include file="staff_lef_panel.jsp" %> <%
       }
            }
catch(Exception e)
{
out.println(e);
}
        %>
        <div class="container-fluid">

            <div class="col-md-7">
                
                <div class="container-fluid" style="text-align: center;">
                    <h4>Welcome: <%= uname%> <br>Role <%= role%> </h4>
                    
                </div>
            </div>
        </div>
    </body>
</html>
