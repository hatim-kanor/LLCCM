
<%@page import="java.io.OutputStream"%>
<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/logo.png" type="image/x-icon" /> 
           <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
        <title>PHOTO GALLERY</title>
        <style>

            * {
                 box-sizing: border-box;
            }
            .image_zoom:hover
            {
                  -ms-transform: scale(1.5); /* IE 9 */
                -webkit-transform: scale(1.5); /* Safari 3-8 */
                 transform: scale(1.5); 
            }
        </style>
    </head>
    <body ng-app="myapp" ng-controller="fetchCtrl">
        <% String url,title = "";
           String modified_url = "";
                       OutputStream img = null;
             byte[] barray = null;
        String type2 = "";
        String type1= "";
            %>
        <div class="container">
        <%@include file="header.jsp" %>
        <%
            Connection con = dbconnection.DbConnection.getConnection();
        %>
           <% url = String.valueOf(request.getQueryString());
           modified_url = URLDecoder.decode(url,"UTF-8");
           
           %>
           
           <%
               if(url.equalsIgnoreCase("null")){
                   %>
                           <% 
                           PreparedStatement ps = con.prepareStatement("select conf_id from gallery group by conf_id;");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next())
                    {%>
                           <%
                        PreparedStatement ps2 = con.prepareStatement("select c.title,g.conf_id,g.img1,g.g_id from gallery g,conference c where g.conf_id="+rs.getString("conf_id") +" and c.conf_id = g.conf_id order by c.conf_id desc LIMIT 1");
                        ResultSet rs2 = ps2.executeQuery();
                        %>
                        
                        <%
                        while(rs2.next()){
                        %>
                        <div class="col-sm-4">
                            <h3><%= rs2.getString("c.title") %></h3>
                            
                        <img src="img_view.jsp?g<%= rs2.getString("g.g_id") %>" height="150" width="150" style="border:1px solid black;" class="image_zoom"><br>
                        <a href="photo_gallery.jsp?<%= rs2.getString("c.title") %>">View More ...</a>
                        </div>
                        <%
                            }
                            
                            
                    }
                           %>
                          
                    <%
               }
               else
               {


                %><div class="container">
                    <div><center><%= modified_url %></center></div>
                    <%
                   PreparedStatement ps = con.prepareStatement("select g.g_id AS GALLERY_ID,c.title,c.conf_id from conference c,gallery g where c.title LIKE '%"+modified_url+"%' and c.conf_id=g.conf_id");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next())
                    {
                        title = rs.getString("c.title");
                    %><img src="img_view.jsp?g<%= rs.getString("GALLERY_ID") %>" alt="<%= rs.getString("c.title")  %>" height="170" width="170" style="border:1px solid black;" class="image_zoom"> <%
                    }
                   
                %></div><%
               }
           %>
        
        </div>
  <script>
		var fetch = angular.module('myapp', []);

		fetch.controller('fetchCtrl',function ($scope, $http) {
                    
                    $scope.readMore = function(conf_id){
                        console.log(conf_id);
                        //window.location.href = "photo_gallery.jsp?"+conf_id;
                    }
                });      
  </script>            
    </body>
 
</html>
