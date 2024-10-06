<%@ page import="java.sql.Connection" %>
<%@ page import="DAO.MyDatabase" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="./RecruiterStyle/Doc/css/style.css">
    <link rel="stylesheet" href="./RecruiterStyle/Doc/css/main.css">
    <link rel="stylesheet" href="./RecruiterStyle/core.css">
    <link rel="stylesheet" href="./RecruiterStyle/Doc/css/main.css">
    <link rel="stylesheet" href="./RecruiterStyle/style.css">
    <title>Add Jobs</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <style>
        h4{
            font-family: 'Josefin Sans', sans-serif;
        }
    </style>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    String R_Email = null;
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("Vem".equals(cookie.getName())) {
                R_Email = cookie.getValue();
                System.out.println(R_Email);
                break;
            }
        }
    }
%>
<%


    try
    {
        Connection con = MyDatabase.getConnection();
        PreparedStatement psmt = con.prepareStatement("select * from recuruiter where Email= ?");
        psmt.setString(1,R_Email);
        ResultSet rs = psmt.executeQuery();

        while(rs.next())
        {
            String id = rs.getString("r_id");

%>
<div class="pd-ltr-20 xs-pd-20-10" style="display: flex; justify-content: center;">
    <div class="max-width-1000" style="width: 100%; max-width: 1000px;">
        <div class="pd-20 card-box mb-30">
            <div class="clearfix">
                <h4 class="text-blue h4">Add Jobs</h4>
            </div>
            <div class="wizard-content">
                <form id="jobForm" action="AddJobServlet" method="post" enctype="multipart/form-data">
                    <section>
                        <input type="hidden" value="<%=id%>" name="r_id">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Job Title :</label>
                                    <input type="text" name="jobTitle" class="form-control" required/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div style="padding: 0px" class="container">
                                        <label>Employment Type:</label>
                                        <div class="select">
                                            <select name="EmploymentType" class="form-control" required>
                                                <option value="">Select Type</option>
                                                <option value="Full Time">Full Time</option>
                                                <option value="Part Time">Part Time</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Enter Minimum Salary :</label>
                                    <input type="number" name="Minsalary" class="form-control"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Enter Maximum Salary :</label>
                                    <input type="number" name="Maxsalary" class="form-control"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!-- Additional fields can go here -->
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div style="padding: 0px" class="container">
                                        <label>Hiring Poster :</label>
                                        <input type="file" name="Hpimg" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div style="padding: 0px" class="container">
                                        <label>Fields:</label>
                                        <div class="select">
                                            <select name="EmploymentType" class="form-control" required>
                                                <option value="">Select Job Fields</option>
                                                <option value="Information technology">Information technology</option>
                                                <option value=""></option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Job Description :</label>
                                    <textarea name="jobdesc" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Qualification And Skill :</label>
                                    <textarea name="Qualification_skill" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Benefits :</label>
                                    <textarea name="Benefits" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>
                    </section>
                    <button class="btn btn-primary" type="submit" id="buttonsubmit" name="submit">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%
        }

    }catch (Exception e)
        {
            e.printStackTrace();
        }
%>
<script>

</script>
<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        $("#buttonsubmit").click(function(event) {--%>
<%--            event.preventDefault(); // Prevent the default form submission--%>
<%--            var form = $("#jobForm")[0];--%>
<%--            var formData = new FormData(form);--%>

<%--            $.ajax({--%>
<%--                type: "POST",--%>
<%--                url: "AddJobServlet",--%>
<%--                data: formData,--%>
<%--                processData: false,--%>
<%--                contentType: false,--%>
<%--                success: function(response) {--%>
<%--                    swal("Success", "Form submitted successfully!", "success");--%>
<%--                },--%>
<%--                error: function(xhr, status, error) {--%>
<%--                    swal("Error", "There was an error submitting the form: " + xhr.responseText, "error");--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>