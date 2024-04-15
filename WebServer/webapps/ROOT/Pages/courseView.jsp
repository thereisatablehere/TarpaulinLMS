<%@include file="../userAuth.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - View a Course</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="instructorHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <script src="../Scripts/loadSidebar.js"></script>

    <section class="mainContainer courseView">
        
        <p class="title">CSCI 101</p>

        <nav id="nav">
            <p onclick="changeTab(this)" style="font-weight: bold;">Overview</p>
            <p onclick="changeTab(this)">Lectures</p>
            <p onclick="changeTab(this)">Tests</p>
            <p onclick="changeTab(this)">Q Board</p>
            <p onclick="changeTab(this)">Comments</p>
        </nav>

        <div id="overview" class="tab">

            <div class="topInfo">
                <button id="join" class="buttonNormal">Unenroll</button>
                <button id="join" class="buttonAccent" onclick='window.open("courseGrades.jsp", "_self")'>View Grades</button>
            </div>

            <div class="topInfo">
                <p class="instructor" onclick='window.open("instructorPage.jsp", "_self")'>Professor Prof</p>
                <div>
                    <img draggable="false" class="star" src="../Images/star-full.svg">
                    <img draggable="false" class="star" src="../Images/star-full.svg">
                    <img draggable="false" class="star" src="../Images/star-full.svg">
                    
                    <p>(3.2)</p>
                </div>
            </div>

            <div class="description">
                <p>Description</p>
                <p>This is a very good coures. You should enroll.</p>
            </div>

        </div>

        <div id="lectures" class="tab">

            <div class="todo">
                <p class="bigDescription" style="margin-bottom: 1em; font-weight: bold;">3 Unfinished Lectures</p>

                <div class="lectureContainer">
                    <p>Data Types Part 3</p>
                    <div class="video">Video placeholder</div>
                </div>
    
                <div class="lectureContainer">
                    <p>Intro to Data Structures</p>
                    <div class="video">Video placeholder</div>
                </div>
    
                <div class="lectureContainer">
                    <p>Data Structures Part 2</p>
                    <div class="video">Video placeholder</div>
                </div>
            </div>

            <div class="finished">
                <p class="bigDescription" style="margin-bottom: 1em; font-weight: bold;">3 Completed Lectures</p>

                <div class="lectureContainer">
                    <p>Your First Program</p>
                    <div class="video">Video placeholder</div>
                </div>
    
                <div class="lectureContainer">
                    <p>Intro to Data Types</p>
                    <div class="video">Video placeholder</div>
                </div>
    
                <div class="lectureContainer">
                    <p>Data Types Part 2</p>
                    <div class="video">Video placeholder</div>
                </div>
            </div>


        </div>

        <div id="tests" class="tab">

            <div class="testContainer">
                <p>Test Title</p>
                <p>This test is about something, and that is described right here.</p>
                <button class="buttonNormal" onclick='window.open("test.jsp", "_self")'>Start</button>
            </div>

            <div class="testContainer">
                <p>Test Title</p>
                <p>This test is about something, and that is described right here.</p>
                <div>
                    <p>completed on</p>
                    <p>01/23/12 at 12:34pm</p>
                </div>
                <button class="buttonAccent" onclick='window.open("testResults.jsp", "_self")'>View Results</button>
            </div>

            <div class="testContainer">
                <p>Test Title</p>
                <p>This test is about something, and that is described right here.</p>
                <button class="buttonNormal" onclick='window.open("test.jsp", "_self")'>Start</button>
            </div>
            
        </div>

        <div id="q board" class="tab">

            <div class="questionContainer">
                <div>
                    <p>userName</p>
                    <p>at</p>
                    <p>1:23pm</p>
                </div>
                
                <p>This is a question a user can post.</p>
            </div>

            <div class="questionContainer">
                <div>
                    <p class="instructor">theProf (instructor)</p>
                    <p>at</p>
                    <p>5:00pm</p>
                </div>
                
                <p>Something else here.</p>
            </div>

            <div class="questionContainer">
                <div>
                    <p>userHere</p>
                    <p>at</p>
                    <p>7:00am</p>
                </div>
                
                <p>Is this a question?</p>
            </div>
            
        </div>

        <div id="comments" class="tab">
            <input type="text" placeholder="comment" style="
                width: 50%;
                padding: 10px;
                outline: none;
                border: 1px solid black;
                border-radius: 10px;
                font-size: 1em;
                margin-left: 10%;
            ">
            <button class="buttonAccent" style="font-size: 0.7em; margin: 0; margin-top: 0.5em; margin-bottom: 2em; margin-left: 10%;">Comment</button>

            <div class="questionContainer">
                <div>
                    <p class="instructor">Bruce The Prof (instructor)</p>
                    <p>01/22/24 at 2:30pm</p>
                </div>
                
                <p>Thanks for all of the feedback everyone!</p>
            </div>
            
            <div class="questionContainer">
                <div>
                    <p>userHere</p>
                    <p>01/21/24 at 1:23pm</p>
                </div>
                
                <p>Great course.</p>
            </div>

            <div class="questionContainer">
                <div>
                    <p>anotherUser</p>
                    <p>01/21/24 at 1:20pm</p>
                </div>
                
                <p>I learned a lot of usefull stuff.</p>
            </div>
            
        </div>
        
    </section>

    <script src="../Scripts/courseViewNav.js"></script>
  </body>
</html>