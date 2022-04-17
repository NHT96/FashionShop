package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import net.codejava.spring.model.Customer;

public class CustomerDAOImpl implements CustomerDAO {
	
	private JdbcTemplate jdbcTemplate;
    public CustomerDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
	@Override
	public void saveOrUpdate(Customer customer) {
		// TODO Auto-generated method stub
		if (customer.getCustomer_id() > 0) {
            // update
            String sql = "UPDATE customer SET customer_name = ?, customer_email = ?, customer_phone = ?, customer_address = ?, customer_pass = ?, customer_status = ? WHERE customer_id = ?";
            jdbcTemplate.update(sql, customer.getCustomer_name(), customer.getCustomer_email(), customer.getCustomer_phone(), customer.getCustomer_address(), customer.getCustomer_pass(), customer.getCustomer_status(), customer.getCustomer_id());
        } else {
            // insert
            String sql = "INSERT INTO customer(customer_name, customer_email, customer_phone, customer_address, customer_pass, customer_status) VALUES (?,?,?,?,?,?)";
            jdbcTemplate.update(sql, customer.getCustomer_name(), customer.getCustomer_email(), customer.getCustomer_phone(), customer.getCustomer_address(), customer.getCustomer_pass(), customer.getCustomer_status());
        }
	}
	
	@Override
	public boolean Update(String name, String phone, String add, int id) {
		// TODO Auto-generated method stub
		try {
			String sql = "UPDATE customer SET customer_name = ?, customer_phone = ?, customer_address = ? WHERE customer_id = ?";
	        jdbcTemplate.update(sql, name, phone, add, id);
	        return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	@Override
	public boolean UpdatePass(String pass, int id) {
		// TODO Auto-generated method stub
		try {
			String sql = "UPDATE customer SET customer_pass= ? WHERE customer_id = ?";
	        jdbcTemplate.update(sql, pass, id);
	        return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public void delete(int customer_id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM customer WHERE customer_id=?";
        jdbcTemplate.update(sql, customer_id);
	}

	@Override
	public Customer get(int customer_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM customer WHERE customer_id=" + customer_id;
        return jdbcTemplate.query(sql, new ResultSetExtractor<Customer>() {
     
            @Override
            public Customer extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                	Customer customer = new Customer();
                	customer.setCustomer_id(rs.getInt("customer_id"));
                	customer.setCustomer_name(rs.getString("customer_name"));
                	customer.setCustomer_email(rs.getString("customer_email"));
                	customer.setCustomer_phone(rs.getString("customer_phone"));
                	customer.setCustomer_address(rs.getString("customer_address"));
                	customer.setCustomer_pass(rs.getString("customer_pass"));
                	customer.setCustomer_status(rs.getString("customer_status"));
                    return customer;
                }
     
                return null;
            }
     
        });
	}

	@Override
	public List<Customer> list() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM `customer`";
	    List<Customer> listCustomer = jdbcTemplate.query(sql, new RowMapper<Customer>() {
	 
	        @Override
	        public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Customer customer = new Customer();
            	customer.setCustomer_id(rs.getInt("customer_id"));
            	customer.setCustomer_name(rs.getString("customer_name"));
            	customer.setCustomer_email(rs.getString("customer_email"));
            	customer.setCustomer_phone(rs.getString("customer_phone"));
            	customer.setCustomer_address(rs.getString("customer_address"));
            	customer.setCustomer_pass(rs.getString("customer_pass"));
            	customer.setCustomer_status(rs.getString("customer_status"));
                return customer;
	        }
	 
	    });
	 
	    return listCustomer;
	}

	@Override
	public Customer login(String user, String pass) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM customer WHERE customer_email ='" + user + "'AND `customer_pass` = '" + pass +"'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<Customer>() {
     
            @Override
            public Customer extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                	Customer customer = new Customer();
                	customer.setCustomer_id(rs.getInt("customer_id"));
                	customer.setCustomer_name(rs.getString("customer_name"));
                	customer.setCustomer_email(rs.getString("customer_email"));
                	customer.setCustomer_phone(rs.getString("customer_phone"));
                	customer.setCustomer_address(rs.getString("customer_address"));
                	customer.setCustomer_pass(rs.getString("customer_pass"));
                	customer.setCustomer_status(rs.getString("customer_status"));
                    return customer;
                }
     
                return null;
            }
     
        });
	}
	
	@Override
	public Customer checkPass(String user, String pass) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM customer WHERE customer_id ='" + user + "'AND `customer_pass` = '" + pass +"'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<Customer>() {
     
            @Override
            public Customer extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                	Customer customer = new Customer();
                	customer.setCustomer_id(rs.getInt("customer_id"));
                	customer.setCustomer_name(rs.getString("customer_name"));
                	customer.setCustomer_email(rs.getString("customer_email"));
                	customer.setCustomer_phone(rs.getString("customer_phone"));
                	customer.setCustomer_address(rs.getString("customer_address"));
                	customer.setCustomer_pass(rs.getString("customer_pass"));
                	customer.setCustomer_status(rs.getString("customer_status"));
                    return customer;
                }
     
                return null;
            }
     
        });
	}

	@Override
	public boolean UpdateStt(String tt, String order_id, int customer_id) {
		// TODO Auto-generated method stub
		try {
			String sql = "UPDATE `order` SET order_status = ? WHERE order_id = ? AND customer_id = ?";
	        jdbcTemplate.update(sql, tt, order_id, customer_id);
	        return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean Signup(String name, String email, String phone, String address, String pass) {
		// TODO Auto-generated method stub
		try {
			String sql = "INSERT INTO customer(customer_name, customer_email, customer_phone, customer_address, customer_pass) VALUES (?,?,?,?,?)";
            jdbcTemplate.update(sql, name, email, phone, address, pass);
	        return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public List<Customer> CheckBeforSignup(String email, String phone) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM `customer` WHERE customer_email = '"+ email + "' OR customer_phone = '" + phone +"'";
	    List<Customer> listCustomer = jdbcTemplate.query(sql, new RowMapper<Customer>() {
	 
	        @Override
	        public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Customer customer = new Customer();
            	customer.setCustomer_id(rs.getInt("customer_id"));
            	customer.setCustomer_name(rs.getString("customer_name"));
            	customer.setCustomer_email(rs.getString("customer_email"));
            	customer.setCustomer_phone(rs.getString("customer_phone"));
            	customer.setCustomer_address(rs.getString("customer_address"));
            	customer.setCustomer_pass(rs.getString("customer_pass"));
            	customer.setCustomer_status(rs.getString("customer_status"));
                return customer;
	        }
	 
	    });
	 
	    return listCustomer;
	}

	@Override
	public Customer CheckEmail(String email) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM `customer` WHERE `customer_email` = '" + email +"'";
        return jdbcTemplate.query(sql, new ResultSetExtractor<Customer>() {
     
            @Override
            public Customer extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                	Customer customer = new Customer();
                	customer.setCustomer_id(rs.getInt("customer_id"));
                	customer.setCustomer_name(rs.getString("customer_name"));
                	customer.setCustomer_email(rs.getString("customer_email"));
                	customer.setCustomer_phone(rs.getString("customer_phone"));
                	customer.setCustomer_address(rs.getString("customer_address"));
                	customer.setCustomer_pass(rs.getString("customer_pass"));
                	customer.setCustomer_status(rs.getString("customer_status"));
                    return customer;
                }
     
                return null;
            }
     
        });
	}

	@Override
	public boolean UpdatePassMail(String pass, String email) {
		// TODO Auto-generated method stub
		try {
			String sql = "UPDATE customer SET customer_pass= ? WHERE customer_email = ?";
	        jdbcTemplate.update(sql, pass, email);
	        return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

}
