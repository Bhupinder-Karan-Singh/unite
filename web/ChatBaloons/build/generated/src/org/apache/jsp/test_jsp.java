package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class test_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <style>\n");
      out.write("            div.baloon_top1\n");
      out.write("            {\n");
      out.write("                overflow:hidden;\n");
      out.write("                width:254px;\n");
      out.write("                background:url(images/orange_bal_top.gif) no-repeat 0 0;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            div.baloon_bottom1\n");
      out.write("            {\n");
      out.write("                overflow:hidden;\n");
      out.write("                width:254px;\n");
      out.write("                background:url(images/orange_bal_bottom.gif) no-repeat 100% 100%;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("            div.baloon1\n");
      out.write("            {\n");
      out.write("                overflow:hidden;\n");
      out.write("                width:254px;\n");
      out.write("                background:url(images/orange_bal_center.gif) repeat-y 100% 0;\n");
      out.write("\n");
      out.write("            }\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            div.baloon_top2\n");
      out.write("            {\n");
      out.write("                overflow:hidden;\n");
      out.write("                width:254px;\n");
      out.write("                background:url(images/green_bal_top.gif) no-repeat 0 0;\n");
      out.write("            }\n");
      out.write("            div.baloon_bottom2\n");
      out.write("            {\n");
      out.write("                overflow:hidden;\n");
      out.write("                width:254px;\n");
      out.write("                background:url(images/green_bal_bottom.gif) no-repeat 0 100%;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            div.baloon2\n");
      out.write("            {\n");
      out.write("                overflow:hidden;\n");
      out.write("                width:254px;\n");
      out.write("                background:url(images/green_bal_center.gif) repeat-y 0 100%;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("    <center>\n");
      out.write("        <div style=\"border: 2px solid green; width: 540px; height: 400px; overflow: auto; padding: 10px;\">\n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("                    <td></td>\n");
      out.write("                    <td>\n");
      out.write("                        <div class=\"baloon2\">\n");
      out.write("                            <div class=\"baloon_top2\">\n");
      out.write("                                <div class=\"baloon_bottom2\">\n");
      out.write("                                    <p style=\"padding-right: 20px; padding-left: 10px; text-align: justify;\">Hello !!</p>\n");
      out.write("                                    <p style=\"padding-right: 20px; padding-left: 10px; color: white;\">25 Aug 2015 12:46 PM</p>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </td>\n");
      out.write("                    \n");
      out.write("                </tr>\n");
      out.write("                 <tr>\n");
      out.write("                    <td>\n");
      out.write("                        <div class=\"baloon1\">\n");
      out.write("                            <div class=\"baloon_top1\">\n");
      out.write("                                <div class=\"baloon_bottom1\">\n");
      out.write("                                    <p style=\"padding-right: 10px; padding-left: 20px; text-align: justify;\">Hi !!</p>\n");
      out.write("                                    <p style=\"padding-right: 10px; padding-left: 20px; color: white;\">25 Aug 2015 12:46 PM</p>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </td>\n");
      out.write("                     <td></td>\n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        <div class=\"baloon1\">\n");
      out.write("                            <div class=\"baloon_top1\">\n");
      out.write("                                <div class=\"baloon_bottom1\">\n");
      out.write("                                    <p style=\"padding-right: 10px; padding-left: 20px; text-align: justify;\">Where are you now ?</p>\n");
      out.write("                                    <p style=\"padding-right: 10px; padding-left: 20px; color: white;\">25 Aug 2015 12:46 PM</p>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </td>\n");
      out.write("                     <td></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td></td>\n");
      out.write("                    <td>\n");
      out.write("                        <div class=\"baloon2\">\n");
      out.write("                            <div class=\"baloon_top2\">\n");
      out.write("                                <div class=\"baloon_bottom2\">\n");
      out.write("                                    <p style=\"padding-right: 20px; padding-left: 10px; text-align: justify;\">I am at home. you tell me what is going on ?</p>\n");
      out.write("                                    <p style=\"padding-right: 20px; padding-left: 10px; color: white;\">25 Aug 2015 12:46 PM</p>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </td>\n");
      out.write("                    \n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td></td>\n");
      out.write("                    <td>\n");
      out.write("                        <div class=\"baloon2\">\n");
      out.write("                            <div class=\"baloon_top2\">\n");
      out.write("                                <div class=\"baloon_bottom2\">\n");
      out.write("                                    <p style=\"padding-right: 20px; padding-left: 10px; text-align: justify;\">Hello students, this is parwinder.</p>\n");
      out.write("                                    <p style=\"padding-right: 20px; padding-left: 10px; color: white;\">25 Aug 2015 12:46 PM</p>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </td>\n");
      out.write("                    \n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("    </center>\n");
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
