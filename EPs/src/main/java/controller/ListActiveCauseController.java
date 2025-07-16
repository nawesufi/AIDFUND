package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cause;

import java.io.IOException;
import java.util.List;

import dao.CauseDAO;

/**
 * Servlet implementation class ListActiveCauseController
 */
@WebServlet("/causePage")
public class ListActiveCauseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			List<Cause> activeCauses = CauseDAO.getActiveCausesDonor(); 
			request.setAttribute("causes", activeCauses);      // for card grid
			request.setAttribute("causeList", activeCauses);   // for dropdown
			RequestDispatcher rd = request.getRequestDispatcher("causePage.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace(); 
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error while retrieving causes.");
		}
	}
}
