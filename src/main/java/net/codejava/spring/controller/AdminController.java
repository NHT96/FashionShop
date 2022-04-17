package net.codejava.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.codejava.spring.dao.AdminDAO;
import net.codejava.spring.dao.BrandDAO;
import net.codejava.spring.dao.CategoryDAO;
import net.codejava.spring.dao.CustomerDAO;
import net.codejava.spring.dao.OrderDAO;
import net.codejava.spring.dao.Order_detailDAO;
import net.codejava.spring.dao.ProductDAO;
import net.codejava.spring.model.Brand;
import net.codejava.spring.model.Category;
import net.codejava.spring.model.Customer;
import net.codejava.spring.model.Order;
import net.codejava.spring.model.Order_detail;
import net.codejava.spring.model.Product;
import net.codejava.spring.model.ProductViewModel;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	HttpSession session;
	@Autowired
	private AdminDAO adminDAO;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private Order_detailDAO order_detailDAO;
	@Autowired 
	private CategoryDAO categoryDAO;
	@Autowired 
	private BrandDAO brandDAO;
	@Autowired
	private CustomerDAO customerDAO;
	@RequestMapping(value="/index", method= RequestMethod.GET)
	public ModelAndView index(ModelAndView model, HttpServletRequest request) {
		session = request.getSession();
		String admin = (String)session.getAttribute("admin");
		if(admin == null) {
			return new ModelAndView("redirect:" + "/admin/signin");
		}
		double total = orderDAO.getOrderTotal();
		int customer = orderDAO.getCustomerTotal();
		int order = orderDAO.getOrderCount();
		int product = orderDAO.getProductCount();
		List<Order> listOrderAcceptList = orderDAO.listOrderAccept();
		model.addObject("customer", customer);
		model.addObject("total", total);
		model.addObject("order", order);
		model.addObject("product", product);
		model.addObject("listOrderAcceptList", listOrderAcceptList);
		model.setViewName("Admin_index");
		return model;
	}
	
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request) throws IOException{
		session = request.getSession();
		session.invalidate();
		return new ModelAndView("redirect:" + "./signin");
	}
	
	@RequestMapping(value="/manageproduct", method= RequestMethod.GET)
	public ModelAndView ProductList(ModelAndView model, HttpServletRequest request) {
		String admin = (String)session.getAttribute("admin");
		if(admin == null) {
			return new ModelAndView("redirect:" + "/admin/signin");
		}
		
		List<ProductViewModel> listProduct = adminDAO.manageProduct();
		model.addObject("products",listProduct);
		model.setViewName("Admin_products");
		return model;
	}
	
	@RequestMapping(value="/signin", method= RequestMethod.GET)
	public ModelAndView signin(ModelAndView model, HttpServletRequest request) throws IOException{	
	    model.setViewName("Admin_signin");
	    return model;
	}
	
	@RequestMapping(value="/signin", method= RequestMethod.POST )
	@ResponseBody
	public String signin(HttpServletRequest request) throws IOException{
		session = request.getSession();
		String account = request.getParameter("account");
		String password = DigestUtils.sha256Hex(request.getParameter("password"));
		
		int result = adminDAO.login(account, password);
		if(result == 1) {
			session.setAttribute("admin", account);
			return "{\"status\": \"success\", \"message\": \"Login successfull\"}";
		}
		
		return "{\"status\": \"error\", \"message\": \"Fail to login!\"}";
	}
	
	@RequestMapping(value="/productdetail", method= RequestMethod.GET)
	@ResponseBody
	public ModelAndView productdetail(ModelAndView model, HttpServletRequest request) {
		String admin = (String)session.getAttribute("admin");
		if(admin == null) {
			return new ModelAndView("redirect:" + "/admin/signin");
		}
		
		int id = Integer.valueOf(request.getParameter("id"));
		Product product = productDAO.get(id);
		
		List<Category> listCategory = categoryDAO.list();
		List<Brand> listBrand = brandDAO.list();
		
		model.addObject("product", product);
		model.addObject("categories",listCategory);
		model.addObject("brands",listBrand);

		model.setViewName("Admin_productdetail");
		return model;
	}
	
	@RequestMapping(value="/addproduct", method= RequestMethod.GET)
	@ResponseBody
	public ModelAndView addproduct(ModelAndView model, HttpServletRequest request) throws IOException{
		String admin = (String)session.getAttribute("admin");
		if(admin == null) {
			return new ModelAndView("redirect:" + "/admin/signin");
		}
		
		List<Category> listCategory = categoryDAO.list();
		List<Brand> listBrand = brandDAO.list();
		
		model.addObject("categories",listCategory);
		model.addObject("brands",listBrand);

		model.setViewName("Admin_addproduct");
		return model;
	}
	@RequestMapping(value="/addProduct", method= RequestMethod.POST)
    @ResponseBody
    public String addProduct(HttpServletRequest request) throws IOException{
        String admin = (String)session.getAttribute("admin");
        if(admin == null) {
            return "{\"status\": \"error\", \"message\": \"Login first!\"}";
        }
        try {
            Product product = new Product();
            product.setProduct_name(request.getParameter("name"));
            product.setProduct_price(Double.valueOf(request.getParameter("price")));
            product.setProduct_description(request.getParameter("description"));
            product.setProduct_color(request.getParameter("color"));
            product.setProduct_size(request.getParameter("size"));
            product.setBrand_id(Integer.valueOf(request.getParameter("brand")));
            product.setCategory_id(Integer.valueOf(request.getParameter("category")));
            product.setProduct_status("1");
            product.setProduct_img(request.getParameter("newImage"));

            productDAO.add(product);
			
			return "{\"status\": \"success\", \"message\": \"Added!\"}";
		}catch(Exception e) {
			return "{\"status\": \"error\", \"message\": \"Fail to add!\"}";
		}
	}
	
	@RequestMapping(value="/editProduct", method= RequestMethod.POST)
    @ResponseBody
    public String editProduct(HttpServletRequest request) throws IOException{
        String admin = (String)session.getAttribute("admin");
        if(admin == null) {
			return "{\"status\": \"error\", \"message\": \"Login first!\"}";
        }
        try {
            Product product = new Product();
            product.setProduct_id(Integer.valueOf(request.getParameter("id")));
            product.setProduct_name(request.getParameter("name"));
            product.setProduct_price(Double.valueOf(request.getParameter("price")));
            product.setProduct_description(request.getParameter("description"));
            product.setProduct_color(request.getParameter("color"));
            product.setProduct_size(request.getParameter("size"));
            product.setBrand_id(Integer.valueOf(request.getParameter("brand")));
            product.setCategory_id(Integer.valueOf(request.getParameter("category")));
            product.setProduct_status("1");

            // Current image
            if(request.getParameter("newImage").equals("[]")) {
                product.setProduct_img(request.getParameter("image"));
                System.out.print(request.getParameter("image"));
            }
            // New image
            if(request.getParameter("image").equals("[]")) {
                product.setProduct_img(request.getParameter("newImage"));
            }

            productDAO.saveOrUpdate(product);
			
			return "{\"status\": \"success\", \"message\": \"Your changes has been saved!\"}";
		}catch(Exception e) {
			return "{\"status\": \"error\", \"message\": \"Fail to save your changes!\"}";
		}
	}
	
	@RequestMapping(value="/deleteProduct", method= RequestMethod.POST)
	@ResponseBody
	public String deleteProduct(HttpServletRequest request) throws IOException{
		String admin = (String)session.getAttribute("admin");
		if(admin == null) {
			return "{\"status\": \"error\", \"message\": \"Login first!\"}";
		}
		try {
			productDAO.delete(Integer.valueOf(request.getParameter("id")));
			return "{\"status\": \"success\", \"message\": \"Deleted!\"}";
		}catch(Exception e) {
			return "{\"status\": \"error\", \"message\": \"Fail to delete!\"}";
		}
	}
	
	@RequestMapping(value="/orderlist")
	public ModelAndView orderlist(HttpServletRequest request) throws IOException{
		session = request.getSession();
		String admin = (String)session.getAttribute("admin");
		if(admin == null) {
			return new ModelAndView("redirect:" + "/admin/signin");
		}
		List<Order> listOrders = orderDAO.list();
		ModelAndView model = new ModelAndView();
		model.addObject("listOrders", listOrders);
	    model.setViewName("Admin_orderlist");
	    return model;
	}
	
	@RequestMapping(value="/orderlistwait")
	public ModelAndView orderlistwait(HttpServletRequest request) throws IOException{	
		session = request.getSession();
		String admin = (String)session.getAttribute("admin");
		if(admin == null) {
			return new ModelAndView("redirect:" + "/admin/signin");
		}
		List<Order> listOrders = orderDAO.listwait();
		ModelAndView model = new ModelAndView();
		model.addObject("listOrders", listOrders);
	    model.setViewName("Admin_orderlistwait");
	    return model;
	}

	
	@RequestMapping(value="/orderdetail/{id}")
	public ModelAndView orderdetail(HttpServletRequest request, @PathVariable(value="id") String id) throws IOException{
		session = request.getSession();
		String admin = (String)session.getAttribute("admin");
		if(admin == null) {
			return new ModelAndView("redirect:" + "/admin/signin");
		}
		Order order = orderDAO.get(id);
		List<Order_detail> listOrder_details = order_detailDAO.list(id);
		List<Product> listProducts = productDAO.list();
		ModelAndView model = new ModelAndView();
		model.addObject("listProducts", listProducts);
		model.addObject("order",order);
		model.addObject("listOrder_details", listOrder_details);
	    model.setViewName("Admin_orderdetail");
	    return model;
	}
	
	@RequestMapping(value = "/updateOderStt", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateOderStt(HttpServletRequest request) {
		String tt = request.getParameter("tt");
		String order_id = request.getParameter("odid");
	    if(!adminDAO.UpdateStt(tt, order_id)) {
	    	return "{\"status\": \"error\", \"message\": \"Cập nhật thất bại!\"}";
	    }
	    return "{\"status\": \"success\", \"message\": \"Cập nhật thành công!\"}";
	}
	@RequestMapping(value="/manageuser")
	public ModelAndView manageuser(HttpServletRequest request) throws IOException{	
		session = request.getSession();
		String admin = (String)session.getAttribute("admin");
		if(admin == null) {
			return new ModelAndView("redirect:" + "/admin/signin");
		}
		List<Customer> listCustomers = customerDAO.list();
		ModelAndView model = new ModelAndView();
		model.addObject("listCustomers", listCustomers);
	    model.setViewName("Admin_manageuser");
	    return model;
	}
	
	@RequestMapping(value = "/updateCustomerStt", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateCustomerStt(HttpServletRequest request) {
		String tt = request.getParameter("tt");
		String customer_id = request.getParameter("id");
	    if(!adminDAO.UpdateAccountStt(tt, customer_id)) {
	    	return "{\"status\": \"error\", \"message\": \"Cập nhật thất bại!\"}";
	    }
	    return "{\"status\": \"success\", \"message\": \"Cập nhật thành công!\"}";
	}
	
	@RequestMapping(value="/brandlist")
	public ModelAndView brandlist(HttpServletRequest request) throws IOException{	
		session = request.getSession();
		String admin = (String)session.getAttribute("admin");
		if(admin == null) {
			return new ModelAndView("redirect:" + "/admin/signin");
		}
		List<Brand> listBrands = brandDAO.list();
		ModelAndView model = new ModelAndView();
		model.addObject("listBrands", listBrands);
	    model.setViewName("Admin_brandlist");
	    return model;
	}
	
	@RequestMapping(value="/categorylist")
	public ModelAndView categorylist(HttpServletRequest request) throws IOException{	
		session = request.getSession();
		String admin = (String)session.getAttribute("admin");
		if(admin == null) {
			return new ModelAndView("redirect:" + "/admin/signin");
		}
		List<Category> listCategories = categoryDAO.list();
		ModelAndView model = new ModelAndView();
		model.addObject("listCategories", listCategories);
	    model.setViewName("Admin_categorylist");
	    return model;
	}
}