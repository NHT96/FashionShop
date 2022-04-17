<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
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
    <title>Thông tin cá nhân</title>
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
                            <a href="/Java_FashionShop/account/index">Hồ sơ cá nhân</a>
                        </li>
                    </ul>
                    <hr>
                    <div class="user__profile-wrapper row">
                        <div class="col-md-2 col-xs-12 mb-4">
                            <div class="tabs-control">
                                <div class="control-selectlist">
                                    <select name="" id="" class="form-control" onchange="location = this.value">
                                        <option value="./index" selected>Thông tin cá nhân</option>
                                        <option value="./orderhistory">Lịch sử đơn hàng</option>
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
                                        <a class="d-flex align-items-center active" href="./index"
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
                                        <a class="d-flex align-items-center" href="./orderhistory"
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
                                        <a class="d-flex align-items-center" href="./changepassword"
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
                                        <div class="title"><strong>THÔNG TIN CÁ NHÂN</strong></div>
                                    </div>
                                    <form class="user__info-form mx-auto">
                                        <div class="form-group mb-4">
                                            <label>Họ tên</label>
                                            <input type="text" id="name" class="form-control" aria-describedby="emailHelp"
                                                value="${customer.getCustomer_name()}">
                                        </div>
                                        <div class="form-group mb-4">
                                            <label>Số điện thoại</label>
                                            <div class="d-flex align-items-center">
                                                <input type="tel" id="phone" class="form-control mr-2" aria-describedby="emailHelp"
                                                    value="${customer.getCustomer_phone()}">
                                            </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label>Email</label>
                                            <input type="text" class="form-control" value="${customer.getCustomer_email()}" disabled>
                                        </div>
                                        <div class="form-group">
                                            <label>Địa chỉ</label>
                                            <div class="d-flex flex-wrap">
                                                
                                                <div class="select-form w-100 mb-2">
                                                    <select name="" id="T" class="user-city form-control">
                                                        <option value="" disabled selected>Tỉnh/Thành...</option>
                                                    </select>
                                                    <span class="d-flex align-items-center">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="#333"
                                                            stroke-width="1" stroke-linecap="round"
                                                            stroke-linejoin="round"
                                                            class="feather feather-chevron-down">
                                                            <polyline points="6 9 12 15 18 9"></polyline>
                                                        </svg>
                                                    </span>
                                                </div>
                                                <div class="select-form w-100 mb-2">
                                                    <select name="" id="H" class="user-district form-control">
                                                        <option value="" disabled selected>Quận/Huyện...</option>
                                                    </select>
                                                    <span class="d-flex align-items-center">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="#333"
                                                            stroke-width="1" stroke-linecap="round"
                                                            stroke-linejoin="round"
                                                            class="feather feather-chevron-down">
                                                            <polyline points="6 9 12 15 18 9"></polyline>
                                                        </svg>
                                                    </span>
                                                </div>
                                                <div class="select-form w-100 mb-2">
                                                    <select name="" id="X" class="user-ward form-control">
                                                        <option value="" disabled selected>Phường/Xã...</option>
                                                    </select>
                                                    <span class="d-flex align-items-center">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                            viewBox="0 0 24 24" fill="none" stroke="#333"
                                                            stroke-width="1" stroke-linecap="round"
                                                            stroke-linejoin="round"
                                                            class="feather feather-chevron-down">
                                                            <polyline points="6 9 12 15 18 9"></polyline>
                                                        </svg>
                                                    </span>
                                                </div>
                                                <input type="text" id="addressTmp" value="${customer.getCustomer_address()}" hidden>
                                                <input type="text" id="S" class="form-control mb-2" value="${customer.getCustomer_address().split(', ')[0]}">
                                            </div>
                                            <script type="text/javascript">
                                                $.get('/Java_FashionShop/resources/js/json/provinces-open-api.json', function(data) {
                                                	 var add = document.getElementById("addressTmp").value;
                                                	let address = add.split(', ');
                                                    // City
                                                    var userCity = address[3];
                                                    // District
                                                    var userDistrict = address[2];
                                                    // Ward
                                                    var userWard = address[1];

                                                    var htmlTinhThanh = `<option value="" disabled>Tỉnh/Thành...</option>`
                                                    data.forEach(city => {
                                                        if (city.name == userCity) {
                                                            htmlTinhThanh += `<option value="` + city.code + `" selected>` + city.name + `</option>`
                                                            let htmlQuanHuyen = `<option value="" disabled selected>Quận/Huyện...</option>`
                                                            city.districts.forEach(dist => {
                                                                if (dist.name == userDistrict) {
                                                                    htmlQuanHuyen += `<option value="` + dist.code + `" selected>` + dist.name + `</option>`
                                                                    let htmlPhuongXa = `<option value="" disabled selected>Phường/Xã...</option>`
                                                                    dist.wards.forEach(ward => {
                                                                        if (ward.name == userWard) {
                                                                            htmlPhuongXa += `<option value="` + ward.code + `" selected>` + ward.name + `</option>`
                                                                        } else {
                                                                            htmlPhuongXa += `<option value="` + ward.code + `">` + ward.name + `</option>`
                                                                        }
                                                                    })
                                                                    $(".user-ward")[0].innerHTML = htmlPhuongXa;
                                                                } else {
                                                                    htmlQuanHuyen += `<option value="` + dist.code + `">` + dist.name + `</option>`
                                                                }
                                                            })
                                                            $(".user-district")[0].innerHTML = htmlQuanHuyen;
                                                        } else {
                                                            htmlTinhThanh += `<option value="` + city.code + `">` + city.name + `</option>`
                                                        }
                                                    });
                                                    $(".user-city")[0].innerHTML = htmlTinhThanh;

                                                    // Select Districts
                                                    $(".user-city").on('change', function() {
                                                        let htmlQuanHuyen = `<option value="" disabled selected>Quận/Huyện...</option>`
                                                        data.forEach(city => {
                                                            if (city.code == this.value) {
                                                                city.districts.forEach(dist => {
                                                                    htmlQuanHuyen += `<option value="` + dist.code + `">` + dist.name + `</option>`
                                                                })
                                                                $(".user-district")[0].innerHTML = htmlQuanHuyen
                                                                $(".user-ward")[0].innerHTML = `<option value="" disabled selected>Phường/Xã...</option>`
                                                            }
                                                        })
                                                    });
                                                    // Select Wards
                                                    $(".user-district").on('change', function() {
                                                        let valueTinhThanh = $(".user-city")[0].value
                                                        let valueQuanHuyen = this.value
                                                        let htmlPhuongXa = `<option value="" disabled selected>Phường/Xã...</option>`
                                                        data.forEach(city => {
                                                            if (city.code == valueTinhThanh) {
                                                                city.districts.forEach(dist => {
                                                                    if (dist.code == valueQuanHuyen) {
                                                                        dist.wards.forEach(ward => {
                                                                            htmlPhuongXa += `<option value="` + ward.code + `">` + ward.name + `</option>`
                                                                        })
                                                                        $(".user-ward")[0].innerHTML = htmlPhuongXa
                                                                    }
                                                                })
                                                            }
                                                        })
                                                    });
                                                })
                                            </script>
                                        </div>
                                        <div class="text-right">
                                            <button type="button" id = "btn-confirm" class="btn btn-primary">Lưu</button>
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
        $("#btn-confirm").click(() => {
            var name = $("#name").val();
            var phone = $("#phone").val();
            var address = $("#S").val().toString().replaceAll(',', "") + ", " + $("#X option:selected").text()+ ", " + $("#H option:selected").text()+ ", " + $("#T option:selected").text();
            $.post("/Java_FashionShop/account/updateInfo", {
                name: name,
                phone: phone,
                address: address,
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