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

        /* <select> styles */
        select {
            background-color: black;
            /* Reset */
            appearance: none;
            border: 0;
            outline: 0;
            font: inherit;
            /* Personalize */
            width: 20rem;
            padding: 1rem 4rem 1rem 1rem;
            background: var(--arrow-icon) no-repeat right 0.8em center / 1.4em,
            linear-gradient(to left, var(--arrow-bg) 3em, var(--select-bg) 3em);
            color: black;
            border-radius: 0.25em;
            box-shadow: 0 0 1em 0 rgba(0, 0, 0, 0.2);
            cursor: pointer;
            /* Remove IE arrow */
            &::-ms-expand {
                display: none;
            }
            /* Remove focus outline */
            &:focus {
                outline: none;
            }
            /* <option> colors */
            option {
                color: inherit;
                background-color: var(--option-bg);
            }
        }

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
    String id = request.getParameter("a_id");

    if(id == null || id.isEmpty()) {
        id = "1";
    }
%>
<%
    try {
        Connection con = MyDatabase.getConnection();
        PreparedStatement psmt = con.prepareStatement("SELECT * FROM job_apply inner join seeker on seeker.s_id=job_apply.s_id   inner join job_add on job_apply.j_id = job_add.j_id  WHERE a_id = ?");
        psmt.setString(1, id);
        ResultSet rs = psmt.executeQuery();
        if (rs.next()) {
            int job_id = rs.getInt("a_id");
            String Job_Title = rs.getString("Job_Title");
            String fname = rs.getString("fname");
            String lname = rs.getString("lname");
            String status = rs.getString("JobStatus");
            String Gender = rs.getString("Gender");
            String JobApplyDate = rs.getString("JobApplyDate");
            byte[] simg = rs.getBytes("simg");
            String imgByte = Base64.getEncoder().encodeToString(simg);
            String simgs = "data:image/png;base64," + imgByte;
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
                        <img src="<%=simgs%>" alt="Avatar" style="width:200px;height: 200px; object-fit: cover;border-radius:10%;">
                    </td>
                </tr>
                <tr>
                    <td>Job Title</td>
                    <td><%=Job_Title%></td>
                </tr>
                <tr>
                    <td>Seeker Name:</td>
                    <td><%=fname%> <%=lname%></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><%=Gender%></td>
                </tr>
                <tr>
                    <td>Job Apply Date:</td>
                    <td><%=JobApplyDate%></td>
                </tr>
                <tr>
                    <td>Job Status:</td>
                    <td><%=status%></td>
                </tr>

            </table>
        </div>
    </section>
</div>

<div class="row" style="display: flex; justify-content: space-around; padding: 30px;">
<%--    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateModal">Update</button>--%>

<%--    <!-- Update Modal -->--%>
<%--    <form action="JobUpdateServlet" method="POST" id="updateform" enctype="multipart/form-data">--%>
<%--        <div class="modal" id="updateModal">--%>
<%--            <div class="modal-dialog">--%>
<%--                <div class="modal-content">--%>
<%--                    <!-- Modal Header -->--%>
<%--                    <div class="modal-header">--%>
<%--                        <h4 class="modal-title">Update Job</h4>--%>
<%--                        <button type="button" class="close" data-dismiss="modal">&times;</button>--%>
<%--                    </div>--%>
<%--                    <!-- Modal Body -->--%>
<%--                    <div class="modal-body">--%>
<%--                        <div class="form-group">--%>

<%--                            <input type="hidden" name="j_id" class="form-control" placeholder="j_id" value="<%=job_id%>" readonly>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label >Job Title</label>--%>
<%--                            <input type="text" name="Job_Title" class="form-control" placeholder="Job Name" value="<%=Job_Title%>"/>--%>
<%--                        </div>--%>

<%--                        <div class="form-group">--%>
<%--                            <label for="pet-select">Employment Type</label>--%>
<%--                            <select name="EmploymentType" id="pet-select" class="form-control">--%>
<%--                                <option value="" disabled selected>--Please choose Employment Type--</option>--%>
<%--                                <option value="Full Time">Full Time</option>--%>
<%--                                <option value="Part Time">Part Time</option>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                        <label >MinSalary</label>--%>
<%--                        <div class="form-group">--%>
<%--                            <input type="number" name="MinSalary" class="form-control" maxlength="10" placeholder="<%=MinSalary%>" value=""/>--%>
<%--                        </div>--%>
<%--                        <label >Max Salary</label>--%>
<%--                        <div class="form-group">--%>
<%--                            <input type="number" name="MaxSalary" class="form-control" placeholder="MaxSalary" value="<%=MaxSalary%>"/>--%>
<%--                        </div>--%>
<%--                        <label >Job Description</label>--%>
<%--                        <div class="form-group">--%>
<%--                            <input type="text" name="JobDescription" class="form-control" placeholder="jo" value="<%=jobdes%>"/>--%>
<%--                        </div>--%>
<%--                        <label >Benefits</label>--%>
<%--                        <div class="form-group">--%>
<%--                            <input type="text" name="Benefits" class="form-control" placeholder="Salary" value="<%=Benefits%>"/>--%>
<%--                        </div>--%>
<%--                        <label >Qualification_and_skill </label>--%>
<%--                        <div class="form-group">--%>
<%--                            <input type="text" name="Qualification_and_skill" class="form-control" placeholder="Start Date" value="<%=Qualification_and_Skill%>"/>--%>
<%--                        </div>--%>
<%--                        <label >Job Title</label>--%>
<%--                        <div class="form-group">--%>
<%--                            <input type="file" name="pimg" class="form-control"/>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Modal Footer -->--%>
<%--                    <div class="modal-footer">--%>
<%--                        <button type="submit" class="btn btn-primary">Update</button>--%>
<%--                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </form>--%>

    <button type="button" class=" btn-success" data-toggle="modal" data-target="#deleteModal">Approve Job</button>

    <!-- Delete Modal -->
    <form action="ApplyStatusServlet" method="POST" enctype="multipart/form-data" id="deleteForm">
        <div class="modal" id="deleteModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Approve Job</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <h6 style="color: #cb4b16">Are You Sure You Want to Approve This Job?</h6>
                    </div>
                    <!-- Modal Footer -->
                    <div class="modal-footer">
                        <input type="hidden" name="id" value="<%=id%>">
                        <input type="hidden" name="status" value="Approve">
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
