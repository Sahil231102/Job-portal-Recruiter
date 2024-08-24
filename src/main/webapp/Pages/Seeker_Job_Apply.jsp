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
        .button {
            position: relative;
            transition: all 0.3s ease-in-out;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
            padding-block: 0.5rem;
            padding-inline: 1.25rem;
            background-color: rgb(237, 241, 241);
            border-radius: 9999px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            color: #70b903;
            gap: 10px;
            font-weight: bold;
            border: 3px solid #ffffff4d;
            outline: none;
            overflow: hidden;
            font-size: 15px;
        }

        .icon {
            width: 24px;
            height: 24px;
            transition: all 0.3s ease-in-out;
        }

        .button:hover {
            transform: scale(1.05);
            border-color: #fff9;
        }

        .button:hover .icon {
            transform: translate(4px);
        }

        .button:hover::before {
            animation: shine 1.5s ease-out infinite;
        }

        .button::before {
            content: "";
            position: absolute;
            width: 100px;
            height: 100%;
            background-image: linear-gradient(
                    120deg,
                    rgba(255, 255, 255, 0) 30%,
                    rgba(255, 255, 255, 0.8),
                    rgba(255, 255, 255, 0) 70%
            );
            top: 0;
            left: -100px;
            opacity: 0.6;
        }

        @keyframes shine {
            0% {
                left: -100px;
            }

            60% {
                left: 100%;
            }

            to {
                left: 100%;
            }
        }

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


                String a_id = rs1.getString("a_id");
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
                                <li style="margin-right: 0px">Job Status:</li>
                               <%
                                   if("Panding".equals(JobStatus))
                                   {

                               %>
                                <li style="color: red;"><%=JobStatus%></li>
                                <%
                                    }
                                   else
                                    {


                                %>
                                <li style="color: forestgreen;"><%=JobStatus%></li>
                                <%
                                    }
                                %>

                            </ul>
                        </div>
                    </div>


                        <a  style="height: 50px;text-decoration: #f0f0f0" class="button" href=".?pname=ApplyInfo&a_id=<%=a_id%>">
                            View Apply
                            <svg fill="currentColor" viewBox="0 0 24 24" class="icon">
                                <path
                                        clip-rule="evenodd"
                                        d="M12 2.25c-5.385 0-9.75 4.365-9.75 9.75s4.365 9.75 9.75 9.75 9.75-4.365 9.75-9.75S17.385 2.25 12 2.25zm4.28 10.28a.75.75 0 000-1.06l-3-3a.75.75 0 10-1.06 1.06l1.72 1.72H8.25a.75.75 0 000 1.5h5.69l-1.72 1.72a.75.75 0 101.06 1.06l3-3z"
                                        fill-rule="evenodd"
                                ></path>
                            </svg>
                        </a>





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
