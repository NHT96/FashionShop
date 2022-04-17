package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import net.codejava.spring.model.Order_detail;

public class Order_detailDAOImpl implements Order_detailDAO {
	
	private JdbcTemplate jdbcTemplate;
    public Order_detailDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
	@Override
	public void saveOrUpdate(Order_detail order_detail) {
		// TODO Auto-generated method stub
		if (order_detail.getOrder_detail_id() > 0) {
            // update
            String sql = "UPDATE order_detail SET product_id = ?, order_id = ?, order_detail_count = ?, order_detail_price = ?, order_detail_size_choose = ?, order_detail_color_choose = ? WHERE order_detail_id = ?";
            jdbcTemplate.update(sql, order_detail.getProduct_id(), order_detail.getOrder_id(), order_detail.getOrder_detail_count(), order_detail.getOrder_detail_price(), order_detail.getOrder_detail_size_choose(), order_detail.getOrder_detail_color_choose(), order_detail.getOrder_detail_id());
        } else {
            // insert
            String sql = "INSERT INTO order_detail(product_id, order_id, order_detail_count, order_detail_price, order_detail_size_choose, order_detail_color_choose) VALUES (?,?,?,?,?,?)";
            jdbcTemplate.update(sql, order_detail.getProduct_id(), order_detail.getOrder_id(), order_detail.getOrder_detail_count(), order_detail.getOrder_detail_price(), order_detail.getOrder_detail_size_choose(), order_detail.getOrder_detail_color_choose());
        }
	}

	@Override
	public void delete(int order_detail_id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM Order_detail WHERE order_detail_id=?";
        jdbcTemplate.update(sql, order_detail_id);
	}

	@Override
	public Order_detail get(int order_detail_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM order_detail WHERE order_detail_id=" + order_detail_id;
        return jdbcTemplate.query(sql, new ResultSetExtractor<Order_detail>() {
     
            @Override
            public Order_detail extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                	Order_detail order_detail = new Order_detail();
    	        	order_detail.setOrder_detail_id(rs.getInt("order_detail_id"));
    	        	order_detail.setProduct_id(rs.getInt("product_id"));
    	        	order_detail.setOrder_id(rs.getString("order_id"));
    	        	order_detail.setOrder_detail_count(rs.getInt("order_detail_count"));
    	        	order_detail.setOrder_detail_price(rs.getDouble("order_detail_price"));
    	        	order_detail.setOrder_detail_size_choose(rs.getString("order_detail_size_choose"));
    	        	order_detail.setOrder_detail_color_choose(rs.getString("order_detail_color_choose"));
                    return order_detail;
                }
     
                return null;
            }
     
        });
	}

	@Override
	public List<Order_detail> list(String order_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM order_detail WHERE order_id=" + order_id;
	    List<Order_detail> listOrderdetail = jdbcTemplate.query(sql, new RowMapper<Order_detail>() {
	 
	        @Override
	        public Order_detail mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Order_detail order_detail = new Order_detail();
	        	order_detail.setOrder_detail_id(rs.getInt("order_detail_id"));
	        	order_detail.setProduct_id(rs.getInt("product_id"));
	        	order_detail.setOrder_id(rs.getString("order_id"));
	        	order_detail.setOrder_detail_count(rs.getInt("order_detail_count"));
	        	order_detail.setOrder_detail_price(rs.getDouble("order_detail_price"));
	        	order_detail.setOrder_detail_size_choose(rs.getString("order_detail_size_choose"));
	        	order_detail.setOrder_detail_color_choose(rs.getString("order_detail_color_choose"));
                return order_detail;
	        }
	 
	    });
	 
	    return listOrderdetail;
	}

}
