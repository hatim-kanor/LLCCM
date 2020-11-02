
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <%@include file="header_user.jsp" %>
         <style>
         body{
             margin:10px;
         }
        
         #hj{
             text-decoration: none;
             font-size:13px;
             
           
           
         }
         #hj:hover
         {
             background-color: blue;
             color:white;
         }
     </style>

    </head>
    <body>
         <div class="container-fluid" style="text-align: center;padding:20px;">
           
              
            <span style="font-weight: bold;font-size:20px;margin-top:70px;"><img src="../images/logo.png" height="70" width="70">LALA LAJPATRAI COLLEGE OF COMMERCE AND ECONOMICS -- CONFERENCE MANAGEMENT SYSTEM </span>
            
                </div>
        <div class="navbar">
            
            <div class="container">
                
                
                
                    
              
                    
                    <button class="navbar-toggle"  data-toggle="collapse" data-target=".navHeaderCollapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    
                    
                    
                    <div class="collapse navbar-collapse navHeaderCollapse">
                        
                        <ul class="nav navbar-nav">
                            
                            <li><a href="user_home.jsp" class="active" id="hj" >HOME</a></li>
                            <li><a href="attendance.jsp"  id="hj">UPDATE ATTENDANCE LIST</a></li>
                            
                            
                            <li><a href="attended_conference.jsp" id="hj">VIEW ATTENDED CONFERENCES</a></li>
                            <li><a href="committee_list.jsp" id="hj">VIEW COMMITTEE LIST</a></li>
                            <li><a href="../logout.jsp" id="hj">LOGOUT</a></li>
                            
                        </ul> <!--end of menu list -->
                    </div> <!--end of collapse menu bar -->
                <!--</div>--> <!--end of image brand div -->
            </div><!--end of container main -->
        </div><!--end of navigation -->
       
    </body>
</html>
