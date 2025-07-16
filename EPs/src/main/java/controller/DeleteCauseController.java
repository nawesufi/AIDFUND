package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import dao.CauseDAO;

/**
 * Deletes a cause by ID.
 */
@WebServlet("/DeleteCauseController")
public class DeleteCauseController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String causeId = request.getParameter("causeId");

        if (causeId == null || causeId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Cause ID is missing.");
            return;
        }

        try {
            CauseDAO.deleteCause(causeId);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error deleting cause: " + e.getMessage());
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            return;
        }

        response.sendRedirect("Cause"); // or dashboard.jsp
    }
}