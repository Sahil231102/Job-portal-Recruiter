package Controller;


import DAO.SignUpDB;
import Model.SignUpModel;

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


@WebServlet(name="RecruiterSignUpServlet",value = "/RecruiterSignUpServlet")
@MultipartConfig
public class RecruiterSignUpServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try
        {

            String companyname = request.getParameter("companyname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String companyAddress = request.getParameter("companyAddress");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String country = request.getParameter("country");
            String password = request.getParameter("password");

            Part CImages = request.getPart("companyImg");

            InputStream inputStream = CImages.getInputStream();
            byte[] comimg = readByteFromInputStream(inputStream);


            SignUpModel signupModel = new SignUpModel(companyname,email,phone,password,companyAddress,state,country,city,comimg);
            SignUpDB vDB = new SignUpDB();
            boolean SignUpData = vDB.SignUpDB(signupModel);

            if(SignUpData)
            {
                response.sendRedirect(request.getContextPath() + "/RecruiterLogin.jsp?s=signUp");
            }
            else
            {
                response.sendRedirect("RecruiterSignUp.jsp");
                //request.getRequestDispatcher(request.getContextPath()+ "/Page/Vendor_Signup.jsp").include(request, response);
            }

        }catch (Exception e)
        {
            e.printStackTrace();
        }

    }
    private byte[] readByteFromInputStream(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        int bytesRead;
        byte[] data = new byte[1024];
        while ((bytesRead = inputStream.read(data,0,data.length)) != -1) {
            byteArrayOutputStream.write(data,0,bytesRead);
        }
        return byteArrayOutputStream.toByteArray();
    }
}
