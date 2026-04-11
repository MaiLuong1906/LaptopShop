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
                                    <h1>Tạo mới người dùng</h1>
                                </div>
                            </div>
                            <div class="card" style="max-width: 600px; margin: 0 auto;">
                                <div class="card-body">
                                    <form:form method="post" action="/admin/users/update" modelAttribute="user">
                                        <form:hidden path="id" />
                                        <div class="mb-3">
                                            <label for="email" class="form-label">Email:</label>
                                            <form:input path="email" id="email" type="email" class="form-control"
                                                disabled="true" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="password" class="form-label">Mật khẩu:</label>
                                            <form:password path="password" id="password" class="form-control" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="fullName" class="form-label">Họ và tên:</label>
                                            <form:input path="fullName" id="fullName" type="text"
                                                class="form-control" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="address" class="form-label">Địa chỉ:</label>
                                            <form:input path="address" id="address" type="text" class="form-control" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="phone" class="form-label">Số điện thoại:</label>
                                            <form:input path="phone" id="phone" type="text" class="form-control" />
                                        </div>
                                        <div class="text-end">
                                            <a href="/admin/users" class="btn btn-secondary me-2">Hủy</a>
                                            <button type="submit" class="btn btn-primary">Cập nhật</button>
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