<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="org.json.JSONArray" %>
<%@ page language="java" import="java.text.DecimalFormat" %>
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
    <title>Danh sách sản phẩm</title>
</head>

<body>
    <jsp:include page="/WEB-INF/views/partials/header.jsp">
       <jsp:param name="title" value="Main title" />
    </jsp:include>
    <main class="main">
        <!-- Main contain -->
        <div class="custom-container">
            <div class="content__wrapper products__content-wrapper">
                <div class="content__inner w-100">
                    <ul class="web__directional">
                        <li><a href="/Java_FashionShop">Trang chủ</a></li>
                        <li><a href="/Java_FashionShop/product">Sản Phẩm</a></li>
                    </ul>
                    <div class="products__content d-flex">
						<jsp:include page="/WEB-INF/views/partials/products_menu.jsp">
					       <jsp:param name="title" value="Main title" />
					    </jsp:include>
                        <div class="products__list">
                            <div class="filter__control-top">
                                <!-- Dropdown order list-->
                                <div class="order__item-wrapper order__button">
                                    <div class="order__item-dropdown">
                                        Mới nhất
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1"
                                            stroke-linecap="round" stroke-linejoin="round"
                                            class="feather feather-chevron-down svg-order">
                                            <polyline points="6 9 12 15 18 9"></polyline>
                                        </svg>
                                    </div>
                                    <div class="order__item-dropdown_menu">
                                        <div class="order__item-dropdown_items">
                                            <a id="sortIdDESC" class="order__item d-none">Mới nhất
                                                <svg
                                                    xmlns='http://www.w3.org/2000/svg' width='24' height='24'
                                                    viewBox='0 0 24 24' fill='none' stroke='#333' stroke-width='1'
                                                    stroke-linecap='round' stroke-linejoin='round'
                                                    class='feather feather-chevron-right'>
                                                    <polyline points='9 18 15 12 9 6'></polyline>
                                                </svg>
                                            </a>

                                            <a id="sortPriceASC" class="order__item">Giá thấp - cao
                                                <svg xmlns='http://www.w3.org/2000/svg'
                                                    width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='#333'
                                                    stroke-width='1' stroke-linecap='round' stroke-linejoin='round'
                                                    class='feather feather-chevron-right'>
                                                    <polyline points='9 18 15 12 9 6'></polyline>
                                                </svg>
                                            </a>

                                            <a id="sortPriceDESC" class="order__item">Giá cao - thấp
                                                <svg xmlns='http://www.w3.org/2000/svg'
                                                    width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='#333'
                                                    stroke-width='1' stroke-linecap='round' stroke-linejoin='round'
                                                    class='feather feather-chevron-right'>
                                                    <polyline points='9 18 15 12 9 6'></polyline>
                                                </svg>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Number / total -->
                                <div class="filter__number">
                                    <div class="text">Hiển thị: </div>
                                    <div class="number">
                                        <span class="nowItems">999</span>
                                        /
                                        <span class="totalItems">1000</span>
                                    </div>
                                </div>
                                <!-- Pagination -->
                                <div class="filter__pagination">
                                    <ul class="pagination">
                                        <li class="pagination-item pagination-item__page previous">
                                            <a class="pagination-link pagination-item__page" style="height: 24px;">
                                                <svg xmlns='http://www.w3.org/2000/svg' width='24' height='24'
                                                    viewBox='0 0 24 24' fill='none' stroke='#333' stroke-width='1'
                                                    stroke-linecap='round' stroke-linejoin='round'
                                                    class='feather feather-chevron-left'>
                                                    <polyline points='15 18 9 12 15 6'></polyline>
                                                </svg>
                                            </a>
                                        </li>
                                        <div id="page_num">
                                            <!-- <li class="pagination-item pagination-item__page" data-page="1">
                                                <a class="pagination-link">1</a>
                                            </li>
                                            <li class="pagination-item pagination-item__page active" data-page="2">
                                                <a class="pagination-link">2</a>
                                            </li>
                                            <li class="pagination-item pagination-item__page" data-page="3">
                                                <a class="pagination-link">3</a>
                                            </li> -->
                                        </div>
                                        <li class="pagination-item pagination-item__page next">
                                            <a class="pagination-link" style="height: 24px;">
                                                <svg xmlns='http://www.w3.org/2000/svg' width='24' height='24'
                                                    viewBox='0 0 24 24' fill='none' stroke='#333' stroke-width='1'
                                                    stroke-linecap='round' stroke-linejoin='round'
                                                    class='feather feather-chevron-right'>
                                                    <polyline points='9 18 15 12 9 6'></polyline>
                                                </svg>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="product__grid-wrapper">
                                <div class="product__grid-inner w-100 d-flex flex-wrap">
                                	<c:forEach var="Product" items="${listProducts}" varStatus="status">
                                		<c:set var="brand_name" value=""/>
                                		<c:forEach var="brand" items="${listBrands}" varStatus="status1">
                                			<c:if test="${Product.brand_id == brand.brand_id}">
                                           		<c:set var="brand_name" value="${brand.brand_name}" />
                                           	</c:if>
                                        </c:forEach>
	                                    <div class="product">
	                                       <input id="product-id" value="${Product.product_id}" readonly hidden/>
	                                       <input id="product-size" value="${JSONArray(Product.product_size).getString(0)}" readonly hidden/>
	                                       <input id="product-color" value="${JSONArray(Product.product_color).getString(0)}" readonly hidden/>
	                                       <a class="product-img" href="<c:url value="/product/detail?id=${Product.product_id}"/>">
	                                           <img src="<c:url value="${JSONArray(Product.product_img).getString(0)}"/>" alt="">
	                                       </a>
	                                       <div class="product-label d-flex justify-content-end align-items-center w-100" style="background-color: #fff; padding: 3px 0;">
	                                       </div>
	                                       <hr style="width: 50%; margin: 0 auto;">
	                                       <div class="product__info">
	                                           <div class="product__info-detail text-center">
	                                               <div class="product-name mb-2">${Product.product_name}</div>
	                                               <div class="product-price">${DecimalFormat("###,###,###").format(Product.product_price)} đ</div>
	                                               <div class="product-btn" data-product-id="${Product.product_id}" data-product-name="${Product.product_name}" data-brand-name="${brand_name}" data-product-price="${Product.product_price}" data-product-img="${JSONArray(Product.product_img).getString(0)}" data-product-size="${JSONArray(Product.product_size).getString(0)}" data-product-color="${JSONArray(Product.product_color).getString(0)}">
	                                                   <span>Thêm Giỏ Hàng</span>
	                                               </div>
	                                           </div>
	                                       </div>
	                                   </div>
                                   </c:forEach>
                                </div>
                            </div>
                            <div class="filter__control-bottom">
                                <!-- Number / total -->
                                <div class="filter__number">
                                    <div class="text">Hiển thị: </div>
                                    <div class="number">
                                        <span class="nowItems">999</span>
                                        /
                                        <span class="totalItems">1000</span>
                                    </div>
                                </div>
                                <!-- Pagination -->
                                <div class="filter__pagination">
                                    <ul class="pagination">
                                        <li class="pagination-item pagination-item__page previous">
                                            <a class="pagination-link pagination-item__page" style="height: 24px;">
                                                <svg xmlns='http://www.w3.org/2000/svg' width='24' height='24'
                                                    viewBox='0 0 24 24' fill='none' stroke='#333' stroke-width='1'
                                                    stroke-linecap='round' stroke-linejoin='round'
                                                    class='feather feather-chevron-left'>
                                                    <polyline points='15 18 9 12 15 6'></polyline>
                                                </svg>
                                            </a>
                                        </li>
                                        <div id="page_numDes">
                                            <!-- <li class="pagination-item pagination-item__page active" data-page="1">
                                                <a class="pagination-link">1</a>
                                            </li>
                                            <li class="pagination-item pagination-item__page" data-page="2">
                                                <a class="pagination-link">2</a>
                                            </li>
                                            <li class="pagination-item pagination-item__page" data-page="3">
                                                <a class="pagination-link">3</a>
                                            </li> -->
                                        </div>
                                        <li class="pagination-item pagination-item__page next">
                                            <a class="pagination-link" style="height: 24px;">
                                                <svg xmlns='http://www.w3.org/2000/svg' width='24' height='24'
                                                    viewBox='0 0 24 24' fill='none' stroke='#333' stroke-width='1'
                                                    stroke-linecap='round' stroke-linejoin='round'
                                                    class='feather feather-chevron-right'>
                                                    <polyline points='9 18 15 12 9 6'></polyline>
                                                </svg>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
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
    <script type="text/javascript" src="<c:url value="/resources/public/js/main/main.js" />"></script>
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

        var rowsShown = 3;
        var rowsTotal = $('.product').length;
        var numPages = rowsTotal/rowsShown;
        var nowPage = 0;
        if (rowsTotal > 0){
            for(i = 0;i < numPages;i++) {
                var pageNum = i;
                rowsTotal = i+1; 
                $('#page_numDes').append('<li class="pagination-item pagination-item__page '+(pageNum == 0 ? 'active' : '')+'" data-page="'+(pageNum)+'"> <a class="pagination-link">'+(pageNum+1)+'</a> </li>');
                $('#page_num').append('<li class="pagination-item pagination-item__page '+(pageNum == 0 ? 'active' : '')+'" data-page="'+(pageNum)+'"> <a class="pagination-link">'+(pageNum+1)+'</a> </li>'); 
            }
            $(".filter__number .number .totalItems")[0].innerHTML = rowsTotal;
            $(".filter__number .number .totalItems")[1].innerHTML = rowsTotal;
            $(".filter__number .number .nowItems")[0].innerHTML = 1;
            $(".filter__number .number .nowItems")[1].innerHTML = 1;

            $('.product').hide();
            $('.product').slice(0, rowsShown).show();
            $('.pagination-item').bind('click', function(){
                if ($(this).is(".next") || $(this).is(".previous")){
                    return;
                }
                $('.pagination-item').removeClass('active');
                $(this).addClass('active');
                var currPage = $(this).attr('data-page');
                $(".filter__number .number .nowItems")[0].innerHTML = Number(currPage)+1;
                $(".filter__number .number .nowItems")[1].innerHTML = Number(currPage)+1;
                var startItem = currPage * rowsShown;
                var endItem = startItem + rowsShown;
                nowPage = currPage;
                $('.product').css('opacity','0.0').hide().slice(startItem, endItem).
                css('display','table-row').animate({opacity:1}, 300);
            });
            $('.previous').click(()=>{
                nowPage--;
                if(nowPage < 0) nowPage = rowsTotal - 1; 
                $('.pagination-item').removeClass('active');
                $('[data-page='+nowPage+']').addClass("active");
                $(".filter__number .number .nowItems")[0].innerHTML = Number(nowPage)+1;
                $(".filter__number .number .nowItems")[1].innerHTML = Number(nowPage)+1;
                var startItem = nowPage * rowsShown;
                var endItem = startItem + rowsShown;
                $('.product').css('opacity','0.0').hide().slice(startItem, endItem).
                css('display','table-row').animate({opacity:1}, 300);
            });
            $('.next').click(()=>{
                nowPage++;
                if(nowPage > rowsTotal - 1) nowPage = 0;
                $('.pagination-item').removeClass('active');
                $('[data-page='+nowPage+']').addClass("active");
                $(".filter__number .number .nowItems")[0].innerHTML = Number(nowPage)+1;
                $(".filter__number .number .nowItems")[1].innerHTML = Number(nowPage)+1;
                var startItem = nowPage * rowsShown;
                var endItem = startItem + rowsShown;
                $('.product').css('opacity','0.0').hide().slice(startItem, endItem).
                css('display','table-row').animate({opacity:1}, 300);
            });
        };

        $("#sortPriceASC").click(()=>{
            var products = $(".product");
            $('.product').hide();
            $('.product').slice(0, rowsShown).show();
            for (let i = 0; i < products.length-1; i++) {
                for (let j = i+1; j < products.length; j++) {
                    var tagPricePrev = products[i].querySelector(".product-price");
                    var numPricePrev = Number(tagPricePrev.innerHTML.replaceAll(" đ","").replaceAll(",",""));
                    var tagPrice = products[j].querySelector(".product-price");
                    var numPrice = Number(tagPrice.innerHTML.replaceAll(" đ","").replaceAll(",",""));
                    if (numPricePrev > numPrice){
                        var temp = products[i];
                        products[i] = products[j];
                        products[j] = temp;
                    }
                }
            }
            var html = "";
            for (let i = 0; i < products.length; i++) {
                html += products[i].outerHTML;
            }
            $(".product__grid-inner")[0].innerHTML = html;
            nowPage = 0;
            $('.pagination-item').removeClass('active');
            $('[data-page='+nowPage+']').addClass("active");
            $(".filter__number .number .nowItems")[0].innerHTML = Number(nowPage)+1;
            $(".filter__number .number .nowItems")[1].innerHTML = Number(nowPage)+1;
            var startItem = nowPage * rowsShown;
            var endItem = startItem + rowsShown;
            $('.product').css('opacity','0.0').hide().slice(startItem, endItem).
            css('display','table-row').animate({opacity:1}, 300);
            
        });

        $("#sortPriceDESC").click(()=>{
            var products = $(".product");
            $('.product').hide();
            $('.product').slice(0, rowsShown).show();
            for (let i = 0; i < products.length-1; i++) {
                for (let j = i+1; j < products.length; j++) {
                    var tagPricePrev = products[i].querySelector(".product-price");
                    var numPricePrev = Number(tagPricePrev.innerHTML.replaceAll(" đ","").replaceAll(",",""));
                    var tagPrice = products[j].querySelector(".product-price");
                    var numPrice = Number(tagPrice.innerHTML.replaceAll(" đ","").replaceAll(",",""));
                    if (numPricePrev < numPrice){
                        var temp = products[i];
                        products[i] = products[j];
                        products[j] = temp;
                    }
                }
            }
            var html = "";
            for (let i = 0; i < products.length; i++) {
                html += products[i].outerHTML;
            }
            $(".product__grid-inner")[0].innerHTML = html;
            nowPage = 0;
            $('.pagination-item').removeClass('active');
            $('[data-page='+nowPage+']').addClass("active");
            $(".filter__number .number .nowItems")[0].innerHTML = Number(nowPage)+1;
            $(".filter__number .number .nowItems")[1].innerHTML = Number(nowPage)+1;
            var startItem = nowPage * rowsShown;
            var endItem = startItem + rowsShown;
            $('.product').css('opacity','0.0').hide().slice(startItem, endItem).
            css('display','table-row').animate({opacity:1}, 300);
        });

        $("#sortIdDESC").click(()=>{
            var products = $(".product");
            $('.product').hide();
            $('.product').slice(0, rowsShown).show();
            for (let i = 0; i < products.length-1; i++) {
                for (let j = i+1; j < products.length; j++) {
                    var tagIdPrev = products[i].querySelector("#product-id");
                    var numIdPrev = Number(tagIdPrev.value.replaceAll(" đ","").replaceAll(",",""));
                    var tagId = products[j].querySelector("#product-id");
                    var numId = Number(tagId.value.replaceAll(" đ","").replaceAll(",",""));
                    if (numIdPrev < numId){
                        var temp = products[i];
                        products[i] = products[j];
                        products[j] = temp;
                    }
                }
            }

            var html = "";
            for (let i = 0; i < products.length; i++) {
                html += products[i].outerHTML;
            }

            $(".product__grid-inner")[0].innerHTML = html;
            nowPage = 0;
            $('.pagination-item').removeClass('active');
            $('[data-page='+nowPage+']').addClass("active");
            $(".filter__number .number .nowItems")[0].innerHTML = Number(nowPage)+1;
            $(".filter__number .number .nowItems")[1].innerHTML = Number(nowPage)+1;
            var startItem = nowPage * rowsShown;
            var endItem = startItem + rowsShown;
            $('.product').css('opacity','0.0').hide().slice(startItem, endItem).
            css('display','table-row').animate({opacity:1}, 300);
        });

        var products = $(".product-btn");
        for (let i = 0; i < products.length; i++) {
            $(products[i]).click((e)=>{
                var product_id = $(products[i]).attr("data-product-id");
                var product_name = $(products[i]).attr("data-product-name");
                var product_size = $(products[i]).attr("data-product-size");
                var product_color = $(products[i]).attr("data-product-color");
                var product_img = $(products[i]).attr("data-product-img");
                var product_price = $(products[i]).attr("data-product-price");
                var brand_name = $(products[i]).attr("data-brand-name");
                addUpdateCartHeader({
                	product_id: product_id,
                	product_name: product_name,
                	product_count: 1,
                	product_price: product_price,
                	product_color: product_color,
                	product_size: product_size,
                	product_img: product_img,
                	brand_name: brand_name,
                })
            });
        }
    </script>
</body>
</html>