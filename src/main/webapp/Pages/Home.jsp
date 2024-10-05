<%@ page import="DAO.MyDatabase" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 20-05-2024
  Time: 03:54 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js" lang="zxx">

<head>

    <style>

        .row {
            display: flex;
            flex-wrap: wrap;
            margin-right: -15px;
            margin-left: -15px;
        }

        .col-xl-3 {
            flex: 0 0 25%;
            max-width: 25%;
            padding-right: 15px;
            padding-left: 15px;
        }

        .mb-30 {
            margin-bottom: 30px;
        }

        /* Card Styles */
        /* Card Styles */
        .card-box {
            background-color: #ffffff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
        }

        .card-box:hover {
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }

        .height-100-p {
            height: 100%;
        }

        .widget-style1 {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .d-flex {
            display: flex;
        }

        .flex-wrap {
            flex-wrap: wrap;
        }

        .align-items-center {
            align-items: center;
        }

        /* Widget Data */
        .widget-data {
            margin-left: 20px;
        }

        .widget-data .h4 {
            font-size: 24px;
            font-weight: 700;
            color: #333;
        }

        .widget-data .weight-600 {
            font-weight: 600;
            color: #888;
            margin-top: 5px;
        }

        /* Progress Data */
        .progress-data {
            flex-shrink: 0;
        }
        #chart1 {
            width: 60px;
            height: 60px;
            background-color: #f0f0f0;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        /* Styles for the image inside the chart */
        #chart1 img {
            width: 40px; /* Adjust the size as needed */
            height: 40px;
            object-fit: contain; /* Ensures the image scales properly within the container */
        }
        #chart2 {
            width: 60px;
            height: 60px;
            background-color: #f0f0f0;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        /* Styles for the image inside the chart */
        #chart2 img {
            width: 40px; /* Adjust the size as needed */
            height: 40px;
            object-fit: contain; /* Ensures the image scales properly within the container */
        }
        #chart3 {
            width: 60px;
            height: 60px;
            background-color: #f0f0f0;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        /* Styles for the image inside the chart */
        #char3 img {
            width: 40px; /* Adjust the size as needed */
            height: 40px;
            object-fit: contain; /* Ensures the image scales properly within the container */
        }

        #chart4 {
            width: 60px;
            height: 60px;
            background-color: #f0f0f0;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        /* Styles for the image inside the chart */
        #chart4 img {
            width: 40px; /* Adjust the size as needed */
            height: 40px;
            object-fit: contain; /* Ensures the image scales properly within the container */
        }

        @media (max-width: 1200px) {
            .col-xl-3 {
                flex: 0 0 50%;
                max-width: 50%;
            }
        }

        @media (max-width: 768px) {
            .col-xl-3 {
                flex: 0 0 100%;
                max-width: 100%;
            }
            .widget-data {
                margin-left: 10px;
            }
        }


    </style>

    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Job board HTML-5 Template </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
<%--    <link rel="shortcut icon" type="image" href="./RecruiterStyle/assets/img/logo/finalogo.jpg">--%>

    <!-- CSS here -->
</head>

<body>
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
try
{

        Connection con = MyDatabase.getConnection();
        PreparedStatement psmt = con.prepareStatement("select * from recuruiter where Email=?");
        psmt.setString(1,R_Email);
        ResultSet rs = psmt.executeQuery();

        if(rs.next()) {
            String rid = rs.getString("r_id");





%>

<!-- Preloader Start -->
<%--<div class="pre-loader">--%>
<%--    <div class="pre-loader-box">--%>
<%--        <div class="loader-logo">--%>
<%--            <div class="loading">--%>
<%--                <img width="20%" src="./userstyle/assets/img/logo/lalo.png"/>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="loader-progress" id="progress_div">--%>
<%--            <div class="bar" id="bar1"></div>--%>
<%--        </div>--%>
<%--        <div class="percent" id="percent1">0%</div>--%>
<%--        <div class="loading-text">Loading...</div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- Preloader Start -->

<main>
    <div style="padding: 20px">
        <div class="row">
            <div class="col-xl-3 mb-30">
                <div class="card-box height-100-p widget-style1">
                    <div class="d-flex flex-wrap align-items-center">
                        <div class="progress-data">
                            <div id="chart1">

                                <img src="./RecruiterStyle/assets/icons/job.png" style="height: 30px">
                            </div>
                        </div>
                        <div class="widget-data">
                            <div class="widget-data" style="place-items: center">
                                <%

try
{

                                        Connection con1 = MyDatabase.getConnection();
                                        PreparedStatement psmt1 = con1.prepareStatement("select count(j_id) from job_add where r_id=?");
                                        psmt1.setString(1,rid);
                                        ResultSet rs1 = psmt1.executeQuery();

                                        if(rs1.next())
                                        {
                                            String RecruiterNo = rs1.getString(1);




                                %>


                                <div class="h4 mb-0"><%=RecruiterNo%></div>
                                <div class="weight-600 font-14">Jobs</div> <%
                                        }

                                }
catch (Exception e)
{
    e.printStackTrace();
}
                            %>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 mb-30">
                <div class="card-box height-100-p widget-style1">
                    <div class="d-flex flex-wrap align-items-center">
                        <div class="progress-data">
                            <div id="chart2">
                                <img src="./RecruiterStyle/assets/icons/job-offer.png" style="height: 30px">
                            </div>
                        </div>
                        <div class="widget-data">
                            <div class="widget-data" style="place-items: center">
                                <%

                                    try
                                    {

                                        Connection con1 = MyDatabase.getConnection();
                                        PreparedStatement psmt1 = con1.prepareStatement("select count(a_id) from job_apply where r_id=?");
                                        psmt1.setString(1,rid);
                                        ResultSet rs1 = psmt1.executeQuery();

                                        if(rs1.next())
                                        {
                                            String ApplyNo = rs1.getString(1);




                                %>


                                <div class="h4 mb-0"><%=ApplyNo%></div>
                                <div class="weight-600 font-14"> Seeker Job Apply</div> <%
                                    }

                                }
                                catch (Exception e)
                                {
                                    e.printStackTrace();
                                }
                            %>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 mb-30">
                <div class="card-box height-100-p widget-style1">
                    <div class="d-flex flex-wrap align-items-center">
                        <div class="progress-data">
                            <div id="chart3">
                                <img src="./RecruiterStyle/assets/icons/clock.png" style="height: 30px">
                            </div>
                        </div>
                        <div class="widget-data">
                            <div class="widget-data" style="place-items: center">
                                <%

                                    try
                                    {

                                        Connection con1 = MyDatabase.getConnection();
                                        PreparedStatement psmt1 = con1.prepareStatement("select count(a_id) from job_apply where r_id=? And JobStatus='Pending'");
                                        psmt1.setString(1,rid);
                                        ResultSet rs1 = psmt1.executeQuery();

                                        if(rs1.next())
                                        {
                                            String PendingNo = rs1.getString(1);




                                %>


                                <div class="h4 mb-0"><%=PendingNo%></div>
                                <div class="weight-600 font-14" style="color: #992637">Apply Pending</div> <%
                                    }

                                }
                                catch (Exception e)
                                {
                                    e.printStackTrace();
                                }
                            %>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 mb-30">
                <div class="card-box height-100-p widget-style1">
                    <div class="d-flex flex-wrap align-items-center">
                        <div class="progress-data">

                            <div id="chart4"> <img src="./RecruiterStyle/assets/img/Check_Icon/check-mark.png" style="height: 30px"></div>
                        </div>
                        <div class="widget-data">
                            <div class="widget-data" style="place-items: center">
                                <%

                                    try
                                    {

                                        Connection con1 = MyDatabase.getConnection();
                                        PreparedStatement psmt1 = con1.prepareStatement("select count(a_id) from job_apply where r_id=? And JobStatus='Approve'");
                                        psmt1.setString(1,rid);
                                        ResultSet rs1 = psmt1.executeQuery();

                                        if(rs1.next())
                                        {
                                            String ApproveNo = rs1.getString(1);




                                %>


                                <div class="h4 mb-0"><%=ApproveNo%></div>
                                <div class="weight-600 font-14" style="color: #009045">Apply Approve</div> <%
                                    }

                                }
                                catch (Exception e)
                                {
                                    e.printStackTrace();
                                }
                            %>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- slider Area Start-->
    <div class="slider-area ">
        <!-- Mobile Menu -->
        <div class="slider-active">
            <div class="single-slider slider-height d-flex align-items-center" data-background="./assets/img/gallery/1.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-6 col-lg-9 col-md-10">
                            <div class="hero__caption">
                                <h1 style="font-family:'Josefin Sans', sans-serif">Join the most exciting startup teams.</h1>
                            </div>

                        </div>
                        <img src="./RecruiterStyle/assets/img/Home/home.svg" height="500px" WIDTH="500px">


                    </div>
                    <!-- Search Box -->
<%--                    <div class="row">--%>
<%--                        <div class="col-xl-8">--%>
<%--                            <!-- form -->--%>
<%--                            <form action="#" class="search-box">--%>
<%--                                <div class="input-form">--%>
<%--                                    <input type="text" placeholder="Job Tittle or keyword">--%>
<%--                                </div>--%>
<%--                                <div class="select-form">--%>
<%--                                    <div class="select-itms">--%>
<%--                                        <select name="select" id="select1">--%>
<%--                                            <option value="">Location BD</option>--%>
<%--                                            <option value="">Location PK</option>--%>
<%--                                            <option value="">Location US</option>--%>
<%--                                            <option value="">Location UK</option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="search-form">--%>
<%--                                    <a href="#">Find job</a>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
    <!-- Our Services Start -->

    <!-- Our Services End -->
    <!-- Online CV Area Start -->
<%--    <div class="online-cv cv-bg section-overly pt-90 pb-120"  data-background="userstyle/assets/img/gallery/cv_bg.jpg">--%>
<%--        <div class="container">--%>
<%--            <div class="row justify-content-center">--%>
<%--                <div class="col-xl-10">--%>
<%--                    <div class="cv-caption text-center">--%>
<%--                        <p class="pera1">FEATURED TOURS Packages</p>--%>
<%--                        <p class="pera2"> Make a Difference with Your Online Resume!</p>--%>
<%--                        <a href="#" class="border-btn2 border-btn4">Upload your cv</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <!-- Online CV Area End-->--%>
    <!-- Featured_job_start -->


    <!-- Featured_job_end -->
    <!-- How  Apply Process Start-->



</main>



<!-- JS here -->

<!-- All JS Custom Plugins Link Here here -->
<%

    }
    }

    catch (Exception e)
    {
        e.printStackTrace();
    }
%>
</body>
<script>
    window.addEventListener('load', function () {
        var loader = document.querySelector('.pre-loader');
        var progress = document.querySelector('#bar1');
        var percent = document.querySelector('#percent1');

        // Function to update the loading progress
        function updateProgress() {
            var width = 0;
            var interval = setInterval(function () {
                if (width >= 100) {
                    clearInterval(interval);
                    loader.style.display = 'none'; // Hide loader once complete
                } else {
                    width++;
                    progress.style.width = width + '%';
                    percent.innerHTML = width + '%';
                }
            }, 30); // Speed of progress
        }

        // Start updating progress
        updateProgress();
    });
</script>
</html>
