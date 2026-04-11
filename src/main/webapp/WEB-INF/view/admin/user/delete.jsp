<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Delete</title>
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
                                    <h1>Xác nhận xóa người dùng</h1>
                                </div>
                            </div>
                            <div class="card" style="max-width: 600px; margin: 0 auto;">
                                <div class="card-body">
                                    <form:form method="post" action="/admin/users/delete" modelAttribute="user">
                                        <form:hidden path="id" />
                                        <div class="alert alert-danger" style="background: rgba(239, 68, 68, 0.1); border: 1px solid var(--accent-red); color: var(--accent-red); padding: 16px; border-radius: 8px; margin-bottom: 24px;">
                                            <i class="fas fa-exclamation-triangle"></i> Hành động này không thể hoàn tác. Bạn có chắc chắn muốn xóa người dùng này?
                                        </div>
                                        <div class="mb-4">
                                            <label class="form-label">Email người dùng:</label>
                                            <div class="detail-value" style="padding: 10px; background: rgba(255,255,255,0.05); border-radius: 6px;">${user.email}</div>
                                        </div>
                                        <div class="text-end">
                                            <a href="/admin/users" class="btn btn-secondary me-2">Hủy</a>
                                            <button type="submit" class="btn btn-danger">Xác nhận xóa</button>
                                        </div>
                                    </form:form>
                                </div>
                            </div>

                        </div><!-- end .page-content -->
                    </main>
                </div><!-- end .dashboard-layout -->

                <script src="/js/dashboard.js"></script>
            </body>

            </html>