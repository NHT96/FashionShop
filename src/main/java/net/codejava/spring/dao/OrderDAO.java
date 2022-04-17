package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.Order;

public interface OrderDAO {
	public void saveOrUpdate(Order order, String action);
    
    public void delete(int order_id);
     
    public Order get(String order_id);
     
    public List<Order> list();
    
    public List<Order> listwait();
    
    public List<Order> listOrder_User(int customer_id);

    public Order checkOrderPayment(String orderPayment);
    
    public void updateMOMO(int order_status, String order_payment_code, String order_id);
    
    public double getOrderTotal();
    
    public int getCustomerTotal();
    
    public int getOrderCount();
    
    public int getProductCount();
    
    public List<Order> listOrderAccept();
}
