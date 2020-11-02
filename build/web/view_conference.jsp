
<%@page import="java.net.URLDecoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Conference</title>
          <%@include file="cssfile.jsp" %>
          <style>
              div{
                  text-align: center;
              }
              #ti
              {
                  font-weight: bold;
                 background-color: springgreen;
                 text-transform: uppercase;
              }
          </style>
              
              
    </head>
    <body>
      
        <%
            String title="",conf_date="",collab="",venue="";
            Connection con = dbconnection.DbConnection.getConnection();
            String conf = request.getQueryString();
            conf = URLDecoder.decode(conf, "UTF-8");
            System.out.println(conf);
            
        %>
        <%@include file="conference_menu.jsp" %>
<!--        <div class="container" style="border:1px solid blue;background-color: yellow;">
        <div class="container">
            <div class="col-md-2">
                <img src="images/logo.png" height="80" width="80">
            </div>
            <div class="col-md-8" style="font-weight: bold;">
                <h3><strong>LALA LAJPATRAI COLLEGE OF COMMERCE AND ECONOMICS</strong></h3>
            </div>
            <div class="col-md-2">
               <%
                   PreparedStatement pst = con.prepareStatement("select venue,collab_with,conf_date,title,conf_image,title,conf_id from conference where conf_id ="+conf);
                   ResultSet r = pst.executeQuery();
                   while(r.next())
                   {
                       venue = r.getString("venue");
                       collab = r.getString("collab_with");
                       conf_date = r.getString("conf_date");
                       title = r.getString("title");
                       %><img src="img_view.jsp?c<%= r.getString("conf_id") %>" height="80"  width="80" alt="<%= collab %>"><%
                   }
               %>
            </div>
       </div>
            <div class="container">
                <div class="col-md-2">
                    &nbsp;
                </div>
                <div class="col-md-8" style="text-align: center;">
                    IN COLLABORATION WITH<BR />
                   <H3><%= collab %></H3>
                   <br>
                   ORGANIZES
                   <BR />
                   CONFERENCE ON
                   <BR />
                   <h3 id="ti"> <%= title %> </h3>
                   <br />
                   ON 
                   <br>
                   <h4><strong><%= conf_date %></strong></h4>
                   <br /><br />
                   AT <h4><strong><%= venue %></strong></h4>
                </div>
            </div>
           
       
       </div>-->
    </body>
</html>
