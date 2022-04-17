package net.codejava.spring.controller;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.codejava.spring.dao.CustomerDAO;
import net.codejava.spring.dao.OrderDAO;
import net.codejava.spring.dao.Order_detailDAO;
import net.codejava.spring.dao.ProductDAO;
import net.codejava.spring.model.Customer;
import net.codejava.spring.model.Order;
import net.codejava.spring.model.Order_detail;
import net.codejava.spring.model.Product;
import net.codejava.spring.services.sendmail;

@Controller
@RequestMapping(value="/account")
public class AccountController {
	HttpSession session;
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private Order_detailDAO order_detailDAO;
	@RequestMapping(value="/index")
	public ModelAndView index(HttpServletRequest request) throws IOException{
		session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		if(userId>0) {
			Customer customer = customerDAO.get(userId);
			ModelAndView model = new ModelAndView();
			model.addObject("customer", customer);
		    model.setViewName("Account_index");
		    return model;
			
		}
		return new ModelAndView("redirect:" + "/signin");
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String login(HttpServletRequest request) {
		session = request.getSession();
		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		String ps = DigestUtils.sha256Hex(pass);
		
	    Customer customer =  customerDAO.login(user,ps);
	    if(customer==null) {
	    	return "{\"status\": \"error\", \"message\": \"Sai thông tin tài khoản!\"}";
	    }
	    session.setAttribute("userName", customer.getCustomer_name());
	    session.setAttribute("userId", customer.getCustomer_id());
	    return "{\"status\": \"success\", \"message\": \"Đăng nhập thành công!\"}";
	}
	
	@RequestMapping(value = "/updateInfo", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateInfo(HttpServletRequest request) {
		session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
	    customerDAO.Update(name,phone,address,userId);
	    if(!customerDAO.Update(name,phone,address,userId)) {
	    	return "{\"status\": \"error\", \"message\": \"Cập nhật thất bại!\"}";
	    }
	    return "{\"status\": \"success\", \"message\": \"Cập nhật thành công!\"}";
	}
	
	@RequestMapping(value = "/SignupPost", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String SignupPost(HttpServletRequest request) {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");
		List<Customer> listCustomers = customerDAO.CheckBeforSignup(email, phone);
		if(listCustomers.size()>0) {
			return "{\"status\": \"error\", \"message\": \"Tài khoản đã tồn tại!\"}";
		}
		if(pass.equals(repass)==false) {
			return "{\"status\": \"error\", \"message\": \"Mật khẩu không trùng khớp!\"}";
		}
		String pso = DigestUtils.sha256Hex(pass);
	    customerDAO.Signup(name, email, phone,address, pso);
	    return "{\"status\": \"success\", \"message\": \"Đăng ký thành công!\"}";
	}
	
	@RequestMapping(value = "/updateOderStt", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateOderStt(HttpServletRequest request) {
		session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String tt = request.getParameter("tt");
		String order_id = request.getParameter("odid");
	    customerDAO.UpdateStt(tt, order_id, userId);
	    if(!customerDAO.UpdateStt(tt, order_id, userId)) {
	    	return "{\"status\": \"error\", \"message\": \"Cập nhật thất bại!\"}";
	    }
	    return "{\"status\": \"success\", \"message\": \"Cập nhật thành công!\"}";
	}
	
	@RequestMapping(value = "/updatePass", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updatePass(HttpServletRequest request) {
		session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		String idsString = String.valueOf(userId);
		String passold = request.getParameter("passold");
		String pass = request.getParameter("pass");
		String repass = request.getParameter("repass");
		if(pass.equals(repass)==false) {
			return "{\"status\": \"error\", \"message\": \"Mật khẩu không khớp!\"}";
		}
		String pso = DigestUtils.sha256Hex(passold);
		Customer customer =  customerDAO.checkPass(idsString,pso);
	    if(customer==null) {
	    	return "{\"status\": \"error\", \"message\": \"Sai mật khẩu cũ!\"}";
	    }
		String ps = DigestUtils.sha256Hex(pass);
	    customerDAO.UpdatePass(ps,userId);
	    if(!customerDAO.UpdatePass(ps,userId)) {
	    	return "{\"status\": \"error\", \"message\": \"Thay đổi mật khẩu thất bại!\"}";
	    }
	    session = request.getSession();
	    session.invalidate();
	    return "{\"status\": \"success\", \"message\": \"Thay đổi mật khẩu thành công!\"}";
	}
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request) throws IOException{
		session = request.getSession();
		session.invalidate();
		return new ModelAndView("redirect:" + "./signin");
	}
	
	@RequestMapping(value="/changepassword")
	public ModelAndView changepassword(HttpServletRequest request) throws IOException{
		ModelAndView model = new ModelAndView();
	    model.setViewName("Account_changepassword");
	    return model;
	}
	
	@RequestMapping(value="/orderhistory")
	public ModelAndView orderhistory(HttpServletRequest request) throws IOException{
		session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		if(userId>0) {
			List<Order> listOrders = orderDAO.listOrder_User(userId);
			ModelAndView model = new ModelAndView();
			model.addObject("listOrders", listOrders);
		    model.setViewName("Account_orderhistory");
		    return model;
		}
		return new ModelAndView("redirect:" + "/signin");
	}
	
	@RequestMapping(value="/signin")
	public ModelAndView signin(HttpServletRequest request) throws IOException{
		session = request.getSession();
		String userName = (String)session.getAttribute("userName");
		if(userName==null) {
			ModelAndView model = new ModelAndView();
		    model.setViewName("Account_signin");
		    return model;
		}
		return new ModelAndView("redirect:" + "/");
	}
	
	@RequestMapping(value="/signup")
	public ModelAndView signup(HttpServletRequest request) throws IOException{
		ModelAndView model = new ModelAndView();
	    model.setViewName("Account_signup");
	    return model;
	}
	
	@RequestMapping(value="/forgotpassword")
	public ModelAndView forgotpassword(HttpServletRequest request) throws IOException{
		ModelAndView model = new ModelAndView();
	    model.setViewName("Account_forgotpassword");
	    return model;
	}
	protected String getSaltString() {
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 8) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;

    }
	@RequestMapping(value = "/forgotpasswordpost", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String forgotpasswordpost(HttpServletRequest request) {
		String email = request.getParameter("email");
		sendmail sendmail = new sendmail();
		String passtmp = getSaltString();
		String ps = DigestUtils.sha256Hex(passtmp);
		Customer customer =  customerDAO.CheckEmail(email);
	    if(customer==null) {
	    	return "{\"status\": \"error\", \"message\": \"Không tìm thấy tài khoản!\"}";
	    }
	    if(customerDAO.UpdatePassMail(ps,email) && sendmail.SendPass(email, passtmp)) {
	    	return "{\"status\": \"success\", \"message\": \"Khôi phục mật khẩu thành công!\"}";
	    }
	    return "{\"status\": \"error\", \"message\": \"Lỗi Thực Hiện!\"}";
	}
	
	@RequestMapping(value="/orderdetail/{id}")
	public ModelAndView orderdetail(HttpServletRequest request, @PathVariable(value="id") String id) throws IOException{
		session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		if(userId>0) {
			Order order = orderDAO.get(id);
			List<Order_detail> listOrder_details = order_detailDAO.list(id);
			List<Product> listProducts = productDAO.list();
			ModelAndView model = new ModelAndView();
			model.addObject("listProducts", listProducts);
			model.addObject("order",order);
			model.addObject("listOrder_details", listOrder_details);
		    model.setViewName("Account_orderdetail");
		    return model;
		}
		return new ModelAndView("redirect:" + "/signin");
		
	}
}
