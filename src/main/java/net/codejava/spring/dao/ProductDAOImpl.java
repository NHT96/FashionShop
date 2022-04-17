package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import net.codejava.spring.model.Product;

public class ProductDAOImpl implements ProductDAO {
	
	private JdbcTemplate jdbcTemplate;
    public ProductDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
    @Override
	public void add(Product product) {
		// TODO Auto-generated method stub
		// insert
        String sql = "INSERT INTO product(product_name, product_color, product_size, product_img, product_price, category_id, brand_id, product_description, product_status) VALUES (?,?,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, product.getProduct_name(), product.getProduct_color(), product.getProduct_size(), product.getProduct_img(), product.getProduct_price(), product.getCategory_id(), product.getBrand_id(), product.getProduct_description(), product.getProduct_status());
	}
	@Override
	public void saveOrUpdate(Product product) {
		// TODO Auto-generated method stub
		if (product.getProduct_id() > 0) {
            // update
            String sql = "UPDATE product SET product_name = ?, product_color = ?, product_size = ?, product_img = ?, product_price = ?, category_id = ?, brand_id = ?, product_description = ?, product_status = ? WHERE product_id= ?";
            jdbcTemplate.update(sql, product.getProduct_name(), product.getProduct_color(), product.getProduct_size(), product.getProduct_img(), product.getProduct_price(), product.getCategory_id(), product.getBrand_id(), product.getProduct_description(), product.getProduct_status(), product.getProduct_id());
        } else {
            // insert
            String sql = "INSERT INTO product(product_name, product_color, product_size, product_img, product_price, category_id, brand_id, product_description, product_status) VALUES (?,?,?,?,?,?,?,?,?)";
            jdbcTemplate.update(sql, product.getProduct_name(), product.getProduct_color(), product.getProduct_size(), product.getProduct_img(), product.getProduct_price(), product.getCategory_id(), product.getBrand_id(), product.getProduct_description(), product.getProduct_status());
        }
	}

	@Override
	public void delete(int product_id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM product WHERE product_id=?";
        jdbcTemplate.update(sql, product_id);
	}

	@Override
	public Product get(int product_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM product WHERE product_id=" + product_id;
        return jdbcTemplate.query(sql, new ResultSetExtractor<Product>() {
     
            @Override
            public Product extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                	Product product = new Product();
    	        	product.setProduct_id(rs.getInt("product_id"));
    	        	product.setProduct_name(rs.getString("product_name"));
    	        	product.setProduct_color(rs.getString("product_color"));
    	        	product.setProduct_size(rs.getString("product_size"));
    	        	product.setProduct_img(rs.getString("product_img"));
    	        	product.setProduct_price(rs.getDouble("product_price"));
    	        	product.setCategory_id(rs.getInt("category_id"));
    	        	product.setBrand_id(rs.getInt("brand_id"));
    	        	product.setProduct_description(rs.getString("product_description"));
    	        	product.setProduct_status(rs.getString("product_status"));
                    return product;
                }
     
                return null;
            }
     
        });
	}

	@Override
	public List<Product> list() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM product ORDER BY product_id DESC";
	    List<Product> listProduct = jdbcTemplate.query(sql, new RowMapper<Product>() {
	 
	        @Override
	        public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Product product = new Product();
	        	product.setProduct_id(rs.getInt("product_id"));
	        	product.setProduct_name(rs.getString("product_name"));
	        	product.setProduct_color(rs.getString("product_color"));
	        	product.setProduct_size(rs.getString("product_size"));
	        	product.setProduct_img(rs.getString("product_img"));
	        	product.setProduct_price(rs.getDouble("product_price"));
	        	product.setCategory_id(rs.getInt("category_id"));
	        	product.setBrand_id(rs.getInt("brand_id"));
	        	product.setProduct_description(rs.getString("product_description"));
	        	product.setProduct_status(rs.getString("product_status"));
                return product;
	        }
	 
	    });
	 
	    return listProduct;
	}
	
	@Override
	public List<Product> listByBrand(int brand_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM product WHERE brand_id="+brand_id+" ORDER BY product_id DESC";
	    List<Product> listProduct = jdbcTemplate.query(sql, new RowMapper<Product>() {
	 
	        @Override
	        public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Product product = new Product();
	        	product.setProduct_id(rs.getInt("product_id"));
	        	product.setProduct_name(rs.getString("product_name"));
	        	product.setProduct_color(rs.getString("product_color"));
	        	product.setProduct_size(rs.getString("product_size"));
	        	product.setProduct_img(rs.getString("product_img"));
	        	product.setProduct_price(rs.getDouble("product_price"));
	        	product.setCategory_id(rs.getInt("category_id"));
	        	product.setBrand_id(rs.getInt("brand_id"));
	        	product.setProduct_description(rs.getString("product_description"));
	        	product.setProduct_status(rs.getString("product_status"));
                return product;
	        }
	 
	    });
	 
	    return listProduct;
	}
	
	@Override
	public List<Product> listByCategory(int category_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM product WHERE category_id="+category_id+" ORDER BY product_id DESC";
	    List<Product> listProduct = jdbcTemplate.query(sql, new RowMapper<Product>() {
	 
	        @Override
	        public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Product product = new Product();
	        	product.setProduct_id(rs.getInt("product_id"));
	        	product.setProduct_name(rs.getString("product_name"));
	        	product.setProduct_color(rs.getString("product_color"));
	        	product.setProduct_size(rs.getString("product_size"));
	        	product.setProduct_img(rs.getString("product_img"));
	        	product.setProduct_price(rs.getDouble("product_price"));
	        	product.setCategory_id(rs.getInt("category_id"));
	        	product.setBrand_id(rs.getInt("brand_id"));
	        	product.setProduct_description(rs.getString("product_description"));
	        	product.setProduct_status(rs.getString("product_status"));
                return product;
	        }
	 
	    });
	 
	    return listProduct;
	}
	
	@Override
	public List<Product> listSearch(String str) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM product WHERE product_name LIKE '%"+str+"%' ORDER BY product_id DESC";
	    List<Product> listProduct = jdbcTemplate.query(sql, new RowMapper<Product>() {
	 
	        @Override
	        public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Product product = new Product();
	        	product.setProduct_id(rs.getInt("product_id"));
	        	product.setProduct_name(rs.getString("product_name"));
	        	product.setProduct_color(rs.getString("product_color"));
	        	product.setProduct_size(rs.getString("product_size"));
	        	product.setProduct_img(rs.getString("product_img"));
	        	product.setProduct_price(rs.getDouble("product_price"));
	        	product.setCategory_id(rs.getInt("category_id"));
	        	product.setBrand_id(rs.getInt("brand_id"));
	        	product.setProduct_description(rs.getString("product_description"));
	        	product.setProduct_status(rs.getString("product_status"));
                return product;
	        }
	 
	    });
	 
	    return listProduct;
	}
}
