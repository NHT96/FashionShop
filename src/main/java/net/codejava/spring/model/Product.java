package net.codejava.spring.model;


public class Product {
	private int product_id;
	private String product_name;
    private String product_color;
    private String product_size;
    private String product_img;
    private Double product_price;
    private int category_id;
    private int brand_id;
    private String product_description;
    private String product_status;

	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_color() {
		return product_color;
	}
	public void setProduct_color(String product_color) {
		this.product_color = product_color;
	}
	public String getProduct_size() {
		return product_size;
	}
	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public Double getProduct_price() {
		return product_price;
	}
	public void setProduct_price(Double product_price) {
		this.product_price = product_price;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public int getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public String getProduct_status() {
		return product_status;
	}
	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}
	
	public Product() {
	}
	public Product(int product_id, String product_name, String product_color, String product_size, String product_img,
			Double product_price, int category_id, int brand_id, String product_description,
			String product_status) {
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_color = product_color;
		this.product_size = product_size;
		this.product_img = product_img;
		this.product_price = product_price;
		this.category_id = category_id;
		this.brand_id = brand_id;
		this.product_description = product_description;
		this.product_status = product_status;
	}
	
    
}
