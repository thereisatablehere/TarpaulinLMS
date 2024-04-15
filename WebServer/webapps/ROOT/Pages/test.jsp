<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="../Styles/styles.css">
    <title>Tarpaulin - Test</title>
  <link rel="icon" type="image/x-icon" href="../Images/Tarpaulin_Logo_Alt_2.png">
</head>
  <body>
    <script src="../Scripts/userTypeLocalStorage.js"></script>
    
    <section class="mainContainer entireTestContainer">
        
        <p class="title">Exam 2</p>

        <div class="questionContainer">
            <p class="">What is 1 + 1.</p>

            <label><input type="radio" name="question1">1</label>

            <label><input type="radio" name="question1">11</label>

            <label><input type="radio" name="question1">2</label>

            <label><input type="radio" name="question1">1+1</label>
        </div>

        <div class="questionContainer">
            <p class="">How many days in a week are there?</p>

            <label><input type="radio" name="question2">1</label>

            <label><input type="radio" name="question2">7</label>

            <label><input type="radio" name="question2">8</label>

            <label><input type="radio" name="question2">Weeks do not exist</label>
        </div>

        <div class="questionContainer">
            <p class="">How many grains of sand are on Earth?</p>

            <label><input type="radio" name="question3">1 grain</label>

            <label><input type="radio" name="question3">1,000,000 grains</label>

            <label><input type="radio" name="question3">1E525 grains</label>

            <label><input type="radio" name="question3">Sand doens't exist</label>
        </div>

        <button class="buttonAccent" onclick='window.open("courseView.jsp", "_self")'>Submit</button>

    </section>
  </body>
</html>