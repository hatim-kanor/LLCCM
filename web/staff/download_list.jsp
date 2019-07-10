
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="javax.swing.JFileChooser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.swing.JOptionPane" %>
<%@page import="com.itextpdf.text.*,java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Download List</title>

    </head>
    <body>
        <%
            Connection con = dbconnection.DbConnection.getConnection();
             Date d = new Date();
            String c_year = new SimpleDateFormat("yyyy-MM-dd").format(d);
           
        %>

        <%
            try{
                
                String file_path = "";
            String conf_id = request.getParameter("c");
            String type = request.getParameter("d");
            String title = request.getParameter("t");
            if(conf_id!=null || type!=null)
            {
                if(type.equals("p"))
                {
                    PreparedStatement ps = con.prepareStatement("select c.title,c.conf_id,r.reg_id,r.uname,r.contact,p.p_type,r.designation,pa.amount,r.payment_status,r.user_status from payment_amount pa,payment p,registration r,conference c where c.conf_date = '"+c_year+"' and c.conf_id=r.conf_id and p.payment_id = r.payment_id and pa.id = r.pa_id group by r.user_status asc");
                    
                    ResultSet rst = ps.executeQuery();
                    response.setContentType("application/pdf");
                    OutputStream outStream = response.getOutputStream();
                    
                        Document Mydocument = new Document();
                        PdfWriter writer = PdfWriter.getInstance(Mydocument, outStream);
                        Mydocument.open();
                        PdfPTable table = new PdfPTable(9);
                          float[] columnWidths = new float[]{3,3,7,5,3,4,4,4,4};
                        table.setWidths(columnWidths);
                         table.setWidthPercentage(100);
                         
                         PdfPTable table2 = new PdfPTable(1);
                          float[] columnWidths2 = new float[]{20};
                        table2.setWidths(columnWidths2);
                         table2.setWidthPercentage(100);

                       table2.addCell(new PdfPCell(new Paragraph("                              LALA LAJPATRAI COLLEGE OF COMMERCE AND ECONOMICS \n                                                      CONFERENCE ATTENDANCE LIST \n                                                                                  \n                                                              TITLE: " + title.toUpperCase() ,FontFactory.getFont(FontFactory.TIMES_BOLD,12,Font.NORMAL))));
                        
                        
                        table.addCell(new PdfPCell(new Paragraph("REG_ID",FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph("CONF_ID",FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph("NAME",FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph("CONTACT",FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph("DESIG",FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph("PAYMENT_TYPE",FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph("AMOUNT",FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph("PAYMENT_STATUS",FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph("STATUS",FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        
                        while(rst.next())
                        {
                             table.addCell(new PdfPCell(new Paragraph(rst.getString("r.reg_id"),FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph(rst.getString("c.conf_id"),FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));          
                        table.addCell(new PdfPCell(new Paragraph(rst.getString("r.uname"),FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph(rst.getString("r.contact"),FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph(rst.getString("r.designation"),FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph(rst.getString("p.p_type"),FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph(rst.getString("pa.amount"),FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph(rst.getString("r.payment_status"),FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        table.addCell(new PdfPCell(new Paragraph(rst.getString("r.user_status"),FontFactory.getFont(FontFactory.TIMES_BOLD,10,Font.NORMAL))));
                        
                        }
                        Mydocument.add(table2);
                        Mydocument.add(table);
                        
                        Mydocument.close();
                        
                    
                    
                }
                
            }
            }catch(Exception e)
            {
                out.println(e);
            }

        %>
    </body>
</html>
