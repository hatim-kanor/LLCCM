package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;

public final class add_005fgallery_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Add Gallery</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            ");
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
      out.write("                     <a href=\"add_staff.jsp\">ADD & UPDATE STAFF</a><br>\n");
      out.write("                     <a href=\"logout.jsp\">Logout</a><br>\n");
      out.write("                     \n");
      out.write("                 </div>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("            <div class=\"col-md-8\" style=\"border:1px solid black\">\n");
      out.write("                     <p style=\"background-color: #0158B6;color: white;font-size: 20px;text-align: center;\">MAIN VIEW </p> <br><br>\n");
      out.write("                     <div >\n");
      out.write("                     ");

                             String uname = (String)session.getAttribute("username");
                             out.println("Welcome: " + uname);
                         
      out.write("\n");
      out.write("                         <div>\n");
      out.write("                             ");

                                 String msg = request.getParameter("status");
                                 if(msg!=null)
                                 {
                                 if(msg.equals("fail"))
                                 {
                                     
      out.write("<h2>Failed to Add Conference </h2>   \n");
      out.write("                                ");
 }
                                 else if(msg.equals("success"))
                                 {
                                      
      out.write("<h2>Successfully added Conference </h2>   \n");
      out.write("                                      ");
 }}
      out.write("\n");
      out.write("                                \n");
      out.write("                         </div>\n");
      out.write("                         <form action=\"\" method=\"POST\" enctype=\"multipart/form-data\">\n");
      out.write("                             <table>\n");
      out.write("                                 <caption><center>Add Photos</center></caption>\n");
      out.write("                                 <tr>\n");
      out.write("                                     <th>\n");
      out.write("                                         Select Conference\n");
      out.write("                                     </th>\n");
      out.write("                                     <td>\n");
      out.write("                                ");

                                    try{
                                    Connection con = dbconnection.DbConnection.getConnection();
                                    PreparedStatement ps = con.prepareStatement("select conf_id,title from conference");
                                    ResultSet rs = ps.executeQuery();
                                    while(rs.next())
                                    {
                                
      out.write("<select name=\"");
      out.print( rs.getString("conf_id") );
      out.write("\"><option value=\"");
      out.print( rs.getString("title") );
      out.write('"');
      out.write('>');
      out.print( rs.getString("title") );
      out.write("</option></select>");

                                    }
}catch(Exception e)
{
out.println(e);
}
                                
      out.write("         \n");
      out.write("                                     </td>\n");
      out.write("                                 </tr>\n");
      out.write("                                 <tr>\n");
      out.write("                                     <th>\n");
      out.write("                                         &nbsp;\n");
      out.write("                                     </th>\n");
      out.write("                                     <td>\n");
      out.write("                                         &nbsp;\n");
      out.write("                                     </td>\n");
      out.write("                                 </tr>\n");
      out.write("                                 <tr>\n");
      out.write("                                     <th>\n");
      out.write("                                         Photo 1\n");
      out.write("                                     </th>\n");
      out.write("                                     <td>\n");
      out.write("                                         <input type=\"file\" name=\"gallery_1\" />\n");
      out.write("                                     </td>\n");
      out.write("                                 </tr>\n");
      out.write("                                 <tr>\n");
      out.write("                                     <th>\n");
      out.write("                                         &nbsp;\n");
      out.write("                                     </th>\n");
      out.write("                                     <td>\n");
      out.write("                                         &nbsp;\n");
      out.write("                                     </td>\n");
      out.write("                                 </tr>\n");
      out.write("                                 <tr>\n");
      out.write("                                     <th>\n");
      out.write("                                         Photo 2\n");
      out.write("                                     </th>\n");
      out.write("                                     <td>\n");
      out.write("                                         <input type=\"file\" name=\"gallery_2\" />\n");
      out.write("                                     </td>\n");
      out.write("                                 </tr>\n");
      out.write("                                 <tr>\n");
      out.write("                                     <th>\n");
      out.write("                                         &nbsp;\n");
      out.write("                                     </th>\n");
      out.write("                                     <td>\n");
      out.write("                                         &nbsp;\n");
      out.write("                                     </td>\n");
      out.write("                                 </tr>\n");
      out.write("                                 <tr>\n");
      out.write("                                     <th>\n");
      out.write("                                         Photo 3\n");
      out.write("                                     </th>\n");
      out.write("                                     <td>\n");
      out.write("                                         <input type=\"file\" name=\"gallery_3\" />\n");
      out.write("                                     </td>\n");
      out.write("                                 </tr>\n");
      out.write("                                 <tr>\n");
      out.write("                                     <th>\n");
      out.write("                                         &nbsp;\n");
      out.write("                                     </th>\n");
      out.write("                                     <td>\n");
      out.write("                                         &nbsp;\n");
      out.write("                                     </td>\n");
      out.write("                                 </tr>\n");
      out.write("                                 <tr>\n");
      out.write("                                     <th>\n");
      out.write("                                         Photo 4\n");
      out.write("                                     </th>\n");
      out.write("                                     <td>\n");
      out.write("                                         <input type=\"file\" name=\"gallery_4\" />\n");
      out.write("                                     </td>\n");
      out.write("                                 </tr>\n");
      out.write("                                 <tr>\n");
      out.write("                                     <th>\n");
      out.write("                                         &nbsp;\n");
      out.write("                                     </th>\n");
      out.write("                                     <td>\n");
      out.write("                                         &nbsp;\n");
      out.write("                                     </td>\n");
      out.write("                                 </tr>\n");
      out.write("                                 <tr>\n");
      out.write("                                     <th>\n");
      out.write("                                         Photo 5\n");
      out.write("                                     </th>\n");
      out.write("                                     <td>\n");
      out.write("                                         <input type=\"file\" name=\"gallery 5\" />\n");
      out.write("                                     </td>\n");
      out.write("                                 </tr>\n");
      out.write("                                 <tr>\n");
      out.write("                                     <th>\n");
      out.write("                                         &nbsp;\n");
      out.write("                                     </th>\n");
      out.write("                                     <td>\n");
      out.write("                                         &nbsp;\n");
      out.write("                                     </td>\n");
      out.write("                                 </tr>\n");
      out.write("                                 <tr>\n");
      out.write("                                     <th colspan=\"2\">\n");
      out.write("                                         <input type=\"submit\" name=\"add_gallery\" value=\"Add Photos\">\n");
      out.write("                                     </th>\n");
      out.write("                                     \n");
      out.write("                                 </tr>\n");
      out.write("                             </table>  \n");
      out.write("                         </form>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
