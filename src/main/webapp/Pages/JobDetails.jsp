<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %>
<%@ page import="DAO.MyDatabase" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        table {
            font-family:'Josefin Sans',sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }

        .job-details {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .job-card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            flex: 1;
            min-width: 250px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .company-logo {
            width: 80px;
            height: auto;
            margin-bottom: 10px;
        }

        .job-card h2 {
            color: #007bff;
            font-size: 1.5em;
            margin-bottom: 10px;
            text-align: center;
        }

        .job-card p {
            color: #6c757d;
            margin: 5px 0;
            text-align: center;
        }

        .job-card p strong {
            color: #343a40;
        }

    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Information</title>
    <link rel="stylesheet" href="../RecruiterStyle/style.css">
    <link rel="stylesheet" href="../RecruiterStyle/Doc/css/style.css">
</head>
<body>

<%
    String id = request.getParameter("j_id");

    if(id == null || id.isEmpty()) {
        id = "1";
    }
%>
<%
    try {
        Connection con = MyDatabase.getConnection();
        PreparedStatement psmt = con.prepareStatement("SELECT * FROM job_add WHERE j_id = ?");
        psmt.setString(1, id);
        ResultSet rs = psmt.executeQuery();
        if (rs.next()) {
            int job_id = rs.getInt("j_id");
            String Job_Title = rs.getString("Job_Title");
            String EmploymentType = rs.getString("EmploymentType");
            String MinSalary = rs.getString("Minsalary");
            String MaxSalary = rs.getString("Maxsalary");
            String jobdes = rs.getString("JobDescripton");
            String Qualification_and_Skill = rs.getString("Qualification_and_Skill");
            String Benefits = rs.getString("Benefits");
            String AddDate = rs.getString("JobAddDate");
            byte[] pimg = rs.getBytes("PosterImg");
            String imgByte = Base64.getEncoder().encodeToString(pimg);
            String pimgs = "data:image/png;base64," + imgByte;
%>
<div class="container">
    <section class="job-details">
        <div class="job-card">
            <table>
                <tr>
                    <th colspan="2" style="text-align: center;font-weight: bold;font-size: 25px;color: #0c5460">Job Information</th>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <img src="<%=pimgs%>" alt="Avatar" style="width:200px; border-radius:10%;">
                    </td>
                </tr>
                <tr>
                    <td>Job Title</td>
                    <td><%=Job_Title%></td>
                </tr>
                <tr>
                    <td>Employment Type</td>
                    <td><%=EmploymentType%></td>
                </tr>
                <tr>
                    <td>Salary</td>
                    <td><%=MinSalary%> - <%=MaxSalary%></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><%=jobdes%></td>
                </tr>
                <tr>
                    <td>Benefits</td>
                    <td><%=Benefits%></td>
                </tr>
                <tr>
                    <td>Qualification and Skill</td>
                    <td><%=Qualification_and_Skill%></td>
                </tr>
                <tr>
                    <td>Add Date</td>
                    <td><%=AddDate%></td>
                </tr>
            </table>
        </div>
    </section>
</div>

<div class="row" style="display: flex; justify-content: space-around; padding: 30px;">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal">Update</button>

    <!-- Update Modal -->
    <form action="/JobUpdateServlet" method="POST" id="updateform" enctype="multipart/form-data">
        <div class="modal" id="updateModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Update Job</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="hidden" name="id" class="form-control" placeholder="ID" value="<%=job_id%>" readonly>
                        </div>
                        <div class="form-group">
                            <input type="text" name="job_Name" class="form-control" placeholder="Job Name" value="<%=Job_Title%>"/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="email" class="form-control" placeholder="Employment Type" value="<%=EmploymentType%>"/>
                        </div>
                        <div class="form-group">
                            <input type="tel" name="phone" class="form-control" maxlength="10" placeholder="Phone Number" value=""/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="city" class="form-control" placeholder="City" value=""/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="state" class="form-control" placeholder="State" value=""/>
                        </div>
                        <div class="form-group">
                            <input type="text" name="salary" class="form-control" placeholder="Salary" value=""/>
                        </div>
                        <div class="form-group">
                            <input type="date" name="startDate" class="form-control" placeholder="Start Date" value=""/>
                        </div>
                        <div class="form-group">
                            <input type="date" name="endDate" class="form-control" placeholder="End Date" value=""/>
                        </div>
                        <div class="form-group">
                            <select name="jobType" class="form-control-range">
                                <option value="">Select Job Type</option>
                                <option value="Full Time">Full Time</option>
                                <option value="Part Time">Part Time</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" name="JobAdder" class="form-control" value="<%=Job_Title%>" readonly/>
                        </div>
                        <div class="form-group">
                            <textarea name="JobDescription" class="form-control" placeholder="Job Description"></textarea>
                        </div>
                        <div class="form-group">
                            <input type="file" name="cimg" class="form-control"/>
                        </div>
                    </div>
                    <!-- Modal Footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Update</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">Delete</button>

    <!-- Delete Modal -->
    <form action="./JobDeleteServlet" method="POST" id="deleteForm">
        <div class="modal" id="deleteModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Delete Job</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <h6 style="color: #cb4b16">Are You Sure You Want to Delete This Job?</h6>
                    </div>
                    <!-- Modal Footer -->
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<%= job_id %>">
                        <button type="submit" class="btn btn-primary">Yes</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <button class="btn btn-outline-dark" type="submit" id="buttonback" name="back">
        <a href="./?pn=jobDetails">Back</a>
    </button>
</div>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
