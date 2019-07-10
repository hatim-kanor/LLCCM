
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LLC - LOGIN PAGE</title>
        <%@include file="cssfile.jsp" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function hide_login()
            {
                var a = document.getElementById("admin");
                var s = document.getElementById("staff");
                var u = document.getElementById("user");
                a.style.display = 'none';
                s.style.display = 'none';
                u.style.display = 'block';
                
                
            }
            function admin_fun(id)
            {
            var e = document.getElementById(id);
            var u = document.getElementById("user");
            var s = document.getElementById("staff");
            if(e.style.display === 'block')
            {
                 e.style.display = 'none';
            }
            else
            {
                e.style.display = 'block';
                u.style.display = 'none';
                s.style.display = 'none';
            }
        }
            function staff_fun(id)
            {
            var e = document.getElementById(id);
            var a = document.getElementById("admin");
            var u = document.getElementById("user");
            if(e.style.display === 'block')
            {
                 e.style.display = 'none';
                
                 
            }
            else
            {
                e.style.display = 'block';
                a.style.display = 'none';
                u.style.display = 'none';
            }
        }
            function user_fun(id)
            {
            var e = document.getElementById(id);
            var a = document.getElementById("admin");
            var s = document.getElementById("staff");
            if(e.style.display === 'block')
            {
                 e.style.display = 'none';
            }
            else
            {
                e.style.display = 'block';
                a.style.display = 'none';
                s.style.display = 'none';
            }    
            }
            
            </script>
    </head>
    <body onload="hide_login()">
        <div class="container-fluid">
        <%@include file="header.jsp" %>
        </div>
        <div class="container">
       <!-- CODE FOR SUCCESS AND FAIL MSG -->
         <%
                           
                            String a = request.getParameter("a");
                            if(a!=null)
                            {
                                if(a.equals("pass_sent"))
                                {
                                    out.println("<h4 style='color:green'>PASSWORD SENT TO YOU REGISTERED EMAIL ID</h4>");
                                }
                                
                            }
                            
                            String ss = (String)session.getAttribute("role");
                            if(ss!=null)
                            {
                                if(ss.equals("admin"))
                                {
                                response.sendRedirect("admin_profile.jsp");
                                }
                                else if(ss.equals("convenor"))
                                {
                                    response.sendRedirect("convenor_home.jsp");
                                }
                                else if(ss.equals("user"))
                                {
                                    response.sendRedirect("user/user_home.jsp");
                                }
                            }
                        
                        %>
       <!-- CODE FOR SUCCESS AND FAIL MSG -->                 
        </div>
        <div class="container" style="padding: 10px;margin: 50px;">
    <!-- USER LOGIN SECTION START  c1-->
       
           <section id="user" class="c1">
            <b><h3>USER LOGIN</h3></b>
        <br><br>
       
        
        <form id="" method="POST" action="user_login" style="text-align: center;">
            <table>
                <tr>
                    <td colspan="2"> 
                                             
                    </td>
                </tr>
                <tr>
                        <th>User Email: </th>
                        <td><input type="email" name="user_email" placeholder="User Email" /></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                   <tr>
                        <th>User Contact: </th>
                        <td><input type="text" name="user_contact" placeholder="User contact" id="user_contact" >
                        </td>
                    </tr> <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    
                    
                    <tr>
                        <td><input type="submit" value="Login" id="user_login"></td>
                        <td><a href="#" class="admin" onclick="admin_fun('admin')">Admin Login</a><br>
                        <a href="#" class="staff" onclick="staff_fun('staff')">Staff Login</a>
                        <tr>
                         <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                            <td colspan="2">
                            <a href="forgot_password.jsp?u=user">Not getting Logged in?</a>
                        </td>
                        
                    </tr>
                        
                        </td>   
                    </tr>
            </table>
            
        </form>
                
                
        </section>
       
        <!-- USER LOGIN SECTION END -->   
      
            <!-- STAFF LOGIN SECTION START c2 -->
       
            <section id="staff" class="c2">
           
                <b><h3>STAFF LOGIN</h3></b>
        <br><br>
       
        
        <form id="" method="POST" action="login_staff">
            <table>
                <tr>
                    <td colspan="2"> 
                                             
                    </td>
                </tr>
                <tr>
                        <th>Staff Email: </th>
                        <td><input type="email" name="staff_email" placeholder="Staff Email" /></td>
                    </tr>
                   
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                     <tr>
                        <th>Staff Contact: </th>
                        <td>
                            <input type="text" name="staff_contact" placeholder="Staff Contact" id="staff_contact" />
                        </td>
                    </tr>
                   
                    
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" id="staff_login"></td>
                        <td><a href="#" class="admin" onclick="admin_fun('admin')">Admin Login</a><br>
                        <a href="#" class="user" onclick="user_fun('user')">User Login</a>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td colspan="2">
                            <a href="forgot_password.jsp?u=admin">Forgot Password?</a>
                        </td>
                    </tr>
            </table>
            
        </form>
                
                
            
        </section>
       
        <!-- STAFF LOGIN SECTION END -->   
      
        <!-- ADMIN LOGIN SECTION START  c3-->
        
            <section id="admin" class="c3">
            
                <b><h3>ADMIN LOGIN</h3></b>
        <br><br>
       
        
        <form id="" method="POST" action="login">
            <table>
                <tr>
                    <td colspan="2"> 
                                             
                    </td>
                </tr>
                <tr>
                    <th>
                        Enter Admin UserName: 
                    </th>
                    <td>
                        <input type="text" name="uname" placeholder="Admin UserName" id="admin_name">
                    </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                    <th>
                        Enter Admin Password: 
                    </th>
                    <td>
                        <input type="password" name="admin_pass" placeholder="Admin Password" id="admin_pass">
                    </td>
                </tr>
                <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" id="admin_login"></td>
                        <td><a href="#" class="user" onclick="user_fun('user')">User Login</a><br>
                        <a href="#" class="staff" onclick="staff_fun('staff')">Staff Login</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a href="forgot_password.jsp?u=admin">Forgot Password?</a>
                        </td>
                    </tr>
            </table>
            
        </form>
                
                
            
        </section>
        
        <!-- ADMIN LOGIN SECTION END -->   
          
        </div>

    
    </body>
</html>
