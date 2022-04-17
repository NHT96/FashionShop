<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Đăng nhập</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value="/resources/public/vendor/fontawesome-free/css/all.min.css" />" rel="stylesheet" type="text/css"/>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="<c:url value="/resources/public/css/sb-admin-2.min.css" />" rel="stylesheet"/>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Đăng nhập</h1>
                                    </div>
                                    
                                    <form class="user">
                                        <div class="form-group">
                                            <input class="form-control form-control-user"
                                                id="account" aria-describedby="emailHelp"
                                                placeholder="Tài khoản" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="password" placeholder="Mật khẩu" />
                                        </div>
                                        <button id="btn-signin" type="button" class="btn btn-primary btn-user btn-block">Đăng nhập</button>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="">Quên mật khẩu</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="<c:url value="/resources/public/vendor/jquery/jquery.min.js" />" ></script>
    <script src="<c:url value="/resources/public/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value="/resources/public/vendor/jquery-easing/jquery.easing.min.js" />"></script>

    <!-- Custom scripts for all pages-->
    <script src="<c:url value="/resources/public/js/sb-admin-2.min.js" />"></script>
    <script>
        $('#account').keypress((ev)=>{
            var keycode = (ev.keyCode ? ev.keyCode : ev.which);
            if (keycode == '13') {
                signin();
            }
        })

        $('#password').keypress((ev)=>{
            var keycode = (ev.keyCode ? ev.keyCode : ev.which);
            if (keycode == '13') {
                signin();
            }
        })

        $("#btn-signin").click(function(){
            signin();
        })

        function signin(){
            let account =  $('#account').val();
            let password = $('#password').val();
            $.post("/Java_FashionShop/admin/signin",{
                account: account,
                password: password,
            }, function(data, error){
                if(error != "success"){
                    alert(error); 
                    return;
                }
                let json = JSON.parse(data);
                if(json.status == "error"){
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
                    text: "Đăng nhập thành công",
                })
                setTimeout(()=>{
                    window.location = "/Java_FashionShop/admin/index"
                },1000)
            })
        }
    </script>

</body>

</html>