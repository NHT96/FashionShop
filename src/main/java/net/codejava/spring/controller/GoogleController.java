package net.codejava.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.codejava.spring.dao.AdminDAO;
import net.codejava.spring.dao.BrandDAO;
import net.codejava.spring.dao.CategoryDAO;
import net.codejava.spring.dao.CustomerDAO;
import net.codejava.spring.dao.ProductDAO;
import net.codejava.spring.model.Admin;
import net.codejava.spring.model.Brand;
import net.codejava.spring.model.Category;
import net.codejava.spring.model.Customer;
import net.codejava.spring.model.GooglePojo;
import net.codejava.spring.model.Product;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

import org.apache.commons.codec.digest.DigestUtils;
import org.json.JSONArray;
import org.json.JSONObject;
@Controller
@RequestMapping(value="/google")
public class GoogleController {
	@Autowired
	CustomerDAO customerDAO;
	
	private String GOOGLE_APP_ID = "493593590669-mnehgoe6fclfnoe4ccq1voc5h9nehsfo.apps.googleusercontent.com";
	private String GOOGLE_APP_SECRET = "1EtbCsURRhXJSrHnGxKdNiRm";
	private String GOOGLE_APP_CALLBACK_URL = "http://localhost:8080/Java_FashionShop/google/redirect";
	private String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
	private String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
	private String GOOGLE_GRANT_TYPE = "authorization_code";
	
	@RequestMapping(value="")
	public ModelAndView index(HttpServletRequest request) throws IOException{
		HttpSession session = request.getSession();
		Integer customer_id = (Integer)session.getAttribute("userId");
		if(customer_id != null) {
			return new ModelAndView("redirect:" + "/account/signin");
		}
		String urlString = "https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri="+GOOGLE_APP_CALLBACK_URL+"&response_type=code&client_id="+GOOGLE_APP_ID+"&approval_prompt=force";
	    return new ModelAndView("redirect:" + urlString);
	}
	
	@RequestMapping(value="/redirect")
	public ModelAndView redirect(HttpServletRequest request) throws IOException{
		HttpSession session = request.getSession();
		Integer customer_id = (Integer)session.getAttribute("userId");
		String code = request.getParameter("code");
		if(customer_id != null) {
			return new ModelAndView("redirect:" + "/account/signin");
		}
		
		if (code == null || code.isEmpty()) {
			return new ModelAndView("redirect:" + "/account/signin");
		}
		String jsonString = "{\"client_id\": \""+GOOGLE_APP_ID+"\"" 
				+ ",\"client_secret\": \""+GOOGLE_APP_SECRET+"\""
				+ ",\"redirect_uri\": \""+GOOGLE_APP_CALLBACK_URL+"\""
				+ ",\"code\": \""+code+"\""
				+ ",\"grant_type\": \""+GOOGLE_GRANT_TYPE+"\"}";
		String token = post(GOOGLE_LINK_GET_TOKEN, jsonString);
		String access_token = new JSONObject(token).getString("access_token");
		String getInfoString = GOOGLE_LINK_GET_USER_INFO + access_token;
		String getInfo = get(getInfoString);
		JSONObject jsonInfo = new JSONObject(getInfo);
		Customer customer = customerDAO.CheckEmail(jsonInfo.getString("email"));
		if(customer == null) {
		    customerDAO.Signup(jsonInfo.getString("email").replace("@gmail.com", ""), jsonInfo.getString("email"), "","", "123456789");
		    Customer customer1 = customerDAO.CheckEmail(jsonInfo.getString("email"));
		    session.setAttribute("userName", customer1.getCustomer_name());
		    session.setAttribute("userId", customer1.getCustomer_id());
			return new ModelAndView("redirect:" + "/");
		}else {
			session.setAttribute("userName", customer.getCustomer_name());
		    session.setAttribute("userId", customer.getCustomer_id());
		    return new ModelAndView("redirect:" + "/");
		}
	}
	
	//====== FUNCTION ======
	String post(String url, String json) throws IOException {
		MediaType JSON = MediaType.get("application/json; charset=utf-8");
		OkHttpClient client = new OkHttpClient();
		RequestBody body = RequestBody.create(JSON, json);
		Request request = new Request.Builder().url(url).post(body).build();
		try (Response response = client.newCall(request).execute()) {
		    return response.body().string();
		}
	}
	
	String get(String url) throws IOException {
		MediaType JSON = MediaType.get("application/json; charset=utf-8");
		OkHttpClient client = new OkHttpClient();
		Request request = new Request.Builder().url(url).get().build();
		try (Response response = client.newCall(request).execute()) {
		    return response.body().string();
		}
	}
}
