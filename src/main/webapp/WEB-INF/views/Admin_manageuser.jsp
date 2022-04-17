<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<h1 class="h3 mb-0 text-gray-800">Quản lý người dùng cá nhân</h1>
					</div>

					<!-- Content Row -->
					<div class="card shadow">
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered order-table" id="dataTable"
									width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>Họ và tên</th>
											<th>Email</th>
											<th>SĐT</th>
											<th>Địa chỉ</th>
											<th>Trạng thái</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="user" items="${listCustomers}" varStatus="status">
											<tr>
												<input type="text" class="id-get" value="${user.customer_id }" hidden>
												<td>${user.customer_name }</td>
												<td>${user.customer_email }</td>
												<td>${user.customer_phone }</td>
												<td style="font-size: 14px;">${user.customer_address }</td>
												<td><c:if test="${user.customer_status=='active'}">
														<div>
															<label class="btn btn-danger btn-lock mb-0">Khóa</label>
															<input type="text" value="${user.customer_id }" hidden>
														</div>
														</c:if>
														<c:if test="${user.customer_status=='blocked'}">
														<div>
															<label class="btn btn-primary btn-unlock mb-0">Mở khóa</label> <input type="text" value="${user.customer_id }" hidden>
														</div>
													</c:if>
												</td>

											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
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
	<script>
        $(".btn-lock").click(function() {
            var id = $(this).siblings('input').val();
            $.post("/Java_FashionShop/admin/updateCustomerStt", {
                tt: 'blocked',
                id: id,
            }, (data, err) => {
                var json = JSON.parse(data);
                if (json.status == "error") {
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
                setTimeout(() => {
                    window.location.reload();
                }, 1000)
            });
        });
        $(".btn-unlock").click(function() {
            var id = $(this).siblings('input').val();
            $.post("/Java_FashionShop/admin/updateCustomerStt", {
                tt: 'active',
                id: id,
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

