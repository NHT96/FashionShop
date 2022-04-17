package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import net.codejava.spring.model.Order;

public class OrderDAOImpl implements OrderDAO {
	
	private JdbcTemplate jdbcTemplate;
    public OrderDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
	@Override
	public void saveOrUpdate(Order order, String action) {
		// TODO Auto-generated method stub
		if (action == "update") {
            // update
            String sql = "UPDATE `order` SET order_date = ?, order_payment = ?, order_status = ?, order_total = ?, order_note = ?, customer_id = ?, order_name = ?, order_phone = ?, order_email = ?, order_address = ?, order_payment_code = ? WHERE order_id = ?";
            jdbcTemplate.update(sql, order.getOrder_date(), order.getOrder_payment(), order.getOrder_status(), order.getOrder_total(), order.getOrder_note(), order.getCustomer_id(), order.getOrder_name(), order.getOrder_phone(), order.getOrder_email(), order.getOrder_address(), order.getOrder_payment_code(), order.getOrder_id());
        } else {
            // insert
            String sql = "INSERT INTO `order`(`order_id`, `order_date`, `order_payment`, `order_status`, `order_total`, `order_note`, `customer_id`, `order_name`, `order_phone`, `order_email`, `order_address`, `order_payment_code`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
            jdbcTemplate.update(sql,order.getOrder_id(), order.getOrder_date(), order.getOrder_payment(), order.getOrder_status(), order.getOrder_total(), order.getOrder_note(), order.getCustomer_id(), order.getOrder_name(), order.getOrder_phone(), order.getOrder_email(), order.getOrder_address(),"");
        }
	}

	@Override
	public void delete(int order_id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM `order` WHERE order_id=?";
        jdbcTemplate.update(sql, order_id);
	}
	
	@Override
	public Order get(String order_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM `order` WHERE order_id=" + order_id;
        return jdbcTemplate.query(sql, new ResultSetExtractor<Order>() {
     
            @Override
            public Order extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                	Order order = new Order();
                	order.setOrder_id(rs.getString("order_id"));
                	order.setOrder_date(rs.getDate("order_date"));
                	order.setOrder_payment(rs.getInt("order_payment"));
                	order.setOrder_status(rs.getInt("order_status"));
                	order.setOrder_total(rs.getDouble("order_total"));
                	order.setOrder_note(rs.getString("order_note"));
                	order.setCustomer_id(rs.getInt("customer_id"));
                	order.setOrder_name(rs.getString("order_name"));
                	order.setOrder_phone(rs.getString("order_phone"));
                	order.setOrder_email(rs.getString("order_email"));
                	order.setOrder_address(rs.getString("order_address"));
                	order.setOrder_payment_code(rs.getString("order_payment_code"));
                    return order;
                }
     
                return null;
            }
     
        });
	}

	@Override
	public List<Order> list() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM `order` ORDER BY order_date DESC";
	    List<Order> listOrder = jdbcTemplate.query(sql, new RowMapper<Order>() {
	 
	        @Override
	        public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Order order = new Order();
            	order.setOrder_id(rs.getString("order_id"));
            	order.setOrder_date(rs.getDate("order_date"));
            	order.setOrder_payment(rs.getInt("order_payment"));
            	order.setOrder_status(rs.getInt("order_status"));
            	order.setOrder_total(rs.getDouble("order_total"));
            	order.setOrder_note(rs.getString("order_note"));
            	order.setCustomer_id(rs.getInt("customer_id"));
            	order.setOrder_name(rs.getString("order_name"));
            	order.setOrder_phone(rs.getString("order_phone"));
            	order.setOrder_email(rs.getString("order_email"));
            	order.setOrder_address(rs.getString("order_address"));
            	order.setOrder_payment_code(rs.getString("order_payment_code"));
                return order;
	        }
	 
	    });
	 
	    return listOrder;
	}

	@Override
	public List<Order> listOrder_User(int customer_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM `order` WHERE customer_id = '" + customer_id +"' ORDER BY order_date DESC";
	    List<Order> listOrder = jdbcTemplate.query(sql, new RowMapper<Order>() {
	 
	        @Override
	        public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Order order = new Order();
            	order.setOrder_id(rs.getString("order_id"));
            	order.setOrder_date(rs.getDate("order_date"));
            	order.setOrder_payment(rs.getInt("order_payment"));
            	order.setOrder_status(rs.getInt("order_status"));
            	order.setOrder_total(rs.getDouble("order_total"));
            	order.setOrder_note(rs.getString("order_note"));
            	order.setCustomer_id(rs.getInt("customer_id"));
            	order.setOrder_name(rs.getString("order_name"));
            	order.setOrder_phone(rs.getString("order_phone"));
            	order.setOrder_email(rs.getString("order_email"));
            	order.setOrder_address(rs.getString("order_address"));
            	order.setOrder_payment_code(rs.getString("order_payment_code"));
                return order;
	        }
	 
	    });
	 
	    return listOrder;
	}

	@Override
	public Order checkOrderPayment(String orderPayment) {
		String sql = "SELECT * FROM `order` WHERE order_payment_code = '"+orderPayment+"'";
		return jdbcTemplate.query(sql, new ResultSetExtractor<Order>() {
            @Override
            public Order extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                	Order order = new Order();
                	order.setOrder_id(rs.getString("order_id"));
                	order.setOrder_date(rs.getDate("order_date"));
                	order.setOrder_payment(rs.getInt("order_payment"));
                	order.setOrder_status(rs.getInt("order_status"));
                	order.setOrder_total(rs.getDouble("order_total"));
                	order.setOrder_note(rs.getString("order_note"));
                	order.setCustomer_id(rs.getInt("customer_id"));
                	order.setOrder_name(rs.getString("order_name"));
                	order.setOrder_phone(rs.getString("order_phone"));
                	order.setOrder_email(rs.getString("order_email"));
                	order.setOrder_address(rs.getString("order_address"));
                	order.setOrder_payment_code(rs.getString("order_payment_code"));
                    return order;
                }
     
                return null;
            }
     
        });
	}

	@Override
	public void updateMOMO(int order_status, String order_payment_code, String order_id) {
		String sql = "UPDATE `order` SET order_status = ?, order_payment_code = ? WHERE order_id = ?";
        jdbcTemplate.update(sql, order_status, order_payment_code, order_id);
	}

	@Override
	public List<Order> listwait() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM `order`WHERE order_status = '1' ORDER BY order_date DESC";
	    List<Order> listOrder = jdbcTemplate.query(sql, new RowMapper<Order>() {
	 
	        @Override
	        public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Order order = new Order();
            	order.setOrder_id(rs.getString("order_id"));
            	order.setOrder_date(rs.getDate("order_date"));
            	order.setOrder_payment(rs.getInt("order_payment"));
            	order.setOrder_status(rs.getInt("order_status"));
            	order.setOrder_total(rs.getDouble("order_total"));
            	order.setOrder_note(rs.getString("order_note"));
            	order.setCustomer_id(rs.getInt("customer_id"));
            	order.setOrder_name(rs.getString("order_name"));
            	order.setOrder_phone(rs.getString("order_phone"));
            	order.setOrder_email(rs.getString("order_email"));
            	order.setOrder_address(rs.getString("order_address"));
            	order.setOrder_payment_code(rs.getString("order_payment_code"));
                return order;
	        }
	 
	    });
	 
	    return listOrder;
	}

	@Override
	public double getOrderTotal() {
		// TODO Auto-generated method stub
		String sql = "SELECT SUM(`order_total`) as total FROM `order`";
		long tmp = jdbcTemplate.queryForLong(sql);
         return tmp;
	}
	
	@Override
	public int getCustomerTotal() {
		// TODO Auto-generated method stub
		String sql = "SELECT COUNT(`customer_id`) as total FROM `customer`";
		int tmp = jdbcTemplate.queryForInt(sql);
         return tmp;
	}
	
	@Override
	public int getOrderCount() {
		// TODO Auto-generated method stub
		String sql = "SELECT COUNT(`order_id`) as total FROM `order`";
		int tmp = jdbcTemplate.queryForInt(sql);
         return tmp;
	}
	
	@Override
	public int getProductCount() {
		// TODO Auto-generated method stub
		String sql = "SELECT COUNT(`product_id`) as total FROM `product`";
		int tmp = jdbcTemplate.queryForInt(sql);
         return tmp;
	}

	@Override
	public List<Order> listOrderAccept() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM `order` WHERE order_status = '0' ORDER BY order_date DESC";
	    List<Order> listOrder = jdbcTemplate.query(sql, new RowMapper<Order>() {
	 
	        @Override
	        public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Order order = new Order();
            	order.setOrder_id(rs.getString("order_id"));
            	order.setOrder_date(rs.getDate("order_date"));
            	order.setOrder_payment(rs.getInt("order_payment"));
            	order.setOrder_status(rs.getInt("order_status"));
            	order.setOrder_total(rs.getDouble("order_total"));
            	order.setOrder_note(rs.getString("order_note"));
            	order.setCustomer_id(rs.getInt("customer_id"));
            	order.setOrder_name(rs.getString("order_name"));
            	order.setOrder_phone(rs.getString("order_phone"));
            	order.setOrder_email(rs.getString("order_email"));
            	order.setOrder_address(rs.getString("order_address"));
            	order.setOrder_payment_code(rs.getString("order_payment_code"));
                return order;
	        }
	 
	    });
	 
	    return listOrder;
	}
}
