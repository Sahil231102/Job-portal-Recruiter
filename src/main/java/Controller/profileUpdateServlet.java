package Controller;


import DAO.ProfileUpdateDB;
import Model.ProfileUpdateModel;

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
import java.util.Date;


@WebServlet(name = "profileUpdateServlet",value = "/profileUpdateServlet")
@MultipartConfig(maxFileSize = 1024*1024*10)
public class profileUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            String company_name = req.getParameter("company_name");
            String phone = req.getParameter("phone");
            String address = req.getParameter("address");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String country = req.getParameter("country");

//    System.out.println(id);
//    System.out.println(fname);
//    System.out.println(lname);
//    System.out.println(email);
//    System.out.println(phone);
//    System.out.println(gender);


            Part updateimg = req.getPart("updateimg");
            InputStream inputStream = updateimg.getInputStream();
            byte[] UpdateImg = readByteFromInputstream(inputStream);

            ProfileUpdateModel UUPM = new ProfileUpdateModel(id,company_name,phone,address,city,state,country,UpdateImg);
            ProfileUpdateDB uupDB = new ProfileUpdateDB();
            boolean updateData = uupDB.ProfileUpdateDB(UUPM);
//System.out.println(updateData);
            if(updateData)
            {
                System.out.println();
                resp.sendRedirect(".?pname=userProfile");
            }
            else
            {
                System.out.println("Error");
                resp.sendRedirect(".?pname=userProfile");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();;
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
