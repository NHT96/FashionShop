<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
						<h1 class="h3 mb-0 text-gray-800">Trang chủ</h1>
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												Tổng doanh thu</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												<fmt:setLocale value="vi-VN" />
												<fmt:formatNumber type="number" maxFractionDigits="0" value="${total}" /> ₫
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												Khách hàng</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												${customer}
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-user fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Earnings (Monthly) Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">
												Tổng đơn hàng</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
														<fmt:setLocale value="vi-VN" />
														<fmt:formatNumber type="number" maxFractionDigits="0" value="${order}" />
													</div>
												</div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Pending Requests Card Example -->
						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												Sản phẩm</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												<fmt:setLocale value="vi-VN" />
												<fmt:formatNumber type="number" maxFractionDigits="0" value="${product}" />
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-products fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="font-weight-bold mb-2 text-center"
						style="font-size: 30px;">Đơn hàng chưa xác nhận</div>
					<div class="table-responsive">
						<table class="table table-bordered order-table" id="dataTable"
							width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>Mã</th>
									<th>Ngày</th>
									<th>Giá</th>
									<th>Người nhận</th>
									<th>Điện thoại</th>
									<th>Địa chỉ</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="order" items="${listOrderAcceptList}"
											varStatus="status">
											<tr>
												<tr>
                                                <td><a href="/Java_FashionShop/admin/orderdetail/${order.order_id}">${order.order_id}</a></td>
                                                <td>${order.order_date}</td>
                                                <td><fmt:setLocale value="vi-VN" />
												<fmt:formatNumber type="number" maxFractionDigits="0" value="${order.order_total}" /> ₫</td>
                                                <td>${order.order_name}</td>
                                                <td>${order.order_phone}</td>
                                                <td style="max-width: 300px;; white-space: pre-line">${order.order_address}</td>
                                            </tr>
											</tr>
										</c:forEach>
							</tbody>
						</table>
					</div>
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

</body>

</html>
