<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="products__menu">
    <div class="product__filter">
        <div class="filter__block">
            <h3 class="filter__title">Thương Hiệu <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right">
                    <polyline points="9 18 15 12 9 6"></polyline>
                </svg></h3>
            <ul class="filter__list filter--scrollbar" style="max-height: 0px;"> 
            	<c:forEach var="brand" items="${listBrands}" varStatus="status1">
                	<li class="filter__item">
                        <a href="<c:url value="/product/brand?id=${brand.brand_id}" />" class="mb-0"><i class="fa-solid fa-circle"></i> ${brand.brand_name}</a>
                    </li>
                </c:forEach>          
            </ul>
        </div>
        <div class="filter__block">
            <h3 class="filter__title">Loại Sản Phẩm <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right">
                    <polyline points="9 18 15 12 9 6"></polyline>
                </svg></h3>
            <ul class="filter__list filter--scrollbar" style="max-height: 0px;">
	            <c:forEach var="category" items="${listCategories}" varStatus="status1">
                	<li class="filter__item">
                        <a href="<c:url value="/product/category?id=${category.category_id}" />" class="mb-0"><i class="fa-solid fa-circle"></i> ${category.category_name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>