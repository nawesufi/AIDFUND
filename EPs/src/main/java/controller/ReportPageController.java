package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cause;
import model.Donation;

import java.io.IOException;
import java.util.List;

import dao.CauseDAO;
import dao.DonationDAO;

/**
 * Servlet implementation class ReportPageController, UNUSED.
 */
@WebServlet("/report")
public class ReportPageController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Donation> donations = DonationDAO.getAllDonations();
            List<Cause> causes = CauseDAO.getAllCauses();

            request.setAttribute("donations", donations);
            request.setAttribute("causeList", causes);
            request.getRequestDispatcher("report.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

