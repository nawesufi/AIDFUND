package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.CauseDAO;

/**
 * Servlet to update the status (Active/Inactive) of a Cause (button)
 */
@WebServlet("/UpdateCauseStatusController")
public class UpdateCauseStatusController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateCauseStatusController() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String causeId = request.getParameter("causeId");
        String status = request.getParameter("status");

        if (causeId == null || status == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing causeId or status parameter.");
            return;
        }

        CauseDAO causeDAO = new CauseDAO();
		causeDAO.updateCauseStatus(causeId, status);

        response.sendRedirect("Cause"); // or dashboard.jsp if you prefer
    }
}