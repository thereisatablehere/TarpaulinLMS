<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/style.css">
    <title>Tarpaulin - Instructor Home</title>
  </head>
  <body class="instructorHomeBody">
    <script src="../Scripts/userTypeLocalStorage.js"></script>
    <script src="../Scripts/userTypeLocalStorageAuthPageCheck.js"></script>
    <script src="../Scripts/header.js"></script>

    <section class="mainContainer">
        
        <div class="studentWelcome title">
            <p>Welcome back, </p>
            <p id="username">username</p>
            <p>!</p>
        </div>

        <button class="buttonAccent createCourseButton" onclick='window.open("createCourse.jsp", "_self")'>Create a Course</button>

        <section class="studentHomeMainContainer instructorMainContainer">

            <div class="listContainer">
    
              <p class="bigTitle">My Created Courses</p>
    
              <div class="list coursesList">
                <div class="instructorCoursePreview">
                    <p class="bigDescription">Sample Course</p>

                    <div class="rating">
                        <div>
                            <img draggable="false" class="star" src="../Images/star-full.svg">
                            <img draggable="false" class="star" src="../Images/star-full.svg">
                            <img draggable="false" class="star" src="../Images/star-full.svg">
                            <img draggable="false" class="star" src="../Images/star-full.svg">
                            <img class="emptyStar" src="../Images/star-full.svg">
                        </div>
                        <p>(4.5)</p>
                    </div>

                    <div class="students">
                        <p>123</p>
                        <p>students</p>
                    </div>

                    <div class="controls">
                        <a href="courseView.jsp">View</a>
                        <a href="editCourse.jsp">Edit</a>
                        <a href="instructorHome.jsp">QBoard</a>
                        <a class="delete">Delete</a>
                    </div>
                </div>

                <div class="instructorCoursePreview">
                    <p class="bigDescription">Terrible Course</p>

                    <div class="rating">
                        <div>
                            <img draggable="false" class="star" src="../Images/star-full.svg">
                            <img draggable="false" class="star" src="../Images/star-full.svg">
                            <img class="emptyStar" src="../Images/star-full.svg">
                            <img class="emptyStar" src="../Images/star-full.svg">
                            <img class="emptyStar" src="../Images/star-full.svg">
                        </div>
                        <p>(2.1)</p>
                    </div>

                    <div class="students">
                        <p>12</p>
                        <p>students</p>
                    </div>

                    <div class="controls">
                        <a href="courseView.jsp">View</a>
                        <a href="editCourse.jsp">Edit</a>
                        <a href="instructorHome.jsp">QBoard</a>
                        <a class="delete">Delete</a>
                    </div>
                </div>

                <div class="instructorCoursePreview">
                    <p class="bigDescription">Average Course</p>

                    <div class="rating">
                        <div>
                            <img draggable="false" class="star" src="../Images/star-full.svg">
                            <img draggable="false" class="star" src="../Images/star-full.svg">
                            <img draggable="false" class="star" src="../Images/star-full.svg">
                            <img class="emptyStar" src="../Images/star-full.svg">
                            <img class="emptyStar" src="../Images/star-full.svg">
                        </div>
                        <p>(3.0)</p>
                    </div>

                    <div class="students">
                        <p>543</p>
                        <p>students</p>
                    </div>

                    <div class="controls">
                        <a href="courseView.jsp">View</a>
                        <a href="editCourse.jsp">Edit</a>
                        <a href="instructorHome.jsp">QBoard</a>
                        <a class="delete">Delete</a>
                    </div>
                </div>
                
              </div>
    
            </div>
    
          </section>
        
    </section>

    <script src="../Scripts/loadInstructorHome.js"></script>
  </body>
</html>