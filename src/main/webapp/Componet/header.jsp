<%@ page import="DAO.MyDatabase" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="../RecruiterStyle/style.css">
    <link rel="stylesheet" href="../RecruiterStyle/core.css">
    <link rel="stylesheet" href="../RecruiterStyle/Doc/css/main.css">
    <link rel="stylesheet" href="../RecruiterStyle/assets/css/bootstrap.min.css">
    <link rel="stylesheet">

    <title>Title</title>
</head>
<body>

<%--<%--%>

<%--    Cookie[] cookies1 = request.getCookies();--%>
<%--    String checkuser = null;--%>
<%--    String checkVendor = null;--%>

<%--    // Find the cookie that contains the user's email--%>
<%--    if (cookies1 != null) {--%>
<%--        for (Cookie cookie : cookies1) {--%>
<%--            if ("usr".equals(cookie.getName())) {--%>
<%--                checkuser = cookie.getValue();--%>
<%--                System.out.println(checkuser);--%>
<%--                break;--%>
<%--            }--%>
<%--            else if("vnd".equals(cookie.getName())) {--%>
<%--                checkVendor = cookie.getValue();--%>
<%--                System.out.println(checkVendor);--%>
<%--                break;--%>

<%--            }--%>
<%--        }--%>
<%--    }--%>

<%--    // Check if the admin cookie is present and equals "admin"--%>
<%--    if ("user".equals(checkuser)) {--%>
<%--%>--%>



<%--<%--%>
<%--} else if ("vendor".equals(checkVendor)) {--%>
<%--%>--%>

<div class="header-area header-transparrent">
    <div class="headder-top header-sticky">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-3 col-md-2">
                    <!-- Logo -->
                    <div class="logo" style="padding-top: 20px">
                        <a href="Home.jsp"><img style="width: 100%;height: 100%" src="./RecruiterStyle/assets/img/logo/lalo.png" height="130px" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-9 col-md-9">
                    <div class="menu-wrapper">
                        <!-- Main-menu -->
                        <div class="main-menu">
                            <nav class="d-none d-lg-table">
                                <ul id="navigation2">
                                    <li><a style="text-decoration: none" href=".?pname=Home">Home</a></li>
                                    <li><a style="text-decoration: none" href=".?pname=ShowAllJob">Show All Job</a> </li>
                                    <li><a style="text-decoration: none" href=".?pname=showJob">Show Job</a></li>
                                    <li><a style="text-decoration: none" href=".?pname=AddJob">Add Job</a></li>
                                    <li><a style="text-decoration: none" href=".?pname=JobApply">Apply</a></li>

                                    <li><a style="text-decoration: none" href=".?pname=Contact">Contact</a></li>
                                    <li><a style="text-decoration: none" href=".?pname=About">About</a></li>
                                    <!-- <li><a href=".?pname=userProfile">Profile</a></li> -->
                                </ul>
                            </nav>
                        </div>

                        <%
                            Cookie[] cookies = request.getCookies();
                            String R_Email = null;

                            if (cookies != null) {
                                for (Cookie cookie : cookies) {
                                    if ("Vem".equals(cookie.getName())) {
                                        R_Email = cookie.getValue();
                                        break;
                                    }
                                }
                            }

                            try {
                                Connection con = MyDatabase.getConnection();
                                PreparedStatement psmt = con.prepareStatement("SELECT Cimg FROM recuruiter WHERE Email=?");
                                psmt.setString(1, R_Email);
                                ResultSet rs = psmt.executeQuery();
                                if (rs.next()) {
                                    byte[] cimg = rs.getBytes("Cimg");
                                    String imgbyte = Base64.getEncoder().encodeToString(cimg);
                                    String cimges = "data:image/png;base64," + imgbyte;
                        %>
                        <a href=".?pname=userProfile">
                            <img style="height: 50px; border-radius: 50px; align-items: end; border-style: solid; border-color: #4C5B5C" width="50px" src="<%=cimges%>" />
                        </a>

                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </div>
                </div>
                <div class="col-lg-12 col-md-13"></div>
                <!-- Mobile Menu -->
                <div class="col-12">
                    <div class="mobile_menu d-block d-lg-none"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<%--%>
<%--    }--%>
<%--%>--%>

</body>
</html>
