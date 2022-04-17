<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="org.json.JSONArray" %>
<%@ page language="java" import="java.lang.Math" %>
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
    <title>Chi tiết đơn hàng</title>
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
                    <li><a href="/Java_FashionShop">Trang chủ</a></li>
                    <li><a href="/Java_FashionShop/account/orderhistory">Lịch sử đơn hàng</a></li>
                    <li><a href="#">Chi tiết đơn hàng</a></li>
                </ul>
                <div class="billing-summary">
                    <div class="cart-title text-center">CHI TIẾT ĐƠN HÀNG</div>
                    <div class="row justify-content-between mb-4">
                        <div class="col-md-5 col-xs-12">
                            <div class="text-center mb-4"><strong>Thông tin đơn hàng</strong></div>
                            <div class="cart-bottom billing-total">
                                <div class="mb-2 d-flex justify-content-between ml-auto mr-0">
                                    <span>Mã đơn hàng:</span>
                                    <input id="order_id_get" type="text" value="${order.order_id}" hidden>
                                    <span class="">#${order.order_id}</span>
                                </div>
                                <div class="mb-2 d-flex justify-content-between ml-auto mr-0">
                                    <span>Ngày:</span>
                                    <span class="">${order.order_date}</span>
                                </div>
                                <div class="mb-2 d-flex justify-content-between ml-auto mr-0">
                                    <span>Trạng thái:</span>
                                    <c:if test="${order.order_status==0}">
			                       		<td>Chờ xác nhận</td>
		                            </c:if>
		                            <c:if test="${order.order_status==1}">
			                       		<span>Đã xác nhận</span>
		                            </c:if>
		                            <c:if test="${order.order_status==2}">
			                       		<span style="color: var(--fail);">Đơn hàng bị hủy</span>
		                            </c:if>
		                            <c:if test="${order.order_status==3}">
			                       		<span>Đang giao hàng</span>
		                            </c:if>
		                            <c:if test="${order.order_status==4}">
			                       		<span style="color: var(--success); white-space: nowrap;">Hoàn thành</span>
		                            </c:if>
		                            <c:if test="${order.order_status==5}">
			                       		<span style="color: var(--fail);">Thất bại</span>
		                            </c:if>
		                            <c:if test="${order.order_status==-1}">
			                       		<span style="color: var(--fail);">Chưa Thanh Toán</span>
		                            </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 col-xs-12">
                            <div class="text-center mb-4"><strong>Giá trị đơn hàng</strong></div>
                            <div class="cart-bottom billing-total">
                                <div class="mb-2 d-flex justify-content-between ml-auto mr-0">
                                    <span>Số lượng:</span>
                                    <c:set var="count" value="${0}"/>
                                    <c:forEach var="oddt" items="${listOrder_details}" varStatus="status">
										<c:set var="count" value="${count + oddt.order_detail_count}" />
               						</c:forEach>
                                    <span class="">x${count}</span>
                                </div>

                                <div class="mb-2 d-flex justify-content-between ml-auto mr-0">
                                    <span>Note:</span>
                                    <span class="">${order.order_note}</span>
                                </div>
                                <div class="mb-2 d-flex justify-content-between ml-auto mr-0">
                                    <span class="text">
                                        TỔNG CỘNG:
                                    </span>
                                    <span class="value">
                                    <fmt:setLocale value = "vi-VN"/>         													
                                        <strong><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${order.order_total}" /> ₫</strong>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
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
                            <c:forEach var="oddt" items="${listOrder_details}" varStatus="status">
								<c:forEach var="Product" items="${listProducts}" varStatus="status">
		                       		<c:if test="${Product.product_id == oddt.product_id}">
			                       		<div class="cart-product d-flex flex-wrap w-100">
	                                        <div class="cart-product__image">
	                                            <img src="<c:url value="${JSONArray(Product.product_img).getString(0)}"/>" alt="">
	                                        </div>
	                                        <div class="cart-product__info">
	                                            <div class="cart-product--auto">
	                                                <div><strong>${Product.product_name}</strong></div>
	                                                <div>(${oddt.order_detail_size_choose}, ${oddt.order_detail_color_choose})</div>
	                                                <div class="price">
	                                                    <span class="value"><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${oddt.order_detail_price}" /> ₫</span>
	                                                </div>
	                                            </div>
	                                            <div class="cart-product--col">
	                                                ${oddt.order_detail_count}
	                                            </div>
	                                            <div class="cart-product--col totalprice text-right">
	                                                <span class="total-value"><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${oddt.order_detail_price * oddt.order_detail_count}" /> ₫</span>
	                                            </div>
	                                        </div>
	                                    </div>
		                            </c:if>
	               				</c:forEach> 
               				</c:forEach>
                                <c:if test="${order.order_status==0 ||  order.order_status==1}">
			                       		<div class="product__detail-buttons d-flex justify-content-between w-100">
                                            <button id="order_canceled" class="btn-addtocart" style="width: 49%; background-color: #333; color: #ff0000;" >
                                                Hủy Đơn Hàng
                                            </button>
                                            <button id="order_accepted" class="btn-buynow" style="width: 49%; background-color: #333; color: #fff;" disabled>
                                                Vui lòng đợi giao hàng!
                                            </button>
                                        </div>
		                        </c:if>
		                        <c:if test="${order.order_status==3}">
			                       		<div class="product__detail-buttons d-flex justify-content-between w-100">
                                            <button id="order_canceled" class="btn-addtocart" style="width: 49%; background-color: #333; color: #fff;" disabled>
                                                Vui lòng không bom hàng!
                                            </button>
                                            <button id="order_accepted" class="btn-buynow" style="width: 49%; background-color: #333; color: #00cc00;" >
                                                Đã Nhận Hàng
                                            </button>
                                        </div>
		                        </c:if>
                                

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
    <script type="text/javascript" src="<c:url value="/resources/js/main/main.js" />"></script>
    <script>
        var orderid = $("#order_id_get").val();
        $("#order_canceled").click(() => {
            var tt = 2;
            $.post("/Java_FashionShop/account/updateOderStt", {
                tt: tt,
                odid: orderid,
            }, (data, err) => {
                var json = JSON.parse(data);
                if (json.status == "error"){
                    Swal.fire({
                        icon: 'error',
                        title: 'Thông Báo',
                        text: json.message,
                    })
                    return;
                }
                Swal.fire({
                    icon: 'success',
                    title: 'Thông Báo',
                    text: json.message,
                })
                setTimeout(()=>{
                    window.location.reload();
                },1000)
            });
        });
        $("#order_accepted").click(() => {
            var tt = 4;
            $.post("/Java_FashionShop/account/updateOderStt", {
                tt: tt,
                odid: orderid,
            }, (data, err) => {
                var json = JSON.parse(data);
                if (json.status == "error"){
                    Swal.fire({
                        icon: 'error',
                        title: 'Thông Báo',
                        text: json.message,
                    })
                    return;
                }
                Swal.fire({
                    icon: 'success',
                    title: 'Thông Báo',
                    text: json.message,
                })
                setTimeout(()=>{
                    window.location.reload();
                },1000)
            });
        });
    </script>
</body>

</html>