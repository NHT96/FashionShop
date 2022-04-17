package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.Product;

public interface ProductDAO {
	public void saveOrUpdate(Product product);
    
    public void delete(int product_id);
     
    public Product get(int product_id);
     
    public List<Product> list();
    public List<Product> listByBrand(int brand_id);
    public List<Product> listByCategory(int category_id);
    public List<Product> listSearch(String str);
    public void add(Product product);
}
