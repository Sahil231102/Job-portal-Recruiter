<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="DAO.MyDatabase" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 05-06-2024
  Time: 07:00 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;600;700&display=swap');

        .container {
            width: 1200px;
            padding: 0;
            margin: 0 auto;
        }

        .gradient-cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3 columns */
            grid-template-rows: repeat(3, 1fr); /* 3 rows */
            gap: 32px;
            padding: 30px;
        }

        .container-title {
            text-align: center;
            margin-bottom: 40px;
            font-size: 40px;
            color: #fff;
            font-weight: 600;
            line-height: 60px;
        }

        .card {
            text-wrap: nowrap;
            max-width: 350px;
            border: 0;
            width: 100%;
            margin-inline: auto;
        }

        .container-card {
            position: relative;
            border: 2px solid transparent;
            background: linear-gradient(71deg, #080509, #1a171c, #080509);
            background-clip: padding-box;
            border-radius: 45px;
            padding: 40px;
        }

        .bg-green-box::after,
        .bg-white-box::after,
        .bg-yellow-box::after,
        .bg-blue-box::after {
            position: absolute;
            top: -1px;
            bottom: -1px;
            left: -1px;
            right: -1px;
            content: "";
            z-index: -1;
            border-radius: 45px;
        }

        .bg-green-box::after {
            background: linear-gradient(71deg, #0d1212, #3da077, #0d1212);
        }

        .bg-white-box::after {
            background: linear-gradient(71deg, #121013, #b0afb0, #121013);
        }

        .bg-yellow-box::after {
            background: linear-gradient(71deg, #110e0e, #afa220, #110e0e);
        }

        .bg-blue-box::after {
            background: linear-gradient(71deg, #0c0a0e, #5f6fad, #0c0a0e);
        }

        .card-title {
            font-weight: 600;
            color: white;
            letter-spacing: -0.02em;
            line-height: 40px;
            font-style: normal;
            font-size: 28px;
            padding-bottom: 8px;
        }

        .card-description {
            font-weight: 600;
            line-height: 32px;
            color: hsla(0, 0%, 100%, 0.5);
            font-size: 16px;
            max-width: 470px;
        }
        .card img {
            width: 70px; /* Fixed width */
            height: 70px; /* Fixed height */
            border-radius: 50%; /* Optional: Make the image circular */
            margin-bottom: 15px; /* Space between image and title */
        }
    </style>
</head>
<body>

<div class="pd-ltr-20 xs-pd-20-10">
    <div class="min-height-200px">
        <div class="container pd-0">


            <div class="contact-directory-list">
                <div class="gradient-cards">
                    <% try {
                        Connection con = MyDatabase.getConnection();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from job_add ");
                        while (rs.next()) {
                            String job_Title = rs.getString("Job_Title");
                            String job_Description = rs.getString("JobDescripton");
                            String employentType = rs.getString("EmploymentType");
                            String Minsalary = rs.getString("Minsalary");
                            String Maxsalary = rs.getString("Maxsalary");
                            String QS = rs.getString("Qualification_and_Skill");
                            String Benefits = rs.getString("Benefits");
                            byte[] pimg = rs.getBytes("PosterImg");
                            String imgByte = Base64.getEncoder().encodeToString(pimg);
                            String pimgs = "data:image/png;base64," + imgByte;
                    %>
                    <div class="card">
                        <div class="container-card bg-blue-box">
                            <div class="row" style="display: flex; align-items: center; margin-bottom: 20px;">
                                <img src="<%= pimgs %>" style=" border-radius: 50%; margin-right: 15px;" alt="Job Poster Image"/>
                                <h6 style="margin: 0; font-size: 18px; font-weight: 600; color: #FFFFFF;"><%= job_Title %></h6>
                            </div>

                            <p class="card-title"><%= job_Title %></p>
                            <p class="card-description"><%= job_Description %></p>
                        </div>
                    </div>
                    <% }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } %>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
