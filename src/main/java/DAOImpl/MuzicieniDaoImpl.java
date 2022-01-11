package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Muzicieni;
import DAO.MuzicieniDao;
import java.util.Date;
import DAOImpl.HibernateUtil;

public class MuzicieniDaoImpl implements MuzicieniDao {

	public void adaugaMuzicieni(Muzicieni muzician) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.save(muzician);
		transaction.commit();
		session.close();
	}

	public List<Muzicieni> afiseazaMuzicieni() {
		List<Muzicieni> listaMuzicieni = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();
		org.hibernate.Query query = session.createQuery("From Muzicieni");
		listaMuzicieni = query.list();
		session.close();
		return listaMuzicieni;
	}

	public void modificaMuzicieni(Long idmuzician, String nume, String prenume, Date datanasterii, String trupa) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Muzicieni detaliimuzicieni = (Muzicieni) session.load(Muzicieni.class, idmuzician);
		detaliimuzicieni.setNume(nume);
		detaliimuzicieni.setPrenume(prenume);
		detaliimuzicieni.setDatanasterii(datanasterii);
		detaliimuzicieni.setTrupa(trupa);
		session.update(detaliimuzicieni);
		transaction.commit();
		session.close();
	}

	public void stergeMuzician(Muzicieni muzician) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(muzician);
		transaction.commit();
		session.close();
	}
}
