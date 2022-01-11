package DAO;

import java.util.List;
import pojo.StiluriMuzicale;

public interface StiluriMuzicaleDao {
	public void adaugaStilurimuzicale(StiluriMuzicale stilmuzical);

	public List<StiluriMuzicale> afiseazaStilurimuzicale();

	public void modificaStilurimuzicale(Long idstilmuzical, String stilmuzical);

	public void stergeStilmuzical(StiluriMuzicale stilmuzical);

}
