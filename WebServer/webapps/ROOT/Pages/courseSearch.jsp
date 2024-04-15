<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/style.css">
    <title>Tarpaulin - Find a Community</title>
  </head>
  <body class="studentHomeBody">
    <script src="../Scripts/userTypeLocalStorage.js"></script>
    <script src="../Scripts/userTypeLocalStorageAuthPageCheck.js"></script>
    <script src="../Scripts/header.js"></script>

    <img class="openNavbar" src="../Images/menu.svg">

    <script src="../Scripts/loadSidebar.js"></script>

    <section class="mainContainer mainContainerLeft courseSearch">
        
        <section class="search">
            <p class="title">Find a New Course to Enroll In</p>

            <p class="bigDescription">Fill out any number of parameters</p>

            <div>
                <p>Course Name</p>
                <input type="text">
            </div>

            <div>
                <p>Created By</p>
                <input type="text">
            </div>

            <button class="buttonAccent" onclick='
                let results = document.getElementsByClassName("results")[0];

                results.style.display = "block";
            '>search</button>

        </section>
        
        <section class="results">
            <p class="title">Results</p>

            <select>
                <option>Filter By</option>
                <option>Course Name</option>
                <option>Instructor</option>
                <option>Rating</option>
                <option>Date Created</option>
            </select>

            <div class="course">
                <p class="name">Course Name</p>

                <div>
                    <p>Created By</p>
                    <p class="instructor">Instructor</p>
                </div>

                <div>
                    <div>
                        <img draggable="false" class="star" src="../Images/star-full.svg">
                        <img draggable="false" class="star" src="../Images/star-full.svg">
                        <img draggable="false" class="star" src="../Images/star-full.svg">
                        <img draggable="false" class="star" src="../Images/star-full.svg">
                    </div>
                    <p>(4.5)</p>
                </div>

                <p>A description of this course would go right here.</p>
            </div>

            <div class="course">
                <p class="name">Another Course</p>

                <div>
                    <p>Created By</p>
                    <p class="instructor">Some Instructor</p>
                </div>

                <div>
                    <div>
                        <img draggable="false" class="star" src="../Images/star-full.svg">
                        <img draggable="false" class="star" src="../Images/star-full.svg">
                        <img draggable="false" class="star" src="../Images/star-full.svg">
                    </div>
                    <p>(3.2)</p>
                </div>

                <p>There would, hypotheticaly, be some description of this current course currently right here. And this description would have been created by the instructor, who is listed above.</p>
            </div>

        </section>

    </section>

  </body>
</html>