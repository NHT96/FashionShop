<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
    <title>Quên mật khẩu</title>
</head>

<body>
    <jsp:include page="/WEB-INF/views/partials/header.jsp">
       <jsp:param name="title" value="Main title" />
    </jsp:include>
    <main class="main">
        <!-- Main content -->
        <div class="custom-container py-4">
            <div class="signup__wrapper">
                <ul class="web__directional">
                    <li><a href="/Java_FashionShop">Trang chủ</a></li>
                    <li><a href="/Java_FashionShop/account/forgotpassword">Quên mật khẩu</a></li>
                </ul>
                <section class="vh-100">
                    <div class="container-fluid h-custom">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-md-9 col-lg-6 col-xl-5">
                                <img src="<c:url value="/resources/public/images/login/draw2.webp" />" class="img-fluid" alt="Sample image">
                            </div>
                            <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                                <form class="login-form">
                                    <!-- Email input -->
                                    <div class="mb-4 form-input">
                                        <span><i class="fa-solid fa-user"></i></span>
                                        <input type="text" id="email" class="form-control form-control-lg" placeholder="Nhập Email" />
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <a href="./signup" class="text-body">Tạo tài khoản mới</a>
                                        <a href="./signin" class="text-body">Đăng nhập</a>
                                    </div>

                                    <div class="login text-center text-lg-start mt-4 pt-2">
                                        <button type="button" id="btn-confirm">Khởi tạo mật khẩu mới</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </main>
    
    <jsp:include page="/WEB-INF/views/partials/footer.jsp">
       <jsp:param name="title" value="Main title" />
    </jsp:include>
    <!-- Personal Script -->
    <script type="text/javascript" src="<c:url value="/resources/js/main/main.js"/>"></script>
    <script src="https://www.gstatic.com/firebasejs/6.0.2/firebase.js"></script>
    <script>
        $("#btn-confirm").click(() => {
            var email = $("#email").val();
            Swal.fire({
                icon: 'info',
                title: 'Vui lòng chờ !',
                html: 'Đang thực thi lệnh!',// add html attribute if you want or remove
                allowOutsideClick: false,
                showConfirmButton: false,
                onBeforeOpen: () => {
                    Swal.showLoading()
                },
            });
            $.post("/Java_FashionShop/account/forgotpasswordpost", {
                email: email
            }, (data, err) => {
                var json = JSON.parse(data);
                if (json.status == "error"){
                    Swal.close();
                    Swal.fire({
                        icon: 'error',
                        title: 'Thông Báo',
                        text: json.message,
                    })
                    return;
                }
                Swal.close();
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