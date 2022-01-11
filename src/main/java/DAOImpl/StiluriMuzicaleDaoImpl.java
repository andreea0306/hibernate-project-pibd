package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.StiluriMuzicale;
import DAO.StiluriMuzicaleDao;

public class StiluriMuzicaleDaoImpl implements StiluriMuzicaleDao {

	public void adaugaStilurimuzicale(StiluriMuzicale stilmuzical) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.save(stilmuzical);
		transaction.commit();
		session.close();
	}

	public List<StiluriMuzicale> afiseazaStilurimuzicale() {
		List<StiluriMuzicale> listastilurimuzicale = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();
		org.hibernate.Query query = session.createQuery("From StiluriMuzicale");
		listastilurimuzicale = query.list();
		return listastilurimuzicale;
	}

	public void modificaStilurimuzicale(Long idstilmuzical, String stilmuzical) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		StiluriMuzicale detaliistil = (StiluriMuzicale) session.load(StiluriMuzicale.class, idstilmuzical);
		detaliistil.setStilmuzical(stilmuzical);
		session.update(detaliistil);
		transaction.commit();
		session.close();
	}

	public void stergeStilmuzical(StiluriMuzicale stilmuzical) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(stilmuzical);
		transaction.commit();
		session.close();
	}
}
