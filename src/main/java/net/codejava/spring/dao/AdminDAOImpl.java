package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import net.codejava.spring.model.Admin;
import net.codejava.spring.model.ProductViewModel;

public class AdminDAOImpl implements AdminDAO{
	private JdbcTemplate jdbcTemplate;
    public AdminDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
	@Override
	public void saveOrUpdate(Admin admin) {
		// TODO Auto-generated method stub
		if (admin.getAdmin_id() > 0) {
            // update
            String sql = "UPDATE admin SET admin_user = ?, admin_name = ?, admin_pass = ?, admin_role = ? WHERE admin_id = ?";
            jdbcTemplate.update(sql, admin.getAdmin_user(), admin.getAdmin_name(), admin.getAdmin_pass(), admin.getAdmin_role(), admin.getAdmin_id());
        } else {
            // insert
            String sql = "INSERT INTO admin(admin_user, admin_name, admin_pass, admin_role) VALUES (?,?,?,?)";
            jdbcTemplate.update(sql, admin.getAdmin_user(), admin.getAdmin_name(), admin.getAdmin_pass(), admin.getAdmin_role());
        }
	}
	@Override
	public void delete(int admin_id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM admin WHERE admin_id=?";
        jdbcTemplate.update(sql, admin_id);
	}
	@Override
	public Admin get(int admin_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM admin WHERE admin_id=" + admin_id;
        return jdbcTemplate.query(sql, new ResultSetExtractor<Admin>() {
     
            @Override
            public Admin extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                    Admin admin = new Admin();
                    admin.setAdmin_id(rs.getInt("admin_id"));
                    admin.setAdmin_user(rs.getString("admin_user"));
                    admin.setAdmin_name(rs.getString("admin_name"));
                    admin.setAdmin_pass(rs.getString("admin_pass"));
                    admin.setAdmin_role(rs.getString("admin_role"));
                    return admin;
                }
     
                return null;
            }
     
        });
	}
	@Override
	public List<Admin> list() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM admin";
	    List<Admin> listAdmin = jdbcTemplate.query(sql, new RowMapper<Admin>() {
	 
	        @Override
	        public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Admin admin = new Admin();
                admin.setAdmin_id(rs.getInt("admin_id"));
                admin.setAdmin_user(rs.getString("admin_user"));
                admin.setAdmin_name(rs.getString("admin_name"));
                admin.setAdmin_pass(rs.getString("admin_pass"));
                admin.setAdmin_role(rs.getString("admin_role"));
                return admin;
	        }
	 
	    });
	 
	    return listAdmin;
	}
	
	@Override
	public int login(String admin_user, String admin_pass) {
		// TODO Auto-generated method stub
		String sql = "SELECT admin_id FROM admin WHERE admin_user = ? and admin_pass = ?";
		int admin = jdbcTemplate.queryForObject(sql, new Object[] { admin_user, admin_pass}, Integer.class);
		
		return admin;
	}
	@Override
	public boolean UpdateStt(String tt, String order_id) {
		// TODO Auto-generated method stub
		try {
			String sql = "UPDATE `order` SET order_status = ? WHERE order_id = ?";
	        jdbcTemplate.update(sql, tt, order_id);
	        return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	@Override
	public List<ProductViewModel> manageProduct(){
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM product a, brand b, category c WHERE a.brand_id = b.brand_id and a.category_id = c.category_id";
	    List<ProductViewModel> listProduct = jdbcTemplate.query(sql, (rs, rsNum) -> new ProductViewModel(
	    		rs.getInt("product_id"),
	    		rs.getString("product_name"),
	    		rs.getString("product_color"),
	    		rs.getString("product_size"),
	    		rs.getString("product_img"),
	    		rs.getDouble("product_price"),
	    		rs.getString("category_name"),
	    		rs.getString("brand_name"),
	    		rs.getString("product_description"),
	    		rs.getString("product_status")
	    ));
	    
	    return listProduct;
	}
	
	@Override
	public boolean UpdateAccountStt(String tt, String customer_id) {
		// TODO Auto-generated method stub
		try {
			String sql = "UPDATE `customer` SET customer_status = ? WHERE customer_id = ?";
	        jdbcTemplate.update(sql, tt, customer_id);
	        return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

}
