package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import net.codejava.spring.model.Brand;

public class BrandDAOImpl implements BrandDAO{
	
	private JdbcTemplate jdbcTemplate;
    public BrandDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
	@Override
	public void saveOrUpdate(Brand brand) {
		// TODO Auto-generated method stub
		if (brand.getBrand_id() > 0) {
            // update
            String sql = "UPDATE brand SET brand_name = ?, brand_logo = ? WHERE brand_id = ?";
            jdbcTemplate.update(sql, brand.getBrand_name(), brand.getBrand_logo(), brand.getBrand_id());
        } else {
            // insert
            String sql = "INSERT INTO brand(brand_name, brand_logo) VALUES (?,?)";
            jdbcTemplate.update(sql, brand.getBrand_name(), brand.getBrand_logo());
        }
	}

	@Override
	public void delete(int brand_id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM brand WHERE brand_id=?";
        jdbcTemplate.update(sql, brand_id);
	}

	@Override
	public Brand get(int brand_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM brand WHERE brand_id=" + brand_id;
        return jdbcTemplate.query(sql, new ResultSetExtractor<Brand>() {
     
            @Override
            public Brand extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                    Brand brand = new Brand();
                    brand.setBrand_id(rs.getInt("brand_id"));
                    brand.setBrand_name(rs.getString("brand_name"));
                    brand.setBrand_logo(rs.getString("brand_logo"));
                    return brand;
                }
     
                return null;
            }
     
        });
	}

	@Override
	public List<Brand> list() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM brand";
	    List<Brand> listBrand = jdbcTemplate.query(sql, new RowMapper<Brand>() {
	 
	        @Override
	        public Brand mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Brand brand = new Brand();
                brand.setBrand_id(rs.getInt("brand_id"));
                brand.setBrand_name(rs.getString("brand_name"));
                brand.setBrand_logo(rs.getString("brand_logo"));
                return brand;
	        }
	 
	    });
	 
	    return listBrand;
	}

	@Override
	public void addbrand() {
		// TODO Auto-generated method stub
		
	}

}
