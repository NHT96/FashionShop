package net.codejava.spring.model;

public class Customer {
	private int customer_id;
	private String customer_name;
	private String customer_email;
	private String customer_phone;
	private String customer_address;
	private String customer_pass;
	private String customer_status;
	
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public String getCustomer_address() {
		return customer_address;
	}
	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}
	public String getCustomer_pass() {
		return customer_pass;
	}
	public void setCustomer_pass(String customer_pass) {
		this.customer_pass = customer_pass;
	}
	public String getCustomer_status() {
		return customer_status;
	}
	public void setCustomer_status(String customer_status) {
		this.customer_status = customer_status;
	}
	public Customer(int customer_id, String customer_name, String customer_email, String customer_phone,
			String customer_address, String customer_pass, String customer_status) {
		this.customer_id = customer_id;
		this.customer_name = customer_name;
		this.customer_email = customer_email;
		this.customer_phone = customer_phone;
		this.customer_address = customer_address;
		this.customer_pass = customer_pass;
		this.customer_status = customer_status;
	}
	public Customer() {
	}
	
}
