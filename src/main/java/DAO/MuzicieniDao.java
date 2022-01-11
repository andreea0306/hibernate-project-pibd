package DAO;

import java.util.List;
import pojo.Muzicieni;
import java.util.Date;

public interface MuzicieniDao {
	public void adaugaMuzicieni(Muzicieni muzician);

	public List<Muzicieni> afiseazaMuzicieni();

	public void modificaMuzicieni(Long idmuzician, String nume, String prenume, Date datanasterii, String trupa);

	public void stergeMuzician(Muzicieni muzician);
}
