<!DOCTYPE html>
<head>
    <title>Tarpaulin</title>
</head>
<body>
    <script src="./Scripts/userTypeLocalStorage.js"></script>

    <script>
        let load = "./Pages/";

        switch(localStorage.getItem("userType")) {
            case "student":
                load += "studentHome.jsp";
                break;
            case "instructor":
                load += "instructorHome.jsp";
                break;
            default:
                load += "landing.jsp";
        }

        window.open(load, "_self");
    </script>
</body>
</html>