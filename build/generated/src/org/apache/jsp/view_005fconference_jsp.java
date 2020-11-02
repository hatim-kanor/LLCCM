package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class view_005fconference_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/cssfile.jsp");
    _jspx_dependants.add("/header.jsp");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Conference</title>\n");
      out.write("          ");
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
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("       \n");
      out.write("   \n");
      out.write("        <title>Header</title>\n");
      out.write("         ");
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
      out.write("    \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("    \n");
      out.write("        <div class=\"container-fluid\" style=\"text-align: center;padding:20px;\">\n");
      out.write("           \n");
      out.write("              \n");
      out.write("            <span style=\"font-weight: bold;font-size:20px;margin-top:70px;\"><img src=\"images/logo.png\" height=\"70\" width=\"70\">LALA LAJPATRAI COLLEGE OF COMMERCE AND ECONOMICS -- CONFERENCE MANAGEMENT SYSTEM </span>\n");
      out.write("            \n");
      out.write("                </div>\n");
      out.write("        <div class=\"navbar\">\n");
      out.write("            \n");
      out.write("            <div class=\"container\">\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                    \n");
      out.write("              \n");
      out.write("                    \n");
      out.write("                    <button class=\"navbar-toggle\"  data-toggle=\"collapse\" data-target=\".navHeaderCollapse\">\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                    </button>\n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                    \n");
      out.write("                    <div class=\"collapse navbar-collapse navHeaderCollapse\">\n");
      out.write("                        \n");
      out.write("                        <ul class=\"nav navbar-nav\">\n");
      out.write("                            \n");
      out.write("                            <li><a href=\"index.jsp\" class=\"active\" >HOME</a></li>\n");
      out.write("                            <li><a href=\"aboutus.jsp\" >ABOUT US</a></li>\n");
      out.write("                            <li><a href=\"blogs.jsp\" >PHOTO GALLERY</a></li>\n");
      out.write("                            <li><a href=\"contact.jsp\" >CONTACT US</a></li> \n");
      out.write("                            <li><a href=\"login.jsp\" >LOGIN</a></li> \n");
      out.write("                        </ul> <!--end of menu list -->\n");
      out.write("                    </div> <!--end of collapse menu bar -->\n");
      out.write("                <!--</div>--> <!--end of image brand div -->\n");
      out.write("            </div><!--end of container main -->\n");
      out.write("        </div><!--end of navigation -->\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("       ");

           String conf = request.getParameter("no");
           

       
               try{
                   String title ="";
               Connection con = dbconnection.DbConnection.getConnection();
               PreparedStatement ps = con.prepareStatement("select * from conference where conf_id = " + conf);
               ResultSet rs = ps.executeQuery();
               while(rs.next())
               {
                   title = rs.getString("title");
       
      out.write("<p >");
      out.print( title );
      out.write("</p>");

               }
               }catch(Exception e )
               {
                   out.println(e);
                   
               }
               out.println("");
               
      out.write('\n');

           
      out.write("\n");
      out.write("           \n");
      out.write("       \n");
      out.write("       </div>\n");
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
