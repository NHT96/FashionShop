package net.codejava.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.codejava.spring.dao.AdminDAO;
import net.codejava.spring.dao.BrandDAO;
import net.codejava.spring.dao.CategoryDAO;
import net.codejava.spring.dao.ProductDAO;
import net.codejava.spring.model.Admin;
import net.codejava.spring.model.Brand;
import net.codejava.spring.model.Category;
import net.codejava.spring.model.Product;

import org.json.JSONArray;
@Controller
@RequestMapping(value="/")
public class HomeController {
	@Autowired
    private BrandDAO brandDAO;
	@Autowired
    private ProductDAO productDAO;
	@Autowired
    private CategoryDAO categoryDAO;
	
	@RequestMapping(value="")
	public ModelAndView index(HttpServletRequest request) throws IOException{
	    List<Brand> listBrands = brandDAO.list();
	    List<Product> listProducts = productDAO.list();
	    List<Category> listCategories = categoryDAO.list();
	    ModelAndView model = new ModelAndView();
	    model.addObject("listBrands", listBrands);
	    model.addObject("listProducts", listProducts);
	    model.addObject("listCategories", listCategories);
	    model.setViewName("Home_index");
	    return model;
	}
}
