<%@ page import="java.sql.Connection" %>
<%@ page import="DAO.MyDatabase" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 29-05-2024
  Time: 01:11 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <style>
        .square {
            padding: 10px;
            height: 70px;
            width: 70px;
            background-color: #555;
        }
    </style>
    <!-- Add this line in the <head> section of your HTML -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Job board HTML-5 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>

<body>
<!-- Preloader Start -->
<!-- Uncomment if you need preloader
<div id="preloader-active">
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-inner position-relative">
            <div class="preloader-circle"></div>
            <div class="preloader-img pere-text">
                <img src="userstyle/assets/img/logo/logo.png" alt="">
            </div>
        </div>
    </div>
</div>
-->
<!-- Preloader End -->

<main>
    <!-- Hero Area Start-->

    <!-- Hero Area End -->

    <!-- Job List Area Start -->   <section class="featured-job-area feature-padding"  style="padding-top: 0px !important;">
    <div class="row h3">
        <div class="col-lg-12">
            <div class="section-tittle text-center">
                <span>Apply Job</span>

            </div>
        </div>
    </div>

    <%
        Cookie[] cookies = request.getCookies();
        String R_Email = null;
        String  R_id ="";

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("Vem".equals(cookie.getName())) {
                    R_Email = cookie.getValue();
                    break;
                }
            }
        }
    %>

    <%

        Connection con = MyDatabase.getConnection();
        PreparedStatement psmt = con.prepareStatement("select * from recuruiter where Email=?");
        psmt.setString(1,R_Email);

        ResultSet rs = psmt.executeQuery();

        while (rs.next())
        {
            R_id =  rs.getString("r_id");
        }



    %>
    <%

        try
        {

            PreparedStatement psmt1 = con.prepareStatement("SELECT * FROM job_apply INNER JOIN recuruiter ON job_apply.r_id = recuruiter.r_id INNER JOIN seeker ON job_apply.s_id = seeker.s_id INNER JOIN  Job_add on job_apply.j_id = job_add.j_id  WHERE job_apply.r_id=?");

            psmt1.setString(1,R_id);

            ResultSet rs1 = psmt1.executeQuery();


            while (rs1.next()) {



                String Fname = rs1.getString("fname");
                String Lname = rs1.getString("lname");
                String Gender = rs1.getString("Gender");
                String JobStatus = rs1.getString("JobStatus");
                String jobDate = rs1.getString("JobApplyDate");
                byte[] simg = rs1.getBytes("simg");
                String imgbyte = Base64.getEncoder().encodeToString(simg);
                String simges = "data:image/png;base64," + imgbyte;

    %>


    <div class="container">
        <!-- Section Tittle -->


        <div class="row justify-content-center">
            <div class="col-xl-10" >
                <!-- single-job-content -->
                <div class="single-job-items mb-30" style="border-style: solid" >

                    <div class="job-items">

                        <img src="<%=simges%>" style="height: 70px;width: 70px;margin-right: 10px;border-style: solid ; object-fit: cover" >


                        <div class="job-tittle">
                            <a style="text-decoration: none" href="job_details.html"><h4><%=Fname%> <%=Lname%></h4></a>
                            <ul style="padding-left: 0px">
                                <li ><%=Gender%></li>
                                <li><%=jobDate%></li>

                            </ul>
                        </div>
                    </div>
                    <div class="items-link f-right">
                        <%
                            if ("Panding".equals(JobStatus)) {
                        %>
                        <a style="text-decoration: none; background-color: crimson; color: #FFFFFF" href="job_details.html"><%= JobStatus %></a>
                        <%
                        } else if ("Approve".equals(JobStatus)) {
                        %>
                        <a style="text-decoration: none; background-color: greenyellow; color: black" href="job_details.html"><%= JobStatus %></a>
                        <%
                            }
                        %>


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
        catch (Exception e)
        {
            e.printStackTrace();
        }

    %>
</section>
</main>
<script>
    // JavaScript to toggle the view
    document.getElementById('toggleIcon').addEventListener('click', function() {
        var content = document.getElementById('toggleContent');
        content.classList.toggle('show');
    });
</script>
</body>
</html>
