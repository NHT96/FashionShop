<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
    <title>Lịch sử đơn hàng</title>
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
                        <li>
                            <a href="/Java_FashionShop">Trang chủ</a>
                        </li>
                        <li>
                            <a href="/Java_FashionShop/account/orderhistory">Lịch sử đơn hàng</a>
                        </li>
                    </ul>
                    <hr>
                    <div class="user__profile-wrapper row">
                        <div class="col-md-2 col-xs-12 mb-4">
                            <div class="tabs-control">
                                <div class="control-selectlist">
                                    <select name="" id="" class="form-control" onchange="location = this.value">
                                        <option value="./index" >Thông tin cá nhân</option>
                                        <option value="./orderhistory" >Lịch sử đơn hàng</option>
                                        <option value="./changepassword"selected>Đổi mật khẩu</option>
                                    </select>
                                    <span class="d-flex align-items-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" 
                                            viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1"
                                            stroke-linecap="round" stroke-linejoin="round"
                                            class="feather feather-chevron-down">
                                            <polyline points="6 9 12 15 18 9"></polyline>
                                        </svg>
                                    </span>
                                </div>
                                <ul class="control-list">
                                    <li class="mb-2">
                                        <a class="d-flex align-items-center " href="./index"
                                            style="white-space: nowrap;">
                                            <span class="mr-2" style="height: 24px;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1"
                                                    stroke-linecap="round" stroke-linejoin="round"
                                                    class="feather feather-info">
                                                    <circle cx="12" cy="12" r="10"></circle>
                                                    <line x1="12" y1="16" x2="12" y2="12"></line>
                                                    <line x1="12" y1="8" x2="12.01" y2="8"></line>
                                                </svg>
                                            </span>
                                            Thông tin cá nhân
                                        </a>
                                    </li>
                                    <li class="mb-2">
                                        <a class="d-flex align-items-center active" href="./orderhistory"
                                            style="white-space: nowrap;">
                                            <span class="mr-2" style="height: 24px;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1"
                                                    stroke-linecap="round" stroke-linejoin="round"
                                                    class="feather feather-list">
                                                    <line x1="8" y1="6" x2="21" y2="6"></line>
                                                    <line x1="8" y1="12" x2="21" y2="12"></line>
                                                    <line x1="8" y1="18" x2="21" y2="18"></line>
                                                    <line x1="3" y1="6" x2="3.01" y2="6"></line>
                                                    <line x1="3" y1="12" x2="3.01" y2="12"></line>
                                                    <line x1="3" y1="18" x2="3.01" y2="18"></line>
                                                </svg>
                                            </span>
                                            Lịch sử đơn hàng
                                        </a>
                                    </li>
                                    <li class="mb-2">
                                        <a class="d-flex align-items-center " href="./changepassword"
                                            style="white-space: nowrap;">
                                            <span class="mr-2 mb-0" style="height: 24px;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                    stroke-width="1" stroke-linecap="round" stroke-linejoin="round"
                                                    class="feather feather-edit-3">
                                                    <path d="M12 20h9"></path>
                                                    <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z">
                                                    </path>
                                                </svg>
                                            </span>
                                            Đổi mật khẩu
                                        </a>
                                    </li>
                                    <hr>
                      
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-10 col-xs-12 mb-4">
                            <div class="tabs-content">
                                <div class="tab-content">
                                    <div class="text-center">
                                        <div class="title"><strong>LỊCH SỬ ĐƠN HÀNG</strong></div>
                                    </div>
                                    <div class="card shadow mb-4">
                                        <div class="card-body p-2">
                                            <div class="d-flex flex-wrap align-items-center mb-2">
                                                <div
                                                    class="order-filter d-flex form-group align-items-center mr-2 mb-2">
                                                    <label class="mb-0 mr-2" style="white-space: nowrap;">Trạng thái:</label>
                                                    <div class="filter-type select-form">
                                                        <select class="form-control pr-5" name="" id="">
                                                            <option value="">Tất cả</option>
                                                            <option value="">Hoàn thành</option>
                                                            <option value="">Hủy</option>
                                                            <option value="">Đang giao hàng</option>
                                                            <option value="">Chờ xác nhận</option>
                                                            <option value="">Chờ lấy hàng</option>
                                                        </select>
                                                        <span class="d-flex align-items-center">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                height="24" viewBox="0 0 24 24" fill="none"
                                                                stroke="#333" stroke-width="1" stroke-linecap="round"
                                                                stroke-linejoin="round"
                                                                class="feather feather-chevron-down">
                                                                <polyline points="6 9 12 15 18 9"></polyline>
                                                            </svg>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div
                                                    class="order-filter d-flex form-group align-items-center mr-2 mb-2">
                                                    <label class="mb-0 mr-2" style="white-space: nowrap;">Đến ngày:</label>
                                                    <div class='filter-type input-group date' style="cursor: pointer;">
                                                        <input type='date' class="date form-control" />
                                                    </div>
                                                </div>
                                                <div
                                                    class="order-filter d-flex form-group align-items-center mr-2 mb-2">
                                                    <label class="mb-0 mr-2" style="white-space: nowrap;">Từ ngày:</label>
                                                    <div class='filter-type input-group date' style="cursor: pointer;">
                                                        <input type='date' class="date form-control" />
                                                    </div>
                                                </div>
                                                <button class="btn mb-2 d-flex align-items-center" style="background-color: var(--blue-dior)">
                                                    <span class="mr-2" style="height: 24px;">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="#fff"
                                                            stroke-width="1" stroke-linecap="round"
                                                            stroke-linejoin="round" class="feather feather-filter">
                                                            <polygon
                                                                points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3">
                                                            </polygon>
                                                        </svg>
                                                    </span>
                                                    <span style="color: #fff;">
                                                        Lọc
                                                    </span>
                                                </button>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="table table-bordered order-table" id="dataTable"
                                                    width="100%" cellspacing="0">
                                                    <thead>
                                                        <tr>
                                                            <th>Ngày tạo</th>
                                                            <th>Mã hóa đơn</th>
                                                            <th>Tổng tiền</th>
                                                            <th>Trạng thái</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach var="order" items="${listOrders}" varStatus="status">
							                       		<tr>
                                                            <td>${order.order_date}</td>
                                                            <td><a href="./orderdetail/${order.order_id}"style="color: var(--blue-dior);">#${order.order_id}</a></td>
                                                            <fmt:setLocale value = "vi-VN"/>         													
                                                            <td><fmt:formatNumber type = "number" maxFractionDigits = "0" value = "${order.order_total}" /> ₫</td>
                                                            <c:if test="${order.order_status==0}">
									                       		<td>Chờ xác nhận</td>
								                            </c:if>
								                            <c:if test="${order.order_status==1}">
									                       		<td>Đã xác nhận</td>
								                            </c:if>
								                            <c:if test="${order.order_status==2}">
									                       		<td style="color: var(--fail);">Đơn hàng bị hủy</td>
								                            </c:if>
								                            <c:if test="${order.order_status==3}">
									                       		<td>Đang giao hàng</td>
								                            </c:if>
								                            <c:if test="${order.order_status==4}">
									                       		<td style="color: var(--success); white-space: nowrap;">Hoàn thành</td>
								                            </c:if>
								                            <c:if test="${order.order_status==5}">
									                       		<td style="color: var(--fail);">Thất bại</td>
								                            </c:if>
								                            <c:if test="${order.order_status==-1}">
									                       		<td style="color: var(--fail);">Chưa Thanh Toán</td>
								                            </c:if>
                                                        </tr>
							               			</c:forEach>  
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="footer">
        <div class="custom-container">
            <div class="footer__inner">
                <div class="py-4">
                    <div class="d-flex flex-wrap justify-content-between">
                        <div class="footer__info">
                            <span class="footer__info-title">
                                <p>Công ty</p>
                            </span>
                            <ul class="footer__info-list">
                                <li class="footer__info-link pb-2">
                                    <a href="">Giới thiệu về công ty</a>
                                </li>
                                <li class="footer__info-link pb-2">
                                    <a href="">Quy tắc đạo đức</a>
                                </li>
                                <li class="footer__info-link pb-2">
                                    <a href="">Quyền riêng tư</a>
                                </li>
                                <li class="footer__info-link pb-2">
                                    <a href="">Sản phẩm của chúng tôi</a>
                                </li>
                            </ul>
                        </div>
                        <div class="footer__info">
                            <span class="footer__info-title">
                                <p>Chính sách hỗ trợ</p>
                            </span>
                            <ul class="footer__info-list">
                                <li class="footer__info-link pb-2">
                                    <a href="">Chính sách bảo hành</a>
                                </li>
                                <li class="footer__info-link pb-2">
                                    <a href="">Chỉnh sách đổi trả</a>
                                </li>
                                <li class="footer__info-link pb-2">
                                    <a href="">Chính sách thanh toán</a>
                                </li>
                                <li class="footer__info-link pb-2">
                                    <a href="">Chính sách giao hàng</a>
                                </li>
                            </ul>
                        </div>
                        <div class="footer__info">
                            <span class="footer__info-title">
                                <p>Tìm chúng tôi trên</p>
                            </span>
                            <ul class="footer__info-list">
                                <li class="footer__info-link pb-2">
                                    <a href="">
                                        <i class="fab fa-facebook-square"></i> Facebook</a>
                                </li>
                                <li class="footer__info-link pb-2">
                                    <a href="">
                                        <i class="fab fa-youtube-square"></i> Youtube</a>
                                </li>
                                <li class="footer__info-link pb-2">
                                    <a href="">
                                        <i class="fab fa-instagram-square"></i> Instagram</a>
                                </li>
                                <li class="footer__info-link pb-2">
                                    <a href="">
                                        <i class="fab fa-facebook-messenger"></i> Messenger</a>
                                </li>
                            </ul>
                        </div>
                        <div class="footer__info">
                            <span class="footer__info-title">
                                <p>Thông tin liên hệ</p>
                            </span>
                            <ul class="footer__info-list">
                                <li class="footer__info-link pb-2">
                                    <a>
                                        <i class="fas fa-mobile-alt"></i>
                                        Zalo: 0123456789
                                    </a>
                                </li>
                                <li class="footer__info-link pb-2">
                                    <a>
                                        <i class="far fa-envelope"></i>
                                        Mail: mail@gmail.com
                                    </a>
                                </li>
                                <li class="footer__info-link pb-2">
                                    <a href="https://goo.gl/maps/tnZ1983YvzTU4j6s6" target="_blank">
                                        <i class="fas fa-map-marker-alt"></i>
                                        Số 365/39A Hậu Giang, Phường 11, Quận 06, TP.Hồ Chí Minh
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer__copyright">
            <div class="custom-container">
                <div class="py-4">
                    <!-- <span class="footer__copyright-info" style="font-weight: bold;"></span> -->
                    <p class="footer__copyright-info"><i class="far fa-copyright"></i> 2022 - Copyright by Công ty TNHH
                        A Company</p>
                </div>
            </div>
        </div>
    </footer>
    <!-- Personal Script -->
    <script type="text/javascript" src="<c:url value="/resources/js/main/main.js" />"></script>
    <script type="text/javascript">
        // $('.date').datepicker({
        //     dateFormat: 'dd-mm-yy'
        // });
    </script>
</body>

</html>