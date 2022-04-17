package net.codejava.spring.model;

public class Order_detail {
	private int order_detail_id;
	private int product_id;
	private String order_id;
	private int order_detail_count;
	private Double order_detail_price;
	private String order_detail_size_choose;
	private String order_detail_color_choose;
	
	public int getOrder_detail_id() {
		return order_detail_id;
	}
	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public int getOrder_detail_count() {
		return order_detail_count;
	}
	public void setOrder_detail_count(int order_detail_count) {
		this.order_detail_count = order_detail_count;
	}
	public Double getOrder_detail_price() {
		return order_detail_price;
	}
	public void setOrder_detail_price(Double order_detail_price) {
		this.order_detail_price = order_detail_price;
	}
	public String getOrder_detail_size_choose() {
		return order_detail_size_choose;
	}
	public void setOrder_detail_size_choose(String order_detail_size_choose) {
		this.order_detail_size_choose = order_detail_size_choose;
	}
	public String getOrder_detail_color_choose() {
		return order_detail_color_choose;
	}
	public void setOrder_detail_color_choose(String order_detail_color_choose) {
		this.order_detail_color_choose = order_detail_color_choose;
	}
	public Order_detail(int order_detail_id, int product_id, String order_id, int order_detail_count,
			Double order_detail_price, String order_detail_size_choose, String order_detail_color_choose) {
		this.order_detail_id = order_detail_id;
		this.product_id = product_id;
		this.order_id = order_id;
		this.order_detail_count = order_detail_count;
		this.order_detail_price = order_detail_price;
		this.order_detail_size_choose = order_detail_size_choose;
		this.order_detail_color_choose = order_detail_color_choose;
	}
	public Order_detail() {
	}
	
}
