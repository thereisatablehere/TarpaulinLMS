/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.20
 * Generated at: 2024-04-17 19:01:51 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Pages;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;

public final class courseView_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/Pages/../userAuth.jsp", Long.valueOf(1713379526783L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


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



try {
    int userCheck = (int) session.getAttribute("userType");
    
    if(userCheck != 1 && userCheck != 2) {
        response.sendRedirect("index.jsp");
    }
}
catch(Exception E) {
    response.sendRedirect("index.jsp");
}

Connection con = null;

    try {
        Class.forName("oracle.jdbc.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@//cscioraclerh7srv.ad.csbsju.edu:1521/" +
                                                                "csci.cscioraclerh7srv.ad.csbsju.edu",
                                                                "TEAM06", "TEAM06");
    }
    catch(Exception E) {
        out.println("EXCEPTION encountered");
        out.println(E);
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    \n");
      out.write("    <link rel=\"stylesheet\" href=\"../Styles/styles.css\">\n");
      out.write("    <title>Tarpaulin - View a Course</title>\n");
      out.write("  <link rel=\"icon\" type=\"image/x-icon\" href=\"../Images/Tarpaulin_Logo_Alt_2.png\">\n");
      out.write("</head>\n");
      out.write("  <body class=\"instructorHomeBody\">\n");
      out.write("    <script src=\"../Scripts/headerLoggedIn.js\"></script>\n");
      out.write("\n");
      out.write("    <script src=\"../Scripts/loadSidebar.js\"></script>\n");
      out.write("\n");
      out.write("    <section class=\"mainContainer courseView\">\n");
      out.write("        \n");
      out.write("        <p class=\"title\">CSCI 101</p>\n");
      out.write("\n");
      out.write("        <nav id=\"nav\">\n");
      out.write("            <p onclick=\"changeTab(this)\" style=\"font-weight: bold;\">Overview</p>\n");
      out.write("            <p onclick=\"changeTab(this)\">Lectures</p>\n");
      out.write("            <p onclick=\"changeTab(this)\">Tests</p>\n");
      out.write("            <p onclick=\"changeTab(this)\">Q Board</p>\n");
      out.write("            <p onclick=\"changeTab(this)\">Comments</p>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <div id=\"overview\" class=\"tab\">\n");
      out.write("\n");
      out.write("            <div class=\"topInfo\">\n");
      out.write("                <button id=\"join\" class=\"buttonNormal\">Unenroll</button>\n");
      out.write("                <button id=\"join\" class=\"buttonAccent\" onclick='window.open(\"courseGrades.jsp\", \"_self\")'>View Grades</button>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"topInfo\">\n");
      out.write("                <p class=\"instructor\" onclick='window.open(\"instructorPage.jsp\", \"_self\")'>Professor Prof</p>\n");
      out.write("                <div>\n");
      out.write("                    <img draggable=\"false\" class=\"star\" src=\"../Images/star-full.svg\">\n");
      out.write("                    <img draggable=\"false\" class=\"star\" src=\"../Images/star-full.svg\">\n");
      out.write("                    <img draggable=\"false\" class=\"star\" src=\"../Images/star-full.svg\">\n");
      out.write("                    \n");
      out.write("                    <p>(3.2)</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"description\">\n");
      out.write("                <p>Description</p>\n");
      out.write("                <p>This is a very good coures. You should enroll.</p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div id=\"lectures\" class=\"tab\">\n");
      out.write("\n");
      out.write("            <div class=\"todo\">\n");
      out.write("                <p class=\"bigDescription\" style=\"margin-bottom: 1em; font-weight: bold;\">3 Unfinished Lectures</p>\n");
      out.write("\n");
      out.write("                <div class=\"lectureContainer\">\n");
      out.write("                    <p>Data Types Part 3</p>\n");
      out.write("                    <div class=\"video\">Video placeholder</div>\n");
      out.write("                </div>\n");
      out.write("    \n");
      out.write("                <div class=\"lectureContainer\">\n");
      out.write("                    <p>Intro to Data Structures</p>\n");
      out.write("                    <div class=\"video\">Video placeholder</div>\n");
      out.write("                </div>\n");
      out.write("    \n");
      out.write("                <div class=\"lectureContainer\">\n");
      out.write("                    <p>Data Structures Part 2</p>\n");
      out.write("                    <div class=\"video\">Video placeholder</div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"finished\">\n");
      out.write("                <p class=\"bigDescription\" style=\"margin-bottom: 1em; font-weight: bold;\">3 Completed Lectures</p>\n");
      out.write("\n");
      out.write("                <div class=\"lectureContainer\">\n");
      out.write("                    <p>Your First Program</p>\n");
      out.write("                    <div class=\"video\">Video placeholder</div>\n");
      out.write("                </div>\n");
      out.write("    \n");
      out.write("                <div class=\"lectureContainer\">\n");
      out.write("                    <p>Intro to Data Types</p>\n");
      out.write("                    <div class=\"video\">Video placeholder</div>\n");
      out.write("                </div>\n");
      out.write("    \n");
      out.write("                <div class=\"lectureContainer\">\n");
      out.write("                    <p>Data Types Part 2</p>\n");
      out.write("                    <div class=\"video\">Video placeholder</div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div id=\"tests\" class=\"tab\">\n");
      out.write("\n");
      out.write("            <div class=\"testContainer\">\n");
      out.write("                <p>Test Title</p>\n");
      out.write("                <p>This test is about something, and that is described right here.</p>\n");
      out.write("                <button class=\"buttonNormal\" onclick='window.open(\"test.jsp\", \"_self\")'>Start</button>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"testContainer\">\n");
      out.write("                <p>Test Title</p>\n");
      out.write("                <p>This test is about something, and that is described right here.</p>\n");
      out.write("                <div>\n");
      out.write("                    <p>completed on</p>\n");
      out.write("                    <p>01/23/12 at 12:34pm</p>\n");
      out.write("                </div>\n");
      out.write("                <button class=\"buttonAccent\" onclick='window.open(\"testResults.jsp\", \"_self\")'>View Results</button>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"testContainer\">\n");
      out.write("                <p>Test Title</p>\n");
      out.write("                <p>This test is about something, and that is described right here.</p>\n");
      out.write("                <button class=\"buttonNormal\" onclick='window.open(\"test.jsp\", \"_self\")'>Start</button>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("\n");
//      try {
//        String courseId = (String)session.getAttribute("courseId");
//        if (courseId == null) {
//          // Handle the case when courseId is not set
//          out.println("Course ID is not set.");
//        } else {
//          String sql = "SELECT * FROM view_comments WHERE course_id = ?";
//          PreparedStatement pstmt = con.prepareStatement(sql);
//          pstmt.setString(1, courseId);
//          ResultSet rs = pstmt.executeQuery();
//          
//          
//          
//          out.write("        <div id=\"q board\" class=\"tab\">\n");
//          out.write("\n");
//          
//          
//          while (rs.next()) {
//            // Retrieve comment details from the ResultSet
//            String username = rs.getString("s_username");
//            String comment = rs.getString("s_comment");
//            String cdate = rs.getString("cdate");
//            
//            out.write("            <div class=\"questionContainer\">\n");
//            out.write("  <div>");
//            out.write("    <p><%= username %></p>");
//            out.write("    <p>at <%= cdate %></p>");
//            out.write("    </div>");
//            out.write("    <p><%= comment %></p>");
//            out.write("    </div>");
//            out.write("    <% } %>");
//            out.write("                </div>\n");
//            
//          }
//        } catch (Exception e) {
//          // Handle any exceptions here
//          out.println("An error occurred: " + e.getMessage());
//        }
      }
      
      out.write("            <div class=\"questionContainer\">\n");
      out.write("                <div>\n");
      out.write("                    <p>userName</p>\n");
      out.write("                    <p>at</p>\n");
      out.write("                    <p>1:23pm</p>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <p>This is a question a user can post.</p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"questionContainer\">\n");
      out.write("                <div>\n");
      out.write("                    <p class=\"instructor\">theProf (instructor)</p>\n");
      out.write("                    <p>at</p>\n");
      out.write("                    <p>5:00pm</p>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <p>Something else here.</p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"questionContainer\">\n");
      out.write("                <div>\n");
      out.write("                    <p>userHere</p>\n");
      out.write("                    <p>at</p>\n");
      out.write("                    <p>7:00am</p>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <p>Is this a question?</p>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div id=\"comments\" class=\"tab\">\n");
      out.write("            <input type=\"text\" placeholder=\"comment\" style=\"\n");
      out.write("                width: 50%;\n");
      out.write("                padding: 10px;\n");
      out.write("                outline: none;\n");
      out.write("                border: 1px solid black;\n");
      out.write("                border-radius: 10px;\n");
      out.write("                font-size: 1em;\n");
      out.write("                margin-left: 10%;\n");
      out.write("            \">\n");
      out.write("            <button class=\"buttonAccent\" style=\"font-size: 0.7em; margin: 0; margin-top: 0.5em; margin-bottom: 2em; margin-left: 10%;\">Comment</button>\n");
      out.write("\n");
      out.write("            <div class=\"questionContainer\">\n");
      out.write("                <div>\n");
      out.write("                    <p class=\"instructor\">Bruce The Prof (instructor)</p>\n");
      out.write("                    <p>01/22/24 at 2:30pm</p>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <p>Thanks for all of the feedback everyone!</p>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"questionContainer\">\n");
      out.write("                <div>\n");
      out.write("                    <p>userHere</p>\n");
      out.write("                    <p>01/21/24 at 1:23pm</p>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <p>Great course.</p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"questionContainer\">\n");
      out.write("                <div>\n");
      out.write("                    <p>anotherUser</p>\n");
      out.write("                    <p>01/21/24 at 1:20pm</p>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <p>I learned a lot of usefull stuff.</p>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <wscript src=\"../Scripts/courseViewNav.js\"></script>\n");
      out.write("  </body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
