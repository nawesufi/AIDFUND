package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Cause;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import dao.CauseDAO;

/**
 * Handles full Cause updates (Edit form)
 */
@WebServlet("/UpdateCauseController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB
                 maxFileSize = 5 * 1024 * 1024,   // 5MB
                 maxRequestSize = 10 * 1024 * 1024) // 10MB
public class UpdateCauseController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String causeId = request.getParameter("causeId");
        String title = request.getParameter("title");
        String headline = request.getParameter("headline");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        java.sql.Date startDate = java.sql.Date.valueOf(request.getParameter("startDate"));
		java.sql.Date endDate = java.sql.Date.valueOf(request.getParameter("endDate"));
		int userId = Integer.parseInt(request.getParameter("userId"));
        double targetAmount = 0.0;

        try {
            String amt = request.getParameter("targetAmount");
            if (amt != null && !amt.isEmpty()) {
                targetAmount = Double.parseDouble(amt);
            }

            // Handle file upload (optional thumbnail)
            Part filePart = request.getPart("thumbnail");
            String fileName = null;
            if (filePart != null && filePart.getSize() > 0) {
                fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();
                filePart.write(uploadPath + File.separator + fileName);
            }

            // Update the cause object
            Cause cause = new Cause();
            cause.setCauseId(causeId);
            cause.setTitle(title);
            cause.setHeadline(headline);
            cause.setDescription(description);
            cause.setStatus(status);
            cause.setStartDate(startDate);
            cause.setEndDate(endDate);
            cause.setUserId(userId);
            cause.setTargetAmount(targetAmount);
            if (fileName != null) {
                cause.setThumbnail("uploads/" + fileName); // adjust if needed
            }

            // Update in DB
            CauseDAO.updateCause(cause);

        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating cause: " + e.getMessage());
            request.getRequestDispatcher("editCause.jsp").forward(request, response);
            return;
        }

        response.sendRedirect("Cause");
    }
}
