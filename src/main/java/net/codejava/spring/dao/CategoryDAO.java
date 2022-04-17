package net.codejava.spring.dao;

import java.util.List;

import net.codejava.spring.model.Category;

public interface CategoryDAO {
	public void saveOrUpdate(Category category);
    
    public void delete(int category_id);
     
    public Category get(int category_id);
     
    public List<Category> list();
}
