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
import DAO.MuzicieniDao;
import pojo.Muzicieni;
import DAOImpl.MuzicieniDaoImpl;
import DAOImpl.HibernateUtil;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class MuzicieniController
 */
public class MuzicieniController extends HttpServlet {

	Muzicieni muzician = new Muzicieni();
	MuzicieniDaoImpl muzicianDaoImpl = new MuzicieniDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaMuzicieni") != null) {
			String nume = request.getParameter("nume");
			String prenume = request.getParameter("prenume");

			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date datanasterii = null;
			try {
				datanasterii = df.parse(request.getParameter("datanasterii"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			String trupa = request.getParameter("trupa");
			muzician.setNume(nume);
			muzician.setPrenume(prenume);
			muzician.setDatanasterii(datanasterii);
			muzician.setTrupa(trupa);
			muzicianDaoImpl.adaugaMuzicieni(muzician);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_muzicieniNOU.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaMuzicieni") != null) {
			List<Muzicieni> listaMuzicieni = new ArrayList();
			listaMuzicieni = muzicianDaoImpl.afiseazaMuzicieni();
			request.setAttribute("listaMuzicieni", listaMuzicieni);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_muzicieniNOU.jsp");
			rd.forward(request, response);
		}
		if (request.getParameter("modificaMuzicieni") != null) {
			Long id1 = Long.parseLong(request.getParameter("idmuzician"));
			String nume = request.getParameter("nume");
			String prenume = request.getParameter("prenume");
			DateFormat df = new SimpleDateFormat("yyy-MM-dd");
			Date datanasterii = null;
			try {
				datanasterii = df.parse(request.getParameter("datanasterii"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			String trupa = request.getParameter("trupa");
			muzicianDaoImpl.modificaMuzicieni(id1, nume, prenume, datanasterii, trupa);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_muzicieniNOU.jsp");
			rd.forward(request, response);
		}
		if (request.getParameter("stergeMuzicieni") != null) {
			Long id2 = Long.parseLong(request.getParameter("idmuzician"));
			muzician.setIdmuzician(id2);
			muzicianDaoImpl.stergeMuzician(muzician);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_muzicieniNOU.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}
}
