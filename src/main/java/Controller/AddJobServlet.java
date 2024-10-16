package Controller;

import DAO.AddJobDB;

import Model.AddJobData;

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
import java.nio.file.Paths;

@WebServlet(name = "AddJobServlet", value = "/AddJobServlet")
@MultipartConfig
public class AddJobServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String r_id = req.getParameter("r_id");
        String jobTitle = req.getParameter("jobTitle");
        String JobCategories = req.getParameter("JobCategories");
        String Minsalary = req.getParameter("Minsalary");
        String Maxsalary = req.getParameter("Maxsalary");
        String EmploymentType = req.getParameter("EmploymentType");
        String Jobdesc = req.getParameter("jobdesc");
        String Qualification_skill = req.getParameter("Qualification_skill");
        String Benefits = req.getParameter("Benefits");
        Part Posterimg = req.getPart("Hpimg");
        InputStream inputStream1 = Posterimg.getInputStream();
        byte[] posterimg = readFile(inputStream1);
//        String imgname = extractFileName(cimg);
//        String imguploadpath = getServletContext().getRealPath("/") + "upload/" + imgname;
//        cimg.write(imguploadpath);

        AddJobData jobdata = new AddJobData(r_id, jobTitle, JobCategories,EmploymentType, Minsalary, Maxsalary, Jobdesc, Qualification_skill, Benefits, posterimg);
        AddJobDB jDB = new AddJobDB();
        boolean insert = jDB.insertJob(jobdata);

        System.out.println(insert);
        if (insert) {
            resp.sendRedirect("./?pn=AJ&s=AddJOB");
        }
        else
        {
            resp.sendRedirect("./?pn=AJ&s=NOTAddJOB");

        }

    }

    private byte[] readFile(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[1024];
        while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
            byteArrayOutputStream.write(data, 0, nRead);

        }
        return byteArrayOutputStream.toByteArray();
    }
//    private String extractFileName(Part part)
//    {
//        String contentDisp = part.getHeader("content-disposition");
//        String[] items = contentDisp.split(";");
//        for (String s : items)
//        {
//            if(s.trim().startsWith("filename"))
//            {
//                return s.substring(s.indexOf("=") + 2, s.length() - 1);
//            }
//        }
//        return "";
//    }
}