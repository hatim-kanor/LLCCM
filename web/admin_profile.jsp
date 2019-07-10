
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMIN HOME PAGE</title>
         <%@include file="cssfile.jsp" %>
     <style>
         a{
             text-decoration: none;
             font-size:20px;
             text-align: center;
           
           
         }
         a:hover
         {
             background-color: brown;
             color:white;
         }
     </style>
    </head>
    <body>
    

   

     
         <div class="container">
             <p style="font-size: 20px;"></p>
             
         </div>
     
             <div class="container">
             
                 <%@include file="admin_left_panel.jsp" %>
                 <div class="col-md-6" style="border:1px solid black">
                     <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                     <div >
                         
                         
                     </div>
                 </div>
                 
            
     </div>
    </body>
</html>
