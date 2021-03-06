<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" import="org.json.JSONArray" %>
<%@ page language="java" import="java.text.DecimalFormat" %>
<%@ page language="java" import="java.lang.Math" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- JQuery -->
    <script src="<c:url value="/resources/public/js/jquery-3.3.1.min.js"/>"></script>
    <script src="<c:url value="/resources/public/js/jquery-migrate-3.0.1.min.js"/>"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<c:url value="/resources/public/css/bootstrap-4.0.0.min.css"/>">
    <script src="<c:url value="/resources/public/js/bootstrap-4.0.0.min.js"/>"></script>
    <!-- Slick slider -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css" />
    <script type="text/javascript" src="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.min.js"></script>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>"
        integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel='stylesheet' href="<c:url value="https://sachinchoolur.github.io/lightslider/dist/css/lightslider.css"/>">
    <script src="https://sachinchoolur.github.io/lightslider/dist/js/lightslider.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="<c:url value="/resources/public/css/main/global.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/public/css/main/header.css" />"/>
    <link rel="stylesheet" href="<c:url value="/resources/public/css/main/main.css" />" />
    <link rel="stylesheet" href="<c:url value="/resources/public/css/main/footer.css" />" />
    <title>Chi ti???t s???n ph???m</title>
    <style>
        .lSpg {
            display: none;
        }
        .lSAction>.lSPrev {
            background-image: url("assets/images/icon/left.png");
        }
        .lSAction>.lSNext {
            background-image: url("assets/images/icon/right.png");
        }
        .lSSlideOuter .lSPager.lSGallery li.active {
            border: 2px solid var(--blue-dior);
        }
        .lSPager li {
            height: 100%;
        }
        .lSSlideOuter .lSPager.lSGallery img {
            height: 100%;
            width: auto;
            margin: 0 auto;
            object-fit: contain;
        }
        .product__detail-content .lSSlideWrapper{
            height: 600px;
        }

        .lSAction > .lSPrev{
            left: -8px;
        }
        .lSAction > .lSNext{
            right: -8px;
        }

        .product__images-slider .lslide,
        .product__images-slider .clone {
            height: 100%;
            text-align: center;
        }
        .product__images-slider .lslide img,
        .product__images-slider .clone img {
            width: 100%;
            height: 100%;

            object-fit: contain;
        }

        /* Demo */
        .option-title {
            margin-right: 3px;
        }

        .stars .checked {
            color: orange;
        }
        .rating .stars span {
            cursor: pointer;
        }

        #imagemodal .modal-dialog {
            max-width: 80%;
        }
        @media only screen and (max-width: 1400px){
            .product__detail-content .lSSlideWrapper{
                height: 467.64px;
            }
        }
        @media only screen and (max-width: 1200px){
            .product__detail-content .lSSlideWrapper{
                height: 381px;
            }
        }
        @media only screen and (max-width: 992px){
            .product__detail-content .lSSlideWrapper{
                height: 374px;
            }
        }
        @media only screen and (max-width: 768px) {
            #imagemodal .modal-dialog {
                max-width: 100%;
            }
        }
    </style>
</head>

<body>
    <jsp:include page="/WEB-INF/views/partials/header.jsp">
       <jsp:param name="title" value="Main title" />
    </jsp:include>
    <main class="main">
        <!-- Main contain -->
        <div class="custom-container">
            <div class="content__wrapper products__content-wrapper">
                <div class="content__inner w-100 pb-0">
                    <ul class="web__directional">
                        <li>
                            <a href="/">Trang ch???</a>
                        </li>
                        <li>
                            <a href="/product">S???n ph???m</a>
                        </li>
                        <li>
                            <a href="<c:url value="/product/brand?id=${brand.brand_id}" />">${brand.brand_name}</a>
                        </li>
                        <li>
                            <a href="">${product.product_name}</a>
                        </li>
                    </ul>
                    <div class="product__detail-content">
                        <div class="row no-gutters"> 
                            <div class="product__detail-image col-md-5">
                                <div class="product__detail-card">
                                    <div class="product__detail-slider mb-2">
                                        <ul class="lightSlider h-100">
                                            <c:forEach begin="0" end="${JSONArray(product.product_img).length() - 1}" varStatus="loop">
											    <li class="h-100" data-thumb="<c:url value="${JSONArray(product.product_img).getString(loop.index)}"/>">
                                                    <img class="pop h-100" src="<c:url value="${JSONArray(product.product_img).getString(loop.index)}"/>"/>
                                                </li>
											</c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="product__detail-info col-md-7">
                                <div class="product__detail-card">
                                    <div class="about">
                                        <div class="product__detail-id d-flex flex-wrap align-items-center">
                                            <a class="product-id d-flex">
                                                <span>M?? s???n ph???m:</span>
                                                <span>#${product.product_id}</span>
                                                <input id="product-id" type="text" value="${product.product_id}" hidden>
                                            </a>
                                            <c:set var="countFeedback" value="${0}"/>
                                            <c:set var="totalRate" value="${0}"/>
                                            <c:forEach var="feedback" items="${listFeedback}" varStatus="status">
                                            	<c:set var="countFeedback" value="${countFeedback + 1}" />
                                            	<c:set var="totalRate" value="${totalRate + feedback.feedback_rate}" />
	                                        </c:forEach>
	                                        <c:set var="rateAVG" value="${(countFeedback != 0) ? Math.ceil(totalRate/countFeedback) : 0}" />
	                                        <a class="product-rating d-flex">
                                                <div class="stars">
                                                    <span class="fa fa-star ${1 <= rateAVG ? "checked" : ""}"></span>
                                                    <span class="fa fa-star ${2 <= rateAVG ? "checked" : ""}"></span>
                                                    <span class="fa fa-star ${3 <= rateAVG ? "checked" : ""}"></span>
                                                    <span class="fa fa-star ${4 <= rateAVG ? "checked" : ""}"></span>
                                                    <span class="fa fa-star ${5 <= rateAVG ? "checked" : ""}"></span>
                                                </div>
                                                <u style="cursor: pointer;">${countFeedback} ????nh gi??</u>
                                            </a>
                                        </div>
                                        <div class="product__detail-name">${product.product_name}</div>
                                        <div class="product__detail-brand">
                                            <a href="<c:url value="/product/brand?id=${brand.brand_id}"/>">Th????ng hi???u: ${brand.brand_name}</a>
                                        </div>
                                        <div class="product__detail-desciption">
                                            <div class="bullets">
                                                <div class="d-flex align-items-center mb-2">
                                                    <span class="mr-2">
                                                        <img src="<c:url value="/resources/public/images/icon/medal.png" />" alt="">
                                                    </span>
                                                    <span class="bullet-text">S???n ph???m ch??nh h??ng</span>
                                                </div>
                                                <div class="d-flex align-items-center mb-2">
                                                    <span class="mr-2">
                                                        <img src="<c:url value="/resources/public/images/icon/baohanh.png" />" alt="">
                                                    </span>
                                                    <span class="bullet-text">B???o h??nh 2 n??m</span>
                                                </div>
                                                <div class="d-flex align-items-center mb-2">
                                                    <span class="mr-2">
                                                        <img src="<c:url value="/resources/public/images/icon/return.png" />" alt="">
                                                    </span>
                                                    <span class="bullet-text">?????i tr??? 7 ng??y mi???n ph??</span>
                                                </div>
                                                <div class="d-flex align-items-center mb-2">
                                                    <span class="mr-2">
                                                        <img src="<c:url value="/resources/public/images/icon/giaohang.png" />" alt="">
                                                    </span>
                                                    <span class="bullet-text">Giao h??ng mi???n ph??</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="product__detail-bottom">
                                        <!-- Product options -->
                                        <div class="product__detail-options">
                                            <div class="option-quality d-flex mb-2 align-items-center">
                                                <div class="option-title">Ch???n s??? l?????ng </div>
                                                <input class="text-center" type="number" value="1" min="1" max="50">
                                            </div>
                                            <div class="option-size d-flex mb-2 align-items-center">
                                                <div class="option-title">Ch???n k??ch c??? </div>
                                                <div class="options-wrapper">
                                                    <select class="select-size options form-select w-100"
                                                        aria-label="Default select example">
                                                        <option disabled selected>- Ch???n -</option>
                                                        <c:forEach begin="0" end="${JSONArray(product.product_size).length() - 1}" varStatus="loop">
														   <option value="${JSONArray(product.product_size).getString(loop.index)}">${JSONArray(product.product_size).getString(loop.index)}</option>
														</c:forEach>
                                                    </select>
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                        viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1"
                                                        stroke-linecap="round" stroke-linejoin="round"
                                                        class="feather feather-chevron-down">
                                                        <polyline points="6 9 12 15 18 9"></polyline>
                                                    </svg>
                                                </div>
                                            </div>
                                            <div class="option-color d-flex mb-2 align-items-center">
                                                <div class="option-title">Ch???n m??u s???c </div>
                                                <div class="options-wrapper">
                                                    <select class="select-color options form-select w-100"
                                                        aria-label="Default select example">
                                                        <option disabled selected>- Ch???n -</option>
                                                        <c:forEach begin="0" end="${JSONArray(product.product_color).length() - 1}" varStatus="loop">
														   <option value="${JSONArray(product.product_color).getString(loop.index)}">${JSONArray(product.product_color).getString(loop.index)}</option>
														</c:forEach>
                                                    </select>
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                        viewBox="0 0 24 24" fill="none" stroke="#333" stroke-width="1"
                                                        stroke-linecap="round" stroke-linejoin="round"
                                                        class="feather feather-chevron-down">
                                                        <polyline points="6 9 12 15 18 9"></polyline>
                                                    </svg>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="product__detail-price">
                                        <div class="option-color d-flex mb-2 align-items-center">
                                                <div class="option-title">Gi?? S???n Ph???m: </div>
                                                <span class="price mr-2">${DecimalFormat("###,###,###").format(product.product_price)} ???</span>
                                            </div>
                                        </div>

                                        <!-- Price -->
                                        <div class="product__detail-buttons d-flex justify-content-between w-100">
                                            <button data-product-name="${product.product_name}" data-product-price="${product.product_price}" data-product-img="${JSONArray(product.product_img).getString(0)}" data-brand-name="${brand.brand_name}" class="btn-addtocart" style="width: 49%; background-color: #333; color: #fff;">
                                                Th??m v??o gi???
                                            </button>
                                            <button data-product-name="${product.product_name}" data-product-price="${product.product_price}" data-product-img="${JSONArray(product.product_img).getString(0)}" data-brand-name="${brand.brand_name}" class="btn-buynow" style="width: 49%; background-color: #333; color: #fff;">
                                                Mua ngay
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product__detail-tab">
                        <div class="product__tab-control">
                            <ul class="d-flex justify-content-around">
                                <li class="mx-2">
                                    <a class="control-tab detail-title control__tab-info">Th??ng tin s???n ph???m</a>
                                </li>
                                <li class="mx-2">
                                    <a class="control-tab detail-title control__tab-comment active">????nh gi?? s???n ph???m</a>
                                </li>
                            </ul>
                        </div>
                        <div class="product__tab-content">
                            <div class="content-tab tab__product-info">
                                <div class="product-detail">
                                    <div class="title">M?? t??? ng???n</div>
                                    <div class="description">
                                        <div>
                                            PHONG C??CH C??NG SWAROVSKI CRYSTAL FROST
                                            <br><br>
                                            Swarovski Crystal Frost kh??ng ch??? s??? h???u v??? ?????p n??? t??nh m?? c??n mang ?????n s???
                                            tr??? trung hi???m c?? qua nh???ng ???????ng n??t ph?? c??ch. T???o t??c n??y ph?? di???n n??t ?????p
                                            c???a vi??n ???? pha l?? v???i 178 tinh th??? pha l?? ???????c s???p x???p kh??o tr??n v??nh bezel
                                            mang ?????n hi???u ???ng nh?? nh???ng b??ng tuy???t n???i b???t tr??n n???n kim lo???i v??ng h???ng.
                                            <br><br>
                                            Tr??? trung, th???i th?????ng v?? ph?? c??ch v???i m???t s??? ?????ng h??? l?? b???c tranh ?????y bi???u
                                            c???m. Tr??n n???n m???t s??? ??en tuy???n, c?? n??ng thi??n nga khoe s???c t???i v??? tr?? 12h v??
                                            ch??? s??? ??? R???p mang ?????n s??? vui nh???n, ho???t b??t hi???m c??.
                                            <br><br>
                                            Ho??n thi???n v???i d??y ?????ng h??? b???ng l???a ??en, Swarovski Crystal Frost mang ?????n
                                            phong c??ch th???i trang thanh tho??t b?? ???n nh??ng r???t n??? t??nh cho c?? n??ng s??nh
                                            ??i???u.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="content-tab tab__product-comment active">
                                <div class="product-comment">   
                                    <!-- Button trigger modal -->
                                    <div class="text-center mb-4">
                                        <button class="d-flex mx-auto">
                                            <span style="height: 24px; margin-right: 10px;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="1"
                                                    stroke-linecap="round" stroke-linejoin="round"
                                                    class="feather feather-edit-3">
                                                    <path d="M12 20h9"></path>
                                                    <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z">
                                                    </path>
                                                </svg>
                                            </span>
                                            <span>Vi???t b??nh lu???n</span>
                                        </button>
                                    </div>
                                    <div class="tab__content-block">
                                        <div class="d-flex">
                                            <span class="input-title mx-auto">VI???T NH???N X??T C???A B???N B??N D?????I</span>
                                        </div>
                                        <div class="rating d-flex mb-2 align-items-center">
                                            <span>????nh gi??</span>
                                            <div class="stars ml-2">
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                            </div>
                                        </div>
                                        <div class="d-flex">
                                            <textarea class="d-flex w-100 mb-2" name="" id="txt_msg" placeholder="Nh???n x??t c???a b???n v??? s???n ph???m n??y"></textarea>
                                        </div>
                                        <div class="upload-image mb-2">
                                            <input id="image-upload" type="file" multiple hidden />
                                            <output class="d-flex" id="image-preview">
                                            </output>
                                        </div>
                                        <div class="text-right">
                                            <button id="btn-comment" type="button">G???i b??nh lu???n</button>
                                        </div>
                                    </div>
                                    <!-- <div class="text-center mb-4">
                                        <div>*B???n c???n <a href=""><u>????ng nh???p</u></a> ????? b??nh lu???n s???n ph???m n??y</div>
                                    </div> -->
                                    <!-- <div class="text-center mb-4">
                                        *B???n ch??a mua s???n ph???m n??y
                                    </div> -->
                                    <div id="listCMT" class="tab__content-block d-block">
                                        <c:forEach var="feedback" items="${listFeedback}" varStatus="status">
                                        	<div class="user-comment mb-4">
                                               <div class="d-flex align-items-center">
                                                   <span class="user__comment-name">
                                                   		<c:forEach var="customer" items="${listCustomer}" varStatus="status">
                                                   			<c:if test="${customer.customer_id == feedback.customer_id}">
                                                       			<strong>${customer.customer_name}</strong>
                                                       		</c:if>
                                                       	</c:forEach>
                                                   </span>
                                                   <span class="user__comment-time ml-2">${feedback.feedback_date}</span>
                                               </div>
                                               <div class="d-flex stars">
                                                   <span class="fa fa-star ${1 <= feedback.feedback_rate ? "checked" : ""}"></span>
                                                   <span class="fa fa-star ${2 <= feedback.feedback_rate ? "checked" : ""}"></span>
                                                   <span class="fa fa-star ${3 <= feedback.feedback_rate ? "checked" : ""}"></span>
                                                   <span class="fa fa-star ${4 <= feedback.feedback_rate ? "checked" : ""}"></span>
                                                   <span class="fa fa-star ${5 <= feedback.feedback_rate ? "checked" : ""}"></span>
                                               </div>
                                               <div class="comment">
                                                   ${feedback.feedback_comment}
                                               </div>
                                           </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="imagemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true">&times;</span>
                            <span class="sr-only">Close</span>
                        </button>
                        <img src="" class="imagepreview" style="width: 100%;">
                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/partials/footer.jsp">
       <jsp:param name="title" value="Main title" />
    </jsp:include>
    <script type="text/javascript" src="<c:url value="/resources/public/js/main/main.js"/>"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $('.lightSlider').lightSlider({
                gallery: true,
                item: 1,
                loop: true,
                slideMargin: 0,
                thumbItem: 6
            });
            $('.lSSlideOuter .lSPager').css('height', $('.lSSlideOuter .lSPager li').width() + 4)
            $('#content-slider').lightSlider({
                keyPress: false,
                item: 5,
                loop: true
            })      
            $('#content-slider').css('height', $('#content-slider li').width())
            $(document).resize(function () {
                $('.lSPager').css('height', $('.lSPager li').width() + 4)
                $('#content-slider').css('height', $('#content-slider li').width())
            })
        })
        $('.pop').on('click', function () {
            $('.imagepreview').attr('src', $(this).attr('src'));
            $('#imagemodal').modal('show');
        });

        window.onload = function () {
            if (window.File && window.FileList && window.FileReader) {
                var filesInput = document.getElementById("image-upload");
                filesInput.addEventListener("change", function (event) {
                    var files = event.target.files; //FileList object
                    if (files.length > 3)
                        return;
                    var output = document.getElementById("image-preview");
                    $('#image-preview').empty();
                    for (var i = 0; i < files.length; i++) {
                        var file = files[i];
                        //Only pics
                        if (!file.type.match('image'))
                            continue;
                        var picReader = new FileReader();
                        picReader.addEventListener("load", function (event) {
                            var picFile = event.target;
                            var div = document.createElement("div");
                            div.classList.add(`image__upload-item`);
                            div.innerHTML = "<div class='image-uploaded' style='position: relative; width: 100px; height: 100px; margin-right: 4px'><img src='" + picFile.result + "'" + "title='" + picFile.name + "' style='height: 100%; width: 100%; object-fit: contain'/><span class='remove__upload' style='position: absolute; top: 0; right: 0; cursor: pointer'><svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' viewBox='0 0 24 24' fill='none' stroke='red' stroke-width='1' stroke-linecap='round' stroke-linejoin='round' class='feather feather-x'><line x1='18' y1='6' x2='6' y2='18'></line><line x1='6' y1='6' x2='18' y2='18'></line></svg><span></div>";
                            var removeUpload = div.querySelector(".image-uploaded .remove__upload");
                            removeUpload.addEventListener("click", function(evt){
                                div.remove();
                            })
                            output.insertBefore(div, null);
                        });
                        //Read the image
                        picReader.readAsDataURL(file);
                    }
                });
            } else {
                console.log("Your browser does not support File API");
            }
        }
        
        $("#btn-comment").click(()=>{
            var rate = $(".rating > .stars > .checked").length;
            var productid = $("#product-id").val();
            var comment = $("#txt_msg").val();
            var date = new Date().toISOString().slice(0, 10);
            $.post("/Java_FashionShop/product/feedbackpost",{
                rate : rate,
                comment : comment,
                product_id : productid,
                date: date
            },(data, err)=>{
            	var json = JSON.parse(data);
                if(json.status == "error"){
                    Swal.fire({
                        icon: 'error',
                        title: 'Th??ng B??o',
                        text: json.message,
                    })
                    return;
                }
                var data = json.data;
                var cmtNew = '<div class="user-comment mb-4"> <div class="d-flex align-items-center"> <span class="user__comment-name"> <strong>'+data+'</strong> </span> <span class="user__comment-time ml-2">'+date+'</span> </div> <div class="d-flex stars"> <span class="fa fa-star '+(1 <= Number(rate) ? "checked" : "")+'"></span> <span class="fa fa-star '+(2 <= Number(rate) ? "checked" : "")+'"></span> <span class="fa fa-star '+(3 <= Number(rate) ? "checked" : "")+'"></span> <span class="fa fa-star '+(4 <= Number(rate) ? "checked" : "")+'"></span> <span class="fa fa-star '+(5 <= Number(rate) ? "checked" : "")+'"></span> </div> <div class="comment"> '+comment+' </div> </div>';
                cmtNew += $("#listCMT")[0].innerHTML;
                $("#listCMT")[0].innerHTML = cmtNew;
                $("#txt_msg").val("");
            })
        });
        $(".btn-addtocart").click((e)=>{
        	var productid = $("#product-id").val();
            var product_id = productid;
            var product_count = $(".option-quality > input").val();
            var product_color = $(".options-wrapper > .select-color").val() == null ? "" : $(".options-wrapper > .select-color").val();
            var product_size = $(".options-wrapper > .select-size").val() == null ? "" : $(".options-wrapper > .select-size").val();
            var product_img = $(e.target).attr("data-product-img");
            var brand_name = $(e.target).attr("data-brand-name");
            var product_name = $(e.target).attr("data-product-name");
            var product_price = $(e.target).attr("data-product-price");
            if(product_color == "" || product_size == ""){
            	Swal.fire({
                    icon: 'error',
                    title: 'Th??ng B??o',
                    text: "Vui L??ng Ch???n M??u V?? Size",
                })
                return;
            }
            addUpdateCartHeader({
            	product_id: product_id,
            	product_name: product_name,
            	product_count: product_count,
            	product_price: product_price,
            	product_color: product_color,
            	product_size: product_size,
            	product_img: product_img,
            	brand_name: brand_name,
            })
        })

        $(".btn-buynow").click((e)=>{
        	var productid = $("#product-id").val();
            var product_id = productid;
            var product_count = $(".option-quality > input").val();
            var product_color = $(".options-wrapper > .select-color").val() == null ? "" : $(".options-wrapper > .select-color").val();
            var product_size = $(".options-wrapper > .select-size").val() == null ? "" : $(".options-wrapper > .select-size").val();
            var product_img = $(e.target).attr("data-product-img");
            var brand_name = $(e.target).attr("data-brand-name");
            var product_name = $(e.target).attr("data-product-name");
            var product_price = $(e.target).attr("data-product-price");
            if(product_color == "" || product_size == ""){
            	Swal.fire({
                    icon: 'error',
                    title: 'Th??ng B??o',
                    text: "Vui L??ng Ch???n M??u V?? Size",
                })
                return;
            }
            addUpdateCartHeader({
            	product_id: product_id,
            	product_name: product_name,
            	product_count: product_count,
            	product_price: product_price,
            	product_color: product_color,
            	product_size: product_size,
            	product_img: product_img,
            	brand_name: brand_name,
            })
            window.location = "/Java_FashionShop/cart";
        })
    </script>
</body>
</html>