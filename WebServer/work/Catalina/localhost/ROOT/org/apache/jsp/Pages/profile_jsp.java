/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.20
 * Generated at: 2024-04-15 05:23:45 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.Pages;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.*;
import oracle.jdbc.*;
import java.sql.*;
import oracle.jdbc.*;

public final class profile_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/Pages/../DBconnection.jsp", Long.valueOf(1713153125447L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(5);
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_packages.add("oracle.jdbc");
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

      out.write('\n');
      out.write('\n');

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

      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("  <head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    \n");
      out.write("    <link rel=\"stylesheet\" href=\"../Styles/style.css\">\n");
      out.write("    <title>Tarpaulin - Your Joined Communities</title>\n");
      out.write("  </head>\n");
      out.write("  <body class=\"studentHomeBody\">\n");
      out.write("    <script src=\"../Scripts/userTypeLocalStorage.js\"></script>\n");
      out.write("    <script src=\"../Scripts/userTypeLocalStorageAuthPageCheck.js\"></script>\n");
      out.write("    <script src=\"../Scripts/headerLoggedIn.js\"></script>\n");
      out.write("\n");
      out.write("    <img class=\"openNavbar\" src=\"../Images/menu.svg\">\n");
      out.write("\n");
      out.write("    <script src=\"../Scripts/loadSidebar.js\"></script>\n");
      out.write("\n");
      out.write("    <form action=\"profile_action.jsp\" method=\"post\" class=\"mainContainer profile\">\n");
      out.write("        <div class=\"top\">\n");
      out.write("            <img draggable=\"false\" class=\"profileIcon\" src=\"../Images/user-solid-circle.svg\">\n");
      out.write("            <div>\n");
      out.write("                <p>Your Profile</p>\n");
      out.write("                <p>View or update your account information</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <section class=\"profileSettings\">\n");
      out.write("\n");
      out.write("            <div>\n");
      out.write("                <p>Username</p>\n");
      out.write("\n");
      out.write("                ");

                String username = "username";

                try{
                username = (String) session.getAttribute("username");
                }
                catch(Exception E) {
                username = "username";
                }
                
      out.write("\n");
      out.write("                <input name=\"username\" type=\"text\" placeholder=\"Username\" value=");
      out.print(username);
      out.write(">\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div>\n");
      out.write("                <p>First Name</p>\n");
      out.write("                \n");
      out.write("                ");

                String firstName = "firstName";

                try {
                    String from = "";

                    if(((int) session.getAttribute("userType")) == 1) {
                        from = "instructor";
                    }
                    else if(((int) session.getAttribute("userType")) == 2) {
                        from = "student";
                    }

                    String queryString = 
                        "SELECT F_NAME" + "\n" + 
                        "FROM TARP_" + from + "\n" + 
                        "WHERE USERNAME='" + username + "'";
                    
                    PreparedStatement preparedStmt = con.prepareStatement(queryString);

                    ResultSet result = preparedStmt.executeQuery();

                    while(result.next()) {
                        firstName = result.getString(1);
                        break;
                    }

                    result.close();
                    preparedStmt.close();
                }
                catch(Exception E) {
                    firstName = "exception";
                }
                
      out.write("\n");
      out.write("                <input name=\"fname\" type=\"text\" placeholder=\"First\" value=");
      out.print(firstName);
      out.write(">\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div>\n");
      out.write("                <p>Last Name</p>\n");
      out.write("\n");
      out.write("                ");

                String lastName = "lastName";

                try {
                    String from = "";

                    if(((int) session.getAttribute("userType")) == 1) {
                        from = "instructor";
                    }
                    else if(((int) session.getAttribute("userType")) == 2) {
                        from = "student";
                    }

                    String queryString = 
                        "SELECT L_NAME" + "\n" + 
                        "FROM TARP_" + from + "\n" + 
                        "WHERE USERNAME='" + username + "'";
                    
                    PreparedStatement preparedStmt = con.prepareStatement(queryString);

                    ResultSet result = preparedStmt.executeQuery();

                    while(result.next()) {
                        lastName = result.getString(1);
                        break;
                    }

                    result.close();
                    preparedStmt.close();
                }
                catch(Exception E) {
                    lastName = "exception";
                }
                
      out.write("\n");
      out.write("                <input name=\"lname\" type=\"text\" placeholder=\"Last\" value=");
      out.print(lastName);
      out.write(">\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div>\n");
      out.write("                <p>Password</p>\n");
      out.write("                <img class=\"passwordToggleIcon\" src=\"../Images/eye.png\" onclick=\"\n");
      out.write("                    let input = document.getElementById('password');\n");
      out.write("                    \n");
      out.write("                    if(input.type == 'password') {\n");
      out.write("                        this.src = '../Images/view.png';\n");
      out.write("                        input.type = 'text';\n");
      out.write("                    }\n");
      out.write("                    else{\n");
      out.write("                        this.src = '../Images/eye.png';\n");
      out.write("                        input.type = 'password';\n");
      out.write("                    }\n");
      out.write("                \">\n");
      out.write("\n");
      out.write("                ");

                String password = "password";

                try {
                    String from = "";

                    if(((int) session.getAttribute("userType")) == 1) {
                        from = "instructor";
                    }
                    else if(((int) session.getAttribute("userType")) == 2) {
                        from = "student";
                    }

                    String queryString = 
                        "SELECT PASSWORD" + "\n" + 
                        "FROM TARP_" + from + "\n" + 
                        "WHERE USERNAME='" + username + "'";
                    
                    PreparedStatement preparedStmt = con.prepareStatement(queryString);

                    ResultSet result = preparedStmt.executeQuery();

                    while(result.next()) {
                        password = result.getString(1);
                        break;
                    }

                    result.close();
                    preparedStmt.close();
                }
                catch(Exception E) {
                    password = "exception";
                }
                
      out.write("\n");
      out.write("                <input name=\"password\" type=\"password\" id=\"password\" placeholder=\"password\" value=");
      out.print(password);
      out.write(">\n");
      out.write("            </div>\n");
      out.write("	<button type=\"submit\">\n");
      out.write("		Update Profile\n");
      out.write("	</button>\n");
      out.write("        </section>\n");
      out.write("    </form>\n");
      out.write("\n");
      out.write("    <script src=\"../Scripts/navbarToggle.js\"></script>\n");
      out.write("\n");
      out.write("  </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
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
