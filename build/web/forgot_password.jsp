
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="javax.mail.*,javax.mail.internet.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FORGOT PASSWORD</title>
        <%@include file="cssfile.jsp" %>

    </head>
    <body>
        <%
            Connection con = dbconnection.DbConnection.getConnection();

        %>

        <%@include file="header.jsp" %>
        <div class="container">
            <div>



                <%                    String u = request.getParameter("u");
                    if (u != null) {
                        if (u.equals("admin")) {
                %><form action="verify_pass.jsp" method="POST">
                    <table>
                        <caption style="text-align: center;color:black;font-weight: bold"><h4>FORGOT PASSWORD</h4> </caption>
                        <tr>
                            <td>Enter username</td>
                            <td><input type="text" name="admin_username" ></td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Enter Email id</td>
                            <td><input type="email" name="admin_email" ></td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Enter Date of Birth</td>
                            <td><input type="date" name="admin_dob" ></td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;"><input type="submit" name="admin" value="Get Password"></td>

                        </tr>
                    </table>
                </form><%
                        }
else if(u.equals("user")){
%><form action="verify_pass.jsp" method="POST">
                    <table>
                        <caption style="text-align: center;color:black;font-weight: bold"><h4>FORGOT PASSWORD</h4> </caption>
                        <tr>
                            <td>Enter Contact Number</td>
                            <td><input type="text" name="user_contact" maxlength="10" minlength="10"></td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Enter NAME</td>
                            <td><input type="text" name="uname"></td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center;"><input type="submit" name="user" value="Get Password"></td>

                        </tr>
                    </table>
                </form><%
}
                    }
                %>
            </div>
        </div>
    </body>
</html>
