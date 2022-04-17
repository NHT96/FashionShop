package net.codejava.spring.model;

import java.util.Date;

public class Feedback {
	private int feedback_id;
	private String feedback_comment;
	private int feedback_rate;
	private Date feedback_date;
	private int product_id;
	private int customer_id;
	
	public int getFeedback_id() {
		return feedback_id;
	}
	public void setFeedback_id(int feedback_id) {
		this.feedback_id = feedback_id;
	}
	public String getFeedback_comment() {
		return feedback_comment;
	}
	public void setFeedback_comment(String feedback_comment) {
		this.feedback_comment = feedback_comment;
	}
	public int getFeedback_rate() {
		return feedback_rate;
	}
	public void setFeedback_rate(int feedback_rate) {
		this.feedback_rate = feedback_rate;
	}
	public Date getFeedback_date() {
		return feedback_date;
	}
	public void setFeedback_date(Date feedback_date) {
		this.feedback_date = feedback_date;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public Feedback(int feedback_id, String feedback_comment, int feedback_rate, Date feedback_date, int product_id,
			int customer_id) {
		this.feedback_id = feedback_id;
		this.feedback_comment = feedback_comment;
		this.feedback_rate = feedback_rate;
		this.feedback_date = feedback_date;
		this.product_id = product_id;
		this.customer_id = customer_id;
	}
	public Feedback() {
	}
	
}
