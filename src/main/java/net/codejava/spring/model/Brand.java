package net.codejava.spring.model;

public class Brand {
	private int brand_id;
	private String brand_name;
	private String brand_logo;
	
	public int getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getBrand_logo() {
		return brand_logo;
	}
	public void setBrand_logo(String brand_logo) {
		this.brand_logo = brand_logo;
	}
	public Brand(int brand_id, String brand_name, String brand_logo) {
		super();
		this.brand_id = brand_id;
		this.brand_name = brand_name;
		this.brand_logo = brand_logo;
	}
	public Brand() {
		super();
	}
	
}
