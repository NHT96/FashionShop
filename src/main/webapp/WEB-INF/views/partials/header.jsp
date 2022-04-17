<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    #btn-logout {
        cursor: pointer;
    }

    #btn-logout:hover {
        color: var(--blue-dior);
    }
</style>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<header class="header">
    <div class="header__top">
        <div class="header__top-content align-items-center d-flex pt-2">
            <!-- Logo -->
            <div class="logo__container text-center px-5 mx-auto">
                <a href="/WebDemo/buyer/index.html" class="header__logo">
                    <img class="logo img-fluid" src="<c:url value="/resources/public/images/logo/logotdt.png"/>" alt="">
                </a>
            </div>
            <div class="header__top-info">
                <a href="" class="header__top-link">
                    <span class="icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                            fill="none" stroke="#333" stroke-width="1" stroke-linecap="round"
                            stroke-linejoin="round" class="feather feather-help-circle">
                            <circle cx="12" cy="12" r="10"></circle>
                            <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"></path>
                            <line x1="12" y1="17" x2="12.01" y2="17"></line>
                        </svg>
                    </span>
                    <span class="text">
                        Hỗ trợ
                    </span>
                </a>
                <c:if test="${userName!=null}">
                    <a href="<c:url value="/account/index"/> " class="header__top-link">
	                    <span class="icon">
	                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
	                            fill="none" stroke="#333" stroke-width="1" stroke-linecap="round"
	                            stroke-linejoin="round" class="feather feather-user">
	                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
	                            <circle cx="12" cy="7" r="4"></circle>
	                        </svg>
	                    </span>
	                    	<span class="text">${userName}</span>
	                </a>
	               	<a id="btn-logout" class="header__top-link" href="/Java_FashionShop/account/logout">
                         <span class="icon">
                             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out">
                                 <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                 <polyline points="16 17 21 12 16 7"></polyline>
                                 <line x1="21" y1="12" x2="9" y2="12"></line>
                             </svg>
                         </span>
                         <span class="text">
                             Đăng xuất
                         </span>
                     </a>
                </c:if>
                
                <c:if test="${userName==null}">
                <a href="<c:url value="/account/signin"/> " class="header__top-link">
	                    <span class="icon">
	                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
	                            fill="none" stroke="#333" stroke-width="1" stroke-linecap="round"
	                            stroke-linejoin="round" class="feather feather-user">
	                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
	                            <circle cx="12" cy="7" r="4"></circle>
	                        </svg>
	                    </span>
	                    	<span class="text">Đăng Nhập</span>
	                </a>	
                </c:if>
            </div>
            <ul class="header__top-action align-items-center">
                <li>
                    <a class="header-searchform header__top-link">
                        <span class="text">
                            <input id="txtSearch" type="text" placeholder="Sản phẩm cần tìm">
                        </span>
                        <span id="btnSearch" class="icon">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search">
                                <circle cx="11" cy="11" r="8"></circle>
                                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                            </svg>
                        </span>
                    </a>
                </li>
                <li class="cart-action">
                    <a href="<c:url value="/cart" />" class="header__top-link">
                        <span class="icon cart">
                            <span class="quality">1</span>
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-bag">
                                <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
                                <line x1="3" y1="6" x2="21" y2="6"></line>
                                <path d="M16 10a4 4 0 0 1-8 0"></path>
                            </svg>
                        </span>
                    </a>
                    <div class="minicart-content">
                        <div class="w-100">
                            <div class="header-title pb-4 pt-3">Giỏ hàng: 0</div>
                        </div>
                        <div id="listCart">
                        </div>
                        <div class="minicart-totals px-4 pb-3">
                            <div class="d-flex justify-content-between pt-3 pb-4">
                                <div>Tạm tính</div>
                                <div class="total-price"><strong>000.000.000 ₫</strong></div>
                            </div>
                            <div class="text-center d-block">
                                <a class="minicart-checkout d-inline-block w-100 py-3 mb-4" href="<c:url value="/cart/payment" />">THANH TOÁN</a>
                                <a href="<c:url value="/cart" />"><u>Xem/Chỉnh sửa</u></a>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="header__inner">
        <div class="custom-container">
            <!-- Navigation -->
            <!-- Navigation in mobile -->
            <nav class="nav__mobile">
                <div class="nav__mobile-list d-flex flex-column nav-close" id="nav__mobile-list-open">
                    <div class="nav__mobile-logo d-flex p-4">
                        <div class="w-100 text-center" style="position: relative;">
                            <span id="nav__mobile-list-close" style="left: 0; position: absolute;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                    fill="none" stroke="#333" stroke-width="1" stroke-linecap="round"
                                    stroke-linejoin="round" class="feather feather-x">
                                    <line x1="18" y1="6" x2="6" y2="18"></line>
                                    <line x1="6" y1="6" x2="18" y2="18"></line>
                                </svg>
                            </span>
                            <a href=""><img style="max-height: 50px;" src="<c:url value="/resources/public/images/logo/logotdt.png" />"
                                    alt=""></a>
                        </div>
                    </div>
                    <div class="nav__list-mobile-wrapper py-4 pl-4">
                        <div class="nav__list-mobile h-100" style="overflow:hidden;overflow-y:scroll;">
                            <div class="nav__link-mobile pb-4">
                                <a href="<c:url value="/" />">Trang chủ</a>
                            </div>
                            <div class="nav__link-mobile pb-4">
                                <a href="#">Hot sale</a>
                            </div>
                            <div class="nav__link-mobile pb-4">
                                <a href="<c:url value="/product" />">Sản phẩm</a>
                            </div>
                            <div class="nav__link-mobile pb-4">
                                <a href="<c:url value="/cart/payment" />">Thanh toán</a>
                            </div>
                        </div>
                    </div>
                    <div class="nav__mobile-footer w-100">
                        <ul class="nav__mobile-account p-4">
                            <li class="pb-4">
                                <a href="/sign-up.html" class="d-flex w-100">
                                    <span class="icon">
                                        <span class="quality">1</span>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1"
                                            stroke-linecap="round" stroke-linejoin="round"
                                            class="feather feather-user">
                                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                            <circle cx="12" cy="7" r="4"></circle>
                                        </svg>
                                    </span>
                                    <span class="text">
                                        Hi, Nguyễn Văn A
                                    </span>
                                </a>
                            </li>
                            <li class="">
                                <a href="/sign-up.html" class="d-flex w-100">
                                    <span class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1"
                                            stroke-linecap="round" stroke-linejoin="round"
                                            class="feather feather-log-out">
                                            <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                            <polyline points="16 17 21 12 16 7"></polyline>
                                            <line x1="21" y1="12" x2="9" y2="12"></line>
                                        </svg>
                                    </span>
                                    <span class="text">
                                        Đăng xuất
                                    </span>
                                </a>
                            </li>
                        </ul>
                        <div class="nav__mobile-info p-4">
                            <p><a href="">Phone: 0123456789 (Mr.A)</a></p>
                            <p><a href="">Mail: mail@gmail.com</a></p>
                            <p><a href="https://www.facebook.com/mra/">Facebook: Mr.A</a></p>
                        </div>
                    </div>
                </div>
                <div class="nav__mobile-action d-flex justify-content-between py-2">
                    <label for="nav__mobile-menu" class="overlay d-none" id="nav__overlay"
                        style="margin: 0;"></label>
                    <label for="nav__mobile-menu" class="nav__menubar mb-0" id="nav__menubar-open">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                            fill="none" stroke="#333" stroke-width="1" stroke-linecap="round"
                            stroke-linejoin="round" class="feather feather-menu">
                            <line x1="3" y1="12" x2="21" y2="12"></line>
                            <line x1="3" y1="6" x2="21" y2="6"></line>
                            <line x1="3" y1="18" x2="21" y2="18"></line>
                        </svg>
                    </label>

                    <a class="header__mobile-searchicon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                            fill="none" stroke="#333" stroke-width="1" stroke-linecap="round"
                            stroke-linejoin="round" class="feather feather-search">
                            <circle cx="11" cy="11" r="8"></circle>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                        </svg>
                    </a>

                    <a class="profile-mobile">
                        <span class="quality">1</span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                            fill="none" stroke="#333" stroke-width="1" stroke-linecap="round"
                            stroke-linejoin="round" class="feather feather-user">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                            <circle cx="12" cy="7" r="4"></circle>
                        </svg>
                    </a>

                    <a class="favorite-mobile">
                        <span class="quality">1</span>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                            fill="none" stroke="#333" stroke-width="1" stroke-linecap="round"
                            stroke-linejoin="round" class="feather feather-heart">
                            <path
                                d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z">
                            </path>
                        </svg>
                    </a>

                    <a class="cart-mobile">
                        <span class="quality">1</span>
                        <svg classs="cart-mobile" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                            viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1" stroke-linecap="round"
                            stroke-linejoin="round" class="feather feather-shopping-bag">
                            <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path>
                            <line x1="3" y1="6" x2="21" y2="6"></line>
                            <path d="M16 10a4 4 0 0 1-8 0"></path>
                        </svg>
                    </a>
                </div>
                <div class="searchform__wrapper py-2 d-none">
                    <div class="searchform input-group rounded w-100">
                        <input type="search" id="search-input" class="form-control"
                            placeholder="Thương hiệu, dịch vụ, sản phẩm bạn muốn tìm ?" aria-label="Search"
                            aria-describedby="search-addon" />
                    </div>
                    <div class="searchresult d-none">
                        <p>
                            <a href="">Thế giới di động (Điện thoại di động)</a>
                        </p>
                        <p>
                            <a href="">FPT Shop (Điện thoại di động)</a>
                        </p>
                        <p>
                            <a href="">Samsung Galaxy S20 Ultra</a>
                        </p>
                        <p>
                            <a href="">Geforce RTX 3080TI Asus</a>
                        </p>
                        <div class="text-center w-100">
                            <a class="search-viewmore">Xem thêm</a>
                        </div>
                    </div>
                </div>
            </nav>
            <div class="search__overlay d-none"></div>
            <!-- Navigation in pc -->
            <nav class="nav__pc">
                <ul class="nav__pc-items nav__default d-flex">
                    <li class="nav__link">
                        <a href="/Java_FashionShop" class="py-3">Trang chủ</a>
                    </li>
                    <li class="nav__link">
                        <a href="#" class="py-3">Hot sale</a>
                    </li>
                    <li class="nav__link">
                        <a href="/Java_FashionShop/product" class="py-3">Sản phẩm</a>
                    </li>
                    <li class="nav__link">
                        <a href="/Java_FashionShop/cart/payment" class="py-3">Thanh toán</a>
                    </li>
                </ul>
            </nav>
        </div>

    </div>
</header>

<script>
    $("#btnSearch").click(()=>{
        window.location = "/Java_FashionShop/product/search?txt=" + $("#txtSearch").val();
    });

    $("#txtSearch").keypress((e)=>{
        if (e.which == 13){
            window.location = "/Java_FashionShop/product/search?txt=" + $("#txtSearch").val();
        }
    });

    updateCartHeader();
    function updateCartHeader() {
    	$("#listCart")[0].innerHTML = "";
    	var listCart = getListCart();
    	var html = "";
        var totalPrice = 0;
        var totalCount = 0;
    	var json = JSON.parse(listCart);
    	json.forEach((element, index) => {
            totalPrice += Number(element.product_price) * Number(element.product_count);
            totalCount += Number(element.product_count);
            html += '<div class="minicart-products filter--scrollbar px-4"> <div class="minicart-product d-flex py-4"> <div class="minicart__product-image text-center mr-2"> <img class="h-100 w-auto" src="'+element.product_img+'" alt=""> </div> <div class="minicart__product-info d-flex flex-column"> <div class="name"> <strong>'+element.product_name+'</strong> </div> <div class="detail mb-auto">('+element.product_color+', '+element.product_size+')</div> <div class="amount">x'+element.product_count.toLocaleString("it-IT", {style : "currency", currency : "VND"})+'</div> <div class="price">'+Number(element.product_price).toLocaleString('it-IT', {style : 'currency', currency : 'VND'})+'</div> <div class="total-price">'+(element.product_price*element.product_count).toLocaleString('it-IT', {style : 'currency', currency : 'VND'})+'</div> </div> <span class="minicart-remove" data-id="'+element.product_id + "_" + element.product_color+ "_" + element.product_size+'"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"> <line x1="18" y1="6" x2="6" y2="18"></line> <line x1="6" y1="6" x2="18" y2="18"></line> </svg> </span> </div> </div>';
        });
    	
    	$(".header-title")[0].innerHTML = "Giỏ Hàng: " + totalCount;
        $(".quality")[0].innerHTML = totalCount;
        $(".quality")[1].innerHTML = totalCount;
        $(".total-price > strong")[0].innerHTML = totalPrice.toLocaleString('it-IT', {
            style: 'currency',
            currency: 'VND'
        });
        $("#listCart")[0].innerHTML = html;
        $(".minicart-remove").click((evt) => {
            var cart_id = $(evt.currentTarget).attr("data-id");
            removeItemCart(cart_id);
            updateCartHeader();
        })
    }
    
    function addUpdateCartHeader(arr) {
    	var listCart = getListCart();
    	var json = JSON.parse(listCart);
    	var id = arr.product_id+"_"+arr.product_color+"_"+arr.product_size;
    	if (checkCartIdExist(id)){
    		json.forEach((element, index) => {
        		if(element.id == id){
        			element.product_id = Number(arr.product_id);
        			element.product_name = arr.product_name;
        			element.product_count = Number(element.product_count) + Number(arr.product_count);
        			element.product_price = Number(arr.product_price);
        			element.product_color = arr.product_color;
        			element.product_size = arr.product_size;
        			element.product_img = arr.product_img;
        			element.brand_name = arr.brand_name;
        		}
        	});
    	}else{
    		json.push({
        		id: id,
        		product_id: Number(arr.product_id),
        		product_name: arr.product_name,
        		product_count: Number(arr.product_count),
        		product_price: Number(arr.product_price),
        		product_color: arr.product_color,
        		product_size: arr.product_size,
        		product_img: arr.product_img,
        		brand_name: arr.brand_name,
        	})
    	}
    	localStorage.setItem('cart', JSON.stringify(json));
    	updateCartHeader();
    }
    
    function updateCount(arr){
    	var listCart = getListCart();
    	var json = JSON.parse(listCart);
    	for(let i=0; i< arr.length; i++){
    		for(let j=0; j< json.length; j++){
        		if(arr[i].cart_id == json[j].id){
        			if(arr[i].product_count <= 0){
        				json.splice(j, 1);
        			}else{
        				json[j].product_count = Number(arr[i].product_count);
        			}
        		}
        	}
    	}
    	localStorage.setItem('cart', JSON.stringify(json));
    	updateCartHeader();
    	Swal.fire({
            icon: 'success',
            title: 'Thông Báo',
            text: 'Cập Nhật Giỏ Hàng Thành Công!',
        })
    }
    
    function getListCart(){
    	var listCart = localStorage.getItem('cart');
    	if (listCart == null){
    		localStorage.setItem('cart', '[]');
    	}
    	return localStorage.getItem('cart');
    }
    
    function removeItemCart(id){
    	var listCart = getListCart();
    	var json = JSON.parse(listCart);
    	json.forEach((element, index) => {
    		if(element.id == id){
    			json.splice(index, 1);
    		}
    	});
    	localStorage.setItem('cart', JSON.stringify(json));
    }
    
    function clearAllCart(){
    	localStorage.setItem('cart', '[]');
    	updateCartHeader();
    }
    
    function checkCartIdExist(id){
    	var listCart = getListCart();
    	var json = JSON.parse(listCart);
    	var check = false;
    	json.forEach((element, index) => {
    		if(element.id == id){
    			check = true;
    		}
    	});
    	return check;
    }
</script>