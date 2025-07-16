package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Donation;

import java.io.IOException;
import java.util.List;

import dao.DonationDAO;

/**
 * Servlet to filter donations by month
 */
@WebServlet("/byMonthReport")
public class ReportByMonthController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String monthStr = request.getParameter("month");
            String yearStr = request.getParameter("year");

            List<Donation> donations;
            if (monthStr != null && yearStr != null && !monthStr.isEmpty() && !yearStr.isEmpty()) {
                int month = Integer.parseInt(monthStr);
                int year = Integer.parseInt(yearStr);
                donations = DonationDAO.getDonationsByMonth(month, year);
            } else {
                donations = DonationDAO.getAllDonations();
            }

            request.setAttribute("donations", donations);
            request.getRequestDispatcher("report.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading report.");
        }
    }
}
