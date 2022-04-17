package net.codejava.spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import net.codejava.spring.model.Feedback;

public class FeedbackDAOImpl implements FeedbackDAO {
	
	private JdbcTemplate jdbcTemplate;
    public FeedbackDAOImpl(DataSource dataSource) {
        jdbcTemplate = new JdbcTemplate(dataSource);
    }
    
	@Override
	public void saveOrUpdate(Feedback feedback) {
		// TODO Auto-generated method stub
		if (feedback.getFeedback_id() > 0) {
            // update
            String sql = "UPDATE feedback SET feedback_comment = ?, feedback_rate = ?, feedback_date = ?, product_id = ?, customer_id = ? WHERE feedback_id = ?";
            jdbcTemplate.update(sql, feedback.getFeedback_comment(), feedback.getFeedback_rate(), feedback.getFeedback_date(), feedback.getProduct_id(), feedback.getCustomer_id(), feedback.getFeedback_id());
        } else {
            // insert
            String sql = "INSERT INTO feedback(feedback_comment, feedback_rate, feedback_date, product_id, customer_id) VALUES (?,?,?,?,?)";
            jdbcTemplate.update(sql, feedback.getFeedback_comment(), feedback.getFeedback_rate(), feedback.getFeedback_date(), feedback.getProduct_id(), feedback.getCustomer_id());
        }
	}

	@Override
	public void delete(int feedback_id) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM feedback WHERE feedback_id=?";
        jdbcTemplate.update(sql, feedback_id);
	}

	@Override
	public Feedback get(int feedback_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM feedback WHERE feedback_id=" + feedback_id;
        return jdbcTemplate.query(sql, new ResultSetExtractor<Feedback>() {
     
            @Override
            public Feedback extractData(ResultSet rs) throws SQLException,
                    DataAccessException {
                if (rs.next()) {
                	Feedback feedback = new Feedback();
    	        	feedback.setFeedback_id(rs.getInt("feedback_id"));
    	        	feedback.setFeedback_comment(rs.getString("feedback_comment"));
    	        	feedback.setFeedback_rate(rs.getInt("feedback_rate"));
    	        	feedback.setFeedback_date(rs.getDate("feedback_date"));
    	        	feedback.setProduct_id(rs.getInt("product_id"));
    	        	feedback.setCustomer_id(rs.getInt("customer_id"));
                    return feedback;
                }
     
                return null;
            }
     
        });
	}
	
	public List<Feedback> getFromProduct(int product_id){
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM feedback WHERE product_id=" + product_id + " ORDER BY feedback_id DESC";
	    List<Feedback> listFeedback = jdbcTemplate.query(sql, new RowMapper<Feedback>() {
	 
	        @Override
	        public Feedback mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Feedback feedback = new Feedback();
	        	feedback.setFeedback_id(rs.getInt("feedback_id"));
	        	feedback.setFeedback_comment(rs.getString("feedback_comment"));
	        	feedback.setFeedback_rate(rs.getInt("feedback_rate"));
	        	feedback.setFeedback_date(rs.getDate("feedback_date"));
	        	feedback.setProduct_id(rs.getInt("product_id"));
	        	feedback.setCustomer_id(rs.getInt("customer_id"));
                return feedback;
	        }
	 
	    });
	 
	    return listFeedback; 
	}

	@Override
	public List<Feedback> list() {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM feedback ORDER BY feedback_id DESC";
	    List<Feedback> listFeedback = jdbcTemplate.query(sql, new RowMapper<Feedback>() {
	 
	        @Override
	        public Feedback mapRow(ResultSet rs, int rowNum) throws SQLException {
	        	Feedback feedback = new Feedback();
	        	feedback.setFeedback_id(rs.getInt("feedback_id"));
	        	feedback.setFeedback_comment(rs.getString("feedback_comment"));
	        	feedback.setFeedback_rate(rs.getInt("feedback_rate"));
	        	feedback.setFeedback_date(rs.getDate("feedback_date"));
	        	feedback.setProduct_id(rs.getInt("product_id"));
	        	feedback.setCustomer_id(rs.getInt("customer_id"));
                return feedback;
	        }
	 
	    });
	 
	    return listFeedback;
	}

}
