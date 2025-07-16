package controller;

import dao.CauseDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cause;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Servlet implementation for the statistics widgets in the admin dashboard
 */
@WebServlet("/dashboard")
public class DashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Cause> causes = CauseDAO.getAllCauses();
            System.out.println("DashboardController: causes size = " + causes.size());
            for (Cause c : causes) {
                System.out.println("Cause: " + c.getTitle() + ", Collected: " + c.getTotalCollected());
            }
            int totalCauses = CauseDAO.getTotalCauses();
            int activeCauses = CauseDAO.getCountActiveCauses();
            int pastCauses = CauseDAO.getCountPastCauses();
            double totalDonations = 0;
            for (Cause c : causes) { totalDonations += c.getTotalCollected(); }
            request.setAttribute("totalCauses", totalCauses);
            request.setAttribute("activeCauses", activeCauses);
            request.setAttribute("pastCauses", pastCauses);
            request.setAttribute("totalDonations", totalDonations);
            request.setAttribute("causes", causes);
            // You may also want to set totalCauses, activeCauses, pastCauses, totalDonations if needed
            RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error while retrieving causes.");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
} 