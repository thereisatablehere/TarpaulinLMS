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
    <script src="../Scripts/userTypeLocalStorage.js"></script>
    <script src="../Scripts/userTypeLocalStorageAuthPageCheck.js"></script>
    <script src="../Scripts/header.js"></script>

    <script src="../Scripts/loadSidebar.js"></script>

    <section class="mainContainer profile">
        <div class="top">
            <div>
                <p>Edit a Course</p>
                <p>Modify information and add or remove tests and lectures</p>
            </div>
        </div>

        <section class="profileSettings">

            <div>
                <p>Course Name</p>
                <input type="text" placeholder="Name" value="CSCI 123">
            </div>

            <div style="flex-direction: column;">
                <p>Course Description</p>
                <input type="text" placeholder="Description" value="Learn cool computer stuff.">
            </div>

            <section style="
                display: flex;
                flex-direction: row;
                margin-top: 2em;
                width: 40em;
            ">
                <section class="lectures" style="
                    display: flex;
                    flex-direction: column;
                    width: 50%;
                    align-content: center;
                    padding-right: 2em;
                    border-right: 1px solid #00000050;
                ">
                    
                    <p style="font-size: 1.5em; font-weight: 500; color: var(--accentColor);">Lectures</p>

                    <button id="openAddLectureControls" class="buttonAccent" 
                        onclick='document.getElementById("addLectureControls").style.display="flex"
                        document.getElementById("openAddLectureControls").style.display="none"'
                        style="margin: 0; margin-bottom: 1em; margin-top: 0.5em; align-self: center; font-size: 0.8em;">Add Lecture</button>

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
                        <p>Your First Program</p>
                        
                        <div class="controls" style="display: flex; flex-direction: row;">
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Watch</button>
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Change</button>
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Delete</button>
                        </div>
                    </div>

                    <div style="
                        display: flex;
                        flex-direction: column;
                    ">
                        <p>Intro to Data Types</p>
                        
                        <div class="controls" style="display: flex; flex-direction: row;">
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Watch</button>
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Change</button>
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Delete</button>
                        </div>
                    </div>

                    <div style="
                        display: flex;
                        flex-direction: column;
                    ">
                        <p>Data Types Part 2</p>
                        
                        <div class="controls" style="display: flex; flex-direction: row;">
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Watch</button>
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Change</button>
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Delete</button>
                        </div>
                    </div>

                </section>

                <section class="tests" style="
                    display: flex;
                    flex-direction: column;
                    width: 50%;
                    align-content: center;
                    padding-left: 2em;
                ">
                    
                    <p style="font-size: 1.5em; font-weight: 500; color: var(--accentColor);">Tests</p>

                    <button class="buttonAccent" style="margin: 0; margin-bottom: 1em; margin-top: 0.5em; align-self: center; font-size: 0.8em; height: 3em;">Create Test</button>

                    <div style="
                        display: flex;
                        flex-direction: column;
                    ">
                        <p>Test 1</p>
                        
                        <div class="controls" style="display: flex; flex-direction: row;">
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">View</button>
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Edit</button>
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Delete</button>
                        </div>
                    </div>

                    <div style="
                        display: flex;
                        flex-direction: column;
                    ">
                        <p>Test 1</p>
                        
                        <div class="controls" style="display: flex; flex-direction: row;">
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">View</button>
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Edit</button>
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Delete</button>
                        </div>
                    </div>

                    <div style="
                        display: flex;
                        flex-direction: column;
                    ">
                        <p>Test 1</p>
                        
                        <div class="controls" style="display: flex; flex-direction: row;">
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">View</button>
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Edit</button>
                            <button class="buttonNormal" style="font-size: 0.7em; margin: 0;">Delete</button>
                        </div>
                    </div>

                </section>
            </section>

        </section>
    </section>

    <script src="../Scripts/navbarToggle.js"></script>

  </body>
</html>