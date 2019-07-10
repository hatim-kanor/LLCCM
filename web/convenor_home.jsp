
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Convenor Home</title>
    </head>
    <body>
        <%
            String uname = (String)session.getAttribute("username");
            String wel = " Welcome :" + " " + uname; 
        %>
        
        <%@include file="convenor_left_panel.jsp" %>
        <div>
            <div class="col-md-8" style="border:1px solid black">
                     <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                     <div>
                        <%= wel  %> 
                     </div>
        </div>
        
    </body>
</html>
