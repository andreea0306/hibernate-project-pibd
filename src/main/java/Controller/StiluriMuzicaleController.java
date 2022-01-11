package Controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.StiluriMuzicaleDao;
import pojo.StiluriMuzicale;
import pojo.StiluriMuzicale;
import DAOImpl.StiluriMuzicaleDaoImpl;
import java.text.ParseException;

/**
 * Servlet implementation class StiluriMuzicaleController
 */
public class StiluriMuzicaleController extends HttpServlet {
	StiluriMuzicale stilmuzical = new StiluriMuzicale();
	StiluriMuzicaleDaoImpl stilmuzicalDaoImpl = new StiluriMuzicaleDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaStilurimuzicale") != null) {
			String stil = request.getParameter("stilmuzical");
			stilmuzical.setStilmuzical(stil);
			stilmuzicalDaoImpl.adaugaStilurimuzicale(stilmuzical);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_stilurimuzicaleNOU.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaStilurimuzicale") != null) {
			List<StiluriMuzicale> listastilurimuzicale = new ArrayList();
			listastilurimuzicale = stilmuzicalDaoImpl.afiseazaStilurimuzicale();
			request.setAttribute("listastilurimuzicale", listastilurimuzicale);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_stilurimuzicaleNOU.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaStilurimuzicale") != null) {
			Long id1 = Long.parseLong(request.getParameter("idstilmuzical"));
			String stil = request.getParameter("stilmuzical");
			stilmuzicalDaoImpl.modificaStilurimuzicale(id1, stil);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_stilurimuzicaleNOU.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeStilmuzical") != null) {
			Long id2 = Long.parseLong(request.getParameter("idstilmuzical"));
			stilmuzical.setIdstilmuzical(id2);
			stilmuzicalDaoImpl.stergeStilmuzical(stilmuzical);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_stilurimuzicaleNOU.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}

}
