package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.Brand;

public interface BrandDAO {
	public void saveOrUpdate(Brand brand);
    
    public void delete(int brand_id);
     
    public Brand get(int brand_id);
     
    public List<Brand> list();
    
    public void addbrand();
}
