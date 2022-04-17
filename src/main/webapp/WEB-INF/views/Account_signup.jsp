<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- JQuery -->
    <script src="<c:url value="/resources/js/jquery-3.3.1.min.js"/>"></script>
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
    <title>Đăng Ký</title>
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
                    <li><a href="/Java_FashionShop">Trang chủ</a></i>
                    </li>
                    <li><a href="/Java_FashionShop/account/signup">Đăng ký tài khoản</a></li>
                </ul>
                <div class="signup__inner mx-auto p-4">
                    <form class="d-flex flex-column pt-2">
                        <div class="signup-block">
                        <h3 class="text-center">Tạo Tài Khoản Mới</h3>
                            <div class="signup-info"><strong>THÔNG TIN CÁ NHÂN</strong></div>
                            <input class="mb-2 w-100" type="text" id="name" placeholder="Họ tên">
                            <input class="mb-2 w-100" type="text" id="phone" placeholder="Số điện thoại">
                            
                            
                            <div class="location mb-2">
                                <select name="" id="T" class="city-select w-100">
                                    <option value="" disabled selected>Tỉnh/Thành...</option>
                                </select>
                            </div>
                            <div class="location mb-2">
                                <select name="" id="H" class="district-select w-100">
                                    <option value="" disabled selected>Quận/Huyện...</option>
                                </select>
                            </div>
                            <div class="location mb-2">
                                <select name="" id="X" class="ward-select w-100">
                                    <option value="" disabled selected>Phường/Xã...</option>
                                </select>
                            </div>
                            <input class="mb-2 w-100" id="S" type="text" placeholder="Số nhà">
                        </div>
                        <div class="signup-block">
                            <div class="signup-info"><strong>THÔNG TIN ĐĂNG NHẬP</strong></div>
                            <input class="mb-2 w-100" id="email" type="email" placeholder="Email">
                            <input class="mb-2 w-100" id="password" type="password" placeholder="Nhập mật khẩu">
                            <input class="mb-2 w-100" id="repassword" type="password" placeholder="Nhập lại mật khẩu">
                            <button class="w-100" type="button" id="btn-signup">Tạo tài khoản</button>
                        </div>
                        
                    </form>
                </div>
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
    $.get("/Java_FashionShop/resources/public/js/json/provinces-open-api.json", function (data) {
        // Cities
        if ($(".city-select").length > 0){
            var htmlTinhThanh = `<option value="" disabled selected>Tỉnh/Thành...</option>`
            data.forEach(element => {
                htmlTinhThanh += `<option value="` + element.code + `">` + element.name + `</option>`
            });
            $(".city-select")[0].innerHTML = htmlTinhThanh;
            // Districts
            $(".city-select").on('change', function () {
                var htmlQuanHuyen = `<option value="" disabled selected>Quận/Huyện...</option>`
                data.forEach(element => {
                    if (element.code == this.value) {
                        element.districts.forEach(element1 => {
                            htmlQuanHuyen += `<option value="` + element1.code + `">` + element1.name + `</option>`
                        })
                        $(".district-select")[0].innerHTML = htmlQuanHuyen
                    }
                })
            });
            // Wards
            $(".district-select").on('change', function () {
                var valueTinhThanh = $(".city-select")[0].value
                var valueQuanHuyen = this.value
                var htmlPhuongXa = `<option value="" disabled selected>Phường/Xã...</option>`
                data.forEach(element => {
                    if (element.code == valueTinhThanh) {
                        element.districts.forEach(element1 => {
                            if (element1.code == valueQuanHuyen) {
                                element1.wards.forEach(element2 => {
                                    htmlPhuongXa += `<option value="` + element2.code + `">` + element2.name + `</option>`
                                })
                                $(".ward-select")[0].innerHTML = htmlPhuongXa
                            }
                        })
                    }
                })
            });
        }
    })
        $("#btn-signup").click(() => {
            var name = $("#name").val();
            var phone = $("#phone").val();
            var address = $("#S").val().toString().replaceAll(',', "") + ", " + $("#X option:selected").text()+ ", " + $("#H option:selected").text()+ ", " + $("#T option:selected").text();
            var email = $("#email").val();
            var password = $("#password").val();
            var repassword = $("#repassword").val();
            $.post("/Java_FashionShop/account/SignupPost", {
                name: name,
                phone: phone,
                address: address,
                email: email,
                pass: password,
                repass: repassword
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
                    window.location = "/Java_FashionShop/account/signin"
                },1000)
            });
        });
    </script>
</body>
</html>