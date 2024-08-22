package Controller;

import DAO.JobUpadateDB;
import Model.JobUpdateModel;
import Model.JobUpdateModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;


@WebServlet(name = "JobUpdateServlet", value = "/JobUpdateServlet")
@MultipartConfig
public class JobUpdateServlet extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String j_id = req.getParameter("j_id");
        String Job_Title = req.getParameter("Job_Title");
        String EmploymentType = req.getParameter("EmploymentType");
        String MaxSalary = req.getParameter("MaxSalary");
        String MinSalary = req.getParameter("MinSalary");
        String JobDescription = req.getParameter("JobDescription");
        String Benefits = req.getParameter("Benefits");
        String Qualification_and_skill = req.getParameter("Qualification_and_skill");

        Part pimg = req.getPart("pimg");

        InputStream inputStream = pimg.getInputStream();
        byte[] newcimgs = readByteFromInputstream(inputStream);



        // Create JobUpdateModel object
        JobUpdateModel jobUpdateModel = new JobUpdateModel(j_id,Job_Title,EmploymentType,MinSalary,MaxSalary,JobDescription,Benefits,Qualification_and_skill,  newcimgs);

        // Update job in the database
        JobUpadateDB jDB = new JobUpadateDB();
        boolean updateJob = jDB.updatejob(jobUpdateModel);
        System.out.println(j_id);
        System.out.println(Job_Title);
        System.out.println(EmploymentType);
        System.out.println(MaxSalary);
        System.out.println(MinSalary);
        System.out.println(JobDescription);
        System.out.println(Benefits);
        System.out.println(Qualification_and_skill);
System.out.println(updateJob);
        // Redirect based on update result
        if (updateJob) {
            System.out.println("Successfully updated job");
            resp.sendRedirect("./?pname=ShowAllJob");
        } else {
            System.out.println("Failed to update job");
            resp.sendRedirect("./?pname=JobDetails");
        }

    }
    private byte[] readByteFromInputstream(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int  ByteRead;
        byte[] data = new byte[1024];
        while((ByteRead=inputStream.read(data,0, data.length))!=-1)
        {
            buffer.write(data,0,ByteRead);
        }
        return buffer.toByteArray();
    }

}
