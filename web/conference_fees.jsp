
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Conference Fees</title>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function check_tchr()
            {
                var x = document.getElementById("tchr_fees").value;
                if(x === "" || x===NULL)
                {
                    document.getElementById("tchr_print").innerHTML = "Please fill teacher details";
                }
            }
            function check_sdnt()
            {
                var y = document.getElementById("sdnt_fees").value;
                if(y === "" || y===NULL)
                {
                    document.getElementById("sdnt_print").innerHTML = "Please fill Student details";
                }
            }
            function check_other()
            {
                var z = document.getElementById("other_fees").value;
                if(z === "" || z===NULL)
                {
                    document.getElementById("other_print").innerHTML = "Please fill other details";
                }
            }
        </script>
    </head>
    <body>
        <%
            Connection con = dbconnection.DbConnection.getConnection();
            String conf_id = request.getParameter("conf_id");
            int res1 = 0,res2=0,res3=0; 
            String msg = "";
            if(conf_id!=null)
            {
                String tchr = request.getParameter("tchr_fees");
                String sdnt = request.getParameter("sdnt_fees");
                String other = request.getParameter("other_fees");
                PreparedStatement pst_tchr = con.prepareStatement("insert into payment_amount(conf_id,p_type,amount)values(?,?,?)");
                PreparedStatement pst_sdnt = con.prepareStatement("insert into payment_amount(conf_id,p_type,amount)values(?,?,?)");
                PreparedStatement pst_other = con.prepareStatement("insert into payment_amount(conf_id,p_type,amount)values(?,?,?)");
                
                pst_tchr.setString(1, conf_id);
                pst_tchr.setString(2, "Teacher");
                pst_tchr.setString(3, tchr);
                pst_sdnt.setString(1, conf_id);
                pst_sdnt.setString(2, "Student");
                pst_sdnt.setString(3, sdnt);
                pst_other.setString(1, conf_id);
                pst_other.setString(2, "Other");
                pst_other.setString(3, tchr);
                
                
                res1 = pst_tchr.executeUpdate();
                res2 = pst_sdnt.executeUpdate();
                res3 = pst_other.executeUpdate();
                
                if(res1 > 0)
                {
                    if(res2 > 0)
                    {
                        if(res3 > 0)
                        {
                            msg = "Fees Updated Successfully";
                        }
                        else
                        {
                            msg = "Failed to Updated Fees for Others";
                        }
                    }
                    else
                    {
                        msg = "Failed to Updated Fees for Student and Others";
                    }
                }
                else
                {
                    msg = "Failed to Updated Fees";
                    
                }
                
                
            }
        %>
        
        <%@include file="convenor_left_panel.jsp" %>
        
         <div class="col-md-8" style="border:1px solid black">
                <p style="background-color: #0158B6;color: white;font-size: 20px;text-align: center;">MAIN VIEW </p> <br><br>
                <div>
            <h3><%= msg %></h3>
                </div>
                <label><h3>Add Conference Fees</h3> </label>
                <div>
                    <form action="conference_fees.jsp" method="POST">
                    <table>
                        <tr>
                            <th>Select Conference: </th>
                            <td><select name="conf_id" id="conf_id"><option value="">Select Conference</option>
                            <%
                                
                                PreparedStatement pst = con.prepareStatement("select c.conf_id,c.title from conference c,payment_amount p where c.conf_id<>p.conf_id");
                                ResultSet rst = pst.executeQuery();
                                while(rst.next())
                                {
                            %><option value="<%= rst.getString("c.conf_id") %>"><%= rst.getString("c.title") %></option><% 
                                }
                                
                                %></select>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <th>
                                Teacher
                            </th>
                            <td>
                                <input type="text" name="tchr_fees" id="tchr_fees" onblur="check_tchr()"  />
                                <label id="tchr_print" style="color: red;font-weight: bold"></label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <th>
                                Student
                            </th>
                            <td>
                                <input type="text" name="sdnt_fees" id="sdnt_fees" onblur="check_sdnt()" />
                                <label id="sdnt_print" style="color: red;font-weight: bold"></label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <th>
                                Other
                            </th>
                            <td>
                                <input type="text" name="other_fees" id="other_fees" onblur="check_other()" />
                                <label id="other_print" style="color: red;font-weight: bold"></label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <th colspan="2">
                                <input type="submit" name="Add Fees" >
                            </th>
                        </tr>
                    </table>
                        </form>
                </div>
                            <br><br>
                            <h3>
                                Select to View Conference Fees
                            </h3>
                            <div>
                                <table>
                                    <tr>
                                        <th>
                                            Select Conference
                                        </th>
                                        <td><select name="payment_conf" id="payment_conf"><option value="">Select Conference</option>
                                            <%
                                                  PreparedStatement ps_fees = con.prepareStatement("select c.conf_id ,c.title from payment_amount p,conference c group by c.conf_id");
                                    ResultSet rs_fees = ps_fees.executeQuery();
                                    while(rs_fees.next())
                                    {
                                            %><option value="<%= rs_fees.getString("c.conf_id") %>"><%= rs_fees.getString("c.title") %></option><%
                                    }
                                    
                                            %>
                                        </td>
                                    </tr>
                                </table>
                                        <br><br>
                                        <table border="1" style="width:100%;text-align:center">
                                   
                                    <tr>
                                        <td id="fees_disp">
                                            
                                        </td>
                                    </tr>
                              
                                </table>
                            </div> 
                                
                            
                            
         </div>
    </body>
</html>
<script>
    $(document).ready(function () {
        $("#payment_conf").on("change", function () {
            var payment_conf = $("#payment_conf").val();//id of country select box of index.jsp page;
                $.ajax({
                    url: "fees_disp",//your jsp page name
                    data: {payment_conf :payment_conf},//sending request to state.jsp page.
                    method: "POST",//HTTP method.
                    success: function (data)
                    {
                        $("#fees_disp").html(data);//output or response will display in state select box.
                    }
                });
        });
    });
</script>
