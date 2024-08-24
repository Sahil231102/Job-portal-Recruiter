package Controller;

import DAO.ApplyStatusDB;
import DAO.JobDeleteDB;
import Model.ApplyStatusModel;
import Model.JobDeleteModel;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ApplyStatusServlet",value = "/ApplyStatusServlet")
@MultipartConfig
public class ApplyStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("a_id");
            String status = req.getParameter("status");

            ApplyStatusModel UpdateStatusModel = new ApplyStatusModel(id,status);
            ApplyStatusDB aDB = new ApplyStatusDB();
            boolean statuschange = aDB.ApplyStatusDB(UpdateStatusModel.getId(), UpdateStatusModel.getStatus());

            if (statuschange) {
                System.out.println("Successfully deleted job");
                resp.sendRedirect("./?pname=JobApply");
            } else {
                System.out.println("Failed to delete job");
                resp.sendRedirect("./?pname=JobApply");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // You can forward to an error page or set an error attribute
            req.setAttribute("errorMessage", "An error occurred while deleting the job.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("error.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
