package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.Order_detail;

public interface Order_detailDAO {
	public void saveOrUpdate(Order_detail order_detail);
    
    public void delete(int order_detail_id);
     
    public Order_detail get(int order_detail_id);
     
    public List<Order_detail> list(String order_id);
}
