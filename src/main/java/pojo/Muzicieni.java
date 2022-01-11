package pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Muzicieni implements java.io.Serializable {
	private Long idmuzician;
	private String nume;
	private String prenume;
	private Date datanasterii;
	private String trupa;
	private Set colectii = new HashSet(0);

	public Muzicieni() {
	}

	public Muzicieni(String nume, String prenume, Date datanasterii, String trupa, Set colectii) {
		this.nume = nume;
		this.prenume = prenume;
		this.datanasterii = datanasterii;
		this.trupa = trupa;
		this.colectii = colectii;
	}

	public Long getIdmuzician() {
		return this.idmuzician;
	}

	public String getNume() {
		return this.nume;
	}

	public String getPrenume() {
		return this.prenume;
	}

	public Date getDatanasterii() {
		return this.datanasterii;
	}

	public String getTrupa() {
		return this.trupa;
	}

	public Set getColectii() {
		return this.colectii;
	}

	public void setIdmuzician(Long idmuzician) {
		this.idmuzician = idmuzician;
	}

	public void setNume(String nume) {
		this.nume = nume;
	}

	public void setPrenume(String prenume) {
		this.prenume = prenume;
	}

	public void setDatanasterii(Date datanasterii) {
		this.datanasterii = datanasterii;
	}

	public void setTrupa(String trupa) {
		this.trupa = trupa;
	}

	public void setColectii(Set colectii) {
		this.colectii = colectii;
	}
}
