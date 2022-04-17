<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Thay đổi mật khẩu</title>
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
                            <a href="/Java_FashionShop/account/changepassword">Thay đổi mật khẩu</a>
                        </li>
                    </ul>
                    <hr>
                    <div class="user__profile-wrapper row">
                        <div class="col-md-2 col-xs-12 mb-4">
                            <div class="tabs-control">
                                <div class="control-selectlist">
                                    <select name="" id="" class="form-control" onchange="location = this.value">
                                        <option value="./index" >Thông tin cá nhân</option>
                                        <option value="./orderhistory" selected>Lịch sử đơn hàng</option>
                                        <option value="./changepassword">Đổi mật khẩu</option>
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
                                        <a class="d-flex align-items-center " href="./orderhistory"
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
                                        <a class="d-flex align-items-center active" href="./changepassword"
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
                                        <div class="title"><strong>ĐỔI MẬT KHẨU</strong></div>
                                    </div>
                                    <form action="" class="user__info-form mx-auto">
                                        <div class="form-group mb-4">
                                            <label>Mật khẩu cũ</label>
                                            <input type="password" id="passold" class="form-control">
                                        </div>
                                        <div class="form-group mb-4">
                                            <label>Mật khẩu mới</label>
                                            <input type="password" id="passnew" class="form-control">
                                        </div>
                                        <div class="form-group mb-4">
                                            <label>Nhập lại mật khẩu</label>
                                            <input type="password" id="repassnew" class="form-control">
                                        </div>
                                        <div class="text-right">
                                            <button type="button" class="btn" id="btn-confirm-change" style="background-color: var(--blue-dior); color: #fff;">Đổi mật khẩu</button>
                                        </div>
                                    </form>
                                </div>
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
        $("#btn-confirm-change").click(() => {
            var passold = $("#passold").val();
            var passnew = $("#passnew").val();
            var repassnew = $("#repassnew").val();
            $.post("/Java_FashionShop/account/updatePass",{
                passold : passold,
                pass : passnew,
                repass : repassnew,
            },(data,err)=>{
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
                    window.location = "/Java_FashionShop/account/signin"
                },1000)
            });
        });
    </script>
</body>

</html>