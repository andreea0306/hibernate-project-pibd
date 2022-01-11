package pojo;

public class Colectie implements java.io.Serializable {
	private Long idcolectie;
	private Muzicieni muzicieni;
	private StiluriMuzicale stilmuzical;
	private String name;
	private String anaparitie;

	public Colectie() {

	}

	public Colectie(Muzicieni muzicieni, StiluriMuzicale stilurimuzicale, String name, String anaparitie) {
		this.muzicieni = muzicieni;
		this.stilmuzical = stilurimuzicale;
		this.name = name;
		this.anaparitie = anaparitie;
	}

	public Long getIdcolectie() {
		return this.idcolectie;
	}

	public Muzicieni getMuzicieni() {
		return this.muzicieni;
	}

	public StiluriMuzicale getStilurimuzicale() {
		return this.stilmuzical;
	}

	public String getName() {
		return this.name;
	}

	public String getAnaparitie() {
		return this.anaparitie;
	}

	public void setIdcolectie(Long idcolectie) {
		this.idcolectie = idcolectie;
	}

	public void setMuzicieni(Muzicieni muzicieni) {
		this.muzicieni = muzicieni;
	}

	public void setStilurimuzicale(StiluriMuzicale stilurimuzicale) {
		this.stilmuzical = stilurimuzicale;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAnaparitie(String anaparitie) {
		this.anaparitie = anaparitie;
	}
}
