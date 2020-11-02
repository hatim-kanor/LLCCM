package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public final class valedictory_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      out.write("        <title>Valedictory Members</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("                  \n");
      out.write("                   <form id=\"\" method=\"POST\" action=\"login\">\n");
      out.write("            <table>\n");
      out.write("                                           <tr> <td>Select Conference </td><td><select name=\"conf_id\" id=\"conf_id\">\n");
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
      out.write("                <tr>\n");
      out.write("                        <th>Name </th>\n");
      out.write("                        <td><input type=\"text\" name=\"c_username\" placeholder=\"Chief Guest Name\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>&nbsp;</td>\n");
      out.write("                        <td>&nbsp;</td>\n");
      out.write("                    </tr>\n");
      out.write("                   <tr>\n");
      out.write("                        <th>Designation </th>\n");
      out.write("                        <td><input type=\"text\" name=\"c_desig\" placeholder=\"Designation\">\n");
      out.write("                        </td>\n");
      out.write("                    </tr> <tr>\n");
      out.write("                        <td>&nbsp;</td>\n");
      out.write("                        <td>&nbsp;</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>College/University Name</th>\n");
      out.write("                        <td>\n");
      out.write("                            <input type=\"text\" name=\"c_clg\" placeholder=\"Chief Guest College/University\">\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                      </tr> <tr>\n");
      out.write("                        <td>&nbsp;</td>\n");
      out.write("                        <td>&nbsp;</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Key_Note Speaker </th>\n");
      out.write("                        <td><input type=\"text\" name=\"c_username\" placeholder=\"Key_Note Speaker\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>&nbsp;</td>\n");
      out.write("                        <td>&nbsp;</td>\n");
      out.write("                    </tr>\n");
      out.write("                   <tr>\n");
      out.write("                        <th>Designation </th>\n");
      out.write("                        <td><input type=\"text\" name=\"c_desig\" placeholder=\"Designation\">\n");
      out.write("                        </td>\n");
      out.write("                    </tr> <tr>\n");
      out.write("                        <td>&nbsp;</td>\n");
      out.write("                        <td>&nbsp;</td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>College/University Name</th>\n");
      out.write("                        <td>\n");
      out.write("                            <input type=\"text\" name=\"c_clg\" placeholder=\"Chief Guest College/University\">\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                      </tr> <tr>\n");
      out.write("                        <td>&nbsp;</td>\n");
      out.write("                        <td>&nbsp;</td>\n");
      out.write("                    </tr>\n");
      out.write("                    \n");
      out.write("                    <tr>\n");
      out.write("                        <td colspan=\"2\"><input type=\"submit\" value=\"Add Chief Guest\" id=\"user_login\"></td>\n");
      out.write("                        \n");
      out.write("                        </td>   \n");
      out.write("                    </tr>\n");
      out.write("            </table>\n");
      out.write("            \n");
      out.write("        </form>\n");
      out.write("\n");
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
