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
                                <div class="stat-card blue">
                                    <div class="stat-card-header">
                                        <div class="stat-card-icon"><i class="fas fa-dollar-sign"></i></div>
                                        <div class="stat-card-trend up"><i class="fas fa-arrow-up"></i> 12.5%</div>
                                    </div>
                                    <div class="stat-card-value">₫ 248.5M</div>
                                    <div class="stat-card-label">Tổng doanh thu</div>
                                </div>
                                <div class="stat-card green">
                                    <div class="stat-card-header">
                                        <div class="stat-card-icon"><i class="fas fa-shopping-cart"></i></div>
                                        <div class="stat-card-trend up"><i class="fas fa-arrow-up"></i> 8.2%</div>
                                    </div>
                                    <div class="stat-card-value">1,286</div>
                                    <div class="stat-card-label">Tổng đơn hàng</div>
                                </div>
                                <div class="stat-card orange">
                                    <div class="stat-card-header">
                                        <div class="stat-card-icon"><i class="fas fa-laptop"></i></div>
                                        <div class="stat-card-trend down"><i class="fas fa-arrow-down"></i> 3.1%</div>
                                    </div>
                                    <div class="stat-card-value">342</div>
                                    <div class="stat-card-label">Sản phẩm đang bán</div>
                                </div>
                                <div class="stat-card purple">
                                    <div class="stat-card-header">
                                        <div class="stat-card-icon"><i class="fas fa-users"></i></div>
                                        <div class="stat-card-trend up"><i class="fas fa-arrow-up"></i> 15.3%</div>
                                    </div>
                                    <div class="stat-card-value">5,847</div>
                                    <div class="stat-card-label">Khách hàng</div>
                                </div>
                            </div>

                            <!-- Charts Row -->
                            <div class="content-grid">
                                <!-- Revenue Chart -->
                                <div class="card">
                                    <div class="card-header">
                                        <h3>📊 Doanh thu theo tháng</h3>
                                        <div class="card-header-actions">
                                            <button class="btn btn-secondary btn-sm">Năm 2026</button>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="chart-container">
                                            <div class="chart-bars" id="revenueChart"></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Brand Donut Chart -->
                                <div class="card">
                                    <div class="card-header">
                                        <h3>🏭 Sản phẩm theo hãng</h3>
                                        <div class="card-header-actions">
                                            <button class="btn btn-secondary btn-sm">Chi tiết</button>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="donut-chart-container">
                                            <div class="donut-chart" id="brandChart">
                                                <svg viewBox="0 0 200 200">
                                                    <circle cx="100" cy="100" r="70" stroke="rgba(79, 124, 255, 0.8)"
                                                        stroke-dasharray="175.9 439.8" stroke-dashoffset="0"></circle>
                                                    <circle cx="100" cy="100" r="70" stroke="rgba(168, 85, 247, 0.8)"
                                                        stroke-dasharray="114.8 439.8" stroke-dashoffset="-175.9">
                                                    </circle>
                                                    <circle cx="100" cy="100" r="70" stroke="rgba(34, 197, 94, 0.8)"
                                                        stroke-dasharray="87.96 439.8" stroke-dashoffset="-290.7">
                                                    </circle>
                                                    <circle cx="100" cy="100" r="70" stroke="rgba(249, 115, 22, 0.8)"
                                                        stroke-dasharray="61.17 439.8" stroke-dashoffset="-378.66">
                                                    </circle>
                                                </svg>
                                                <div class="donut-center">
                                                    <div class="value">342</div>
                                                    <div class="label">sản phẩm</div>
                                                </div>
                                            </div>
                                            <div class="donut-legend">
                                                <div class="donut-legend-item">
                                                    <div class="donut-legend-dot"
                                                        style="background: rgba(79, 124, 255, 0.8);"></div>
                                                    <span>Dell</span>
                                                    <strong>40%</strong>
                                                </div>
                                                <div class="donut-legend-item">
                                                    <div class="donut-legend-dot"
                                                        style="background: rgba(168, 85, 247, 0.8);"></div>
                                                    <span>HP</span>
                                                    <strong>26%</strong>
                                                </div>
                                                <div class="donut-legend-item">
                                                    <div class="donut-legend-dot"
                                                        style="background: rgba(34, 197, 94, 0.8);"></div>
                                                    <span>Lenovo</span>
                                                    <strong>20%</strong>
                                                </div>
                                                <div class="donut-legend-item">
                                                    <div class="donut-legend-dot"
                                                        style="background: rgba(249, 115, 22, 0.8);"></div>
                                                    <span>Asus / Khác</span>
                                                    <strong>14%</strong>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Recent Orders & Activity -->
                            <div class="content-grid">
                                <!-- Recent Orders -->
                                <div class="card">
                                    <div class="card-header">
                                        <h3>🛒 Đơn hàng gần đây</h3>
                                        <button class="btn btn-secondary btn-sm" data-page="orders">Xem tất cả</button>
                                    </div>
                                    <div class="card-body no-padding">
                                        <div class="table-wrapper">
                                            <table class="data-table" id="recentOrdersTable">
                                                <thead>
                                                    <tr>
                                                        <th>Mã đơn</th>
                                                        <th>Khách hàng</th>
                                                        <th>Tổng tiền</th>
                                                        <th>Trạng thái</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><strong>#ORD-2841</strong></td>
                                                        <td>
                                                            <div class="table-user">
                                                                <div class="table-user-avatar"
                                                                    style="background: var(--gradient-primary);">NV
                                                                </div>
                                                                <span>Nguyễn Văn A</span>
                                                            </div>
                                                        </td>
                                                        <td>₫ 25,990,000</td>
                                                        <td><span class="status-badge success">Hoàn thành</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td><strong>#ORD-2840</strong></td>
                                                        <td>
                                                            <div class="table-user">
                                                                <div class="table-user-avatar"
                                                                    style="background: var(--gradient-green);">TT</div>
                                                                <span>Trần Thị B</span>
                                                            </div>
                                                        </td>
                                                        <td>₫ 18,500,000</td>
                                                        <td><span class="status-badge warning">Đang giao</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td><strong>#ORD-2839</strong></td>
                                                        <td>
                                                            <div class="table-user">
                                                                <div class="table-user-avatar"
                                                                    style="background: var(--gradient-purple);">LH</div>
                                                                <span>Lê Hoàng C</span>
                                                            </div>
                                                        </td>
                                                        <td>₫ 32,400,000</td>
                                                        <td><span class="status-badge info">Xử lý</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td><strong>#ORD-2838</strong></td>
                                                        <td>
                                                            <div class="table-user">
                                                                <div class="table-user-avatar"
                                                                    style="background: var(--gradient-orange);">PD</div>
                                                                <span>Phạm Đức D</span>
                                                            </div>
                                                        </td>
                                                        <td>₫ 45,000,000</td>
                                                        <td><span class="status-badge success">Hoàn thành</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td><strong>#ORD-2837</strong></td>
                                                        <td>
                                                            <div class="table-user">
                                                                <div class="table-user-avatar"
                                                                    style="background: linear-gradient(135deg, #06b6d4, #22c55e);">
                                                                    VN</div>
                                                                <span>Võ Ngọc E</span>
                                                            </div>
                                                        </td>
                                                        <td>₫ 15,200,000</td>
                                                        <td><span class="status-badge danger">Đã hủy</span></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                                <!-- Recent Activity -->
                                <div class="card">
                                    <div class="card-header">
                                        <h3>⚡ Hoạt động gần đây</h3>
                                        <button class="btn btn-secondary btn-sm">Làm mới</button>
                                    </div>
                                    <div class="card-body">
                                        <div class="activity-list">
                                            <div class="activity-item">
                                                <div class="activity-icon order"><i class="fas fa-shopping-bag"></i>
                                                </div>
                                                <div class="activity-content">
                                                    <h4>Đơn hàng mới #ORD-2841</h4>
                                                    <p>Nguyễn Văn A đã đặt Dell XPS 15</p>
                                                </div>
                                                <span class="activity-time">2 phút trước</span>
                                            </div>
                                            <div class="activity-item">
                                                <div class="activity-icon user"><i class="fas fa-user-plus"></i></div>
                                                <div class="activity-content">
                                                    <h4>Khách hàng mới đăng ký</h4>
                                                    <p>Trần Minh F vừa tạo tài khoản</p>
                                                </div>
                                                <span class="activity-time">15 phút trước</span>
                                            </div>
                                            <div class="activity-item">
                                                <div class="activity-icon product"><i class="fas fa-box"></i></div>
                                                <div class="activity-content">
                                                    <h4>Sản phẩm được cập nhật</h4>
                                                    <p>MacBook Pro M3 - giá mới ₫35,990,000</p>
                                                </div>
                                                <span class="activity-time">1 giờ trước</span>
                                            </div>
                                            <div class="activity-item">
                                                <div class="activity-icon alert"><i
                                                        class="fas fa-exclamation-triangle"></i></div>
                                                <div class="activity-content">
                                                    <h4>Cảnh báo tồn kho</h4>
                                                    <p>HP Pavilion 15 chỉ còn 3 sản phẩm</p>
                                                </div>
                                                <span class="activity-time">2 giờ trước</span>
                                            </div>
                                            <div class="activity-item">
                                                <div class="activity-icon order"><i class="fas fa-truck"></i></div>
                                                <div class="activity-content">
                                                    <h4>Đơn hàng #ORD-2835 đã giao</h4>
                                                    <p>Giao thành công cho Hoàng Anh G</p>
                                                </div>
                                                <span class="activity-time">3 giờ trước</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Top Products & Latest Customers -->
                            <div class="content-grid">
                                <!-- Top Products -->
                                <div class="card">
                                    <div class="card-header">
                                        <h3>🏆 Sản phẩm bán chạy</h3>
                                        <button class="btn btn-secondary btn-sm">Tháng này</button>
                                    </div>
                                    <div class="card-body">
                                        <div class="top-product-item">
                                            <div class="top-product-rank gold">1</div>
                                            <div class="top-product-img">💻</div>
                                            <div class="top-product-info">
                                                <h4>Dell XPS 15 9530</h4>
                                                <span>Dell &bull; ₫ 35,990,000</span>
                                            </div>
                                            <div class="top-product-sold">
                                                <div class="amount">156</div>
                                                <div class="label">đã bán</div>
                                            </div>
                                        </div>
                                        <div class="top-product-item">
                                            <div class="top-product-rank silver">2</div>
                                            <div class="top-product-img">💻</div>
                                            <div class="top-product-info">
                                                <h4>MacBook Pro 14 M3</h4>
                                                <span>Apple &bull; ₫ 45,990,000</span>
                                            </div>
                                            <div class="top-product-sold">
                                                <div class="amount">134</div>
                                                <div class="label">đã bán</div>
                                            </div>
                                        </div>
                                        <div class="top-product-item">
                                            <div class="top-product-rank bronze">3</div>
                                            <div class="top-product-img">💻</div>
                                            <div class="top-product-info">
                                                <h4>ASUS ROG Strix G16</h4>
                                                <span>Asus &bull; ₫ 28,990,000</span>
                                            </div>
                                            <div class="top-product-sold">
                                                <div class="amount">98</div>
                                                <div class="label">đã bán</div>
                                            </div>
                                        </div>
                                        <div class="top-product-item">
                                            <div class="top-product-rank default">4</div>
                                            <div class="top-product-img">💻</div>
                                            <div class="top-product-info">
                                                <h4>HP Pavilion 15</h4>
                                                <span>HP &bull; ₫ 15,490,000</span>
                                            </div>
                                            <div class="top-product-sold">
                                                <div class="amount">87</div>
                                                <div class="label">đã bán</div>
                                            </div>
                                        </div>
                                        <div class="top-product-item">
                                            <div class="top-product-rank default">5</div>
                                            <div class="top-product-img">💻</div>
                                            <div class="top-product-info">
                                                <h4>Lenovo ThinkPad X1 Carbon</h4>
                                                <span>Lenovo &bull; ₫ 32,990,000</span>
                                            </div>
                                            <div class="top-product-sold">
                                                <div class="amount">76</div>
                                                <div class="label">đã bán</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Latest Customers -->
                                <div class="card">
                                    <div class="card-header">
                                        <h3>👥 Khách hàng mới nhất</h3>
                                        <button class="btn btn-secondary btn-sm" data-page="users">Xem tất cả</button>
                                    </div>
                                    <div class="card-body no-padding">
                                        <div class="table-wrapper">
                                            <table class="data-table">
                                                <thead>
                                                    <tr>
                                                        <th>Khách hàng</th>
                                                        <th>Email</th>
                                                        <th>Ngày tham gia</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="table-user">
                                                                <div class="table-user-avatar"
                                                                    style="background: var(--gradient-primary);">NV
                                                                </div>
                                                                <span>Nguyễn Văn A</span>
                                                            </div>
                                                        </td>
                                                        <td>nguyenvana@email.com</td>
                                                        <td>10/04/2026</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="table-user">
                                                                <div class="table-user-avatar"
                                                                    style="background: var(--gradient-green);">TT</div>
                                                                <span>Trần Thị B</span>
                                                            </div>
                                                        </td>
                                                        <td>tranthib@email.com</td>
                                                        <td>09/04/2026</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="table-user">
                                                                <div class="table-user-avatar"
                                                                    style="background: var(--gradient-purple);">LH</div>
                                                                <span>Lê Hoàng C</span>
                                                            </div>
                                                        </td>
                                                        <td>lehoangc@email.com</td>
                                                        <td>08/04/2026</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="table-user">
                                                                <div class="table-user-avatar"
                                                                    style="background: var(--gradient-orange);">PD</div>
                                                                <span>Phạm Đức D</span>
                                                            </div>
                                                        </td>
                                                        <td>phamducd@email.com</td>
                                                        <td>07/04/2026</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="table-user">
                                                                <div class="table-user-avatar"
                                                                    style="background: linear-gradient(135deg, #06b6d4, #22c55e);">
                                                                    TM</div>
                                                                <span>Trần Minh F</span>
                                                            </div>
                                                        </td>
                                                        <td>tranminhf@email.com</td>
                                                        <td>06/04/2026</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
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