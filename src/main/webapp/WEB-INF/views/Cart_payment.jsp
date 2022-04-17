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
    <title>Web Demo</title>
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
                    <li><a href="<c:url value="/cart/payment" />">Thanh toán</a></li>
                </ul>
                <div class="billing-summary">
                    <div class="cart-title text-center">HÓA ĐƠN CỦA BẠN</div>
                    <div class="d-flex flex-wrap mb-5">
                        <div class="primary-cartcontent">
                            <div class="cart-head">
                                <span>
                                    <strong>Sản phẩm</strong>
                                </span>
                                <span class="">
                                    <strong>Số lượng</strong>
                                </span>
                                <span class="text-right">
                                    <strong>Thành tiền</strong>
                                </span>
                            </div>
                            <div class="cart-products">
                                <div id="listCartPayment">
                                	
                                </div>
                                <div class="cart-bottom billing-total">
                                    <div class="attr mb-2 d-flex justify-content-between ml-auto mr-0">
                                        <span>Số lượng:</span>
                                        <span id="totalCount">0</span>
                                    </div>
                                    <div class="attr mb-2 d-flex justify-content-between ml-auto mr-0">
                                        <span class="text">
                                            TỔNG CỘNG:
                                        </span>
                                        <span class="value">
                                            <strong id="totalPrice">0 ₫</strong>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="user-info col-md-7 col-xs-12">
                            <div class="title">
                                <strong>THÔNG TIN GIAO HÀNG</strong>
                            </div>
                            <input id="diachiFull" value="${customer.customer_address}" class="w-100" type="text" hidden>
                            <div class="payment-info__line w-100 d-flex align-items-center" style="position: relative;">
                                <span style="color: red; position: absolute; left: 8px; top: 3px;">*</span>
                                <input id="name" value="${customer.customer_name}" class="w-100" type="text" placeholder="Họ tên">
                            </div>
                            <div class="payment-info__line w-100 d-flex align-items-center" style="position: relative;">
                                <span style="color: red; position: absolute; left: 8px; top: 3px;">*</span>
                                <input id="phone" value="${customer.customer_phone}" class="w-100" type="text" placeholder="Số điện thoại">
                            </div>
                            <div class="payment-info__line payment-bank w-100 d-flex align-items-center justify-content-between flex-wrap">
                                <div class="location">
                                    <span style="color: red; position: absolute; left: 8px; top: 3px;">*</span>
                                    <select name="" id="" class="user-city w-100">
                                        <option value="" disabled selected>Tỉnh/Thành...</option>
                                    </select>
                                </div>
                                <div class="location">
                                    <span style="color: red; position: absolute; left: 8px; top: 3px;">*</span>
                                    <select name="" id="" class="user-district w-100">
                                        <option value="" disabled selected>Quận/Huyện...</option>
                                    </select>
                                </div>
                                <div class="location">
                                    <span style="color: red; position: absolute; left: 8px; top: 3px;">*</span>
                                    <select name="" id="" class="user-ward w-100">
                                        <option value="" disabled selected>Phường/Xã...</option>
                                    </select>
                                </div>
                            </div>
                            <div class="payment-info__line w-100 d-flex align-items-center" style="position: relative;">
                                <span style="color: red; position: absolute; left: 8px; top: 3px;">*</span>
                                <input id="address" value="" class="w-100" type="text" placeholder="Địa chỉ">
                            </div>
                            <div class="payment-info__line w-100 d-flex align-items-center" style="position: relative;">
                                <input id="email" value="${customer.customer_email}" class="w-100" type="text" placeholder="Email">
                            </div>
                            <div class="payment-info__line w-100 d-flex align-items-center" style="position: relative;">
                                <input id="note" class="w-100" type="text" placeholder="Ghi chú">
                            </div>
                        </div>
                        <div class="payment-method col-md-5 col-xs-12">
                            <div class="title">
                                <strong>PHƯƠNG THỨC THANH TOÁN</strong>
                            </div>
                            <div class="payment-info__line w-100 align-items-center d-flex">
                                <input name="payment-method" id="cod" value="cod" type="radio" checked style="height: calc(48px + (57 - 48) * ((100vw - 375px)/ (1920 - 375)));">
                                <label class="ml-2 mb-0" for="cod" style="cursor: pointer;">Thanh toán khi nhận hàng</label>
                            </div>
                            <div class="payment-info__line w-100 align-items-center d-flex">
                                <input name="payment-method" id="momo" value="momo" type="radio" style="height: calc(48px + (57 - 48) * ((100vw - 375px)/ (1920 - 375)));">
                                <label class="ml-2 mb-0" for="momo" style="cursor: pointer;">Thanh toán qua ví momo</label>
                            </div>
                            <div class="payment-checkout text-center d-block">
                                <a id="btn-pay" class="d-inline-block">THANH TOÁN</a>
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
    <script type="text/javascript" src="<c:url value="/resources/js/main/main.js"/>"></script>
    <script>
        $("#btn-pay").click(()=>{
            var name = $("#name").val();
            var phone = $("#phone").val();
            var email = $("#email").val();
            var city = $(".user-city > option:selected").html();
            var district = $(".user-district > option:selected").html();
            var ward = $(".user-ward > option:selected").html();
            var address = $("#address").val().replaceAll(",","") + ", " + ward + ", " + district + ", " + city;
            var note = $("#note").val();
            var paymethod = $('input[name="payment-method"]:checked').val();
            var listCart = getListCart();
           	$.post("/Java_FashionShop/cart/paymentpost",{
           		name : name,
                phone : phone,
                email : email,
                address : address,
                note : note,
                paymethod : paymethod,
                listCart: listCart
           	},(data, error)=>{
           		var json = JSON.parse(data);
                if(json.status == "success"){
                    if(paymethod == "cod"){
                        Swal.fire({
                            icon: 'success',
                            title: 'Thông Báo',
                            text: json.message,
                        })
                        setTimeout(()=>{
                            window.location = "/Java_FashionShop/account/orderhistory";
                        },1000)
                    }else{
                        Swal.fire({
                            icon: 'success',
                            title: 'Thông Báo',
                            text: 'Đang chuyển hướng đến thanh toán MOMO',
                        })
                        setTimeout(()=>{
                            window.location = json.redirect;
                        },1000)
                    }
                    clearAllCart();
                }else{
                	Swal.fire({
                        icon: 'error',
                        title: 'Thông Báo',
                        text: json.message,
                    })
                }
           	});
        })
        
        load();
        function load(){
        	var listCart = getListCart();
        	var json = JSON.parse(listCart);
        	var html = '';
        	var totalCount = 0;
        	var totalPrice = 0;
        	json.forEach((element, index)=>{
        		totalCount += Number(element.product_count);
        		totalPrice += Number(element.product_price * element.product_count);
        		html += '<div class="cart-product d-flex flex-wrap w-100"><div class="cart-product__image"><img src="'+element.product_img+'" alt=""></div><div class="cart-product__info"><div class="cart-product--auto"><div><strong>'+element.product_name+'</strong></div><div>'+element.brand_name+'</div><div>(' +element.product_color+ ', '+element.product_size+ ')</div><div class="price"><span class="value">' +Number(element.product_price).toLocaleString('it-IT', {style : 'currency', currency : 'VND'})+ '</span></div></div><div class="cart-product--col">x' +element.product_count+ '</div><div class="cart-product--col totalprice text-right"><span class="total-value">' +Number(element.product_price * element.product_count).toLocaleString('it-IT', {style : 'currency', currency : 'VND'})+ '</span></div></div></div>';
        	});
        	$("#totalCount")[0].innerHTML = totalCount;
        	$("#totalPrice")[0].innerHTML = totalPrice.toLocaleString('it-IT', {style : 'currency', currency : 'VND'});
        	$("#listCartPayment")[0].innerHTML = html;
        }

        $.get('/Java_FashionShop/resources/public/js/json/provinces-open-api.json', function(data) {
        	var diachiFull = $("#diachiFull").val();
        	var diachiJson = diachiFull.split(", ");
            // City
            var userCity = '';
            // District
            var userDistrict = '';
            // Ward
            var userWard = '';
            
            if(diachiJson.length > 2){
            	userWard = diachiJson[1];
            	userDistrict = diachiJson[2];
            	userCity = diachiJson[3];
            	$("#address").val(diachiJson[0]);
            }
            

            var htmlTinhThanh = '<option value="" disabled>Tỉnh/Thành...</option>'
            data.forEach(city => {
                if (city.name == userCity) {
                    htmlTinhThanh += '<option value="' + city.code + '" selected>' + city.name + '</option>'
                    let htmlQuanHuyen = '<option value="" disabled selected>Quận/Huyện...</option>'
                    city.districts.forEach(dist => {
                        if (dist.name == userDistrict) {
                            htmlQuanHuyen += '<option value="' + dist.code + '" selected>' + dist.name + '</option>'
                            let htmlPhuongXa = '<option value="" disabled selected>Phường/Xã...</option>'
                            dist.wards.forEach(ward => {
                                if (ward.name == userWard) {
                                    htmlPhuongXa += '<option value="' + ward.code + '" selected>' + ward.name + '</option>'
                                } else {
                                    htmlPhuongXa += '<option value="' + ward.code + '">' + ward.name + '</option>'
                                }
                            })
                            $(".user-ward")[0].innerHTML = htmlPhuongXa;
                        } else {
                            htmlQuanHuyen += '<option value="' + dist.code + '">' + dist.name + '</option>'
                        }
                    })
                    $(".user-district")[0].innerHTML = htmlQuanHuyen;
                } else {
                    htmlTinhThanh += '<option value="' + city.code + '">' + city.name + '</option>'
                }
            });
            $(".user-city")[0].innerHTML = htmlTinhThanh;

            // Select Districts
            $(".user-city").on('change', function() {
                let htmlQuanHuyen = '<option value="" disabled selected>Quận/Huyện...</option>'
                data.forEach(city => {
                    if (city.code == this.value) {
                        city.districts.forEach(dist => {
                            htmlQuanHuyen += '<option value="' + dist.code + '">' + dist.name + '</option>'
                        })
                        $(".user-district")[0].innerHTML = htmlQuanHuyen
                        $(".user-ward")[0].innerHTML = '<option value="" disabled selected>Phường/Xã...</option>'
                    }
                })
            });
            // Select Wards
            $(".user-district").on('change', function() {
                let valueTinhThanh = $(".user-city")[0].value
                let valueQuanHuyen = this.value
                let htmlPhuongXa = '<option value="" disabled selected>Phường/Xã...</option>'
                data.forEach(city => {
                    if (city.code == valueTinhThanh) {
                        city.districts.forEach(dist => {
                            if (dist.code == valueQuanHuyen) {
                                dist.wards.forEach(ward => {
                                    htmlPhuongXa += '<option value="' + ward.code + '">' + ward.name + '</option>'
                                })
                                $(".user-ward")[0].innerHTML = htmlPhuongXa
                            }
                        })
                    }
                })
            });
        })
    </script>
</body>

</html>