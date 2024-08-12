<%@ page import="java.sql.Connection" %>
<%@ page import="DAO.MyDatabase" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 20-05-2024
  Time: 03:54 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js" lang="zxx">
<head>

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
    <div class="our-services section-pad-t12">
        <div class="container">
            <!-- Section Tittle -->
            <div class="row h-auto">
                <div class="col-lg-12">
                    <div class="section-tittle text-center">
                        <span>FEATURED TOURS Packages</span>
                        <h2>Browse Top Categories </h2>
                    </div>
                </div>
            </div>
            <div class="row d-flex justify-contnet-center">
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-tour"></span>
                        </div>
                        <div class="services-cap">
                            <%
                                Cookie[] cookies = request.getCookies();
                                String userEmail = null;
                                String checkadmin = null;
                                // Find the cookie that contains the user's email
                                if (cookies != null) {
                                    for (Cookie cookie : cookies) {
                                        if ("adm".equals(cookie.getName())) { // Change "userEmail" to the actual cookie name
                                            checkadmin = cookie.getValue();
                                            System.out.println(checkadmin);
                                            break;
                                        }
                                    }
                                }
                            %>
                            <h5><a href="job_listing.html">Design & Creative<%=checkadmin%></a></h5>
                            <span>(653)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-cms"></span>
                        </div>
                        <div class="services-cap">
                            <h5><a href="job_listing.html">Design & Development</a></h5>
                            <span>(658)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-report"></span>
                        </div>
                        <div class="services-cap">
                            <h5><a href="job_listing.html">Sales & Marketing</a></h5>
                            <span>(658)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-app"></span>
                        </div>
                        <div class="services-cap">
                            <h5><a href="job_listing.html">Mobile Application</a></h5>
                            <span>(658)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-helmet"></span>
                        </div>
                        <div class="services-cap">
                            <h5><a href="job_listing.html">Construction</a></h5>
                            <span>(658)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-high-tech"></span>
                        </div>
                        <div class="services-cap">
                            <h5><a href="job_listing.html">Information Technology</a></h5>
                            <span>(658)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-real-estate"></span>
                        </div>
                        <div class="services-cap">
                            <h5><a href="job_listing.html">Real Estate</a></h5>
                            <span>(658)</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">
                    <div class="single-services text-center mb-30">
                        <div class="services-ion">
                            <span class="flaticon-content"></span>
                        </div>
                        <div class="services-cap">
                            <h5><a href="job_listing.html">Content Writer</a></h5>
                            <span>(658)</span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- More Btn -->
            <!-- Section Button -->
<%--            <div class="row">--%>
<%--                <div class="col-lg-12">--%>
<%--                    <div class="browse-btn2 text-center mt-50">--%>
<%--                        <a href="job_listing.html" class="border-btn2">Browse All Sectors</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
        </div>
    </div>
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

    <section class="featured-job-area feature-padding">
        <div class="row h3">
            <div class="col-lg-12">
                <div class="section-tittle text-center">
                    <span>Recent Job</span>
                    <h2>Featured Jobs</h2>
                </div>
            </div>
        </div>
        <%
            int id = 3;
            try
            {
                Connection con = MyDatabase.getConnection();
                PreparedStatement  psmt = con.prepareStatement("select * from add_job order by Company_name DESC");
                psmt.execute();
                ResultSet rs = psmt.getResultSet();
                for(int i=1; i<=5;i++)
                {

                    if (rs.next()) {

                        String Jobname= rs.getString("Job_Name");

                        String Company_name= rs.getString("Company_Name");
                        String city = rs.getString("City");
                        String state= rs.getString("State");
                        String email = rs.getString("Email");
                        String phone = rs.getString("Phone_Number");
                        String salary = rs.getString("Salary");
                        String jobtype = rs.getString("JobType");
                        String startdate = rs.getString("StartDate");
                        String enddate = rs.getString("EndDate");
                        String jobDescription = rs.getString("JobDescription");
                        String vacancy = rs.getString("vacancy");

                        byte[] Cimg = rs.getBytes("companyImg");
                        String imgbyte = Base64.getEncoder().encodeToString(Cimg);
                        String companyImg = "data:image/png;base64,"+imgbyte;




        %>

        <div class="container">
            <!-- Section Tittle -->


            <div class="row justify-content-center">
                <div class="col-xl-10">
                    <!-- single-job-content -->
                    <div class="single-job-items mb-30">
                        <div class="job-items">
                            <div class="company-img">
                                <a href=".?pname=jobDetails" style="padding-right: 20px "><img height="100px" width="100px" style="border-color: #4C5B5C;border-style: solid;" src="<%=companyImg%>" alt=""></a>
                            </div>
                            <div class="job-tittle">
                                <a href="job_details.html"><h4><%=Company_name%></h4></a>
                                <ul>
                                    <li><%=Jobname%></li>
                                    <li><i class="fas fa-map-marker-alt"></i><%=city%>,<%=state%></li>

                                </ul>
                            </div>
                        </div>
                        <div class="items-link f-right">
                            <a href="job_details.html">Full Time</a>
                            <li><%=salary%>₹</li>
                        </div>
                    </div>
                    <!-- single-job-content -->
                                     <!-- single-job-content -->

                </div>
            </div>
        </div>
        <%
                    }
                }
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        %>
    </section>
    <!-- Featured_job_end -->
    <!-- How  Apply Process Start-->
    <div class="apply-process-area apply-bg " data-background="./userstyle/assets/img/gallery/how-applybg.png">
        <div class="container">
            <!-- Section Tittle -->
            <div class="row h3">
                <div class="col-lg-12">
                    <div class="section-tittle white-text text-center">
                        <span>Apply process</span>

                    </div>
                </div>
            </div>
            <!-- Apply Process Caption -->
            <div class="row accordion">
                <div class="col-lg-4 col-md-6">
                    <div class="single-process text-center mb-30">
                        <div class="process-ion">
                            <span class="flaticon-search"></span>
                        </div>
                        <div class="process-cap">
                            <h5>1. Search a job</h5>
                            <p>Sorem spsum dolor sit amsectetur adipisclit, seddo eiusmod tempor incididunt ut laborea.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-process text-center mb-30">
                        <div class="process-ion">
                            <span class="flaticon-curriculum-vitae"></span>
                        </div>
                        <div class="process-cap">
                            <h5>2. Apply for job</h5>
                            <p>Sorem spsum dolor sit amsectetur adipisclit, seddo eiusmod tempor incididunt ut laborea.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single-process text-center mb-30">
                        <div class="process-ion">
                            <span class="flaticon-tour"></span>
                        </div>
                        <div class="process-cap">
                            <h5>3. Get your job</h5>
                            <p>Sorem spsum dolor sit amsectetur adipisclit, seddo eiusmod tempor incididunt ut laborea.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</main>
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


<!-- JS here -->

<!-- All JS Custom Plugins Link Here here -->

</body>
</html>
