package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.SimpleDateFormat;
import java.sql.*;
import java.util.Calendar;
import java.util.Date;

public final class add_005fconvenor_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/cssfile.jsp");
    _jspx_dependants.add("/admin_left_panel.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Add Convenor</title>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("         <script src=\"jquery-3.3.1.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"dist/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"dist/js/bootstrap.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"dist/css/bootstrap-theme.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"dist/css/bootstrap-theme.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"dist/css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"dist/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    <a href=\"dist/fonts/glyphicons-halflings-regular.eot\"></a>\n");
      out.write("    <a href=\"dist/fonts/glyphicons-halflings-regular.svg\"></a>\n");
      out.write("    <a href=\"dist/fonts/glyphicons-halflings-regular.ttf\"></a>\n");
      out.write("    <a href=\"dist/fonts/glyphicons-halflings-regular.woff\"></a>\n");
      out.write("    <a href=\"dist/fonts/glyphicons-halflings-regular.woff2\"></a>\n");
      out.write("     <link href=\"dist/css/stylesheet.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("     <!-- Add Thumbnail helper (this is optional) -->\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/jquery.fancybox-thumbs.css?v=1.0.7\" />\n");
      out.write("        <script type=\"text/javascript\" src=\"dist/css_dialog/jquery.fancybox-thumbs.js?v=1.0.7\"></script>\n");
      out.write("\t<!-- Add jQuery library -->\n");
      out.write("        <script type=\"text/javascript\" src=\"dist/css_dialog/jquery-1.10.1.min.js\"></script>\n");
      out.write("        \n");
      out.write("\n");
      out.write("\t<!-- Add mousewheel plugin (this is optional) -->\n");
      out.write("        <script type=\"text/javascript\" src=\"dist/css_dialog/jquery.mousewheel-3.0.6.pack.js\"></script>\n");
      out.write("\n");
      out.write("\t<!-- Add fancyBox main JS and CSS files -->\n");
      out.write("        <script type=\"text/javascript\" src=\"dist/css_dialog/jquery.fancybox.js?v=2.1.5\"></script>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"dist/css_dialog/jquery.fancybox.css\" media=\"screen\" />\n");
      out.write("\n");
      out.write("\t<!-- Add Button helper (this is optional) -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"dist/css_dialog/jquery.fancybox-buttons.css?v=1.0.5\" />\n");
      out.write("        <script type=\"text/javascript\" src=\"dist/css_dialog/jquery.fancybox-buttons.js\"></script>\n");
      out.write("\n");
      out.write("\t<!-- Add Thumbnail helper (this is optional) -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"dist/css_dialog/jquery.fancybox-thumbs.css?v=1.0.7\" />\n");
      out.write("        <script type=\"text/javascript\" src=\"dist/css_dialog/jquery.fancybox-thumbs.js\"></script>\n");
      out.write("\n");
      out.write("\t<!-- Add Media helper (this is optional) -->\n");
      out.write("        <script type=\"text/javascript\" src=\"dist/css_dialog/jquery.fancybox-media.js\"></script>\n");
      out.write("       \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         <div class=\"container\">\n");
      out.write("             \n");
      out.write("                 ");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("             <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("           <script src=\"dist/js/jquery-3.3.1.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"dist/js/bootstrap.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"dist/js/bootstrap.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"dist/css/bootstrap-theme.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"dist/css/bootstrap-theme.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"dist/css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"dist/css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    <a href=\"dist/fonts/glyphicons-halflings-regular.eot\"></a>\n");
      out.write("    <a href=\"dist/fonts/glyphicons-halflings-regular.svg\"></a>\n");
      out.write("    <a href=\"dist/fonts/glyphicons-halflings-regular.ttf\"></a>\n");
      out.write("    <a href=\"dist/fonts/glyphicons-halflings-regular.woff\"></a>\n");
      out.write("    <a href=\"dist/fonts/glyphicons-halflings-regular.woff2\"></a>\n");
      out.write("     <link href=\"dist/css/stylesheet.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("     <style>\n");
      out.write("         body{\n");
      out.write("             margin:15px;\n");
      out.write("         }\n");
      out.write("        \n");
      out.write("         a{\n");
      out.write("             text-decoration: none;\n");
      out.write("             font-size:17px;\n");
      out.write("             \n");
      out.write("           \n");
      out.write("           \n");
      out.write("         }\n");
      out.write("         a:hover\n");
      out.write("         {\n");
      out.write("             background-color: blue;\n");
      out.write("             color:white;\n");
      out.write("         }\n");
      out.write("     </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"col-lg-4\" style=\"\">\n");
      out.write("                     <p style=\"background-color: #0158B6;color: white;font-size: 20px;\">ADMIN MENU </p> <br><br>\n");
      out.write("                     \n");
      out.write("                     <a href=\"admin_profile.jsp\">HOME</a><br>\n");
      out.write("                     <a href=\"new_conference.jsp\">ADD CONFERENCE</a><br>\n");
      out.write("                     <a href=\"view_edit_conference.jsp\">VIEW AND EDIT CONFERENCE</a><br>\n");
      out.write("                     <a href=\"add_convenor.jsp\">CONVENOR</a><br>\n");
      out.write("                     <a href=\"add_staff.jsp\">ADD & UPDATE STAFF</a><br>\n");
      out.write("                     <a href=\"logout.jsp\">Logout</a><br>\n");
      out.write("                     \n");
      out.write("                 </div>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("                 <div class=\"col-md-8\" style=\"border:1px solid black\">\n");
      out.write("                     <p style=\"background-color: #0158B6;color: white;font-size: 20px;text-align: center;\">MAIN VIEW </p> <br><br>\n");
      out.write("                     <div>\n");
      out.write("                         ");

                             String msg = request.getParameter("msg");
                             String del = request.getParameter("del");
                             String up = request.getParameter("up");
                             if(msg!=null)
                             {
                                 if(msg.equals("fail"))
                                 {
                                     
      out.write("<h2>Failed to add convenor</h2>");

                                 }
                                else if(msg.equals("dup"))
                                {
                                    
      out.write("<h2>Convenor already selected for conference</h2>");

                                }
                                else if(msg.equals("success"))
                                {
                                    
      out.write("<h2>Successfully added Convenor</h2>");

                                }
                             }
                             if(del!=null)
                             {
                                 if(del.equals("fail"))
                                 {
                                     
      out.write("<h2>Failed to delete convenor</h2>");

                                 }
                                else if(del.equals("success"))
                                {
                                    
      out.write("<h2>Convenor deleted Successfully</h2>");

                                }
                                
                             }
                             if(up!=null)
{
if(up.equals("success"))
{
                                    
      out.write("<h2>Convenor edited Successfully</h2>");

}
else if(up.equals("fail"))
{
                                    
      out.write("<h2>Failed to edit</h2>");

}
}

                         
      out.write("\n");
      out.write("                         <form id=\"staff\" action=\"add_convenor\" method=\"POST\">\n");
      out.write("                           <table>\n");
      out.write("                               <tr> <td>Select Conference </td><td><select name=\"conf_id\" id=\"conf_id\">\n");
      out.write("                         ");

                             
                              Date d = new Date();
                             String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
                             String query = "select * from conference where conf_date >= '" + c_year + "'";
                             Connection con = dbconnection.DbConnection.getConnection();
                             PreparedStatement ps = con.prepareStatement(query);
                             ResultSet rs = ps.executeQuery(); 
                            
                             while(rs.next())
                             {
                                 
      out.write("\n");
      out.write("                                     <option value=\"");
      out.print( rs.getString("conf_id")  );
      out.write('"');
      out.write('>');
      out.print( rs.getString("title")  );
      out.write(" </option> \n");

                                 
                             }
                             
      out.write("\n");
      out.write("                             </select> </td></tr>\n");
      out.write("                               <tr>\n");
      out.write("                                   <td>\n");
      out.write("                                       &nbsp;\n");
      out.write("                                   </td>\n");
      out.write("                                   <td>\n");
      out.write("                                       &nbsp;\n");
      out.write("                                   </td>\n");
      out.write("                               </tr>                               \n");
      out.write("<tr><td >Select Staff Stream </td>\n");
      out.write("                                     <td><select name=\"stream_id\" id=\"stream_id\">\n");
      out.write("                                 \n");
      out.write("                           ");

                               PreparedStatement pst = con.prepareStatement("select stream,staff_id from staff_list group by stream");
                               ResultSet rst = pst.executeQuery();
                               while(rst.next())
                               {
                             
      out.write("\n");
      out.write("                                           <option value=\"");
      out.print( rst.getString("stream") );
      out.write('"');
      out.write('>');
      out.print( rst.getString("stream") );
      out.write("</option>\n");

                               }
                           
      out.write(" </select> </td>    </tr>\n");
      out.write("<tr>\n");
      out.write("                                   <td>\n");
      out.write("                                       &nbsp;\n");
      out.write("                                   </td>\n");
      out.write("                                   <td>\n");
      out.write("                                       &nbsp;\n");
      out.write("                                   </td>\n");
      out.write("                               </tr>\n");
      out.write("                         <tr><td >Select Staff</td>\n");
      out.write("                             <td id=\"staff_id\"></td></tr>\n");
      out.write("                         <tr>\n");
      out.write("                                   <td>\n");
      out.write("                                       &nbsp;\n");
      out.write("                                   </td>\n");
      out.write("                                   <td>\n");
      out.write("                                       &nbsp;\n");
      out.write("                                   </td>\n");
      out.write("                               </tr>\n");
      out.write("                               <tr>\n");
      out.write("                                   <td colspan=\"2\">\n");
      out.write("                                       <input type=\"submit\" name=\"submit\" value=\"Add Convenor\" id=\"submit\">\n");
      out.write("                                   </td>\n");
      out.write("                                   \n");
      out.write("                               </tr>\n");
      out.write("                           </table>\n");
      out.write("                         </form>\n");
      out.write("                     </div>\n");
      out.write("                    <div>\n");
      out.write("                        <table class=\"table-responsive\" border=\"1\">\n");
      out.write("                            <tr>\n");
      out.write("                                <th>Committee ID</th>\n");
      out.write("                                <th>Staff Name</th>\n");
      out.write("                                <th>Conference</th>\n");
      out.write("                                <th>Role</th>\n");
      out.write("                                <th>Action</th>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                            ");

                                PreparedStatement preparedStatement = con.prepareStatement("select c.c_id,e.staff_name,f.title,c.role from committee_list c,staff_list e,conference f where c.staff_id = e.staff_id and f.conf_id = c.conf_id ");
                                ResultSet resultset = preparedStatement.executeQuery();
                                while(resultset.next())
                                {
                            
      out.write("<td>");
      out.print( resultset.getString("c.c_id") );
      out.write("</td>");

                                
      out.write("<td>");
      out.print( resultset.getString("e.staff_name") );
      out.write("</td>");

                                    
      out.write("<td>");
      out.print( resultset.getString("f.title") );
      out.write("</td>");

                                        
      out.write("<td>");
      out.print( resultset.getString("c.role") );
      out.write("</td>");

                                        
      out.write("<td><a href=\"convenor_edit.jsp?update=");
      out.print( resultset.getString("c.c_id") );
      out.write("&&msg=edit\">Edit</a> | <a href=\"convenor_edit.jsp?update=");
      out.print( resultset.getString("c.c_id") );
      out.write("&&msg=delete\">Delete</a></td>");

                                     
                                }
                            
      out.write("\n");
      out.write("                            </tr>\n");
      out.write("                        </table>\n");
      out.write("                    </div>\n");
      out.write("                 </div>\n");
      out.write("\n");
      out.write("         </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("<script>\n");
      out.write("    $(document).ready(function () {\n");
      out.write("        $(\"#stream_id\").on(\"change\", function () {\n");
      out.write("            var stream_id = $(\"#stream_id\").val();//id of country select box of index.jsp page;\n");
      out.write("                $.ajax({\n");
      out.write("                    url: \"staffview.jsp\",//your jsp page name\n");
      out.write("                    data: {stream_id: stream_id},//sending request to state.jsp page.\n");
      out.write("                    method: \"POST\",//HTTP method.\n");
      out.write("                    success: function (data)\n");
      out.write("                    {\n");
      out.write("                        $(\"#staff_id\").html(data);//output or response will display in state select box.\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("        });\n");
      out.write("    });\n");
      out.write("</script>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
