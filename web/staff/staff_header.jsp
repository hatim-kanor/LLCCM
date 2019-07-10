
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <%@include file="header_user.jsp" %>
             <style>
         body{
             margin:15px;
         }
        
         a{
             text-decoration: none;
             font-size:17px;
             
           
           
         }
         a:hover
         {
             background-color: blue;
             color:white;
         }
     </style>
    </head>
    <body>
       <div class="col-lg-4" style="">
                     <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center">STAFF MENU </p> <br><br>
                     
                     <a href="admin_profile.jsp">HOME</a><br>
                     <a href="attendance.jsp">PROFILE</a><br>
                     <a href="view_edit_conference.jsp">VIEW ATTENDED CONFERENCES</a><br>
                     <a href="">VIEW COMMITTEE LIST</a><br>
                     <a href="../logout.jsp">Logout</a><br>
                     
                 </div>
        
    </body>
</html>
