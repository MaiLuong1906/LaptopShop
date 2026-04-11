<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Home</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
                    crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
                    crossorigin="anonymous"></script>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
                <link rel="stylesheet" href="/css/dashboard.css">
            </head>

            <body>
                <div class="dashboard-layout">
                    <jsp:include page="../../layout/sidebar.jsp" />

                    <main class="main-content">
                        <jsp:include page="../../layout/header.jsp" />

                        <div class="page-content">
                            <div class="page-title-section">
                                <div>
                                    <h1>Chi tiết người dùng</h1>
                                </div>
                            </div>

                            <div class="card profile-card">
                                <div class="card-body">
                                    <div class="profile-header">
                                        <div class="profile-avatar-lg">
                                            <i class="fas fa-user"></i>
                                        </div>
                                        <div class="profile-info-main">
                                            <h2>${user.fullName}</h2>
                                            <p><i class="far fa-envelope"></i> ${user.email}</p>
                                        </div>
                                        <div class="profile-actions">
                                            <a href="/admin/users" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Quay lại</a>
                                            <button class="btn btn-primary"><i class="fas fa-edit"></i> Chỉnh sửa</button>
                                        </div>
                                    </div>

                                    <div class="detail-grid mt-4">
                                        <div class="detail-item">
                                            <label>ID Người dùng</label>
                                            <div class="detail-value">#${user.id}</div>
                                        </div>
                                        <div class="detail-item">
                                            <label>Email đăng nhập</label>
                                            <div class="detail-value">${user.email}</div>
                                        </div>
                                        <div class="detail-item">
                                            <label>Họ và tên</label>
                                            <div class="detail-value">${user.fullName}</div>
                                        </div>
                                        <div class="detail-item">
                                            <label>Số điện thoại</label>
                                            <div class="detail-value">${user.phone}</div>
                                        </div>
                                        <div class="detail-item full-width">
                                            <label>Địa chỉ thường trú</label>
                                            <div class="detail-value">${user.address}</div>
                                        </div>
                                        <div class="detail-item">
                                            <label>Mật khẩu (Đã mã hóa)</label>
                                            <div class="detail-value">••••••••••••</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!-- end .page-content -->
                    </main>
                </div><!-- end .dashboard-layout -->

                <script src="/js/dashboard.js"></script>
            </body>

            </html>