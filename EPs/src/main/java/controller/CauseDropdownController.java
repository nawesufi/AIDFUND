package controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Cause;

import java.io.IOException;
import java.util.List;

import dao.CauseDAO;

@WebServlet("/DonatePage")
public class CauseDropdownController extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Cause> causes = CauseDAO.getActiveCauses();
            request.setAttribute("causes", causes);
            RequestDispatcher rd = request.getRequestDispatcher("cause.html");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
