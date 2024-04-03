const sidebar = `
<nav class="sidebar">

      <a href="allGradeReport.html">
        <img src="../Images/news-paper.svg">
        <p>Grade Report</p>
      </a>

      <a href="enrolledCoursesList.html">
        <img src="../Images/education.svg">
        <p>My Courses</p>
      </a>

      <a href="courseSearch.html">
        <img src="../Images/search.svg">
        <p>Find a Course</p>
      </a>

      <a href="joinedCommunitiesList.html">
        <img src="../Images/user-group.svg">
        <p>My Communities</p>
      </a>
      
      <a href="createCommunity.html">
        <img src="../Images/add-outline.svg">
        <p>Create a Community</p>
      </a>
    </nav>`;

if(localStorage.getItem("userType") == "student") {
  document.write(sidebar);
}