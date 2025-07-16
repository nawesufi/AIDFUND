package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cause;

import java.io.IOException;
import java.sql.SQLException;

import dao.CauseDAO;

/**
 * To edit Causes
 * by Nawal
 */
@WebServlet("/EditCauseController")
public class EditCauseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EditCauseController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            showEditForm(request, response);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
		
	}


	private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		String causeId = request.getParameter("causeId");
		Cause existCause = CauseDAO.getCauseId(causeId);
		request.setAttribute("cause", existCause);
		RequestDispatcher dispatcher = request.getRequestDispatcher("editCause.jsp");
		dispatcher.forward(request, response);
	}
}
