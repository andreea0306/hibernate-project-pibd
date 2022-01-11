package pojo;

import java.util.HashSet;
import java.util.Set;

public class StiluriMuzicale implements java.io.Serializable {
	private Long idstilmuzical;
	private String stilmuzical;
	private Set colectii = new HashSet(0);

	public StiluriMuzicale() {

	}

	public StiluriMuzicale(Long idstilmuzical, String stilmuzical, Set colectii) {
		this.idstilmuzical = idstilmuzical;
		this.stilmuzical = stilmuzical;
		this.colectii = colectii;
	}

	public Long getIdstilmuzical() {
		return this.idstilmuzical;
	}

	public String getStilmuzical() {
		return this.stilmuzical;
	}

	public Set getColectii() {
		return this.colectii;
	}

	public void setIdstilmuzical(Long idstilmuzical) {
		this.idstilmuzical = idstilmuzical;
	}

	public void setStilmuzical(String stilmuzical) {
		this.stilmuzical = stilmuzical;
	}

	public void setColectii(Set colectii) {
		this.colectii = colectii;
	}
}
