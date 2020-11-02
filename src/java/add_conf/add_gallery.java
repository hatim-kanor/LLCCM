package add_conf;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@WebServlet(name="add_gallery",urlPatterns = {"/add_gallery"})
@MultipartConfig(maxFileSize = 1073741824 )
public class add_gallery extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String internal_msg = "";
                String conf_id = request.getParameter("conf_id");
                 InputStream is1,is2,is3,is4,is5,is6,is7,is8,is9,is10;
            int result = 0,r2=0,r3=0,r4=0,r5=0,r6=0,r7=0,r8=0,r9=0,r10=0;
            Connection con = dbconnection.DbConnection.getConnection();
           Part img1 = request.getPart("gallery_1");
           Part img2 = request.getPart("gallery_2");
           Part img3 = request.getPart("gallery_3");
           Part img4 = request.getPart("gallery_4");
           Part img5 = request.getPart("gallery_5");
           
           PreparedStatement p = con.prepareStatement("select * from gallery where conf_id = " + conf_id);
           ResultSet r = p.executeQuery();
           if(r.next())
           {
               response.sendRedirect("add_gallery.jsp?msg=dup");
               
           }
           else
           {
           if(img1 !=null || img2 !=null || img3 !=null ||img4 !=null ||img5 !=null )
           {
//               
                if(img1!=null)
                {
                        PreparedStatement pst = con.prepareStatement("insert into gallery(conf_id,img1) values(?,?)");
                        pst.setString(1, conf_id);
                        is1 = img1.getInputStream();
                        pst.setBlob(2, is1);

                        result = pst.executeUpdate();
                        if(result > 0)
                        {
                            internal_msg = "OK";
                        }
                }       
                        if(result > 0 && internal_msg.equals("OK"))
                        {
                            PreparedStatement p2 = con.prepareStatement("insert into gallery(conf_id,img1) values(?,?)");
                            p2.setString(1,conf_id);
                            is2 = img2.getInputStream();
                            p2.setBlob(2, is2);
                            r2 = p2.executeUpdate();
                        }
               
                   if(r2 > 0)
                   {
                       PreparedStatement p3 = con.prepareStatement("insert into gallery(conf_id,img1) values(?,?)");
                       p3.setString(1,conf_id);
                       is3 = img3.getInputStream();
                       p3.setBlob(2, is3);
                       r3 = p3.executeUpdate();
                       if(r3 > 0 )
                       {
                           PreparedStatement p4 = con.prepareStatement("insert into gallery(conf_id,img1) values(?,?)");
                           p4.setString(1,conf_id);
                           is4 = img4.getInputStream();
                           p4.setBlob(2, is4);
                           r4 = p4.executeUpdate();
                           if(r4 > 0)
                           {
                               PreparedStatement p5 = con.prepareStatement("insert into gallery(conf_id,img1) values(?,?)");
                               p5.setString(1,conf_id);
                               is5 = img5.getInputStream();
                               p5.setBlob(2, is5);
                               r5 = p5.executeUpdate();
                               if(r5 > 0 )
                               {
                                   response.sendRedirect("add_gallery.jsp?msg=success");
                               }
                           }
                           
                       }
                   }
                  // response.sendRedirect("add_gallery.jsp?msg=success");
               }
               else
               {
                   response.sendRedirect("add_gallery.jsp?msg=fail");
               }
           }
                
            } catch (Exception e) {
                out.println(e);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
