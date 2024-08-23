<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 20-07-2024
  Time: 06:04 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .pre-loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #f0f0f0;
            z-index: 1000;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .pre-loader-box {
            text-align: center;
        }

        .loading {
            animation: spin 2s infinite linear;
        }

        /*@keyframes spin {*/
        /*    0% {*/
        /*        transform: rotate(0deg);*/
        /*    }*/

        /*    100% {*/
        /*        transform: rotate(360deg);*/
        /*    }*/
        /*}*/

        .loader-progress {
            height: 15px;
            width: 280px;
            align-items: center;
            background-color: #0b0b0b;
            border-radius: 13px;
            overflow: hidden;
            margin: 20px auto;
        }

        .bar {
            width: 0;
            height: 15px;
            background-color: #3498db;
            border-radius: 13px;
            transition: width 0.2s ;
        }

        .percent {
            font-size: 18px;
            color: #333;
        }

        .loading-text {
            font-size: 16px;
            color: #777;
        }
    </style>
    <title>Title</title>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
    <link rel="manifest" href="./site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="./RecruiterStyle/assets/img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="./RecruiterStyle/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./RecruiterStyle/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="./RecruiterStyle/assets/css/flaticon.css">
    <link rel="stylesheet" type="text/css" href="./RecruiterStyle/assets/css/price_rangs.css">
    <link rel="stylesheet" href="./RecruiterStyle/assets/css/slicknav.css">
    <link rel="stylesheet" href="./RecruiterStyle/assets/css/animate.min.css">
    <link rel="stylesheet" href="./RecruiterStyle/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="./RecruiterStyle/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="./RecruiterStyle/assets/css/themify-icons.css">
    <link rel="stylesheet" href="./RecruiterStyle/assets/css/slick.css">
    <link rel="stylesheet" href="./RecruiterStyle/assets/css/nice-select.css">
    <link rel="stylesheet" href="./RecruiterStyle/Doc/css/style.css">
    <link rel="stylesheet" href="./RecruiterStyle/Doc/css/main.css">


</head>
<body>

<header class="header-area header-transparrent">
    <jsp:include page="Componet/header.jsp"></jsp:include>
</header>



<div>

    <%
        String pagename = request.getParameter("pname");
        if(pagename != null)
        {
            switch (pagename)
            {
                case "Home":
    %>
    <jsp:include page="Pages/Home.jsp"/>
    <%
            break;
        case "showJob":
    %>
    <jsp:include page="Pages/ShowJob.jsp"/>
    <%
            break;
        case "AddJob":
    %>
    <jsp:include page="./Pages/AddJob.jsp"/>
    <%
            break;
        case "Contact":
    %>
<%--    <jsp:include page="Page/contact.jsp"/>--%>
    <%
            break;
        case "jobDetails":
    %>
<%--    <jsp:include page="./Page/job_details.jsp"/>--%>
    <%
            break;
        case"JobApply":
    %>
    <jsp:include page="Pages/Seeker_Job_Apply.jsp"/>
    <%
            break;
        case "userProfile":
    %>
    <jsp:include page="Pages/Profile.jsp"/>
    <%
            break;
        case "JobDetails":
    %>
    <jsp:include page="Pages/JobDetails.jsp"/>
    <%
            break;
        case "ShowAllJob":
    %>
    <jsp:include page="Pages/Show_All_Job.jsp"/>
    <%
                break;
        }
    }else {
    %>
    <jsp:include page="Pages/Home.jsp"/>
    <%
        }
    %>


</div>

<footer>
    <jsp:include page="./Componet/footer.jsp"/>
</footer>



<!-- JS here -->

<!-- All JS Custom Plugins Link Here here -->
<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
<!-- Jquery, Popper, Bootstrap -->
<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="./assets/js/popper.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<!-- Jquery Mobile Menu -->
<script src="./assets/js/jquery.slicknav.min.js"></script>

<!-- Jquery Slick , Owl-Carousel Plugins -->
<script src="./assets/js/owl.carousel.min.js"></script>
<script src="./assets/js/slick.min.js"></script>
<script src="./assets/js/price_rangs.js"></script>

<!-- One Page, Animated-HeadLin -->
<script src="./assets/js/wow.min.js"></script>
<script src="./assets/js/animated.headline.js"></script>
<script src="./assets/js/jquery.magnific-popup.js"></script>

<!-- Scrollup, nice-select, sticky -->
<script src="./assets/js/jquery.scrollUp.min.js"></script>
<script src="./assets/js/jquery.nice-select.min.js"></script>
<script src="./assets/js/jquery.sticky.js"></script>

<!-- contact js -->
<script src="./assets/js/contact.js"></script>
<script src="./assets/js/jquery.form.js"></script>
<script src="./assets/js/jquery.validate.min.js"></script>
<script src="./assets/js/mail-script.js"></script>
<script src="./assets/js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery -->
<script src="./assets/js/plugins.js"></script>
<script src="./assets/js/main.js"></script>

</body>
</html>
