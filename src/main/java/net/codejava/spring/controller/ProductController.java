package net.codejava.spring.controller;

import java.io.Console;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.codejava.spring.dao.AdminDAO;
import net.codejava.spring.dao.BrandDAO;
import net.codejava.spring.dao.CategoryDAO;
import net.codejava.spring.dao.CustomerDAO;
import net.codejava.spring.dao.FeedbackDAO;
import net.codejava.spring.dao.ProductDAO;
import net.codejava.spring.model.Admin;
import net.codejava.spring.model.Brand;
import net.codejava.spring.model.Category;
import net.codejava.spring.model.Customer;
import net.codejava.spring.model.Feedback;
import net.codejava.spring.model.Product;
import com.google.gson.*;


@Controller
@RequestMapping(value="/product")
public class ProductController {
	@Autowired
    private BrandDAO brandDAO;
	@Autowired
    private ProductDAO productDAO;
	@Autowired
    private CategoryDAO categoryDAO;
	@Autowired
    private FeedbackDAO feedbackDAO;
	@Autowired
    private CustomerDAO customerDAO;
	
	@RequestMapping(value="")
	public ModelAndView index(HttpServletRequest request) throws IOException{
		List<Brand> listBrands = brandDAO.list();
	    List<Product> listProducts = productDAO.list();
	    List<Category> listCategories = categoryDAO.list();
	    ModelAndView model = new ModelAndView();
	    model.addObject("listBrands", listBrands);
	    model.addObject("listProducts", listProducts);
	    model.addObject("listCategories", listCategories);
	    model.setViewName("Product_index");
	    return model;
	}
	
	@RequestMapping(value="/brand")
	public ModelAndView brand(HttpServletRequest request) throws IOException{
		String id = request.getParameter("id");
		int number = Integer.parseInt(id);
		List<Brand> listBrands = brandDAO.list();
	    List<Product> listProducts = productDAO.listByBrand(number);
	    List<Category> listCategories = categoryDAO.list();
	    ModelAndView model = new ModelAndView();
	    model.addObject("listBrands", listBrands);
	    model.addObject("listProducts", listProducts);
	    model.addObject("listCategories", listCategories);
	    model.setViewName("Product_index");
	    return model;
	}
	
	@RequestMapping(value="/category")
	public ModelAndView category(HttpServletRequest request) throws IOException{
		String id = request.getParameter("id");
		int number = Integer.parseInt(id);
		List<Brand> listBrands = brandDAO.list();
	    List<Product> listProducts = productDAO.listByCategory(number);
	    List<Category> listCategories = categoryDAO.list();
	    ModelAndView model = new ModelAndView();
	    model.addObject("listBrands", listBrands);
	    model.addObject("listProducts", listProducts);
	    model.addObject("listCategories", listCategories);
	    model.setViewName("Product_index");
	    return model;
	}
	
	@RequestMapping(value="/search")
	public ModelAndView search(HttpServletRequest request) throws IOException{
		String str = request.getParameter("txt");
		List<Brand> listBrands = brandDAO.list();
	    List<Product> listProducts = productDAO.listSearch(str);
	    List<Category> listCategories = categoryDAO.list();
	    ModelAndView model = new ModelAndView();
	    model.addObject("listBrands", listBrands);
	    model.addObject("listProducts", listProducts);
	    model.addObject("listCategories", listCategories);
	    model.setViewName("Product_index");
	    return model;
	}
	
	@RequestMapping(value="/detail")
	public ModelAndView detail(HttpServletRequest request) throws IOException{
		String id = request.getParameter("id");
		int number = Integer.parseInt(id);
        Product product = productDAO.get(number);
        Category category = categoryDAO.get(product.getCategory_id());
        Brand brand = brandDAO.get(product.getBrand_id());
        List<Feedback> listFeedback = feedbackDAO.getFromProduct(product.getProduct_id());
        List<Customer> listCustomer = customerDAO.list();
        ModelAndView model = new ModelAndView();
        model.addObject("product", product);
	    model.addObject("category", category);
	    model.addObject("brand", brand);
	    model.addObject("listFeedback", listFeedback);
	    model.addObject("listCustomer", listCustomer);
	    model.setViewName("Product_detail");
	    return model;
	}
	
	@RequestMapping(value="/feedbackpost", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String feedbackpost(HttpServletRequest request){
		HttpSession session = request.getSession();
		String rate = request.getParameter("rate");
		String comment = request.getParameter("comment");
		String product_id = request.getParameter("product_id");
		String date = request.getParameter("date");
		String userId = String.valueOf(session.getAttribute("userId")) ;
		if (userId==null) {
			return "{\"status\": \"error\", \"message\": \"Vui Lòng Đăng Nhập!!\"}";
		}
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try{
			Customer customer = customerDAO.get(Integer.parseInt(userId));
			String data = new Gson().toJson(customer);
			Feedback feedback = new Feedback();
			feedback.setFeedback_comment(comment);
			feedback.setFeedback_date(formatter.parse(date));
			feedback.setFeedback_rate(Integer.parseInt(rate));
			feedback.setCustomer_id(Integer.parseInt(userId));
			feedback.setProduct_id(Integer.parseInt(product_id));
			try {
				feedbackDAO.saveOrUpdate(feedback);
				return "{\"status\": \"success\", \"message\": \"Complete!\", \"data\": \""+customer.getCustomer_name()+"\"}";
			}catch (Exception e){
				return "{\"status\": \"error\", \"message\": \"Lỗi Push Dữ Liệu!!\"}";
			}
		}catch(Exception e) {
			return "{\"status\": \"error\", \"message\": \"Lỗi Parse Dữ Liệu!!\"}";
		}
		
	}
	
}
