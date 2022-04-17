<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="org.json.JSONArray" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Quản trị</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value="/resources/public/vendor/fontawesome-free/css/all.min.css"/> " rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value="/resources/public/vendor/jquery/jquery.min.js"/> "></script>
    <script src="<c:url value="/resources/public/vendor/bootstrap/js/bootstrap.bundle.min.js" /> "></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value="/resources/public/vendor/jquery-easing/jquery.easing.min.js"/> "></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value="/resources/public/js/sb-admin-2.js"/>"></script>

    <!-- Custom styles for this template-->
    <link href="<c:url value="/resources/public/css/sb-admin-2.min.css"/> " rel="stylesheet">
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
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Quản lý sản phẩm</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="card shadow">
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered order-table" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Mã</th>
                                            <th>Sản phẩm</th>
                                            <th>Thương hiệu</th>
                                            <th>Giá</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${products}" var="product" >
                                    		<tr>
	                                           <td>${product.product_id}</td>
	                                           <td>
	                                               <div class="d-flex">
	                                                   <div class="mr-2 d-flex align-items-center justify-content-between"
	                                                       style="height: 100px; width: 100px;">
	                                                       <img src="${JSONArray(product.product_img).getString(0)}" class="card-img-top" alt="...">
	                                                   </div>
	                                                   <div>${product.product_name}</div>
	                                               </div>
	                                           </td>
	                                           <td>${product.brand_name}</td>
	                                           <td>
	                                           		<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${product.product_price}" /> ₫
	                                           	</td>
	                                           <td class="text-center">
	                                               <a class="btn btn-primary" href="/Java_FashionShop/admin/productdetail?id=${product.product_id}">Chi tiết</a>
	                                               <a class="btn btn-danger" onclick="deleteProduct(${product.product_id})">Xóa</a>
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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
	<script type="text/javascript">
        function deleteProduct(id){
        	$.post('/Java_FashionShop/admin/deleteProduct', {id: id}, function(data, response){
        		var json = JSON.parse(data)
        		if(json.status == "success"){
        			Swal.fire({
                        icon: 'success',
                        title: 'Thông Báo',
                        text: "Xóa thành công",
                    })
                    setTimeout(function() {
                    	window.location.href = "/Java_FashionShop/admin/manageproduct"
                    }, 2000);
                    return;
        		}
        		
        		Swal.fire({
                    icon: 'error',
                    title: 'Thông Báo',
                    text: "Không thể xóa sản phẩm",
                })
        	})
        }
    </script>
</body>
</html>
