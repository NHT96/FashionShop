package net.codejava.spring.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Hex;
import org.apache.commons.codec.digest.DigestUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mysql.fabric.xmlrpc.base.Data;

import net.codejava.spring.dao.CustomerDAO;
import net.codejava.spring.dao.OrderDAO;
import net.codejava.spring.dao.Order_detailDAO;
import net.codejava.spring.model.Customer;
import net.codejava.spring.model.Order;
import net.codejava.spring.model.Order_detail;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Controller
@RequestMapping(value="/cart")
public class CartController {
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private Order_detailDAO order_detailDAO;
	
	@RequestMapping(value="")
	public ModelAndView index(HttpServletRequest request) throws IOException{
		ModelAndView model = new ModelAndView();
	    model.setViewName("Cart_index");
	    return model;
	}
	
	@RequestMapping(value="/payment")
	public ModelAndView payment(HttpServletRequest request) throws IOException{
		HttpSession session = request.getSession();
		Integer customer_id = (Integer)session.getAttribute("userId");
		if(customer_id == null) {
			return new ModelAndView("redirect:" + "/account/signin");
		}
		Customer customer = customerDAO.get(customer_id);
		ModelAndView model = new ModelAndView();
		model.addObject("customer", customer);
	    model.setViewName("Cart_payment");
	    return model;
	}
	
	@RequestMapping(value="/paymentpost", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String paymentpost(HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		Integer customer_id = (Integer)session.getAttribute("userId");
		if(customer_id == null) {
			return "{\"status\": \"error\", \"message\": \"Vui Lòng Đăng Nhập!!\"}";
		};
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String note = request.getParameter("note");
		String paymethod = request.getParameter("paymethod");
		String listCart = request.getParameter("listCart");
		
		if(listCart.equals("[]")) {
			return "{\"status\": \"error\", \"message\": \"Vui Lòng Thêm Giỏ Hàng!!\"}";
		}
		
		if(name.isEmpty() || phone.isEmpty() || email.isEmpty() || address.isEmpty() || paymethod.isEmpty() || listCart.isEmpty()) {
			return "{\"status\": \"error\", \"message\": \"Vui Lòng Nhập Đầy Đủ Thông Tin!!\"}";
		}
		
		if(!email.contains("@")) {
			return "{\"status\": \"error\", \"message\": \"Vui Lòng Nhập Email Đúng Định Dạng!!\"}";
		}
		
		JSONArray listCartJson = new JSONArray(listCart);
		int totalPrice = 0;
		
		for(int i=0; i < listCartJson.length(); i++) {
			JSONObject reader = new JSONObject(listCartJson.get(i).toString());
			totalPrice += reader.getInt("product_price") * reader.getInt("product_count");
		}
		
		SimpleDateFormat formatter= new SimpleDateFormat("yyyyMMddHHmmss");
		String order_id = formatter.format(new Date(System.currentTimeMillis())) + customer_id;
		
		Order order = new Order();
		order.setOrder_id(order_id);
		order.setOrder_name(name);
		order.setOrder_phone(phone);
		order.setOrder_email(email);
		order.setOrder_address(address);
		order.setOrder_note(note);
		order.setOrder_payment(paymethod.equals("cod") ? 0 : 1);
		order.setOrder_date(new Date(System.currentTimeMillis()));
		order.setOrder_status(paymethod.equals("cod") ? 0 : -1);
		order.setOrder_total(Double.valueOf(totalPrice));
		order.setCustomer_id(customer_id);
		
		orderDAO.saveOrUpdate(order, "insert");
		
		for(int i=0; i < listCartJson.length(); i++) {
			JSONObject reader = new JSONObject(listCartJson.get(i).toString());
			Order_detail order_detail = new Order_detail();
			order_detail.setProduct_id(reader.getInt("product_id"));
			order_detail.setOrder_id(order_id);
			order_detail.setOrder_detail_count(reader.getInt("product_count"));
			order_detail.setOrder_detail_price(Double.valueOf(reader.getInt("product_price")));
			order_detail.setOrder_detail_size_choose(reader.getString("product_size"));
			order_detail.setOrder_detail_color_choose(reader.getString("product_color"));
			order_detailDAO.saveOrUpdate(order_detail);
		}

		if(paymethod.equals("cod")) {
			return "{\"status\": \"success\", \"message\": \"Đặt Hàng Thành Công!\"}";
		}
		String redirectMOMO = redirectMoMo(order_id, String.valueOf(totalPrice));
		return "{\"status\": \"success\", \"message\": \"Đặt Hàng Thành Công!\", \"redirect\": \""+redirectMOMO+"\"}";
	}
	
	
	@RequestMapping(value="/redirectmomo")
	public ModelAndView redirectmomo(HttpServletRequest request) throws Exception{
		String orderId = request.getParameter("orderId");
		String partnerCode = request.getParameter("partnerCode");
		String requestId = request.getParameter("requestId");
		String orderInfo = request.getParameter("orderInfo");
		String order_id = orderInfo.replace("Thanh Toán Đơn Hàng: #", "");
		String dataString = checkOrderIdMomo(orderId, partnerCode, requestId);
		JSONObject dataJSON = new JSONObject(dataString);
		if (dataJSON.getInt("resultCode") == 0) {
			if(orderDAO.checkOrderPayment(orderId) == null) {
				orderDAO.updateMOMO(1, orderId, order_id);
				return new ModelAndView("redirect:" + "/account/orderhistory");
			}
		}
		return new ModelAndView("redirect:" + "/product");
	}
	
	
	//============================FUNCTION=================
	public String checkOrderIdMomo(String orderId, String partnerCode, String requestId) throws Exception{
		String endpoint = "https://test-payment.momo.vn/v2/gateway/api/query";
		String accessKey = "RtGKMoZ1WoPQPGwu";
		String secretKey = "hHkC4UKUi8jKeU4qshx0OHhriK8U0Eyy";
		String rawHash = "accessKey=" + accessKey + "&orderId=" + orderId + "&partnerCode=" + partnerCode + "&requestId=" + requestId;
		String signature = encode(secretKey ,rawHash);
		String data = "{\"partnerCode\" : \""+partnerCode+"\",\"requestId\" : \""+requestId+"\",\"orderId\" : \""+orderId+"\",\"signature\" : \""+signature+"\",\"lang\" : \"en\"}";
		String dataString = post(endpoint,data);
		return dataString;
	}
	
	public String redirectMoMo(String order_id, String price) throws Exception{
		String endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";
		String partnerCode = "MOMOG1ES20211116";
		String accessKey = "RtGKMoZ1WoPQPGwu";
		String secretKey = "hHkC4UKUi8jKeU4qshx0OHhriK8U0Eyy";
		String redirectUrl = "http://localhost:8080/Java_FashionShop/cart/redirectmomo";
		String ipnUrl = "http://localhost:8080/Java_FashionShop/cart/notifymomo";
		
		String orderInfo = "Thanh Toán Đơn Hàng: #"+order_id;
		String amount = price;
		String orderId = partnerCode+order_id;
		String extraData = "";
		String requestId = String.valueOf(System.currentTimeMillis());
		String requestType = "captureWallet";
		String rawHash = "accessKey=" + accessKey + "&amount=" + amount + "&extraData=" + extraData + "&ipnUrl=" + ipnUrl + "&orderId=" + orderId + "&orderInfo=" + orderInfo + "&partnerCode=" + partnerCode + "&redirectUrl=" + redirectUrl + "&requestId=" + requestId + "&requestType=" + requestType;
		String signature = encode(secretKey ,rawHash);
		String data = "{\"partnerCode\" : \""+partnerCode+"\",\"accessKey\" : \""+accessKey+"\",\"requestId\" : \""+requestId+"\",\"amount\" : \""+amount+"\",\"orderId\" : \""+orderId+"\",\"orderInfo\" : \""+orderInfo+"\",\"redirectUrl\" : \""+redirectUrl+"\",\"ipnUrl\" : \""+ipnUrl+"\",\"lang\" : \"en\",\"extraData\" : \""+extraData+"\",\"requestType\" : \""+requestType+"\",\"signature\" : \""+signature+"\"}";
		String dataString = post(endpoint,data);
		JSONObject reader = new JSONObject(dataString);
		return reader.getString("payUrl");
	}
	
	String post(String url, String json) throws IOException {
		MediaType JSON = MediaType.get("application/json; charset=utf-8");
		OkHttpClient client = new OkHttpClient();
		RequestBody body = RequestBody.create(JSON, json);
		Request request = new Request.Builder().url(url).post(body).build();
		try (Response response = client.newCall(request).execute()) {
		    return response.body().string();
		}
	}
	
	String encode(String key, String data) throws Exception {
	  Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
	  SecretKeySpec secret_key = new SecretKeySpec(key.getBytes("UTF-8"), "HmacSHA256");
	  sha256_HMAC.init(secret_key);

	  return Hex.encodeHexString(sha256_HMAC.doFinal(data.getBytes("UTF-8")));
	}
}
