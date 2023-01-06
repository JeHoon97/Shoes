package ez.web.util;

public enum ProdSpec {
	HIT("Hit"), NEW("New"), RECOMMEND("추천");
	
	private final String value;
	
	private ProdSpec(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}
}
