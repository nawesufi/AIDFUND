package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Donation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import dao.DonationDAO;

@WebServlet("/DownloadCSV")
public class DownloadCSVController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        try {
            String month = request.getParameter("month");
            String year = request.getParameter("year");
            String causeId = request.getParameter("causeId");

            List<Donation> donations;

            if (causeId != null && !causeId.isEmpty()) {
                donations = DonationDAO.getDonationsByCampaign(causeId);
            } else if (month != null && year != null) {
                donations = DonationDAO.getDonationsByMonth(Integer.parseInt(month), Integer.parseInt(year));
            } else {
                donations = DonationDAO.getAllDonations();
            }

            response.setContentType("text/csv");
            response.setHeader("Content-Disposition", "attachment; filename=\"donation_report.csv\"");

            PrintWriter out = response.getWriter();
            out.println("Reference ID,Amount,Date,Campaign ID,Donor ID");

            for (Donation d : donations) {
                out.printf("%s,%.2f,%s,%s,%d%n",
                    d.getDonationID(),
                    d.getAmount(),
                    d.getDonationDate(),
                    d.getCauseId(),
                    d.getDonorID());
            }

            out.flush();
            out.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating CSV.");
        }
    }
}