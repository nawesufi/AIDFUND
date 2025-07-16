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
 * Servlet implementation class ReportByCauseController, to filter donation by causes (admin dashboard purposes)
 */
@WebServlet("/reportByCause")
public class ReportByCauseController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		try {
            String campaignId = request.getParameter("causeId");

            List<Donation> donations;
            if (campaignId != null && !campaignId.isEmpty()) {
                donations = DonationDAO.getDonationsByCampaign(campaignId);
            } else {
                donations = DonationDAO.getAllDonations();
            }

            // ✅ Add this to populate dropdown
            List<Cause> causes = CauseDAO.getAllCauses(); 
            request.setAttribute("causeList", causes);
            
            request.setAttribute("donations", donations);
            request.getRequestDispatcher("report.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error filtering by campaign.");
        }
    }
}