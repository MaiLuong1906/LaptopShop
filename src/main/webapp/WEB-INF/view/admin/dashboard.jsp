<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description" content="LaptopShop Admin Dashboard - Quản lý sản phẩm, đơn hàng, người dùng">
            <title>LaptopShop | Admin Dashboard</title>

            <!-- Fonts & Icons -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                rel="stylesheet">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

            <!-- Dashboard CSS -->
            <link rel="stylesheet" href="/css/dashboard.css">
        </head>

        <body>
            <div class="dashboard-layout">
                <!-- ===== SIDEBAR ===== -->
                <jsp:include page="../layout/sidebar.jsp" />

                <!-- Mobile Overlay -->
                <div class="mobile-overlay" id="mobileOverlay"></div>

                <!-- ===== MAIN CONTENT ===== -->
                <main class="main-content">
                    <!-- ===== HEADER ===== -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- ===== PAGE CONTENT ===== -->
                    <div class="page-content">

                        <!-- ========================================= -->
                        <!-- ===== DASHBOARD OVERVIEW ================ -->
                        <!-- ========================================= -->
                        <section class="page-section active" id="page-dashboard">
                            <div class="page-title-section">
                                <div>
                                    <h1>Dashboard</h1>
                                    <p>Chào mừng trở lại! Đây là tổng quan hôm nay.</p>
                                </div>
                                <div class="page-actions">
                                    <button class="btn btn-secondary"><i class="fas fa-download"></i> Xuất báo
                                        cáo</button>
                                    <button class="btn btn-primary" id="btnQuickAddProduct"><i class="fas fa-plus"></i>
                                        Thêm sản phẩm</button>
                                </div>
                            </div>

                            <!-- Stats Cards -->
                            <div class="stats-grid">
                                <div class="stat-card green">
                                    <a href="${pageContext.request.contextPath}/admin/orders">
                                        <div class="stat-card-header">
                                            <div class="stat-card-icon"><i class="fas fa-shopping-cart"></i></div>
                                        </div>
                                        <div class="stat-card-value">${totalOrders}</div>
                                        <div class="stat-card-label">Tổng đơn hàng</div>
                                    </a>
                                </div>
                                <div class="stat-card orange">
                                    <a href="${pageContext.request.contextPath}/admin/products">
                                        <div class="stat-card-header">
                                            <div class="stat-card-icon"><i class="fas fa-laptop"></i></div>
                                        </div>
                                        <div class="stat-card-value">${totalProducts}</div>
                                        <div class="stat-card-label">Sản phẩm đang bán</div>
                                    </a>
                                </div>
                                <div class="stat-card purple">
                                    <a href="${pageContext.request.contextPath}/admin/users">
                                        <div class="stat-card-header">
                                            <div class="stat-card-icon"><i class="fas fa-users"></i></div>
                                        </div>
                                        <div class="stat-card-value">${totalUsers}</div>
                                        <div class="stat-card-label">Khách hàng</div>
                                    </a>
                                </div>
                            </div>
                    </div>
                    </section>

                    <!-- ===== PRODUCTS MANAGEMENT ===== -->
                    <section class="page-section" id="page-products">
                    </section>

                    <!-- ===== ORDERS MANAGEMENT ===== -->
                    <section class="page-section" id="page-orders">
                    </section>

                    <!-- ===== USERS MANAGEMENT ===== -->
                    <section class="page-section" id="page-users">
                    </section>

                    <!-- ===== ROLES MANAGEMENT ===== -->
                    <section class="page-section" id="page-roles">
                    </section>


            </div><!-- end .page-content -->
            </main>
            </div><!-- end .dashboard-layout -->

            <!-- Toast Container -->
            <div class="toast-container" id="toastContainer"></div>

            <!-- Dashboard JS -->
            <script src="/js/dashboard.js"></script>
        </body>

        </html>