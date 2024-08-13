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

    <STYLE>
        .overflow-text {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            width: 200px;
            color: #0fd850;
            padding: 10px;
        }
        .container {
            max-width: 1232px;
            width: 100%;
            padding: 0 50px;

        }

        .logo a {
            display: flex;
            align-items: center;
            font-size: 24px;
            font-weight: 700;
        }

        .logo a img {
            max-width: 44px;
        }

        .logo a span {
            color: #E1E4E8;
            margin-left: 12px;
        }

        .layout-card-frame {
            display: flex;
            flex-direction: column;
            height: 100vh;
        }
        .layout-card-frame.layout-card-frame--light .layout-card-body{
            background: #0fd850;
        }

        .layout-card-header {
            height: 80px;
            flex-shrink: 0;
            background: #24292E;
            border-bottom: 1px solid #1B1F23;
        }

        .layout-card-header .container {
            display: inline-block;
            align-items: center;
            justify-content: space-between;
            height: 100%;
        }
        .layout-card-body {
            height: 100%;
            overflow: auto;

            display: grid;
            place-items: center;
            padding: 25px;

            font-family: 'Inter', sans-serif;
        }
        .layout-card-wrap{
            width: 100%;
        }
    </STYLE>
</head>
<body>

<div class="pd-ltr-20 xs-pd-20-10">
    <div class="min-height-200px">
        <div class="container pd-0">
            <div class="page-header">
                <div class="row">
                    <div class="col-md-12 col-sm-12">
                        <div class="title">
                            <h4>Job Details</h4>
                        </div>

                    </div>
                </div>
            </div>

            <div class="contact-directory-list">
                <%
                    try {

                        Connection con = MyDatabase.getConnection();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("select * from job_add ");
                        int count = 0;
                        while (rs.next()) {

                            String company_Name = rs.getString("company_Name");
                            String job_Title = rs.getString("Job_Title");
                            String job_Description = rs.getString("JobDescription");
                            String employentType = rs.getString("EmploymentType");
                            String Minsalary = rs.getString("Minsalary");
                            String Maxsalary = rs.getString("Maxsalary");
                            String QS = rs.getString("Qualification_and_Skill");
                            String Benefits = rs.getString("Benefits");
                            byte[] pimg = rs.getBytes("PosterImg");
                            String imgByte = Base64.getEncoder().encodeToString(pimg);
                            String pimgs = "data:image/png;base64," + imgByte;



                            if (count % 3 == 0) {
                                if (count != 0) {
                %>
                </ul>
                <%
                    }
                %>
                <ul class="row">
                    <%
                        }
                    %>
                    <div class="col-12 col-sm-6 col-md-4">
                        <div class="layout-card-body">
                            <div class="layout-card-wrap">
                                <!-- Card HTML Start -->
                                <div class="card3">
                                    <div class="card__header">
                                        <div class="card-badges">
                                            <span class="badge badge-light" style="color: green;font-weight: bold">Active</span>
                                        </div>

                                        <div class="card-badges">
                                            <span class="badge badge-light" style="color: red;font-weight: bold"><A href="./?pn=jobinfo&job_id=<%="job_id"%>">View</A></span>
                                        </div>

                                    </div>
                                    <div class="card__body">
                                        <div class="user-info">
                                            <div class="avatar">
                                                <div class="img-box">
                                                    <img src="<%=pimgs%>" width="70" height="60" alt="">
                                                </div>
                                            </div>
                                            <div class="name" style="font-family: 'Josefin Sans', sans-serif;font-size: 30px">
                                                <span><%=company_Name%></span>
                                                <h6 style="color: #cb4b16"><%=job_Title%></h6>
                                            </div>
                                        </div>
                                        <div class="overflow-text" style="font-family: 'Josefin Sans', sans-serif;font-size: 20px;max-lines: none" ><%=job_Description%></div>
                                    </div>

                                    <div class="card__footer" style="font-family: 'Josefin Sans', sans-serif;font-size: 20px">
                                        <%="startDate"%>
                                    </div>

                                </div>
                                <!-- Card HTML End -->
                            </div>
                        </div>
                    </div>
                    <%
                            count++;
                        }
                        if (count % 3 != 0) {
                    %>
                </ul>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>


        </div>

    </div>

</div>


</body>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" crossorigin="anonymous"--%>
<%--        referrerpolicy="no-referrer"></script>--%>
<%--<script src="../../assets/js/alpinejs.min.js"></script>--%>
</html>
