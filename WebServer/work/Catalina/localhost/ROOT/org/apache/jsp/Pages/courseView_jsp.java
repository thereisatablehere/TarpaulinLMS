/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.20
 * Generated at: 2024-05-07 00:08:24 UTC
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
import java.util.*;

public final class courseView_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/Pages/../DBconnection.jsp", Long.valueOf(1714355833908L));
    _jspx_dependants.put("/Pages/../userAuth.jsp", Long.valueOf(1714356775659L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(6);
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("java.util");
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



try {
    int userCheck = (int) session.getAttribute("userType");
    
    if(userCheck != 1 && userCheck != 2) {
        response.sendRedirect("index.jsp");
    }
}
catch(Exception E) {
    response.sendRedirect("index.jsp");
}


// create a hiddent p element that can be used by headerLoggedIn.js to get the user's username
String usernameForHeader = "You";

try{
    usernameForHeader = (String) session.getAttribute("username");
}
catch(Exception E) {
    usernameForHeader = "You";
}

      out.write("\n");
      out.write("<p id=\"usernameForHeader\" style=\"display: none;\">");
      out.print(usernameForHeader);
      out.write("</p>");
      out.write('\n');
      out.write('\n');
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

String username = "";

try{
    username = (String) session.getAttribute("username");
}
catch(Exception E) {
    username = "";
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
      out.write("  <!-- hiden at first, and only shown from courseViewNav.ja incase it has to load a tab -->\n");
      out.write("  <body class=\"instructorHomeBody\" style=\"display: none;\">\n");
      out.write("    <script src=\"../Scripts/headerLoggedIn.js\"></script>\n");
      out.write("\n");
      out.write("    <script src=\"../Scripts/loadSidebar.js\"></script>\n");
      out.write("\n");
      out.write("    <section class=\"mainContainer courseView\">\n");
      out.write("\n");
      out.write("        ");

        String courseId = "";
        
        try {
            courseId = (String) session.getAttribute("courseId");
        }
        catch(Exception E) {
            out.println(E);
        }
        
      out.write("\n");
      out.write("\n");
      out.write("        ");

        boolean loadBackToSearch = false;

        try {
            loadBackToSearch = Boolean.parseBoolean((String) session.getAttribute("loadBackToSearch"));
        }
        catch(Exception E) {
            out.println(E);
        }

        if(loadBackToSearch) {
        
      out.write("\n");
      out.write("            <button class=\"buttonAccent\" \n");
      out.write("            style=\"display: flex; align-self: center;\" \n");
      out.write("            onclick=\"window.open('courseSearchResults.jsp', '_self')\">\n");
      out.write("                Back to search\n");
      out.write("            </button>\n");
      out.write("        ");

        }
        
      out.write("\n");
      out.write("        \n");
      out.write("        <p id=\"courseTitle\" class=\"title\">");
      out.print(courseId);
      out.write("</p>\n");
      out.write("\n");
      out.write("        <nav id=\"nav\">\n");
      out.write("            <p onclick=\"changeTab(this)\" style=\"font-weight: bold;\">Overview</p>\n");
      out.write("            <p onclick=\"changeTab(this)\">Lectures</p>\n");
      out.write("            <p onclick=\"changeTab(this)\">Tests</p>\n");
      out.write("            <!--\n");
      out.write("            <p onclick=\"changeTab(this)\">Q Board</p>\n");
      out.write("            -->\n");
      out.write("            <p onclick=\"changeTab(this)\">Comments</p>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <div id=\"overview\" class=\"tab\">\n");
      out.write("\n");
      out.write("            <div class=\"topInfo\">\n");
      out.write("                <!-- not yet implemented, but maybe do so later if enought time and want to -->\n");
      out.write("                ");
  
                String query = "SELECT * FROM TARP_ENROLLS where course_id = ? AND username = ?";
                PreparedStatement prepStmt1 = con.prepareStatement(query);
                prepStmt1.clearParameters();
                prepStmt1.setString(1, courseId);
                prepStmt1.setString(2, username);
                
                ResultSet result1 = prepStmt1.executeQuery();
                if (!result1.next()){
      out.write("\n");
      out.write("                    <button id=\"join\" class=\"buttonNormal\" onclick='window.open(\"enrollAction.jsp\", \"_self\")'>Enroll</button>\n");
      out.write("                ");
}
                else{
      out.write("\n");
      out.write("                    <button id=\"join\" class=\"buttonNormal\">Enrolled</button>\n");
      out.write("                ");
}

                result1.close();
                prepStmt1.close();
                
      out.write("\n");
      out.write("                \n");
      out.write("                <button id=\"join\" class=\"buttonAccent\" onclick='window.open(\"courseGrades.jsp\", \"_self\")'>View Grades</button>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"topInfo\">\n");
      out.write("\n");
      out.write("                ");

                String instructor = "instructor";

                String queryString = 
                "SELECT username" + "\n" + 
                "FROM TARP_COURSE" + "\n" + 
                "WHERE course_id='" + courseId + "'";
                
                PreparedStatement preparedStmt = con.prepareStatement(queryString);

                ResultSet result = preparedStmt.executeQuery();

                while(result.next()) {
                    instructor = result.getString(1);
                    break;
                }

                result.close();
                preparedStmt.close();

                session.setAttribute("instructor", instructor);
                
      out.write("\n");
      out.write("\n");
      out.write("                <div style=\"margin-left: -0.5em;\">\n");
      out.write("                    <p>Taught by</p>\n");
      out.write("                    <p class=\"instructor\" onclick='window.open(\"instructorPage.jsp\", \"_self\")'>");
      out.print(instructor);
      out.write("</p>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                <!-- get rating of instructor - copied from instructorPage.jsp -->\n");
      out.write("                <div>\n");
      out.write("                    ");

                    String rating = "";

                    queryString = 
                    "SELECT instructor_score" + "\n" + 
                    "FROM TARP_RATES" + "\n" + 
                    "WHERE i_username='" + instructor + "'";
                    
                    preparedStmt = con.prepareStatement(queryString);

                    result = preparedStmt.executeQuery();

                    ArrayList<Integer> ratings = new ArrayList<Integer>();
                    int ratingsSum = 0;

                    while(result.next()) {
                        int currentRating = Integer.parseInt(result.getString(1));
                        ratingsSum += currentRating;

                        ratings.add(currentRating);
                    }

                    result.close();
                    preparedStmt.close();

                    String ratingToDisplay = "No Ratings";

                    if(ratings.size() > 0) {
                        // calculate average rating
                        double avgRating = ratingsSum / ((double) ratings.size());
                        avgRating /= 2;
                        // round to 2 decimal ppoints
                        avgRating = Math.round(avgRating * 100.0) / 100.0;

                        ratingToDisplay = "(" + String.valueOf(avgRating) + ")";

                        for(int i = 0; i < Math.floor(avgRating); i++) {
                    
      out.write("\n");
      out.write("                            <img draggable=\"false\" class=\"star\" src=\"../Images/star-full.svg\">\n");
      out.write("                    ");

                        }
                    }
                    
      out.write("\n");
      out.write("                    \n");
      out.write("                    <p>");
      out.print(ratingToDisplay);
      out.write("</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"description\">\n");
      out.write("                <p>Description</p>\n");
      out.write("\n");
      out.write("                <!-- TODO -->\n");
      out.write("                ");
 
                String c_description = "";

                String query2 = 
                "SELECT descrip" + "\n" + 
                "FROM TARP_COURSE" + "\n" + 
                "WHERE course_id='" + courseId + "'";
                
                PreparedStatement preparedStmt2 = con.prepareStatement(query2);

                ResultSet result2 = preparedStmt2.executeQuery();

                while(result2.next()) {
                    c_description = result2.getString(1);
                    break;
                }

                result2.close();
                preparedStmt2.close();
                
      out.write("\n");
      out.write("                <p>");
      out.print(c_description);
      out.write("</p>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div id=\"lectures\" class=\"tab\">\n");
      out.write("\n");
      out.write("            <div class=\"todo\">\n");
      out.write("                ");

                int u_lectures = 0;
                
                String tot_lects = 
                "(SELECT course_id, lecture_id" + "\n" + 
                "FROM View_All_Lectures" + "\n" + 
                "WHERE course_id='" + courseId + "')" + 
                "MINUS" + 
                "(SELECT course_id, lecture_id" + "\n" + 
                "FROM TARP_WATCHES" + "\n" + 
                "WHERE course_id='" + courseId + "' AND username='" + username + "')"  
                ;
                
                PreparedStatement tot_lect_stmt = con.prepareStatement(tot_lects);
                
                ResultSet res_tot_lect = tot_lect_stmt.executeQuery();
                
                while(res_tot_lect.next()) { 
      out.write("\n");
      out.write("                    <form class=\"course\" action=\"setLectureIdSessionAttribute_action.jsp\" method=\"post\" style=\"order: 5;\">\n");
      out.write("                        <input type=\"text\" name=\"lectureId\" value=");
      out.print("\"" + res_tot_lect.getString(2) + "\"");
      out.write(" style=\"display: none;\">\n");
      out.write("                        <input type=\"text\" name=\"courseId\" value=");
      out.print(courseId);
      out.write(" style=\"display: none;\">\n");
      out.write("\n");
      out.write("                            <div class=\"lectureContainer\"style=\"order: 5;\">\n");
      out.write("                                <button class=\"goToLecture\" type=\"submit\">");
      out.print(res_tot_lect.getString(2));
      out.write("</button>\n");
      out.write("                            </div>\n");
      out.write("                    </form>\n");
      out.write("                    ");
  u_lectures++;
                }

                if(u_lectures == 1) {
                
      out.write("\n");
      out.write("                    <p class=\"bigDescription\" style=\"margin-bottom: 1em; font-weight: bold;order: 1;\">");
      out.print(u_lectures);
      out.write(" Unfinished Lecture</p>\n");
      out.write("                ");

                }
                else {
                
      out.write("\n");
      out.write("                    <p class=\"bigDescription\" style=\"margin-bottom: 1em; font-weight: bold;order: 1;\">");
      out.print(u_lectures);
      out.write(" Unfinished Lectures</p>\n");
      out.write("                ");

                }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"finished\">\n");
      out.write("                ");

                int c_lectures = 0;
                
                String c_lects = 
                "SELECT course_id, lecture_id" + "\n" + 
                "FROM TARP_WATCHES" + "\n" + 
                "WHERE course_id='" + courseId + "' AND username='" + username + "'"  
                ;
                
                PreparedStatement c_lect_stmt = con.prepareStatement(c_lects);
                
                ResultSet res_c_lect = c_lect_stmt.executeQuery();
                
                while(res_c_lect.next()) { 
      out.write("\n");
      out.write("                    <form class=\"course\" action=\"setLectureIdSessionAttribute_action.jsp\" method=\"post\" style=\"order: 5;\">\n");
      out.write("                        <input type=\"text\" name=\"lectureId\" value=");
      out.print("\"" + res_c_lect.getString(2) + "\"");
      out.write(" style=\"display: none;\">\n");
      out.write("                        <input type=\"text\" name=\"courseId\" value=");
      out.print(courseId);
      out.write(" style=\"display: none;\">\n");
      out.write("\n");
      out.write("                            <div class=\"lectureContainer\"style=\"order: 5;\">\n");
      out.write("                                <button class=\"goToLecture\" type=\"submit\">");
      out.print(res_c_lect.getString(2));
      out.write("</button>\n");
      out.write("                            </div>\n");
      out.write("                    </form>\n");
      out.write("                    ");
  c_lectures++;
                }
                
                if(c_lectures == 1) {
                
      out.write("\n");
      out.write("                    <p class=\"bigDescription\" style=\"margin-bottom: 1em; font-weight: bold;order: 1;\">");
      out.print(c_lectures);
      out.write(" Finished Lecture</p>\n");
      out.write("                ");

                }
                else {
                
      out.write("\n");
      out.write("                    <p class=\"bigDescription\" style=\"margin-bottom: 1em; font-weight: bold;order: 1;\">");
      out.print(c_lectures);
      out.write(" Finished Lectures</p>\n");
      out.write("                ");

                }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div id=\"tests\" class=\"tab\">\n");
      out.write("\n");
      out.write("            ");

            queryString = 
            "SELECT test_id, num_q" + "\n" + 
            "FROM TARP_TEST" + "\n" + 
            "WHERE course_id='" + courseId + "'";
            
            preparedStmt = con.prepareStatement(queryString);

            result = preparedStmt.executeQuery();

            boolean noTests = true;

            while(result.next()) {
                String testId = result.getString(1);

                // check to see if test has alrady been taken
                String queryStringInner = 
                "SELECT test_id, score" + "\n" + 
                "FROM TARP_TAKEN_BY" + "\n" + 
                "WHERE test_id='" + testId + "'" + " AND " + 
                    "course_id='" + courseId + "'" + " AND " + 
                    "username='" + username + "'";
                
                PreparedStatement preparedStmtInner = con.prepareStatement(queryStringInner);

                ResultSet resultInner = preparedStmtInner.executeQuery();

                boolean took = false;
                String score = "-1";

                boolean noQuestions = (result.getInt(2) == 0);
                int numQuestions = result.getInt(2);

                while(resultInner.next()) {
                    took = true;
                    score = resultInner.getString(2);

                    break;
                }

                resultInner.close();
                preparedStmtInner.close();

                if(!(noQuestions)) {
                    noTests = false;
            
      out.write("\n");
      out.write("\n");
      out.write("                    <form class=\"testContainer\" action=\"takeTest_action.jsp\" method=\"post\">\n");
      out.write("                        <input type=\"text\" name=\"testId\" value=");
      out.print("\"" + testId + "\"");
      out.write(" style=\"display: none;\">\n");
      out.write("                        \n");
      out.write("                        <p>");
      out.print(testId);
      out.write("</p>\n");
      out.write("                        <p>The description of the test would go here - not yet implemented.</p>\n");
      out.write("\n");
      out.write("                        <input type=\"text\" name=\"took\" value=");
      out.print(took);
      out.write(" style=\"display: none;\">\n");
      out.write("\n");
      out.write("                        ");

                        if(took) {
                        
      out.write("\n");
      out.write("                            <div>\n");
      out.write("                                <p class=\"takenText\">Completed!</p>\n");
      out.write("                                <p class=\"score\">Score: ");
      out.print(score);
      out.write("</p>\n");
      out.write("                                <p class=\"numQuestions\">Number of Questions: ");
      out.print(numQuestions);
      out.write("</p>\n");
      out.write("                            </div>\n");
      out.write("                        ");

                        }
                        else {
                        
      out.write("\n");
      out.write("                            <button tye=\"submit\" class=\"buttonNormal\">Start</button>\n");
      out.write("                        ");

                        }
                        
      out.write("\n");
      out.write("\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("            ");

                }
            }

            result.close();
            preparedStmt.close();

            if(noTests) {
            
      out.write("\n");
      out.write("                <p style=\"\n");
      out.write("                font-weight: bold;\n");
      out.write("                text-align: center;\n");
      out.write("                font-size: 1.25em;\n");
      out.write("                \">\n");
      out.write("                    This course does not have any tests.\n");
      out.write("                </p>\n");
      out.write("            ");

            }

            
      out.write("\n");
      out.write("\n");
      out.write("            <!--\n");
      out.write("            <div class=\"testContainer\">\n");
      out.write("                <p>Test Title</p>\n");
      out.write("                <p>This test is about something, and that is described right here.</p>\n");
      out.write("                <div>\n");
      out.write("                    <p>completed on</p>\n");
      out.write("                    <p>01/23/12 at 12:34pm</p>\n");
      out.write("                </div>\n");
      out.write("                <button class=\"buttonAccent\" onclick='window.open(\"testResults.jsp\", \"_self\")'>View Results</button>\n");
      out.write("            </div>\n");
      out.write("            -->\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!--\n");
      out.write("        <div id=\"q board\" class=\"tab\">\n");
      out.write("\n");
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
      out.write("        -->\n");
      out.write("\n");
      out.write("        <div id=\"comments\" class=\"tab\">\n");
      out.write("            ");

            Boolean postCommentFailed = false;

            try{
                postCommentFailed = Boolean.parseBoolean((String) session.getAttribute("failedToPostComment"));
            }
            catch(Exception E) {
                postCommentFailed = false;
            }

            if(postCommentFailed) {
                out.println("Failed to post comment");
                session.setAttribute("failedToPostComment", "false");
            }
            
      out.write("\n");
      out.write("\n");
      out.write("            <section id=\"commentsList\">\n");
      out.write("                ");
 
                String commentQuery = "SELECT s_username, s_comment, cdate FROM view_comments WHERE course_id = ? ORDER BY cdate DESC";
                PreparedStatement commentStmt = con.prepareStatement(commentQuery);
                commentStmt.setString(1, courseId);
                ResultSet commentsResultSet = commentStmt.executeQuery();

                boolean noComments = true;

                while (commentsResultSet.next()) {
                    noComments = false;

                    String commenter = commentsResultSet.getString("s_username");
                    String commentText = commentsResultSet.getString("s_comment");
                    Timestamp commentTime = commentsResultSet.getTimestamp("cdate");
                
      out.write("\n");
      out.write("                    <div class=\"questionContainer\">\n");
      out.write("                        <div>\n");
      out.write("                            ");

                            if(commenter.equals(instructor)) {
                            
      out.write("\n");
      out.write("                                <p class=\"instructor\">");
      out.print( commenter );
      out.write(" (instructor)</p>\n");
      out.write("                            ");

                            }
                            else {
                            
      out.write("\n");
      out.write("                                <p>");
      out.print( commenter );
      out.write("</p>\n");
      out.write("                            ");

                            }
                            
      out.write("\n");
      out.write("                            <p>");
      out.print( new java.text.SimpleDateFormat("MM/dd/yy 'at' HH:mm").format(commentTime) );
      out.write("</p>\n");
      out.write("                        </div>\n");
      out.write("                        \n");
      out.write("                        <p>");
      out.print( commentText );
      out.write("</p>\n");
      out.write("                    </div>\n");
      out.write("                ");

                }

                commentsResultSet.close();
                commentStmt.close();

                if(noComments) {
                
      out.write("\n");
      out.write("                    <p style=\"\n");
      out.write("                    font-weight: bold;\n");
      out.write("                    text-align: center;\n");
      out.write("                    font-size: 1.25em;\n");
      out.write("                    \">\n");
      out.write("                        This course does not have any comments.\n");
      out.write("                    </p>\n");
      out.write("                ");

                }
                
      out.write("\n");
      out.write("            </section>\n");
      out.write("\n");
      out.write("            <form id=\"postCommmentContainer\" action=\"sendComment_action.jsp\" method=\"post\">\n");
      out.write("                <input type=\"hidden\" name=\"courseId\" value=\"");
      out.print( courseId );
      out.write("\">\n");
      out.write("                \n");
      out.write("                <input type=\"text\" name=\"comment\" placeholder=\"Add a comment...\">\n");
      out.write("\n");
      out.write("                <button type=\"submit\">\n");
      out.write("                    <img src=\"../Images/send.svg\">\n");
      out.write("                </button>\n");
      out.write("            </form>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <script src=\"../Scripts/courseViewNav.js\"></script>\n");
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
