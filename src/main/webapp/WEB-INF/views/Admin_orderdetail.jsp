<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" import="org.json.JSONArray"%>
<%@ page language="java" import="java.lang.Math"%>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Quản trị TDTFINDME</title>

<!-- Custom fonts for this template-->
<link
	href="<c:url value="/resources/public/vendor/fontawesome-free/css/all.min.css"/> "
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Bootstrap core JavaScript-->
<script
	src="<c:url value="/resources/public/vendor/jquery/jquery.min.js"/> "></script>
<script
	src="<c:url value="/resources/public/vendor/bootstrap/js/bootstrap.bundle.min.js" /> "></script>

<!-- Core plugin JavaScript-->
<script
	src="<c:url value="/resources/public/vendor/jquery-easing/jquery.easing.min.js"/> "></script>

<!-- Custom scripts for all pages-->
<script src="<c:url value="/resources/public/js/sb-admin-2.js"/>"></script>

<!-- Custom styles for this template-->
<link href="<c:url value="/resources/public/css/sb-admin-2.min.css"/> "
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/partials/admin_sidebar.jsp">
			<jsp:param name="title" value="Main title" />
		</jsp:include>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="/WEB-INF/views/partials/admin_topbar.jsp">
					<jsp:param name="title" value="Main title" />
				</jsp:include>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h2 mb-2 text-center">Chi tiết đơn hàng</h1>
						<input id="order_id_get" type="text" value="${order.order_id}"
							hidden>
						<h1 class="h2 mb-2 text-center">${order.order_id }</h1>
					</div>
					<div class="row justify-content-between mb-4">
						<div class="col-md-6 col-xs-12">
							<div class="text-center mb-4">
								<strong>Thông tin người nhận</strong>
							</div>
							<div class="cart-bottom billing-total">
								<div class="mb-2 d-flex justify-content-between ml-auto mr-0">
									<span>Người Nhận:</span> <span class="">${order.order_name }
									</span>
								</div>
								<div class="mb-2 d-flex justify-content-between ml-auto mr-0">
									<span>Số điện thoại</span> <span class="">
										${order.order_phone } </span>
								</div>
								<div class="mb-2 d-flex justify-content-between ml-auto mr-0">
									<span>Địa chỉ</span> <span style="font-size: 14px;" class="">${order.order_address }
									</span>
								</div>

							</div>
						</div>
						<div class="col-md-5 col-xs-12">
							<div class="text-center mb-4">
								<strong>Thông tin đơn hàng</strong>
							</div>
							<div class="cart-bottom billing-total">
								<div class="mb-2 d-flex justify-content-between ml-auto mr-0">
									<span class="text"> TỔNG CỘNG: </span> <span class="value">
										<fmt:setLocale value="vi-VN" /> <strong><fmt:formatNumber
												type="number" maxFractionDigits="0"
												value="${order.order_total}" /> ₫</strong>
									</span>
								</div>
								<div class="mb-2 d-flex justify-content-between ml-auto mr-0">
									<span>Ghi chú</span> <span style="font-size: 14px;" class="">
										${order.order_note } </span>
								</div>
								<div class="mb-2 d-flex justify-content-between ml-auto mr-0">
									<span>Trạng thái:</span>
									<c:if test="${order.order_status==0}">
										<span>Chờ xác nhận</span>
									</c:if>
									<c:if test="${order.order_status==1}">
										<span>Đã xác nhận</span>
									</c:if>
									<c:if test="${order.order_status==2}">
										<span style="color: darkred;">Đơn hàng bị hủy</span>
									</c:if>
									<c:if test="${order.order_status==3}">
										<span style="color: blue;">Đang giao hàng</span>
									</c:if>
									<c:if test="${order.order_status==4}">
										<span style="color: green">Hoàn thành</span>
									</c:if>
									<c:if test="${order.order_status==5}">
										<span style="color: red;">Thất bại</span>
									</c:if>
									<c:if test="${order.order_status==-1}">
										<span style="color: orange;">Chưa Thanh Toán</span>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<div class="font-weight-bold mb-2 text-center"
						style="font-size: 20px;">Thông tin sản phẩm</div>
					<div class="table-responsive">
						<table class="table table-bordered order-table" id="dataTable"
							width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>Ảnh</th>
									<th>Sản phẩm</th>
									<th>Màu sắc/Kích cỡ</th>
									<th>Số lượng</th>
									<th>Thành tiền</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="oddt" items="${listOrder_details}"
									varStatus="status">
									<c:forEach var="Product" items="${listProducts}"
										varStatus="status">
										<c:if test="${Product.product_id == oddt.product_id}">
											<tr>
												<td>
													<div
														class="d-flex align-items-center justify-content-between"
														style="height: 100px; width: 100px;">
														<img class="w-auto h-100 mx-auto"
															src="<c:url value="${JSONArray(Product.product_img).getString(0)}"/>"
															alt="">
													</div>
												</td>
												<td>${Product.product_name}</td>
												<td>${oddt.order_detail_color_choose};
													${oddt.order_detail_size_choose}</td>
												<td>${oddt.order_detail_count}</td>
												<td><fmt:formatNumber type="number"
														maxFractionDigits="0"
														value="${oddt.order_detail_price * oddt.order_detail_count}" />
													₫</td>
											</tr>
										</c:if>
									</c:forEach>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<c:if test="${order.order_status== 0}">
						<div class="text-right">
							<button id="btn-cancel" class="btn btn-danger">Hủy</button>
							<button id="btn-accept" class="btn btn-success accept-order">Xác
								nhận</button>
						</div>
					</c:if>
					<c:if test="${order.order_status== 1}">
						<div class="text-right">
							<button id="btn-trans" class="btn btn-success">Giao hàng</button>
						</div>
					</c:if>
					<c:if test="${order.order_status== 3}">
						<div class="text-right">
							<button id="btn-fail" class="btn btn-danger">Giao hàng
								thất bại</button>
							<button id="btn-success" class="btn btn-success">Giao
								hàng thành công</button>
						</div>
					</c:if>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/partials/admin_footer.jsp">
				<jsp:param name="title" value="Main title" />
			</jsp:include>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<!-- Page level plugins -->
    <script src="<c:url value="/resources/public/vendor/chart.js/Chart.min.js"/>"></script>

    <!-- Page level custom scripts -->
    <script src="<c:url value="/resources/public/js/demo/chart-area-demo.js"/>" ></script>
    <script src="<c:url value="/resources/public/js/demo/chart-pie-demo.js"/>"></script>
	<script>
	var orderid = $("#order_id_get").val();
        $("#btn-cancel").click(() => {
            var tt = 2;
            $.post("/Java_FashionShop/admin/updateOderStt", {
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
        $("#btn-accept").click(() => {
            var tt = 1;
            $.post("/Java_FashionShop/admin/updateOderStt", {
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
        $("#btn-trans").click(() => {
            var tt = 3;
            $.post("/Java_FashionShop/admin/updateOderStt", {
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
        $("#btn-success").click(() => {
            var tt = 4;
            $.post("/Java_FashionShop/admin/updateOderStt", {
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
        $("#btn-fail").click(() => {
            var tt = 5;
            $.post("/Java_FashionShop/admin/updateOderStt", {
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
