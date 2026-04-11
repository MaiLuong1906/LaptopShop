<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <header class="header">
            <div class="header-left">
                <button class="sidebar-toggle" id="sidebarToggle" aria-label="Toggle sidebar">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="header-search">
                    <i class="fas fa-search"></i>
                    <input type="text" placeholder="Tìm kiếm sản phẩm, đơn hàng, người dùng..." id="globalSearch">
                </div>
            </div>
            <div class="header-right">
                <button class="header-btn" id="btnFullscreen" aria-label="Fullscreen">
                    <i class="fas fa-expand"></i>
                </button>
                <button class="header-btn" id="btnNotifications" aria-label="Notifications">
                    <i class="fas fa-bell"></i>
                    <span class="notification-dot"></span>
                </button>
                <button class="header-btn" id="btnMessages" aria-label="Messages">
                    <i class="fas fa-envelope"></i>
                </button>
                <div class="header-profile" id="headerProfile">
                    <div class="header-profile-avatar">AD</div>
                    <div class="header-profile-info">
                        <h4>Admin</h4>
                        <span>Quản trị viên</span>
                    </div>
                    <i class="fas fa-chevron-down" style="font-size: 0.65rem; color: var(--text-muted);"></i>
                </div>
            </div>
        </header>