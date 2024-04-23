<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - Edit a Course</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body class="studentHomeBody">
    <script src="../Scripts/headerLoggedIn.js"></script>

    <script src="../Scripts/loadSidebar.js"></script>

    <section class="mainContainer courseEditContainer">
        <div class="top">
            <div style="margin-left: 0;">
                <p>Edit a Course</p>
                <p>Modify information and add or remove tests and lectures</p>
            </div>
        </div>

        <section class="editCourse">
            <%
            String courseId = "";
            
            try {
                courseId = (String) session.getAttribute("courseId");
            }
            catch(Exception E) {
                out.println(E);
            }
            %>

            <div class="nameContainer">
                <p><%=courseId%></p>
                
                <div class="inputContainer">
                    <input id="nameInput" type="text" placeholder="Name" value=<%="\"" + courseId + "\""%>>

                    <div id="nameControlsContainer" class="controls">
                        <button id="cancelName" class="buttonAccent">Cancel</button>
                        <button class="buttonNormal">Confirm</button>
                    </div>
                </div>
            </div>

            <div class="descriptionContainer">
                <p>Course Description</p>
                <input type="text" placeholder="Description" value="Learn cool computer stuff.">
            </div>

            <section class="leftRightContainer">
                <section class="lectures">
                    
                    <p class="header">Lectures</p>

                    <button id="openAddLectureControls" class="buttonAccent createButton" 
                        onclick='document.getElementById("addLectureControls").style.display="flex"
                        document.getElementById("openAddLectureControls").style.display="none"'
                        >Add Lecture</button>

                    <section id="addLectureControls" style="
                        display: flex;
                        flex-direction: column;
                        margin-top: 1em;
                        margin-bottom: 2em;
                        background-color: white;
                        padding: 10px;
                        padding-top: 25px;
                        padding-bottom: 15px;
                        border: 1px solid #00000050;
                        border-radius: 10px;
                        display: none;
                    ">
                        <div>
                            <p>Name</p>
                            <input type="text">
                        </div>

                        <div>
                            <p>URL</p>
                            <input type="text">
                        </div>

                        <button class="buttonAccent" style="
                            margin: 0;
                            margin-top: 2em;
                            align-self: center;
                        " onclick='document.getElementById("addLectureControls").style.display="none";
                        document.getElementById("openAddLectureControls").style.display="block"'
                        >Confirm</button>
                    </section>

                    <div style="
                        display: flex;
                        flex-direction: column;
                    ">
                        <p class=contentTitle>Your First Program</p>
                        
                        <div class="controls">
                            <button class="buttonNormal">Watch</button>
                            <button class="buttonNormal">Change</button>
                            <button class="buttonNormal">Delete</button>
                        </div>
                    </div>

                    <div style="
                        display: flex;
                        flex-direction: column;
                    ">
                        <p class=contentTitle>Intro to Data Types</p>
                        
                        <div class="controls">
                            <button class="buttonNormal">Watch</button>
                            <button class="buttonNormal">Change</button>
                            <button class="buttonNormal">Delete</button>
                        </div>
                    </div>

                    <div style="
                        display: flex;
                        flex-direction: column;
                    ">
                        <p class=contentTitle>Data Types Part 2</p>
                        
                        <div class="controls">
                            <button class="buttonNormal">Watch</button>
                            <button class="buttonNormal">Change</button>
                            <button class="buttonNormal">Delete</button>
                        </div>
                    </div>

                </section>

                <section class="tests">
                    
                    <p class="header">Tests</p>

                    <button class="buttonAccent createButton">Create Test</button>

                    <div style="
                        display: flex;
                        flex-direction: column;
                    ">
                        <p class=contentTitle>Test 1</p>
                        
                        <div class="controls">
                            <button class="buttonNormal">View</button>
                            <button class="buttonNormal">Edit</button>
                            <button class="buttonNormal">Delete</button>
                        </div>
                    </div>

                    <div style="
                        display: flex;
                        flex-direction: column;
                    ">
                        <p class=contentTitle>Test 1</p>
                        
                        <div class="controls">
                            <button class="buttonNormal">View</button>
                            <button class="buttonNormal">Edit</button>
                            <button class="buttonNormal">Delete</button>
                        </div>
                    </div>

                    <div style="
                        display: flex;
                        flex-direction: column;
                    ">
                        <p class=contentTitle>Test 1</p>
                        
                        <div class="controls">
                            <button class="buttonNormal">View</button>
                            <button class="buttonNormal">Edit</button>
                            <button class="buttonNormal">Delete</button>
                        </div>
                    </div>

                </section>
            </section>

        </section>
    </section>

    <script src="../Scripts/navbarToggle.js"></script>

    <script>
    let nameControls = document.getElementById("nameControlsContainer");
    let parent = nameControls.parentNode;
    
    let nameInput = document.getElementById("nameInput");
    let startingName = nameInput.value;
    nameInput.addEventListener("input", inputControlsToggleCheck);

    let resetName = false;
    document.getElementById("cancelName").addEventListener("click", function() {
        nameControls.style.marginBottom = "-2em";
        nameControls.style.marginRight = "0";
        nameControls.style.visibility = "1";

        op = 1;
        right = 0;
        bot = -2;
        
        resetName = true;

        interval = window.setInterval(animateControlsBackward, 1000/60);
    })

    let interval;

    let same = true;
    
    function inputControlsToggleCheck() {
        if(nameInput.value + "" != startingName + "") {
            if(same) {
                same = false;
                nameControls.style.display = "flex";
                nameControls.style.visibility = "0";
                nameControls.style.marginBottom = "-3em";
                nameControls.style.marginRight = "-10em";

                op = 0;
                right = -10;
                bot = -3;

                interval = window.setInterval(animateControls, 1000/60);
            }
        }
        else {
            same = true;
            nameControls.style.marginBottom = "-2em";
            nameControls.style.marginRight = "0";
            nameControls.style.visibility = "1";

            op = 1;
            right = 0;
            bot = -2;

            interval = window.setInterval(animateControlsBackward, 1000/60);
        }
    }

    let op = 0;
    let right = -10;
    let bot = -3;

    function animateControls() {
        if(op < 1) {
            op += 0.5;
        }

        if(right < 0) {
            right += 5;
        }

        if(bot < -2) {
            bot += 0.5;
        }

        nameControls.style.opacity = op;
        nameControls.style.marginRight = right + "em";
        nameControls.style.marginBottom = bot + "em";

        if(op >= 1 && right >= 0 && bot >= -2) {
            window.clearInterval(interval);
        }
    }

    function animateControlsBackward() {
        if(op > 0) {
            op -= 0.5;
        }

        if(right > -10) {
            right -= 5;
        }

        if(bot > -3) {
            bot -= 0.5;
        }

        nameControls.style.opacity = op;
        nameControls.style.marginRight = right + "em";
        nameControls.style.marginBottom = bot + "em";

        if(op <= 0 && right <= -10 && bot <= -3) {
            window.clearInterval(interval);

            if(resetName) {
                resetName = false;
                nameInput.value = startingName;
            }
        }
    }
    </script>
  </body>
</html>