<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/Java_FashionShop/admin/index">
        <div class="sidebar-brand-text mx-3" style="text-transform: uppercase;">QUẢN TRỊ</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="/Java_FashionShop/admin/index">
            <i class="fas fa-fw fa-home"></i>
            <span>Trang chủ</span></a>
    </li>
    <!-- Divider -->
    <hr class="sidebar-divider">
    <!-- Heading -->
    <div class="sidebar-heading">Quản trị</div>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#orderAdminManage" aria-expanded="true" aria-controls="orderAdminManage">
            <i class="fas fa-fw fa-list"></i>
            <span>Quản lý đơn hàng</span>
        </a>
        <div id="orderAdminManage" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="./orderlist">Danh sách đơn hàng</a>
                <a class="collapse-item" href="./orderlistwait">Chờ đơn vị vận chuyển</a>
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUser" aria-expanded="true" aria-controls="collapseUser">
            <i class="fas fa-fw fa-user"></i>
            <span>Quản lý người dùng</span>
        </a>
        <div id="collapseUser" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="./manageuser">Danh sách người dùng</a>
                <a class="collapse-item" href="">Tạo tài khoản</a>
            </div>
        </div>
    </li>
    
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBrand" aria-expanded="true" aria-controls="collapseBrand">
            <i class="fas fa-fw fa-poll"></i>
            <span>Quản lý thương hiệu</span>
        </a>
        <div id="collapseBrand" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="./brandlist">Danh sách thương hiệu</a>
                <a class="collapse-item" href="./categorylist">Danh sách danh mục</a>
            </div>
        </div>
    </li>

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseStore" aria-expanded="true" aria-controls="collapseStore">
            <i class="fas fa-fw fa-store"></i>
            <span>Quản lý bán hàng</span>
        </a>
        <div id="collapseStore" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="/Java_FashionShop/admin/manageproduct">Danh sách sản phẩm</a>
                <a class="collapse-item" href="/Java_FashionShop/admin/addproduct">Thêm sản phẩm sản phẩm</a>
            </div>
        </div>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">
    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</ul>