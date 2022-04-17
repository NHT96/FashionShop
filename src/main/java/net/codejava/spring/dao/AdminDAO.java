package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.Admin;
import net.codejava.spring.model.ProductViewModel;

public interface AdminDAO {
	public void saveOrUpdate(Admin admin);
    
    public void delete(int admin_id);
     
    public Admin get(int admin_id);
     
    public List<Admin> list();
    
    public int login(String admin_user, String admin_pass);
    
    public boolean UpdateStt(String tt, String order_id);
    
    public List<ProductViewModel> manageProduct();
    
    public boolean UpdateAccountStt(String tt, String customer_id);
}
