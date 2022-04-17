<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- JQuery -->
    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery-migrate-3.0.1.min.js" />"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-4.0.0.min.css" />">
    <script src="<c:url value="/resources/js/bootstrap-4.0.0.min.js" />"></script>
    <!-- Slick slider -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.min.js"></script>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
        integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Lightslider -->
    <link rel='stylesheet' href='https://sachinchoolur.github.io/lightslider/dist/css/lightslider.css'>
    <script src='https://sachinchoolur.github.io/lightslider/dist/js/lightslider.js'></script>
    <!-- Ajax -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/main/global.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/css/main/header.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/css/main/main.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/css/main/footer.css" />" />
    <!-- <link rel="icon" href="<c:url value="/resources/images/logo/squarelogo.png" />" type="image/x-icon"> -->
    <title>Giỏ Hàng</title>
</head>

<body>
    <jsp:include page="/WEB-INF/views/partials/header.jsp">
       <jsp:param name="title" value="Main title" />
    </jsp:include>
    <main class="main mb-5">
        <!-- Main content -->
        <div class="custom-container">
            <div class="content__inner">
                <ul class="web__directional">
                    <li><a href="<c:url value="/" />">Trang chủ</a></li>
                    <li><a href="<c:url value="/cart" />">Giỏ hàng</a></li>
                </ul>
                <div class="">
                    <div class="cart-title text-center">GIỎ HÀNG</div>
                    <div class="cart-body d-flex flex-wrap">
                        <div class="primary-cartcontent">
                            <div class="cart-head">
                                <span>
                                    <strong>Sản phẩm</strong>
                                </span>
                                <span class="">
                                    <strong>Số lượng</strong>
                                </span>
                                <span class="">
                                    <strong>Thành tiền</strong>
                                </span>
                            </div>
                            <div class="cart-products">
                            </div>
                            <div class="cart-bottom d-flex justify-content-between">
                                <a class="continue-shopping d-inline-block text-center" href="<c:url value="/product" />">
                                    <strong>Tiếp tục mua sắm</strong>
                                </a>
                                <button id="update-cart" class="continue-shopping d-inline-block ">
                                    <strong>Cập Nhật</strong>
                                </button>
                            </div>
                        </div>
                        <div class="secondary-cartcontent">
                            <div class="cart-head mb-0" style="visibility: hidden;">
                                <span class="text-center">ĐƠN HÀNG CỦA BẠN</span>
                            </div>
                            <div class="order-summary">
                                <div class="order-summary-title text-center">
                                    <span>ĐƠN HÀNG CỦA BẠN</span>
                                </div>
                                <div class="d-flex justify-content-between mb-2">
                                    <span>Số lượng:</span>
                                    <span id="totalCount">0</span>
                                </div>
                                <hr>
                                <div class="d-flex justify-content-between mb-4">
                                    <span>TỔNG CỘNG:</span>
                                    <span>
                                        <strong id="totalPrice">0 VND</strong>
                                    </span>
                                </div>
                                <button class="w-100 checkout" onclick="window.location.href='/Java_FashionShop/cart/payment'">
                                    <strong>THANH TOÁN</strong>
                                </button>
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
    <!-- Ajax -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <!-- Bootstrap -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    <!-- Personal Script -->
    <script type="text/javascript" src="<c:url value="/resources/js/main/main.js"/>"></script>
    <script>
        $("#update-cart").click((e)=>{
            var products = $(".cart-product");
            var arrData = [];
            for (let i = 0; i < products.length; i++) {
                var product = products[i];
                var count = product.querySelector(".cart-product__amount").value;
                var cart_id = product.querySelector("#cart_id").value;
                arrData.push({
                    cart_id: cart_id,
                    product_count : count
                });
            }
            updateCount(arrData);
            loadCart();
        })
        
        loadCart();
        
        function loadCart(){
        	var listCart = getListCart();
        	var totalCount = 0;
        	var totalPrice = 0;
            var json = JSON.parse(listCart);
            var html = "";
            json.forEach((element, index) => {
            	totalCount += Number(element.product_count);
            	totalPrice += element.product_price*element.product_count;
        		html += '<div class="cart-product d-flex flex-wrap w-100"> <div class="cart-product__image"> <img src="'+element.product_img+'" alt=""> </div> <div class="cart-product__info"> <div class="cart-product--auto"> <input id="cart_id" value="'+element.id+'" readonly hidden/><div><strong>'+element.product_name+'</strong></div><div>Thương hiệu: '+element.brand_name+'</div><div>('+element.product_color+', '+element.product_size+')</div> <div class="price"><input id="product_price" value="'+element.product_price+'" readonly hidden/><span class="value">'+Number(element.product_price).toLocaleString('it-IT', {style : 'currency', currency : 'VND'})+'</span></div></div><div class="cart-product--col"><input class="cart-product__amount" type="number" value="'+element.product_count+'" min="1"></div><div class="cart-product--col totalprice"><span class="total-value">'+(element.product_price*element.product_count).toLocaleString('it-IT', {style : 'currency', currency : 'VND'})+'</span></div></div><span class="cart-product__remove d-flex"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1"stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg></span></div>';
        	});   
            $(".cart-products")[0].innerHTML = html;
            $("#totalCount")[0].innerHTML = totalCount;
            $("#totalPrice")[0].innerHTML = totalPrice.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
        }
  </script>
</body>
</html>