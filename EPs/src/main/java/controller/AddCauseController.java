package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Cause;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;

import dao.CauseDAO;

/**
 * Servlet implementation class AddCauseController
 */
@WebServlet("/AddCauseController")
@jakarta.servlet.annotation.MultipartConfig(
	    fileSizeThreshold = 1024 * 1024, // 1MB
	    maxFileSize = 1024 * 1024 * 5,   // 5MB
	    maxRequestSize = 1024 * 1024 * 10 // 10MB
	)
public class AddCauseController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public AddCauseController() {
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			addCause(request, response);
		} catch (SQLException e) {
			System.out.println("Error in input parsing: " + e.getMessage());
			e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
		}
	}
    	
  	private void addCause(HttpServletRequest request, HttpServletResponse response)  throws SQLException, IOException, ServletException {
  		
  		 // Retrieve parameters and validate them
  		String causeIdStr = request.getParameter("causeId");
        String userIdStr = request.getParameter("userId");
        String titleV = request.getParameter("title");
        String descriptionV = request.getParameter("description");
        String targetAmountStr = request.getParameter("targetAmount");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        String statusV = request.getParameter("status");
        
        // Check for null or empty parameters
        if (causeIdStr == null || userIdStr == null || titleV == null || descriptionV == null || 
            targetAmountStr == null || startDateStr == null || endDateStr == null || 
            statusV == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required parameters.");
            return;
        }
        try {
        	String causeId = request.getParameter("causeId");
    		int userId = Integer.parseInt(request.getParameter("userId"));
    		String title = request.getParameter("title");
    		String description = request.getParameter("description");
    		String headline = request.getParameter("headline");
    		double targetAmount = Double.parseDouble(request.getParameter("targetAmount"));
    		java.sql.Date startDate = java.sql.Date.valueOf(request.getParameter("startDate"));
    		java.sql.Date endDate = java.sql.Date.valueOf(request.getParameter("endDate"));
    		String status = request.getParameter("status");
    		
    		boolean exists = CauseDAO.doesCauseIdExist(causeId);
    		
    		// Handle thumbnail upload
            Part thumbnailPart = request.getPart("thumbnail");
            String thumbnailPath = "uploads/" + Paths.get(thumbnailPart.getSubmittedFileName()).getFileName().toString();
            File uploadsDir = new File(getServletContext().getRealPath("") + File.separator + "uploads");
            if (!uploadsDir.exists()) {
                uploadsDir.mkdir(); // Create the uploads directory if it doesn't exist
            }
            thumbnailPart.write(uploadsDir + File.separator + thumbnailPart.getSubmittedFileName());
            if (exists) {
	            request.setAttribute("errorMessage", "Cause ID already exists. Please choose another.");
	            request.getRequestDispatcher("editCause.jsp").forward(request, response);
	        } else {
            // Create a new Cause object
    		Cause cause = new Cause();
    		cause.setCauseId(causeId);
    		cause.setUserId(userId);//foreign key
    		cause.setTitle(title);
    		cause.setHeadline(headline);
    		cause.setDescription(description);
    		cause.setStartDate(startDate);
    		cause.setEndDate(endDate);
    		cause.setTargetAmount(targetAmount);
    		cause.setStatus(status);
    		cause.setThumbnail(thumbnailPath);
    		
            // Add the cause to the database
    		CauseDAO.addCause(cause);
    		System.out.println("Campaign created successfully." + cause.getTitle());
    		response.sendRedirect("Cause");
        } }catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid numeric value.");
        } catch (IllegalArgumentException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid date format.");  
            }
}
}