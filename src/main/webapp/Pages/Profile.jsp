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
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');




        .card {
            box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
            background-color: #e2e8f0;
            border-radius: .25rem;
            display: flex;
            flex-direction: column;
            padding: 20px;
            width: 100%;
            max-width: 800px;
            padding-bottom: 0px;
        }

        .card-body {
            flex: 1;
            padding: 1rem;
        }

        .row {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        hr {
            margin: 0.5rem 0;
            border: 0;
            border-top: 1px solid rgba(0,0,0,.1);
        }


    </style>




    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>


<div class="main">
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
                String rid = rs.getString("r_id");
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
    <div class="container">
    <div class="main-body">

        <!-- Breadcrumb -->

        <!-- /Breadcrumb -->

        <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img  style=" border-style: solid;" src="<%=cimges%>" alt="Admin" class="rounded-circle" width="150">
                            <div class="mt-3">
                                <h4><%=cname%></h4>


                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body">
                        <h4 style="font-weight: bold">Information</h4>
                        <hr>
                        <div class="row">

                            <div style="text-wrap: nowrap " class="col-sm-3">
                                <h6 class="mb-0">Email</h6>
                            </div>
                            <div class="col-sm-4 text-black-50" style="text-wrap: nowrap">
                                <%=email%>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Phone Number</h6>
                            </div>
                            <div class="col-sm-4 text-black-50">
                                <%=phone%>
                            </div>
                        </div>
                        <hr>
                        <div class="row" >
                            <div class="col-sm-3">
                                <h6 class="mb-0">Address</h6>
                            </div>
                            <div style="text-wrap: nowrap " class="col-sm-4 text-black-50">
                               <%=address%>
                            </div>
                        </div>
                        <hr>
                        <div style="text-wrap: nowrap "  class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">City</h6>
                            </div>
                            <div style="text-wrap: nowrap "  class="col-sm-4 text-black-50">
                               <%=city%>
                            </div>
                        </div>
                        <hr>
                        <div style="text-wrap: nowrap "  class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">State</h6>
                            </div>
                            <div class="col-sm-4 text-black-50">
                                <%=state%>
                            </div>
                        </div>
                        <hr>
                        <div style="text-wrap: nowrap "  class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Country</h6>
                            </div>
                            <div class="col-sm-4 text-black-50">
                               <%=country%>
                            </div>
                        </div>
                       <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <h6 class="mb-0">SignUp Date</h6>
                            </div>
                            <div class="col-sm-4 text-black-50">
                                <%=recuruiterDate%>
                            </div>
                        </div>
                        <hr>

                        <div class="row">
                            <div class="col-sm-6">
                                <!-- This button will open the modal -->
                                <a class="btn btn-outline-dark" data-toggle="modal" data-target="#exampleModal">Edit Profile</a>
                            </div>
                            <div class="col-sm-6">
                                <a class="btn btn-danger" target="__blank" href="">Logout Account</a>
                            </div>
                        </div>
                        <form enctype="multipart/form-data" method="post" action="./profileUpdateServlet">
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Update profile</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>

                                        <input type="hidden" class="form-control" name="id" value="<%=rid%>" readonly />

                                        <div class="modal-body">
                                            <label>Company name</label>
                                            <input type="text" class="form-control" name="company_name" value="<%=cname%>" />
                                        </div>
                                        <div class="modal-body">
                                            <label>Phone Number</label>
                                            <input type="tel" maxlength="10" class="form-control" name="phone" value="<%=phone%>" />
                                        </div>
                                        <div class="modal-body">
                                            <label>Address</label>
                                            <input type="text" class="form-control" name="address" value="<%=address%>" />
                                        </div>
                                        <div class="modal-body">
                                            <label>City</label>
                                            <input type="text" class="form-control" name="city" value="<%=city%>" />
                                        </div>
                                        <div class="modal-body">
                                            <label>State</label>
                                            <input type="text" class="form-control" name="state" value="<%=state%>" />
                                        </div>
                                        <div class="modal-body">
                                            <label>Country</label>
                                            <input type="text" class="form-control" name="country" value="<%=country%>" />
                                        </div>
                                        <div class="modal-body">
                                            <label>Choose Images</label>
                                            <input type="file" class="form-control" name="updateimg" value="" />
                                        </div>
                                        <div class="modal-footer">
                                            <!-- Corrected button type to submit -->
                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>


                    </div>
                </div>
            </div>
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

</body>

</html>
