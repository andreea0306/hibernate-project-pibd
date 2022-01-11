package Controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Muzicieni;
import pojo.StiluriMuzicale;
import pojo.Colectie;
import DAOImpl.ColectieDaoImpl;
import DAOImpl.HibernateUtil;
import org.hibernate.Session;

/**
 * Servlet implementation class ColectieController
 */
public class ColectieController extends HttpServlet {
	Colectie colectie = new Colectie();
	ColectieDaoImpl colectieDaoImpl = new ColectieDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaColectie") != null) {
			// preluarea parametrilor de interes
			Long idmuzician = java.lang.Long.parseLong(request.getParameter("idmuzician"));
			Long idstilmuzical = java.lang.Long.parseLong(request.getParameter("idstilmuzical"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Muzicieni muzician = (Muzicieni) session.get(Muzicieni.class, idmuzician);
			StiluriMuzicale stilmuzical = (StiluriMuzicale) session.get(StiluriMuzicale.class, idstilmuzical);
			String name = request.getParameter("name");
			String anaparitie = request.getParameter("anaparitie");

			colectie.setMuzicieni(muzician);
			colectie.setStilurimuzicale(stilmuzical);
			colectie.setName(name);
			colectie.setAnaparitie(anaparitie);
			colectieDaoImpl.adaugaColectie(colectie);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_colectieNOU.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaColectie") != null) {
			List<Colectie> listaColectie = new ArrayList();
			listaColectie = colectieDaoImpl.afiseazaColectie();
			request.setAttribute("listaColectie", listaColectie);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_colectiiNOU.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaColectie") != null) {
			Long id1 = Long.parseLong(request.getParameter("idcolectie"));
			// preluarea parametrilor de interes
			Long idmuzician = java.lang.Long.parseLong(request.getParameter("idmuzician"));
			Long idstilmuzical = java.lang.Long.parseLong(request.getParameter("idstilmuzical"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Muzicieni muzician = (Muzicieni) session.get(Muzicieni.class, idmuzician);
			StiluriMuzicale stilmuzical = (StiluriMuzicale) session.get(StiluriMuzicale.class, idstilmuzical);
			String name = request.getParameter("name");
			String anaparitie = request.getParameter("anaparitie");

			colectieDaoImpl.modificaColectie(id1, muzician, stilmuzical, name, anaparitie);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_colectieNOU.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeColectie") != null) {
			Long id2 = Long.parseLong(request.getParameter("idcolectie"));
			colectie.setIdcolectie(id2);
			colectieDaoImpl.stergeColectie(colectie);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_colectieNOU.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}
}
