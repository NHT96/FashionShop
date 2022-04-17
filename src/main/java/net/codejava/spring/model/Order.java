package net.codejava.spring.model;

import java.sql.Date;

public class Order {
	private String order_id;
	private Date order_date;
	private int order_payment;
	private int order_status;
	private Double order_total;
	private String order_note;
	private int customer_id;
	private String order_name;
	private String order_phone;
	private String order_email;
	private String order_address;
	private String order_payment_code;
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public int getOrder_payment() {
		return order_payment;
	}
	public void setOrder_payment(int order_payment) {
		this.order_payment = order_payment;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	public double getOrder_total() {
		return order_total;
	}
	public void setOrder_total(Double order_total) {
		this.order_total = order_total;
	}
	public String getOrder_note() {
		return order_note;
	}
	public void setOrder_note(String order_note) {
		this.order_note = order_note;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getOrder_email() {
		return order_email;
	}
	public void setOrder_email(String order_email) {
		this.order_email = order_email;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_payment_code() {
		return order_payment_code;
	}
	public void setOrder_payment_code(String order_payment_code) {
		this.order_payment_code = order_payment_code;
	}
	public Order(String order_id, Date order_date, int order_payment, int order_status, Double order_total,
			String order_note, int customer_id, String order_name, String order_phone, String order_email,
			String order_address, String order_payment_code) {
		this.order_id = order_id;
		this.order_date = order_date;
		this.order_payment = order_payment;
		this.order_status = order_status;
		this.order_total = order_total;
		this.order_note = order_note;
		this.customer_id = customer_id;
		this.order_name = order_name;
		this.order_phone = order_phone;
		this.order_email = order_email;
		this.order_address = order_address;
		this.order_payment_code = order_payment_code;
	}
	public Order() {
	}
	
}
