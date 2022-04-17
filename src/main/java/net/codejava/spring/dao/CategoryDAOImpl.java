package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import net.codejava.spring.model.Category;

public class CategoryDAOImpl implements CategoryDAO{
	
	private JdbcTemplate jdbcTemplate;
    public CategoryDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
	
	@Override
	public void saveOrUpdate(Category category) {
		// TODO Auto-generated method stub
		if (category.getCategory_id() > 0) {
            // update
            String sql = "UPDATE category SET category_name = ? WHERE category_id = ?";
            jdbcTemplate.update(sql, category.getCategory_name(), category.getCategory_id());
        } else {
            // insert
            String sql = "INSERT INTO category(category_name) VALUES (?)";
            jdbcTemplate.update(sql, category.getCategory_name());
        }
	}

	@Override
	public void delete(int category_id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM category WHERE category_id=?";
        jdbcTemplate.update(sql, category_id);
	}

	@Override
	public Category get(int category_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM category WHERE category_id=" + category_id;
        return jdbcTemplate.query(sql, new ResultSetExtractor<Category>() {
     
            @Override
            public Category extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                	Category category = new Category();
                	category.setCategory_id(rs.getInt("category_id"));
                	category.setCategory_name(rs.getString("category_name"));
                    return category;
                }
     
                return null;
            }
     
        });
	}

	@Override
	public List<Category> list() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM category";
	    List<Category> listCategory = jdbcTemplate.query(sql, new RowMapper<Category>() {
	 
	        @Override
	        public Category mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Category category = new Category();
            	category.setCategory_id(rs.getInt("category_id"));
            	category.setCategory_name(rs.getString("category_name"));
                return category;
	        }
	 
	    });
	 
	    return listCategory;
	}

}
