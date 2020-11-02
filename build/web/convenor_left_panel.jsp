
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
             
             <%@include file="cssfile.jsp" %>
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
                     <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">CONVENOR MENU </p> <br><br>
                     
                     <a href="convenor_home.jsp">HOME</a><br>
                     <a href="view_edit_conference.jsp">VIEW AND EDIT CONFERENCE</a><br>
                     <a href="conference_fees.jsp">CONFERENCE FEES</a><br>
                     <a href="add_staff.jsp">STAFF</a><br>
                     <a href="valedictory.jsp"> VALEDICTORY MEMBERS </a><br>
                     <a href="add_gallery.jsp">GALLERY</a> | <a href="view_gallery.jsp">VIEW PHOTO GALLERY</a><br>
                     <a href="view_registered.jsp"> VIEW REGISTERED </a><br>
                     <a href="committe_list.jsp"> COMMITTEE LIST </a><br>
                     <a href="schedule_list.jsp"> PREPARE SCHEDULE </a><br>
                     <a href="feedback.jsp"> FEEDBACK </a><br>
                     <a href="report_list.jsp"> REPORTS </a><br>
                     <a href="logout.jsp">Logout</a><br>
                     
                
        </div>
    </body>
</html>