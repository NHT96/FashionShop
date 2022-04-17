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
	<style>
        .loader {
            border: 8px solid #f3f3f3;
            border-radius: 50%;
            border-top: 8px solid #3498db;
            width: 60px;
            height: 60px;
            -webkit-animation: spin 2s linear infinite; /* Safari */
            animation: spin 2s linear infinite;
        }

        /* Safari */
        @-webkit-keyframes spin {
            0% { -webkit-transform: rotate(0deg); }
            100% { -webkit-transform: rotate(360deg); }
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>   
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

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary text-center">Thêm sản phẩm</h6>
                        </div>
                        <div class="card-body p-2">
                            <div class="mx-auto">
                                <div class="row">
                                    <div class="col-sm-6 mb-4">
                                        <div class="text-left mb-2 text-primary"><strong>1. Thông tin cơ bản</strong></div>
                                        <div class="form-group mb-4">
                                            <label>Tên sản phẩm</label>
                                            <input type="text" class="form-control product-name" value="${product.product_name}">
                                        </div>
                                        <div class="form-group mb-4">
                                            <label>Giá</label>
                                            <div class="d-flex align-items-center">
                                                <input type="number" class="form-control product-price" value="${product.product_price}" min="0" step="1000">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Loại</label>
                                            <div class="select-form w-100 mb-2">
                                                <select name="" id="" class="form-control product-category">
                                                    <c:forEach items="${categories}" var="category">
                                                    	<c:choose>
														    <c:when test="${category.category_id == product.category_id}">
														        <option value="${category.category_id}"} selected>${category.category_name}</option>
														    </c:when>    
														    <c:otherwise>
														        <option value="${category.category_id}"}>${category.category_name}</option>
														    </c:otherwise>
														</c:choose>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Thương hiệu</label>
                                            <div class="select-form w-100 mb-2">
                                                <select name="" id="" class="form-control product-brand">
                                                    <c:forEach items="${brands}" var="brand">
                                                    	<c:choose>
														    <c:when test="${brand.brand_id == product.brand_id}">
														        <option value="${brand.brand_id}"} selected>${brand.brand_name}</option>
														    </c:when>    
														    <c:otherwise>
														        <option value="${brand.brand_id}"}>${brand.brand_name}</option>
														    </c:otherwise>
														</c:choose>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 mb-4">
                                        <div class="text-left mb-2 text-primary"><strong>2. Thông tin tùy chọn</strong></div>
                                        <div class="d-flex flex-wrap">
                                            <div class="form-group mr-4 mb-2">
                                                <label>Màu sắc</label>
                                                <div class="d-flex mb-2">
                                                    <div class="dropdown mr-2">
                                                        <input class="form-control" type="text">
                                                    </div>
                                                    <a class="add-option btn btn-primary">Thêm</a>
                                                </div>
                                                <ul class="pl-0 color-list">
                                                    <c:forEach begin="0" end="${JSONArray(product.product_color).length() - 1}" varStatus="loop">
                                                    	<li class="attr d-inline p-1 mr-2 mb-2"
                                                             style="background-color: #ddd; border-radius: 4px;">
                                                             <span class="text">${JSONArray(product.product_color).getString(loop.index)}</span>
                                                             <span class="remove-tag ml-2" style="cursor: pointer;">
                                                                 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                     viewBox="0 0 24 24" fill="none" stroke="#333"
                                                                     stroke-width="1" stroke-linecap="round"
                                                                     stroke-linejoin="round" class="feather feather-x">
                                                                     <line x1="18" y1="6" x2="6" y2="18"></line>
                                                                     <line x1="6" y1="6" x2="18" y2="18"></line>
                                                                 </svg>
                                                             </span>
                                                         </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                            <div class="form-group mr-4 mb-2">
                                                <label>Kích thước</label>
                                                <div class="d-flex mb-2">
                                                    <div class="dropdown mr-2">
                                                        <input class="form-control" type="text">
                                                    </div>
                                                    <a class="add-option btn btn-primary">Thêm</a>
                                                </div>
                                                <ul class="pl-0 size-list">
                                                    <c:forEach begin="0" end="${JSONArray(product.product_size).length() - 1}" varStatus="loop">
                                                    	<li class="attr d-inline p-1 mr-2 mb-2"
                                                             style="background-color: #ddd; border-radius: 4px;">
                                                             <span class="text">${JSONArray(product.product_size).getString(loop.index)}</span>
                                                             <span class="remove-tag ml-2" style="cursor: pointer;">
                                                                 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                                     viewBox="0 0 24 24" fill="none" stroke="#333"
                                                                     stroke-width="1" stroke-linecap="round"
                                                                     stroke-linejoin="round" class="feather feather-x">
                                                                     <line x1="18" y1="6" x2="6" y2="18"></line>
                                                                     <line x1="6" y1="6" x2="18" y2="18"></line>
                                                                 </svg>
                                                             </span>
                                                         </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12 mb-4">
                                        <div class="text-left mb-2 text-primary"><strong>4. Mô tả</strong></div>
                                        <div class="form-group mb-4">
                                            <textarea class="form-control product-description" id="product-desciptions" rows="8" cols="50">${product.product_description}</textarea>
                                        </div>
                                        <div class="mb-2 text-primary"><strong>Ảnh sản phẩm</strong></div>
                                        <div class="form-group mb-4">
                                            <label for="imageProduct-upload" class="input-tile mb-2">
                                                <div class="d-flex align-items-center">
                                                    <a class="upload btn-secondary btn mr-2">Chọn ảnh</a>
                                                </div>
                                            </label>
                                            <input id="imageProduct-upload" name="files[]" accept="image/*" type="file" multiple hidden />
                                            <output class="d-flex flex-wrap" id="imageProduct-preview">
                                                <c:forEach begin="0" end="${JSONArray(product.product_img).length() - 1}" varStatus="loop">
                                                	<div class="image__upload-item mr-2">
	                                                    <div class="border mb-2 mx-auto" style="height: 180px; width: 180px;">
	                                                        <div class="image-wrapper w-100 h-100 position-relative d-flex align-items-center justify-content-center">
	                                                            <img src="${JSONArray(product.product_img).getString(loop.index)}" class="card-img-top product-currentimg" alt="...">
	                                                        </div>
	                                                    </div>
	                                                </div>
                                                </c:forEach>
                                            </output>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-center">
                                    <a class="btn btn-secondary get-files">Hủy</a>
                                    <a class="btn btn-primary save-change">Lưu</a>
                                </div>
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
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <script src="https://www.gstatic.com/firebasejs/7.20.0/firebase.js"></script>
	<script type="text/javascript">
	 // Your web app's Firebase configuration
	    const firebaseConfig = {
	        apiKey: "AIzaSyA8WSuWH5l9NYxf64v_8sX4qWIEnmKR41o",
	        authDomain: "tdtfashionshop.firebaseapp.com",
	        projectId: "tdtfashionshop",
	        storageBucket: "tdtfashionshop.appspot.com",
	        messagingSenderId: "543133981962",
	        appId: "1:543133981962:web:00a17b2a672a79c7be2ef3",
	        measurementId: "G-122R8RGKRE"
	    };
	    // Initialize Firebase
	    firebase.initializeApp(firebaseConfig);
	
	    let arrNewImage = []
	    loadIamgesWithPreview("imageProduct-upload", "imageProduct-preview", 7);
	    function loadIamgesWithPreview(upload, preview, amount) {
	        if (window.File && window.FileList && window.FileReader) {
	            var filesInput = document.getElementById(upload);
	            filesInput.addEventListener("change", function(event) {
	                var files = event.target.files;
	
	                // Remove all current images
	                $('.image__upload-item').remove();
	                
	                // check amount of images
	                var currentFiles = $('.image__upload-item').length + files.length;
	                if (currentFiles > amount) {
	                    Swal.fire({
	                        icon: 'error',
	                        title: 'Thông Báo',
	                        text: "Vượt quá số ảnh cho phép",
	                    })
	                    return;
	                }
	
	
	                var output = document.getElementById(preview);
	                output.innerHTML = `
	                    <div class="d-flex waiting align-items-center">
	                        <div class="loader mr-2"></div>
	                        <p class="font-weight-bold mb-0">Đang tải ảnh vui lòng chờ</p>
	                    </div>
	                `;
	                for (var i = 0; i < files.length; i++) {
	                    // Accept images only
	                    var file = files[i];
	                    if (!file.type.match('image')) {
	                        continue;
	                    }
	
	                    // config iamge
	                    const ref = firebase.storage().ref();
	                    const name = +new Date() + "-" + file.name;
	                    const metadata = {
	                        contentType: file.type
	                    };
	                    const task = ref.child(name).put(file, metadata);
	
	                    // Upload to firebase then render to view
	                    task
	                        .then(snapshot => snapshot.ref.getDownloadURL())
	                        .then(url => {
	                            $('.waiting').remove();
	                            var div = document.createElement("div");
	                            div.classList.add(`image__upload-item`, `mr-2`);
	                            div.innerHTML += `
	                                <div class="border mb-2 mx-auto" style="height: 180px; width: 180px;">
	                                    <div class="image-wrapper w-100 h-100 position-relative d-flex align-items-center justify-content-center">
	                                        <img class="mw-100 mh-100" src="\${url}" alt="">
	                                    </div>
	                                </div>
	                            `;
	                            arrNewImage.push(url);
	                            // Insert div into output 
	                            output.append(div);
	                        })
	                        .catch(error => {
	                            console.log(error);
	                            Swal.fire({
	                                icon: 'error',
	                                title: 'Thông Báo',
	                                text: "Lỗi không thêm tải ảnh vui lòng thử lại sau",
	                            })
	                        });
	                }
	            });
	        }
	    }	
	
        $('.save-change').click(function() {
            let id = ${product.product_id};
            let name = $('.product-name').val();
            let price = $('.product-price').val();
            let description = $('.product-description').val();
            let category = $('.product-category').val();
            let brand = $('.product-brand').val();
            let arrColor = [];
            $('.color-list .attr .text').each(function(index, elem) {
                arrColor.push(elem.textContent);
            })
            let arrSize = [];
            $('.size-list .attr .text').each(function(index, elem) {
                arrSize.push(elem.textContent);
            })
            let arrCurrentImage = [];
            $('.product-currentimg').each(function(){
            	arrCurrentImage.push($(this).attr('src').replace("/Java_FashionShop/resources/",""))	
            })
			
            $.post('/Java_FashionShop/admin/editProduct', {
            	id: id,
            	name: name == '' ? 'Chưa có thông tin' : name,
            	price: price,
            	description: description == '' ? 'Chưa có thông tin' : description, 
            	category: category,
            	brand: brand,
            	image: JSON.stringify(arrCurrentImage),
             	newImage: JSON.stringify(arrNewImage),
             	color: JSON.stringify(arrColor),
            	size: JSON.stringify(arrSize)
            }, function(data, response){
            	var json = JSON.parse(data)
            	if(json.status == "success"){
        			Swal.fire({
                        icon: 'success',
                        title: 'Thông Báo',
                        text: "Sửa thành công",
                    })
                    return;
        		}
        		
        		Swal.fire({
                    icon: 'error',
                    title: 'Thông Báo',
                    text: "Không thể sửa sản phẩm",
                })
            })
        })
        $(document).on('click', ".remove-tag", function() {
            $(this).parent().remove();
        });
        $('.add-option').click(function() {
            let val = $(this).siblings('.dropdown').find('input').val();
            if (!val?.trim()) {
                return;
            }

            let check = true;
            if ($(this).parent().siblings('ul').children('li').length) {
                $(this).parent().siblings('ul').children('li').find('.text').each(function(index, element) {
                    if (val == element.textContent) {
                        check = false;
                        return;
                    }
                })
            }
            if (check == false) {
                return;
            }

            $(this).parent().siblings('ul').append(`
                <li class="attr d-inline p-1 mr-2 mb-2"
                    style="background-color: #ddd; border-radius: 4px;">
                    <span class="text">\${val}</span>
                    <span class="remove-tag ml-2" style="cursor: pointer;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                            viewBox="0 0 24 24" fill="none" stroke="#333"
                            stroke-width="1" stroke-linecap="round"
                            stroke-linejoin="round" class="feather feather-x">
                            <line x1="18" y1="6" x2="6" y2="18"></line>
                            <line x1="6" y1="6" x2="18" y2="18"></line>
                        </svg>
                    </span>
                </li>
            `)
            $(this).siblings('.dropdown').find('input').val('');
        })
    </script>     
</body>
</html>
