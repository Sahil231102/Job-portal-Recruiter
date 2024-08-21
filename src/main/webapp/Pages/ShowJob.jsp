<%@ page import="java.sql.Connection" %>
<%@ page import="DAO.MyDatabase" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        * {
            box-sizing: border-box;
            padding: 0;
            margin: 0;
        }

        :root {
            --purple: hsl(240, 80%, 89%);
            --pink: hsl(0, 59%, 94%);
            --light-bg: hsl(204, 37%, 92%);
            --light-gray-bg: hsl(0, 0%, 94%);
            --white: hsl(0, 0%, 100%);
            --dark: hsl(0, 0%, 7%);
            --text-gray: hsl(0, 0%, 30%);
        }

        body {
            background: var(--light-bg);
            font-family: "Space Grotesk", sans-serif;
            color: var(--dark);
        }

        h3 {
            font-size: 1.5em;
            font-weight: 700;
        }

        p {
            font-size: 1em;
            line-height: 1.7;
            font-weight: 300;
            color: var(--text-gray);
        }

        .description {
            white-space: wrap;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4 columns layout */
            gap: 24px;
            padding: 24px;
        }

        .box {
            display: flex;
            flex-direction: column;
            position: relative;
            padding: 24px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .box-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            object-position: 50% 20%;
            margin-bottom: 16px;
        }

        .box-title {
            margin-bottom: 8px;
        }

        .button {
            height: 40px;  /* Fixed height for the button */
            display: flex;  /* Flexbox for better alignment */
            justify-content: center;  /* Center the text horizontally */
            align-items: center;  /* Center the text vertically */
            padding: 10px;
            margin-top: auto;
            color: #000;
            background: transparent;
            box-shadow: 0px 0px 0px 1px black inset;
            transition: background 0.4s ease;
            text-align: center; /* Ensure text is centered */
        }

        .button:hover {
            background: var(--blue);
        }

        /* RESPONSIVE QUERIES */
        @media (max-width: 1024px) {
            .grid-container {
                grid-template-columns: repeat(2, 1fr); /* 2 columns layout for medium screens */
            }
        }

        @media (max-width: 640px) {
            .grid-container {
                grid-template-columns: 1fr; /* 1 column layout for small screens */
            }
        }

    </style>
    <title>Show Job</title>
</head>
<body>

<div class="grid-container">
    <%
        Connection con = MyDatabase.getConnection();
        Statement smt = con.createStatement();

        ResultSet rs = smt.executeQuery("select * from job_add ");

        while (rs.next())
        {
            String j_id = rs.getString("j_id");
            String  JobTitle = rs.getString("Job_Title");
            String EmploymentType = rs.getString("EmploymentType");
            byte[] pimg = rs.getBytes("PosterImg");
            String imgbyte = Base64.getEncoder().encodeToString(pimg);
            String pimges = "data:image/png;base64," + imgbyte;
    %>
    <div class="box">
        <img class="box-image" src="<%=pimges%>" alt="Job Image">
        <h3 class="box-title"><%=JobTitle%></h3>
        <p class="description">Employment Type: <%=EmploymentType%></p>
        <a href=".?pname=JobDetails&j_id=<%=j_id%>" class="button">View Details</a>
    </div>
    <%
        }
    %>
</div>

</body>
</html>
