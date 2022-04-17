<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="org.json.JSONArray" %>
 
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- JQuery -->
    <script src="<c:url value="/resources/public/js/jquery-3.3.1.min.js"/>"></script>
    <script src="<c:url value="/resources/public/js/jquery-migrate-3.0.1.min.js"/>"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<c:url value="/resources/public/css/bootstrap-4.0.0.min.css"/>">
    <script src="<c:url value="/resources/public/js/bootstrap-4.0.0.min.js"/>"></script>
    <!-- Slick slider -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.min.js"></script>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>"
        integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel='stylesheet' href="<c:url value="https://sachinchoolur.github.io/lightslider/dist/css/lightslider.css"/>">
    <script src="https://sachinchoolur.github.io/lightslider/dist/js/lightslider.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<c:url value="/resources/public/css/main/global.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/public/css/main/header.css" />"/>
    <link rel="stylesheet" href="<c:url value="/resources/public/css/main/main.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/public/css/main/footer.css" />" />
    <title>TDT Fashion</title>
</head>

<body>
    <jsp:include page="/WEB-INF/views/partials/header.jsp">
       <jsp:param name="title" value="Main title" />
    </jsp:include>
    <main class="main">
        <!-- Slide banner -->
        <jsp:include page="/WEB-INF/views/partials/banner.jsp">
	       <jsp:param name="title" value="Main title" />
	    </jsp:include>
        <!-- Main content -->
        <div class="custom-container">
            <!-- Bran list slider -->
            <div class="bran__logo-list">
                <div class="text-center">
                    <div class="line my-4"></div>
                    <h3 class="home-title mx-auto">Thương hiệu</h3>
                </div>

                <div class="autoplay d-flex">
                <c:forEach var="Brand" items="${listBrands}" varStatus="status">
                	<a class="bran__logo p-4" href="<c:url value="/product/brand?id=${Brand.brand_id}" />"><img src="<c:url value="${Brand.brand_logo}"/>"alt=""></a>
                </c:forEach>          
                    
                </div>

                <div class="w-100 text-center d-block">
                    <a class="bran__viewmore d-inline-block" href="<c:url value="/product"/>">Xem thêm</a>
                </div>
            </div>
            <!-- Bran list -->
            <div class="content__wrapper">
            <div class="text-center">
                    <div class="line my-4"></div>
                    <h3 class="home-title mx-auto">Sản phẩm nổi bật</h3>
                </div>
                <div class="w-100 my-4 p-4">
                    <div class="bran__list-line my-4"></div>
                    <!-- Bran list content -->
                    <div class="bran__list-items">
                        <div class="d-flex flex-wrap">
                       	<c:forEach var="Product" items="${listProducts}" varStatus="status">
                       		<c:if test="${status.index < 5}">
	                       		<div class="bran__list-item card">
	                                <a href="<c:url value="/product/detail?id=${Product.product_id}"/>">
	                                    <div class="bran__list-img py-2 px-4">
	                                        <img src="${JSONArray(Product.product_img).getString(0)}" class="card-img-top" alt="...">
	                                    </div>
	                                    <div class="card-body text-center p-2 align-items-center justify-content-center">
	                                        <h5 class="bran__list-name card-title mb-0">${Product.product_name}</h5>
	                                        <c:forEach var="Category" items="${listCategories}" varStatus="status1">
	                                        	<c:if test="${Category.category_id == Product.category_id}">
	                                        		<h6 class="bran__list-type card-text">${Category.category_name}</h6>
	                                        	</c:if>
	                                        </c:forEach> 
	                                    </div>
	                                </a>
	                            </div>
                            </c:if>
               			</c:forEach>  
                            <div class="w-100 text-center d-block">
                                <a class="bran__viewmore d-inline-block" href="<c:url value="/product"/>">Xem thêm</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/partials/footer.jsp">
       <jsp:param name="title" value="Main title" />
    </jsp:include>

    <!-- Personal Script -->
    <script type="text/javascript" src="<c:url value="/resources/public/js/main/main.js"/>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.autoplay').slick({
                slidesToShow: 5,
                slidesToScroll: 5,
                autoplay: true,
                autoplaySpeed: 3000,
                prevArrow: "<button type='button' class='slick-prev pull-left'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='#333' stroke-width='1' stroke-linecap='round' stroke-linejoin='round' class='feather feather-chevron-left'><polyline points='15 18 9 12 15 6'></polyline></svg></button>",
                nextArrow: "<button type='button' class='slick-next pull-right'><svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='#333' stroke-width='1' stroke-linecap='round' stroke-linejoin='round' class='feather feather-chevron-right'><polyline points='9 18 15 12 9 6'></polyline></svg></button>"
            });
        });
    </script>

</body>

</html>