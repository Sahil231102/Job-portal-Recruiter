<%@ page import="DAO.MyDatabase" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.swing.plaf.nimbus.State" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11-07-2024
  Time: 02:15 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CSS User Profile Card</title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');

        *{
            margin: 5px;
            padding: 0;
            box-sizing: border-box;
            list-style: none;
            font-family: 'Josefin Sans', sans-serif;
        }

        body{
            background-color: #f0f0f0;


        }

        .wrapper1{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 850px;
            height: 400px;
            display: flex;
            box-shadow: 0 1px 20px 0 rgba(69,90,100,.08);
        }

        .wrapper1 .left{
            width: 45%;
            background: linear-gradient(to right,#0b132b,#353c4e);
            padding: 30px 25px;
            border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
            text-align: center;
            color: #fff;
        }

        .wrapper1 .left img{
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .wrapper1 .left h4{
            margin-bottom: 10px;
        }

        .wrapper1 .left p{
            font-size: 15px;
        }

        .wrapper1 .right{
            width: 65%;
            background: #fff;
            padding: 30px 25px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
        }

        .wrapper1 .right .info,
        .wrapper1 .right .projects{
            margin-bottom: 0px;
        }

        .wrapper1 .right .info h3,
        .wrapper1 .right .projects h3{
            margin-bottom: 15px;
            padding-bottom: 5px;
            border-bottom: 1px solid #e0e0e0;
            color: #353c4e;
            text-transform: uppercase;
            letter-spacing: 5px;
        }

        .wrapper1 .right .info_data,
        .wrapper1 .right .projects_data{
            display: flex;
            justify-content: space-between;
        }

        .wrapper1 .right .info_data .data,
        .wrapper1 .right .projects_data .data{
            width: 45%;
        }

        .wrapper1 .right .info_data .data h4,
        .wrapper1 .right .projects_data .data h4{
            color: #353c4e;
            margin-bottom: 5px;
        }

        .wrapper1 .right .info_data .data p,
        .wrapper1 .right .projects_data .data p{
            font-size: 13px;
            margin-bottom: 10px;
            color: #919aa3;
        }

        .wrapper1 .social_media ul{
            display: flex;
        }

        .wrapper1 .social_media ul li{
            width: 45px;
            height: 45px;
            background: linear-gradient(to right,#0b132b,#353c4e);
            margin-right: 10px;
            border-radius: 5px;
            text-align: center;
            line-height: 45px;
        }

        .wrapper1 .social_media ul li a{
            color :#fff;
            display: block;
            font-size: 18px;
        }
        .main{

            position:relative ;
        }

    </style>




    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>


<div class="main">


<div class="wrapper1">
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

            if(rs.next())
            {
               String cname=rs.getString("Company_Name");
               String email=rs.getString("Email");
               String phone =rs.getString("Phone_Number");
               String address=rs.getString("Address");
               String city=rs.getString("City");
               String state=rs.getString("State");
               String country=rs.getString("Country");
               String recuruiterDate=rs.getString("RecuruiterDate");
                byte[] cimg = rs.getBytes("Cimg");
                String imgbyte = Base64.getEncoder().encodeToString(cimg);
                String cimges = "data:image/png;base64," + imgbyte;
//                String cimg = rs.getString("Aimg");




    %>
    <div class="left">
        <img src="<%=cimges%>"
             alt="user" width="200">
        <h5 style="color: #f0f0f0;font-size: 18px"><%=cname%> </h5>

    </div>
    <div class="right">
        <div class="info">
            <h4>Information</h4>
            <hr>
            <div class="info_data">
                <div class="data">
                    <h5>Email</h5>
                    <p><%=email%></p>
                </div>
                <div class="data">
                    <h5>Phone</h5>
                    <p><%=phone%></p>
                </div>
            </div>
        </div>

        <div class="projects">

            <div class="projects_data">
                <div class="data">
                    <h5>Address</h5>
                    <p><%=address%></p>
                </div>
                <div class="data">
                    <h5>City</h5>
                    <p><%=city%></p>
                </div>
            </div>
        </div>
        <div class="projects" style="padding: 0;">
            <div class="projects_data">
                <div class="data">
                    <h5>State</h5>
                    <p><%=state%></p>
                </div>
                <div class="data">
                    <h5>Country</h5>
                    <p><%=country%></p>
                </div>
            </div>
        </div>
        <div class="projects">

            <div class="projects_data">
                <div class="data">
                    <h5>SignUp Date</h5>
                    <p><%=recuruiterDate%></p>
                </div>

            </div>
        </div>

        <%
                }
            }
            catch (Exception exception)
            {
                exception.printStackTrace();
            }
        %>

        <div class="social_media">
            <ul>
                <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                <li><a href="#"><i class="fab fa-instagram"></i></a></li>
            </ul>
        </div>
    </div>
</div>

</div>
</body>
</html>
