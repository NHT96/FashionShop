package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.Customer;

public interface CustomerDAO {

	public void saveOrUpdate(Customer customer);
	
	public boolean Signup(String name, String email, String phone, String address, String pass);
    
    public void delete(int customer_id);
     
    public Customer get(int customer_id);
     
    public List<Customer> list();
    
    public Customer login(String user, String pass);
    
    public Customer checkPass(String user, String pass);
    
    public boolean Update(String name, String phone, String add, int id);
    
    public boolean UpdatePass(String pass, int id);
    
    public boolean UpdateStt(String tt, String order_id, int customer_id);
    
    public List<Customer> CheckBeforSignup(String email, String phone);
    
    public Customer CheckEmail(String email);
    
    public boolean UpdatePassMail(String pass, String email);
}
