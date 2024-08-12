package Controller;


import DAO.LoginDB;
import Model.LoginModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "RecruiterLoginController" , value = "/RecruiterLoginController")
public class RecruiterLoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        PrintWriter out = resp.getWriter();
        String V_email = req.getParameter("V_email");
        String V_password = req.getParameter("V_password");
        String loginvnd = req.getParameter("loginvnd");
        System.out.println(V_email);
        System.out.println(V_password);
        System.out.println(loginvnd);

        LoginModel loginModel = new LoginModel(V_email,V_password);
        LoginDB vDB = new LoginDB();
        boolean vLogin = vDB.LoginDB(loginModel);



        if (vLogin) {

            Cookie Vem = new Cookie("Vem",V_email);
            Cookie vnd = new Cookie("vnd",loginvnd);
            resp.addCookie(Vem);
            resp.addCookie(vnd);
            resp.sendRedirect(req.getContextPath() + "/?pname=Home");
        }
        else {
            out.println("<script>alert('incorrect phone number and password Please Enter Valid')</script>");
            RequestDispatcher rq=req.getRequestDispatcher("/User_Login.jsp");
            rq.include(req,resp);
        }
    }
}
