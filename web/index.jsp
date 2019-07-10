

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="org:image" content="https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjGiNTfveXgAhVNb1AKHcDnAxIQjRx6BAgBEAU&url=https%3A%2F%2Fwww.linkedin.com%2Fin%2Fplacement-cell-lala-lajpat-rai-college-080401155&psig=AOvVaw0TMhe4X8zgADiiDJTd00da&ust=1551685670150206">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <title>Lala Conference</title>
        <%@include file="cssfile.jsp" %>
        
        <script>
        window.onload=function(){
            if(location.href.indexOf('index.jsp')!== -1){
                document.getElementById('logo').style.display="";
            }
        };    
        </script>
        
        <script>
            
        $(document).ready(function() {
            $('.fancybox').fancybox({
                padding : 100,
                openEffect  : 'elastic'
            });
        });
    </script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$('.fancybox-thumbs').fancybox({
				prevEffect : 'elastic',
				nextEffect : 'elastic',
				

				closeBtn  : true,
				arrows    : true,
				nextClick : true,

				helpers : {
					thumbs : {
						width  : 80,
						height : 80
					},
					
					overlay : {
					openEffect  : 'outside',
				    closeEffect : 'inside',
					speedOut : 0
					}
				}
			});

			

		});
		
		

	</script>
     <style>
         .a{
             background-color: blue;
             color:white;
             font-size: 20px;
         }
         		.fancybox-custom .fancybox-skin {
			box-shadow: 0 0 50px white;
			border-color: #D7B25C;
		}
		
		img
		{
		margin:5px;
		border-color: #D7B25C;
		
		}
		.mySlides {display:none;}

     </style>
    </head>
    <body>
        <%
            Connection con = dbconnection.DbConnection.getConnection();
        %>
        <%@include file="header.jsp" %>
        
        
                <%
                    try {
                            
             String d1 = "0";
         int c =0;
               Date d = new Date();
            String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
            String img_string;
                             String query = "select * from conference where conf_date >= '" + c_year + "'";
               
            

            
           PreparedStatement ps = con.prepareStatement(query);
         ResultSet rs = ps.executeQuery(); %>
            <div class="container" style="border: 1px solid black;">
                <div style="background-color: blue;font-size: 20px;color:white;text-align: center;" >
               <% 
         while(rs.next())
         {
             
           d1 = rs.getString("conf_date");
           img_string = rs.getString("conf_id");
           c = (d1).compareTo(c_year);
           %>
           Upcoming Conference <p style="text-align: center"> Days to go: <%= c %> ||| Date: <%= rs.getString("conf_date") %></p> </div> <br><br> <p style="text-align: center;margin-top: 0px;background-color:green;color:white;font-size: 20px;"> <%= rs.getString("title") %>
           <div class="col-md-6"> <center> <a class="fancybox-thumbs" data-fancybox-group="thumb" href="img_view.jsp?no=<%= rs.getString("conf_id") %>" ><img src="img_view.jsp?no=<%= rs.getString("conf_id") %>" alt="<%= rs.getString("title") %>" style="text-align: center;" height="150" width="150" > </a></center>
               </div>
               
               
               <div>
                   
               </div>
               
               <div class="col-md-5">
                   <p style="text-align: justify;"> <%= rs.getString("about_conf") %><br> <a href="view_conference.jsp?no=<%= rs.getString("conf_id") %>" style="text-transform: none;text-align: right;">Read More ... </a> </p>
               
               <%
         }                    } catch (Exception e) {
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
                     <img src="images/lala1.jpg" height="100" width="250" id="logo" style="display:inline">
                 </div>
                 <div class="col-md-7">
                     <p style="text-align: justify"> Lala Lajpatrai College was established in 1972 and developed as one of the leading educational institutes in Mumbai. The college runs various courses in Junior and Senior Section to augment the needs of the Society. The courses covered are B.Com,BMS, BBI, BAF, BMM, B.Sc.IT, M.Com. It also conducts vocational courses.
                         <br>  <a href="aboutus.jsp" style="text-decoration:none;text-align: right;border: 1px solid blue;">  Read More ...</a> </p>
                         
                 </div>
                </div>
             <br><br>
        <div class="container">
                 <div class="container-fluid" style="font-size: 20px;text-align: center;background-color: blue;color:white;margin-top: 10px;">
                    GALLERY
                 </div>
            <div>
              <%
                  PreparedStatement a = con.prepareStatement("select DISTINCT(g.g_id) AS GALLERY_ID,c.title,c.conf_id from conference c,gallery g where g.conf_id=c.conf_id group by c.conf_id");
                  ResultSet rs = a.executeQuery();
                  while(rs.next())
                  {
                      %><div class="col-md-3">
                          <a class="fancybox-thumbs" data-fancybox-group="thumb" href="img_view.jsp?n=<%= rs.getString("GALLERY_ID") %>" > <img src="img_view.jsp?n=<%= rs.getString("GALLERY_ID") %>" height="120" width="120" /></a><br><p><a href="photo_gallery.jsp?g=<%= rs.getString("GALLERY_ID") %>&&c=<%= rs.getString("c.conf_id") %>"><%= rs.getString("c.title") %></a></p>
                          
</div><%
                  }
              %>
            </div>
        </div>
          
    </body>
</html>
