package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Donation;

import java.io.IOException;

import dao.DonationDAO;

/**
 * Servlet implementation class SearchDonationController
 */
@WebServlet("/searchDonation")
public class SearchDonationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SearchDonationController() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String refId = request.getParameter("refId");
        Donation donation = null;
        try {
            donation = DonationDAO.getDonationById(refId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (donation != null) {
            request.setAttribute("donation", donation);
        } else {
            request.setAttribute("error", "Donation not found for Reference ID: " + refId);
        }

        RequestDispatcher rd = request.getRequestDispatcher("donationHistory.jsp");
        rd.forward(request, response);
	}

}
