package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Donation;

import java.io.*;
import java.util.List;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

import dao.DonationDAO;

/**
 * Servlet implementation to export a pdf file from report page (download pdf button)
 */
@WebServlet("/DownloadPDF")
public class DownloadPDFController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        try {
            String month = request.getParameter("month");
            String year = request.getParameter("year");
            String causeId = request.getParameter("causeId");

            List<Donation> donations;

            // 🛡️ Safely check and parse only if valid
            if (causeId != null && !causeId.isEmpty()) {
                donations = DonationDAO.getDonationsByCampaign(causeId);
            } else if (month != null && !month.isEmpty() && year != null && !year.isEmpty()) {
                int m = Integer.parseInt(month);
                int y = Integer.parseInt(year);
                donations = DonationDAO.getDonationsByMonth(m, y);
            } else {
                donations = DonationDAO.getAllDonations();
            }

            // 📄 Create PDF
            PDDocument document = new PDDocument();
            PDPage page = new PDPage(PDRectangle.A4);
            document.addPage(page);

            PDPageContentStream contentStream = new PDPageContentStream(document, page);
            contentStream.beginText();
            contentStream.setFont(PDType1Font.HELVETICA_BOLD, 16);
            contentStream.setLeading(18f);
            contentStream.newLineAtOffset(50, 750);

            contentStream.showText("AidFund+ Donation Report");
            contentStream.newLine();
            contentStream.setFont(PDType1Font.HELVETICA, 12);
            contentStream.showText("Total donations: " + donations.size());
            contentStream.newLine();

            for (Donation d : donations) {
                String line = String.format("Ref: %s | RM %.2f | %s | Campaign: %s | Donor: %d",
                        d.getDonationID(), d.getAmount(), d.getDonationDate(), d.getCauseId(), d.getDonorID());
                contentStream.showText(line);
                contentStream.newLine();
            }

            contentStream.endText();
            contentStream.close();

            // 📤 Write to response
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"donation_report.pdf\"");
            document.save(response.getOutputStream());
            document.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error generating PDF.");
        }
    }
}