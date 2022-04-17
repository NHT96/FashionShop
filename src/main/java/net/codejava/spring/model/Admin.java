package net.codejava.spring.model;

public class Admin {
	private int admin_id;
	private String admin_user;
	private String admin_name;
	private  String admin_pass;
	private String admin_role;
	
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_user() {
		return admin_user;
	}
	public void setAdmin_user(String admin_user) {
		this.admin_user = admin_user;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_pass() {
		return admin_pass;
	}
	public void setAdmin_pass(String admin_pass) {
		this.admin_pass = admin_pass;
	}
	public String getAdmin_role() {
		return admin_role;
	}
	public void setAdmin_role(String admin_role) {
		this.admin_role = admin_role;
	}
	public Admin(int admin_id, String admin_user, String admin_name, String admin_pass, String admin_role) {
		this.admin_id = admin_id;
		this.admin_user = admin_user;
		this.admin_name = admin_name;
		this.admin_pass = admin_pass;
		this.admin_role = admin_role;
	}
	public Admin() {
	}
	
}
