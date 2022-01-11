package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Colectie;
import pojo.StiluriMuzicale;
import pojo.Muzicieni;
import DAO.ColectieDao;

public class ColectieDaoImpl implements ColectieDao {
	public void adaugaColectie(Colectie colectie) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.save(colectie);
		transaction.commit();
		session.close();
	}

	public List<Colectie> afiseazaColectie() {
		List<Colectie> listaColectie = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();
		org.hibernate.Query query = session.createQuery("From Colectie");
		listaColectie = query.list();
		return listaColectie;
	}

	public void modificaColectie(Long idcolectie, Muzicieni muzician, StiluriMuzicale stilmuzical, String name,
			String anaparitie) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Colectie detaliicolectie;
		detaliicolectie = (Colectie) session.load(Colectie.class, idcolectie);
		detaliicolectie.setMuzicieni(muzician);
		detaliicolectie.setStilurimuzicale(stilmuzical);
		detaliicolectie.setName(name);
		detaliicolectie.setAnaparitie(anaparitie);
		session.update(detaliicolectie);
		transaction.commit();
		session.close();
	}

	public void stergeColectie(Colectie colectie) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(colectie);
		transaction.commit();
		session.close();
	}
}
