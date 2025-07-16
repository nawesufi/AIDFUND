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
import java.util.List;

import dao.CauseDAO;

/**
To Display List of Causes
by Nawal 
 */
@WebServlet("/Cause")
public class ListCauseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListCauseController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
	listCause(request,response);
	} catch (SQLException ex) {
		throw new ServletException(ex);
	}
}

	private void listCause(HttpServletRequest request, HttpServletResponse response)throws SQLException, ServletException, IOException {
	List<Cause> campaign = CauseDAO.getAllCauses();
	request.setAttribute("causes", campaign);
	RequestDispatcher dispatcher = request.getRequestDispatcher("Cause.jsp");
	dispatcher.forward(request, response);
	}
}
