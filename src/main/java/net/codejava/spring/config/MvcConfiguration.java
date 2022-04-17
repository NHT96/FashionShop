package net.codejava.spring.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import net.codejava.spring.dao.AdminDAO;
import net.codejava.spring.dao.AdminDAOImpl;
import net.codejava.spring.dao.BrandDAO;
import net.codejava.spring.dao.BrandDAOImpl;
import net.codejava.spring.dao.CategoryDAO;
import net.codejava.spring.dao.CategoryDAOImpl;
import net.codejava.spring.dao.CustomerDAO;
import net.codejava.spring.dao.CustomerDAOImpl;
import net.codejava.spring.dao.FeedbackDAO;
import net.codejava.spring.dao.FeedbackDAOImpl;
import net.codejava.spring.dao.OrderDAO;
import net.codejava.spring.dao.OrderDAOImpl;
import net.codejava.spring.dao.Order_detailDAO;
import net.codejava.spring.dao.Order_detailDAOImpl;
import net.codejava.spring.dao.ProductDAO;
import net.codejava.spring.dao.ProductDAOImpl;

@Configuration
@ComponentScan(basePackages="net.codejava.spring")
@EnableWebMvc
public class MvcConfiguration extends WebMvcConfigurerAdapter {
	 @Bean
	    public ViewResolver getViewResolver(){
	        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	        resolver.setPrefix("/WEB-INF/views/");
	        resolver.setSuffix(".jsp");
	        return resolver;
	    }
	     
	    @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	    }
	 
	    @Bean
	    public DataSource getDataSource() {
	        DriverManagerDataSource dataSource = new DriverManagerDataSource();
	        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
	        dataSource.setUrl("jdbc:mysql://localhost:3306/tdtfashion");
	        dataSource.setUsername("root");
	        dataSource.setPassword("");
	         
	        return dataSource;
	    }
	     
	    @Bean
	    public AdminDAO getAdminDAO() {
	        return new AdminDAOImpl(getDataSource());
	    }
	    @Bean
	    public BrandDAO getBrandDAO() {
	        return new BrandDAOImpl(getDataSource());
	    }
	    @Bean
	    public CategoryDAO getCategoryDAO() {
	        return new CategoryDAOImpl(getDataSource());
	    }
	    @Bean
	    public CustomerDAO getCustomerDAO() {
	        return new CustomerDAOImpl(getDataSource());
	    }
	    @Bean
	    public FeedbackDAO getFeedbackDAO() {
	        return new FeedbackDAOImpl(getDataSource());
	    }
	    @Bean
	    public Order_detailDAO getOrder_detailDAO() {
	        return new Order_detailDAOImpl(getDataSource());
	    }
	    @Bean
	    public OrderDAO getOrderDAO() {
	        return new OrderDAOImpl(getDataSource());
	    }
	    @Bean
	    public ProductDAO getprProductDAO() {
	        return new ProductDAOImpl(getDataSource());
	    }
}
