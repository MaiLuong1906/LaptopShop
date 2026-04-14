<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <aside class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <div class="sidebar-logo">LS</div>
                <div class="sidebar-brand">
                    <h2>LaptopShop</h2>
                    <span>Admin Panel</span>
                </div>
            </div>

            <nav class="sidebar-nav">
                <div class="nav-section">
                    <div class="nav-section-title">Menu chính</div>
                    <a class="nav-item" href="${pageContext.request.contextPath}/admin" id="nav-dashboard">
                        <i class="fas fa-th-large"></i>
                        <span class="nav-label">Dashboard</span>
                    </a>
                    <a class="nav-item" href="${pageContext.request.contextPath}/admin/products" id="nav-products">
                        <i class="fas fa-laptop"></i>
                        <span class="nav-label">Sản phẩm</span>
                    </a>
                    <a class="nav-item" href="${pageContext.request.contextPath}/admin/orders" id="nav-orders">
                        <i class="fas fa-shopping-bag"></i>
                        <span class="nav-label">Đơn hàng</span>
                    </a>
                    <a class="nav-item" href="${pageContext.request.contextPath}/admin/users" id="nav-users">
                        <i class="fas fa-users"></i>
                        <span class="nav-label">Người dùng</span>
                    </a>
                </div>
            </nav>
            <div class="sidebar-footer">
                <div class="sidebar-user">
                    <div class="sidebar-user-avatar">AD</div>
                    <div class="sidebar-user-info">
                        <h4>Admin</h4>
                        <span>admin@laptopshop.vn</span>
                    </div>
                </div>
            </div>
        </aside>