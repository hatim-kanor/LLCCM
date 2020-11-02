

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logo.png" type="image/x-icon" /> 
        <%@include file="cssfile.jsp" %>
        	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
        <!--<meta name="org:image" content="https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjGiNTfveXgAhVNb1AKHcDnAxIQjRx6BAgBEAU&url=https%3A%2F%2Fwww.linkedin.com%2Fin%2Fplacement-cell-lala-lajpat-rai-college-080401155&psig=AOvVaw0TMhe4X8zgADiiDJTd00da&ust=1551685670150206">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>-->
        
        <title>Lala Conference</title>
        
                <style>

            * {
                 box-sizing: border-box;
            }
            .image_zoom:hover
            {
                  -ms-transform: scale(1.5); /* IE 9 */
                -webkit-transform: scale(1.5); /* Safari 3-8 */
                 transform: scale(1.5); 
                 transition: width 2s, height 4s;
            }
        </style>
    </head>
    <body ng-app="myapp" ng-controller="fetchCtrl">
        <%
            Connection con = dbconnection.DbConnection.getConnection();
        %>
        <div class="container-fluid" style="margin-left: 20dp;margin-right: 20dp">
        <%@include file="header.jsp" %>
        </div>
        
        
        <div class="container" >
        <div class="container" style="font-size: 20px;text-align: center;background-color: blue;color:white">
            Upcoming Conferences
        </div>
                <%
                    try {
                            
             String d1 = "0";
         int c =0;
         String temp_url="";
               Date d = new Date();
            String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
            String img_string;
                             String query = "select conf_id,title,sub_title,conf_date,venue,conf_image,about_conf,collab_with,moto,DATEDIFF(conf_date,SYSDATE()) AS DAYS_LEFT from conference where conf_date >= '" + c_year + "'";
               
            

            
           PreparedStatement ps = con.prepareStatement(query);
         ResultSet rs = ps.executeQuery(); %>
                 <div>    
               <%          
         while(rs.next())
         {  %>
               <%      
                   
            c =  rs.getInt("DAYS_LEFT");
           //d1 = rs.getString("conf_date");
           img_string = rs.getString("conf_id");
           temp_url = rs.getString("title").replaceAll(" ", "_");
           //c = (d1).compareTo(c_year);
          %>

              <div style="margin:5px;border: 1px stripped black">
                  <div class="col-sm-6" style="align-content: center">
                     <center><p style="text-align: center;font-size: 20px;">Date: <%= rs.getString("conf_date") %><br />  Days to go: <%= c %> </p> </center>
                      <center><img src="img_view.jsp?c<%= rs.getString("conf_id") %>" alt="<%= rs.getString("title") %>" style="text-align: center;" height="100" width="100" class="image_zoom"></center>
                      
                      <center> <h3>Title: <%= rs.getString("title") %></h3></center>
                      <button ng-click="readMore(<%= rs.getString("conf_id") %>)" style="align-items: flex-end;align-content: flex-end;" >Read More ...</button>
                      
                  </div>  
                  
              </div>
          </div>
    
               
               <%
         }}    
      catch (Exception e) {
                                out.println(e);


                        }
                
           
             %> 
           
                  </div>       
             <div class="container">
               
        </div>
            </div>
             <div class="container">
                 <div class="container-fluid" style="font-size: 20px;text-align: center;background-color: blue;color:white;margin-top: 10px;">
                     ABOUT US
                 </div>
                 <div class="col-md-5" style="display: inline-block;text-align: center">
                     <img src="images/lala1.jpg" height="100" width="250" id="logo" style="display:inline" class="image_zoom">
                 </div>
                 <div class="col-md-7">
                     <p style="text-align: justify"> Lala Lajpatrai College was established in 1972 and developed as one of the leading educational institutes in Mumbai. The college runs various courses in Junior and Senior Section to augment the needs of the Society. The courses covered are B.Com,BMS, BBI, BAF, BMM, B.Sc.IT, M.Com. It also conducts vocational courses.
                         <br>  <a href="aboutus.jsp" style="text-decoration:none;text-align: right;border: 1px solid blue;">  Read More ...</a> </p>
                         
                 </div>
                </div>
             <br><br>
        <div class="container">
                 <div class="container-fluid" style="font-size: 20px;text-align: center;background-color: blue;color:white;margin-top: 10px;margin-bottom: 10px;">
                    GALLERY
                 </div>
            <div>
              <%
                  PreparedStatement a = con.prepareStatement("select DISTINCT(g.g_id) AS GALLERY_ID,c.title,c.conf_id from conference c,gallery g where g.conf_id=c.conf_id group by c.conf_id");
                  ResultSet rs = a.executeQuery();
                  while(rs.next())
                  {
                      %><div class="col-sm-2">
                          <img src="img_view.jsp?g<%= rs.getString("GALLERY_ID") %>" height="120" width="120" class="image_zoom" /><br><p><a href="photo_gallery.jsp?<%= rs.getString("c.title") %>"><%= rs.getString("c.title") %></a></p>
                          
</div><%
                  }
              %>
            </div>
        </div>
 <script>
		var fetch = angular.module('myapp', []);

		fetch.controller('fetchCtrl',function ($scope, $http) {
                    
                    $scope.readMore = function(conf_id){
                        window.location.href = "view_conference.jsp?#"+conf_id;
                    }
                });      
  </script>                
    </body>
</html>
