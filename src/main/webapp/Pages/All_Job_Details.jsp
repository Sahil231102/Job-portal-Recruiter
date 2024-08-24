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
    String id = request.getParameter("j_id");

    if(id == null || id.isEmpty()) {
        id = "1";
    }
%>
<%
    try {
        Connection con = MyDatabase.getConnection();
        PreparedStatement psmt = con.prepareStatement("SELECT * FROM job_add inner join recuruiter on job_add.r_id = recuruiter.r_id  WHERE j_id = ?");
        psmt.setString(1, id);
        ResultSet rs = psmt.executeQuery();
        if (rs.next()) {
            int job_id = rs.getInt("j_id");
            String CompanyName =rs.getString("Company_Name");
            String Job_Title = rs.getString("Job_Title");
            String EmploymentType = rs.getString("EmploymentType");
            String MinSalary = rs.getString("Minsalary");
            String MaxSalary = rs.getString("Maxsalary");
            String jobdes = rs.getString("JobDescripton");
            String Qualification_and_Skill = rs.getString("Qualification_and_Skill");
            String Benefits = rs.getString("Benefits");
            String AddDate = rs.getString("JobAddDate");
            byte[] cimg = rs.getBytes("Cimg");
            String imgByte = Base64.getEncoder().encodeToString(cimg);
            String cimgs = "data:image/png;base64," + imgByte;
            byte[] pimg = rs.getBytes("PosterImg");
            String imgByte1 = Base64.getEncoder().encodeToString(pimg);
            String pimgs = "data:image/png;base64," + imgByte1;
%>
<div class="container">
    <section class="job-details">
        <div class="job-card">
            <table>
                <tr>
                    <th colspan="2" style="text-align: center;font-weight: bold;font-size: 25px;color: #0c5460">Job Information</th>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: start; display: flex; align-items: center;">
                        <img src="<%=cimgs%>" alt="Avatar" style="width:50px; height:50px; object-fit: cover; border-radius:50%; margin-right: 10px;">
                        <h3 style="margin: 0; font-size: 18px; font-weight: bold"><%=CompanyName%></h3>
                    </td>
                    <td>

                    </td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align: center">
                        <img src="<%=pimgs%>" alt="Avatar" style="width:500px;object-fit: cover; border-radius:10%;">
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


    <button class="btn btn-outline-dark"  type="submit" id="buttonback" name="back">
        <a   style="color: white" href="./?pname=ShowAllJob">Back</a>
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
