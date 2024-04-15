<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/style.css">
    <title>Tarpaulin - Test Results</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body>
    <script src="../Scripts/userTypeLocalStorage.js"></script>
    <script src="../Scripts/userTypeLocalStorageAuthPageCheck.js"></script>
    <script src="../Scripts/header.js"></script>

    <script src="../Scripts/loadSidebar.js"></script>
    
    <section class="mainContainer entireTestContainer">
        
        <p class="title">Some Random Test - Results</p>

        <div class="questionContainer">
            <p class="">The question prompt qould go here.</p>

            <label class="correctAnswer">+<input type="radio" name="question1" checked disabled>Option A</label>

            <label><input type="radio" name="question1" disabled>Option B</label>

            <label><input type="radio" name="question1" disabled>Option C</label>

            <label><input type="radio" name="question1" disabled>Option D</label>
        </div>

        <div class="questionContainer">
            <p class="">Another question prompt could possibly go here.</p>

            <label><input type="radio" name="question2" disabled>Option A</label>

            <label class="incorrectAnswer">-<input type="radio" name="question2" checked disabled>Option B</label>

            <label><input type="radio" name="question2" disabled>Option C</label>

            <label class="correctAnswer">+<input type="radio" name="question2" disabled>Option D</label>
        </div>

        <div class="questionContainer">
            <p class="">Also, a question prompt could appear right here.</p>

            <label><input type="radio" name="question3" disabled>Option A</label>

            <label><input type="radio" name="question3" disabled>Option B</label>

            <label class="correctAnswer">+<input type="radio" name="question3" checked disabled>Option C</label>

            <label><input type="radio" name="question3" disabled>Option D</label>
        </div>

        <button class="buttonAccent" onclick='window.open("courseView.jsp", "_self")'>Go Back</button>

    </section>
  </body>
</html>