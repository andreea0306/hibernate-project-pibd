package DAO;

import java.util.List;
import pojo.StiluriMuzicale;
import pojo.Muzicieni;
import pojo.Colectie;

public interface ColectieDao {
	public void adaugaColectie(Colectie colectie);

	public List<Colectie> afiseazaColectie();

	public void modificaColectie(Long idcolectie, Muzicieni muzician, StiluriMuzicale stilmuzical, String name,
			String anaparitie);

	public void stergeColectie(Colectie colectie);

}
