package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.Feedback;

public interface FeedbackDAO {
	public void saveOrUpdate(Feedback feedback);
    
    public void delete(int feedback_id);
     
    public Feedback get(int feedback_id);
    
    public List<Feedback> getFromProduct(int product_id);
     
    public List<Feedback> list();
}
